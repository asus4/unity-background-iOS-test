using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace BatchRenderer
{
    public class Rotate : MonoBehaviour
    {

        [SerializeField]
        Vector3 speed;

        void Update()
        {
            transform.Rotate(speed * Time.deltaTime);
        }
    }
}