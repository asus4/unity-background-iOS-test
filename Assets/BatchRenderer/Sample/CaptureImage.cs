using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;

namespace BatchRenderer
{
    public class CaptureImage : MonoBehaviour
    {
        [SerializeField]
        int saveIntervalFrame = 120;

        int frames = 0;

        string directory;

        void Start()
        {
            directory = Application.persistentDataPath;
        }

        void Update()
        {
            if (frames % saveIntervalFrame == 0)
            {
                Capture();
            }
            frames++;
        }

        void Capture()
        {
            string filename = string.Format("capture_{0}.png", frames);
            string path = Path.Combine(directory, filename);
            Debug.LogFormat("Save to {0}", path);
            if (!Application.isEditor)
            {
                ScreenCapture.CaptureScreenshot(filename, 1);
            }
        }
    }
}