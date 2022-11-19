using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WaterFollowPlayer : MonoBehaviour
{
    public GameObject player;
    public GameObject water;

    void Start()
    {
        player = GameObject.Find("Player");
        water = GameObject.Find("Water");
    }
    // Update is called once per frame
    void Update()
    {
        water.transform.position = new Vector3(player.transform.position.x, -30, player.transform.position.z);
    }
}
