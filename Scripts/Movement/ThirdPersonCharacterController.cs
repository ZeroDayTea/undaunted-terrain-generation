using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ThirdPersonCharacterController : MonoBehaviour
{
    public float Speed;
    public Quaternion rotation;
    void FixedUpdate()
    {
        PlayerMovement();
    }

    void PlayerMovement()
    {
        float hor = Input.GetAxis("Horizontal");
        float ver = Input.GetAxis("Vertical");
        float jump = Input.GetAxis("Jump");
        Vector3 playerMovement = new Vector3(hor, jump, ver) * Speed * Time.deltaTime;
        transform.Translate(playerMovement, Space.Self);

        rotation = Quaternion.Euler(-90, transform.rotation.y, transform.rotation.z);
    }
}