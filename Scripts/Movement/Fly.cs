using UnityEngine;
using System.Collections;

public class Fly : MonoBehaviour
{

    Vector2 rot;

    void Update()
    {
        rot = new Vector2(
            rot.x + Input.GetAxis("Mouse X") * 2,
            rot.y + Input.GetAxis("Mouse Y") * 2);

        //transform.localRotation = Quaternion.AngleAxis(rot.x, Vector3.up);
        //transform.localRotation *= Quaternion.AngleAxis(rot.y, Vector3.left);

        transform.position += transform.forward * Input.GetAxis("Vertical");
        transform.position += transform.right * Input.GetAxis("Horizontal");
    }
}