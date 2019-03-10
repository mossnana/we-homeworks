package com.example.myapplication

import android.net.Uri
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.MediaController
import android.widget.VideoView

class WatchActivity : AppCompatActivity() {
    private var videoView: VideoView? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_watch)

        videoView = findViewById(R.id.VideoPlayer)
        val httpLiveUrl = intent.getStringExtra("source")
        val xx = "http://gmmservice.radical-enlighten.com/gmm/smil:gmm25.smil/playlist.m3u8"

        Log.d("TVApps", "source=$httpLiveUrl")


        videoView!!.setVideoURI(Uri.parse(xx))
        videoView!!.setMediaController(MediaController(this))
        videoView!!.requestFocus()
        videoView!!.start()
    }
}

