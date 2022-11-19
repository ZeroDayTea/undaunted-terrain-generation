using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Vegetation : MonoBehaviour
{

    const float BATCH_MAX_FLOAT = 1023f;
    const int BATCH_MAX = 1023;
    public GameObject MeshGenerator;
    GameObject entity;
    GameObject[] VegChunks;
    public GameObject player;

    //public float radius = 1f;
    //public Vector2 regionSize = Vector2.one;
    //public int rejectionSamples = 2;

    //public List<Vector2> points;
    //public Vector2 regionSize = new Vector2(750f, 750f);

    Mesh grassMesh;
    Material grassMat;

    public GameObject grass;

    List<Matrix4x4> transformList = new List<Matrix4x4>();

    public void PlaceTreesWithPoissant(Chunk chunk, GameObject tree1, GameObject tree2, GameObject tree3, GameObject tree4, float scale, float radius, int rejectionsamplesTest, Vector2 regionSize)
    {
        //object that holds the grass and parent it to main chunk
        Transform vegetationChunk = new GameObject("TreeChunk").transform;
        vegetationChunk.parent = chunk.transform;
        vegetationChunk.tag = "veg";

        float chunkDiameter = MeshGenerator.GetComponent<MeshGenerator>().boundsSize;
        Vector3 chunkPosition =  new Vector3(chunk.coord.x, chunk.coord.y, chunk.coord.z) * chunkDiameter;
        vegetationChunk.position = chunkPosition;
        //Vector2 regionSize = new Vector2(chunkDiameter, chunkDiameter);

        //Vegetation vegetation;
        //int totalAmount = Random.Range(lowAmount, highAmount);
        List<Vector2>points = PoissonDiscSampling.GeneratePoints(radius, regionSize, rejectionsamplesTest);
        foreach (Vector2 point in points)
        {
            Vector3 position = new Vector3(point.x, 0f, point.y) + new Vector3(chunkPosition.x, chunkPosition.y, chunkPosition.z);

            //RaycastHit hit;
            Vector3 raycastStart = new Vector3(position.x, position.y + 1000f, position.z);
            float slope;
            //int layerMask = 1 << 8;

            
            if (Physics.Raycast(raycastStart, transform.TransformDirection(Vector3.down), out RaycastHit hit) && ((slope = hit.normal.y) > 0.9f) && (hit.point.y >= -20f))
            {
                //It is possible to spawn the vegetation at this position
                //GameObject grassPrefabInstance = grassPrefab;

                int treeType = Random.Range(1, 5);
                
                if(treeType == 1)
                {
                    entity = GameObject.Instantiate(tree1, vegetationChunk);
                }
                else if(treeType == 2)
                {
                    entity = GameObject.Instantiate(tree2, vegetationChunk);
                }
                else if(treeType == 3)
                {
                    entity = GameObject.Instantiate(tree3, vegetationChunk);
                }
                else if(treeType == 4)
                {
                    entity = GameObject.Instantiate(tree4, vegetationChunk);
                }
                
                //set position and rotation and scale
                entity.transform.position = hit.point;
                entity.transform.localEulerAngles += new Vector3(0f, Random.Range(0, 360f), 0f);

                //Vector2 scale;
                float floatScale = scale;
                entity.transform.localScale = Vector3.one * floatScale;

                //avoid flying grass
                AnimationCurve depth = new AnimationCurve(new Keyframe[] { new Keyframe(0f, 0.05f), new Keyframe(1f, 0.25f) });
                entity.transform.position -= Vector3.up * depth.Evaluate(slope);
            }
        }

        MeshCombiner meshCombiner = vegetationChunk.gameObject.AddComponent<MeshCombiner>();
        meshCombiner.CreateMultiMaterialMesh = true;
        meshCombiner.DestroyCombinedChildren = true;
        meshCombiner.CombineMeshes(false);
    }

    public void PlaceTrees(Chunk chunk, GameObject tree1, GameObject tree2, GameObject tree3, GameObject tree4, float scale, Vector2 regionSize)
    {
        //object that holds the grass and parent it to main chunk
        Transform vegetationChunk = new GameObject("TreeChunk").transform;
        vegetationChunk.parent = chunk.transform;
        vegetationChunk.tag = "veg";

        float chunkDiameter = MeshGenerator.GetComponent<MeshGenerator>().boundsSize;
        Vector3 chunkPosition = new Vector3(chunk.coord.x, chunk.coord.y, chunk.coord.z) * chunkDiameter;
        vegetationChunk.position = chunkPosition;
        //Vector2 regionSize = new Vector2(chunkDiameter, chunkDiameter);

        //Vegetation vegetation;
        //int totalAmount = Random.Range(lowAmount, highAmount);
        
        for(float x = chunkPosition.x; x < chunkDiameter; x += 30)
        {
            for(float z = chunkPosition.z; z < chunkDiameter; z += 30)
            {
                float placementchance = Mathf.PerlinNoise(x, z);
                if(placementchance > 0.45f)
                {
                    Vector3 position = new Vector3(x, 0f, z);

                    Vector3 raycastStart = new Vector3(position.x, position.y + 1000f, position.z);
                    float slope;

                    if (Physics.Raycast(raycastStart, transform.TransformDirection(Vector3.down), out RaycastHit hit) && ((slope = hit.normal.y) > 0.9f) && (hit.point.y >= -20f))
                    {
                        //It is possible to spawn the vegetation at this position
                        //GameObject grassPrefabInstance = grassPrefab;

                        int treeType = Random.Range(1, 5);

                        if (treeType == 1)
                        {
                            entity = GameObject.Instantiate(tree1, vegetationChunk);
                        }
                        else if (treeType == 2)
                        {
                            entity = GameObject.Instantiate(tree2, vegetationChunk);
                        }
                        else if (treeType == 3)
                        {
                            entity = GameObject.Instantiate(tree3, vegetationChunk);
                        }
                        else if (treeType == 4)
                        {
                            entity = GameObject.Instantiate(tree4, vegetationChunk);
                        }

                        //set position and rotation and scale
                        entity.transform.position = hit.point;
                        entity.transform.localEulerAngles += new Vector3(0f, Random.Range(0, 360f), 0f);

                        //Vector2 scale;
                        float floatScale = scale;
                        entity.transform.localScale = Vector3.one * floatScale;

                        //avoid flying grass
                        AnimationCurve depth = new AnimationCurve(new Keyframe[] { new Keyframe(0f, 0.05f), new Keyframe(1f, 0.25f) });
                        entity.transform.position -= Vector3.up * depth.Evaluate(slope);
                    }
                }
            }
        }

        MeshCombiner meshCombiner = vegetationChunk.gameObject.AddComponent<MeshCombiner>();
        meshCombiner.CreateMultiMaterialMesh = true;
        meshCombiner.DestroyCombinedChildren = true;
        meshCombiner.CombineMeshes(false);
    }

    public void PlaceTreesRandomly(Chunk chunk, GameObject tree1, GameObject tree2, GameObject tree3, GameObject tree4, int lowAmount, int highAmount, float scale)
    {
        //object that holds the grass and parent it to main chunk
        Transform vegetationChunk = new GameObject("VegChunk").transform;
        vegetationChunk.parent = chunk.transform;
        vegetationChunk.tag = "veg";

        float chunkDiameter = MeshGenerator.GetComponent<MeshGenerator>().boundsSize;
        Vector3 chunkPosition = (new Vector3(chunk.coord.x, chunk.coord.y, chunk.coord.z) * MeshGenerator.GetComponent<MeshGenerator>().boundsSize);
        vegetationChunk.position = chunkPosition;
        

        //Vegetation vegetation;
        int totalAmount = Random.Range(lowAmount, highAmount);
        for (int i = 0; i < totalAmount; i++)
        {
            //Split generation calculations by groups of 15 (performance)
            //if (Application.isEditor && i % 15 == 0) yield return null;

            Vector3 position = new Vector3(Random.Range(-chunkDiameter, chunkDiameter), 0f, Random.Range(-chunkDiameter, chunkDiameter)) + new Vector3(chunkPosition.x, chunkPosition.y, chunkPosition.z);

            //RaycastHit hit;
            Vector3 raycastStart = new Vector3(position.x, position.y + 1000f, position.z);
            float slope;
            //int layerMask = 1 << 8;

            
            if (Physics.Raycast(raycastStart, transform.TransformDirection(Vector3.down), out RaycastHit hit) && ((slope = hit.normal.y) > 0.9f) && (hit.point.y >= -20f))
            {
                //It is possible to spawn the vegetation at this position
                //GameObject grassPrefabInstance = grassPrefab;

                int treeType = Random.Range(1, 5);
                
                if(treeType == 1)
                {
                    entity = GameObject.Instantiate(tree1, vegetationChunk);
                }
                else if(treeType == 2)
                {
                    entity = GameObject.Instantiate(tree2, vegetationChunk);
                }
                else if(treeType == 3)
                {
                    entity = GameObject.Instantiate(tree3, vegetationChunk);
                }
                else if(treeType == 4)
                {
                    entity = GameObject.Instantiate(tree4, vegetationChunk);
                }
                
                //set position and rotation and scale
                entity.transform.position = hit.point;
                entity.transform.localEulerAngles += new Vector3(0f, Random.Range(0, 360f), 0f);

                //Vector2 scale;
                float floatScale = scale;
                entity.transform.localScale = Vector3.one * floatScale;

                //avoid flying grass
                AnimationCurve depth = new AnimationCurve(new Keyframe[] { new Keyframe(0f, 0.05f), new Keyframe(1f, 0.25f) });
                entity.transform.position -= Vector3.up * depth.Evaluate(slope);
            }
        }

        MeshCombiner meshCombiner = vegetationChunk.gameObject.AddComponent<MeshCombiner>();
        meshCombiner.CreateMultiMaterialMesh = true;
        meshCombiner.DestroyCombinedChildren = true;
        meshCombiner.CombineMeshes(false);
    }

    private Matrix4x4[] GetBatchedMatrices(int offset, int batchCount)
    {
        Matrix4x4[] batchedMatrices = new Matrix4x4[batchCount];

        for(int i = 0; i < batchCount; ++i)
        {
            batchedMatrices[i] = transformList[i + offset];
        }

        return batchedMatrices;
    }

    static void SetLayer(Transform parent)
    {
        parent.gameObject.layer = LayerMask.NameToLayer("Grass");
        foreach (Transform child in parent) SetLayer(child);
    }

    public void DeleteOldVeg(float treeVisibilityDistance)
    {
        VegChunks = GameObject.FindGameObjectsWithTag("veg");

        foreach (GameObject vegchunk in VegChunks){
            Vector3 difference = new Vector3(player.transform.position.x - vegchunk.transform.position.x, player.transform.position.y - vegchunk.transform.position.y, player.transform.position.z - vegchunk.transform.position.z);
            float distance = difference.magnitude;
            if (distance >= treeVisibilityDistance)
            {
                vegchunk.GetComponent<MeshFilter>().sharedMesh.Clear();
                Destroy(vegchunk);
            }
        }
    }

}


