using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Enemy : MonoBehaviour {

    public float speed;
    public Transform groundCheck;
    public LayerMask layerGround;
    public bool grounded;
    public float radiusCheck;

    private bool facingRight = true;
    private bool jumping;
    private Rigidbody2D rb2D;
    private Animator anim;
    private bool isVisible = false;

	// Use this for initialization
	void Start () {
        rb2D = GetComponent<Rigidbody2D>();
        anim = GetComponent<Animator>();
	}
	
	// Update is called once per frame
	void Update () {
		
        grounded = Physics2D.OverlapCircle(groundCheck.position, radiusCheck, layerGround);

        if(!grounded){
            Flip();
        }


	}

    private void FixedUpdate()
    {
        if(isVisible){
            rb2D.velocity = new Vector2(speed, rb2D.velocity.y);
        }else{
            rb2D.velocity = new Vector2(0f, rb2D.velocity.y);
        }

    }

    void Flip()
    {
        facingRight = !facingRight;
        transform.localScale = new Vector3(-transform.localScale.x, transform.localScale.y, transform.localScale.z);
        speed *= -1;

    }

	private void OnBecameVisible()
	{
        Invoke("MoveEnemy", 1f);
	}

	private void OnBecameInvisible()
	{
        Invoke("StopEnemy", 1f);	
	}

	void MoveEnemy(){
        isVisible = true;
        anim.Play("Run");
    }

    void StopEnemy(){
        isVisible = false;
        anim.Play("Idle");
    }
}
