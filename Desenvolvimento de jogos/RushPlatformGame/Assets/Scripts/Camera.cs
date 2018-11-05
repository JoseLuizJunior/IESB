using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Camera : MonoBehaviour {

    private Vector2 velocity;

    public Transform target;
    public Vector2 smoothTime;
    public Vector2 maxLimite;
    public Vector2 minLimite;

	// Use this for initialization
	void Start () {

        transform.position = new Vector3(target.position.x, target.position.y, transform.position.z);
		
	}
	
	// Update is called once per frame
	void Update () {
        if(target != null){
            float posX = Mathf.SmoothDamp(transform.position.x, target.position.x, ref velocity.x, smoothTime.x);
            float posY = Mathf.SmoothDamp(transform.position.y, target.position.y, ref velocity.y, smoothTime.y);

            transform.position = new Vector3(posX, posY, transform.position.z);

            transform.position = new Vector3(
                Mathf.Clamp(transform.position.x, minLimite.x, maxLimite.x),
                Mathf.Clamp(transform.position.y, minLimite.y, maxLimite.y),
                transform.position.z);
        }
	}
}
