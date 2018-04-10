using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


namespace BatchRenderer
{
    [RequireComponent(typeof(Text))]
    public class FrameCountLabel : MonoBehaviour
    {
        int frames = 0;
        Text label;

        void Start()
        {
            label = GetComponent<Text>();
        }

        void Update()
        {

            label.text = string.Format("Frame: {0}", frames);

            if (frames % 60 == 0)
            {
                Debug.LogFormat("Frame: {0}", frames);
            }

            frames++;
        }
    }
}