/*
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Vegetation : MonoBehaviour
{

    public GameObject MeshGenerator;
    public GameObject entity;
    GameObject[] VegChunks;
    public GameObject player;

    public void PlaceTrees(Chunk chunk, GameObject tree1, GameObject tree2, GameObject tree3, GameObject tree4, int lowAmount, int highAmount, float scale)
    {
        //object that holds the grass and parent it to main chunk
        Transform vegetationChunk = new GameObject("GrassChunk").transform;
        vegetationChunk.parent = chunk.transform;
        vegetationChunk.tag = "veg";

        float chunkDiameter = MeshGenerator.GetComponent<MeshGenerator>().boundsSize;
        Vector3 chunkPosition = (new Vector3(chunk.coord.x, chunk.coord.y, chunk.coord.z) * MeshGenerator.GetComponent<MeshGenerator>().boundsSize);
        vegetationChunk.position = chunkPosition;
        

        //Vegetation vegetation;
        int totalAmount = Random.Range(lowAmount, highAmount);
        for (int i = 0; i < totalAmount; i++)
        {
            //Split generation calculations by groups of 15 (performance)
            //if (Application.isEditor && i % 15 == 0) yield return null;

            Vector3 position = new Vector3(Random.Range(-chunkDiameter, chunkDiameter), 0f, Random.Range(-chunkDiameter, chunkDiameter)) + new Vector3(chunkPosition.x, chunkPosition.y, chunkPosition.z);

            //RaycastHit hit;
            Vector3 raycastStart = new Vector3(position.x, position.y + 1000f, position.z);
            float slope;
            //int layerMask = 1 << 8;

            
            if (Physics.Raycast(raycastStart, transform.TransformDirection(Vector3.down), out RaycastHit hit) && ((slope = hit.normal.y) > 0.9f) && (hit.point.y >= -20f))
            {
                //It is possible to spawn the vegetation at this position
                //GameObject grassPrefabInstance = grassPrefab;

                int treeType = Random.Range(1, 5);
                
                if(treeType == 1)
                {
                    entity = GameObject.Instantiate(tree1, vegetationChunk);
                }
                else if(treeType == 2)
                {
                    entity = GameObject.Instantiate(tree2, vegetationChunk);
                }
                else if(treeType == 3)
                {
                    entity = GameObject.Instantiate(tree3, vegetationChunk);
                }
                else if(treeType == 4)
                {
                    entity = GameObject.Instantiate(tree4, vegetationChunk);
                }
                
                //set position and rotation and scale
                entity.transform.position = hit.point;
                entity.transform.localEulerAngles += new Vector3(0f, Random.Range(0, 360f), 0f);

                //Vector2 scale;
                float floatScale = scale;
                entity.transform.localScale = Vector3.one * floatScale;

                //avoid flying grass
                AnimationCurve depth = new AnimationCurve(new Keyframe[] { new Keyframe(0f, 0.05f), new Keyframe(1f, 0.25f) });
                entity.transform.position -= Vector3.up * depth.Evaluate(slope);
            }
        }

        MeshCombiner meshCombiner = vegetationChunk.gameObject.AddComponent<MeshCombiner>();
        meshCombiner.CreateMultiMaterialMesh = true;
        meshCombiner.DestroyCombinedChildren = true;
        meshCombiner.CombineMeshes(false);
    }

    static void SetLayer(Transform parent)
    {
        parent.gameObject.layer = LayerMask.NameToLayer("Grass");
        foreach (Transform child in parent) SetLayer(child);
    }

    public void DeleteOldVeg(float treeVisibilityDistance)
    {
        VegChunks = GameObject.FindGameObjectsWithTag("veg");

        foreach (GameObject vegchunk in VegChunks){
            Vector3 difference = new Vector3(player.transform.position.x - vegchunk.transform.position.x, player.transform.position.y - vegchunk.transform.position.y, player.transform.position.z - vegchunk.transform.position.z);
            float distance = difference.magnitude;
            if (distance >= treeVisibilityDistance)
            {
                vegchunk.GetComponent<MeshFilter>().sharedMesh.Clear();
                Destroy(vegchunk);
            }
        }
    }

}
*/