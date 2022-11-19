using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SunController : MonoBehaviour
{
    public Transform player;
    public float DayNightCycleSpeed = 3f;
    public GameObject sun;
    public Material skyboxmat;

    public float blendamount = 0.0f;
    public float transitionSpeedDay = 15.0f;
    public float transitionSpeedNight = 25.0f;
    public float transitionPoint = 190f;


    void Start()
    {
        blendamount = 0.0f;
        skyboxmat.SetFloat("_BlendValue", blendamount);
    }
    
    // Update is called once per frame
    void Update()
    {
        Vector3 pivotPoint = new Vector3(player.transform.position.x, 0, player.transform.position.z);
        transform.RotateAround(pivotPoint, Vector3.right, DayNightCycleSpeed * Time.deltaTime);
        transform.LookAt(pivotPoint);

        if(sun.transform.position.y < transitionPoint)
        {
            if(blendamount < 0.99f)
            {
                blendamount += 0.01f * Time.deltaTime * transitionSpeedDay;
                skyboxmat.SetFloat("_BlendValue", blendamount);
            }

            
        }
        else if (sun.transform.position.y > transitionPoint)
        {
            if (blendamount > 0.0f)
            {
                blendamount -= 0.01f * Time.deltaTime * transitionSpeedNight;
                skyboxmat.SetFloat("_BlendValue", blendamount);
            }


        }
    }
}
