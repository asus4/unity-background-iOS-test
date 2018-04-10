using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace BatchRenderer
{
    [RequireComponent(typeof(AudioSource))]
    public class DummyAudio : MonoBehaviour
    {
        void Awake()
        {
            Application.runInBackground = true;
        }

        void OnAudioFilterRead(float[] data, int channels)
        {
            // Nothing todo
            // Just for keeping alive AirPlay
            // Debug.LogFormat("filter");
        }
    }

}