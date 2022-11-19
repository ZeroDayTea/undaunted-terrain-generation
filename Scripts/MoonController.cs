using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoonController : MonoBehaviour
{

    public Transform player;
    public float DayNightCycleSpeed = 3f;

    // Update is called once per frame
    void Update()
    {
        Vector3 pivotPoint = new Vector3(player.transform.position.x, 0, player.transform.position.z);
        transform.RotateAround(pivotPoint, Vector3.right, DayNightCycleSpeed * Time.deltaTime);
        transform.LookAt(pivotPoint);
    }
}
