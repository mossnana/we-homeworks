package com.mossnana.week4

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.widget.ImageView
import android.widget.TextView

class week32 : AppCompatActivity() {

    var textView: TextView? = null
    var imageView: ImageView? = null
    var viewArray: TextView? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_week32)

        textView = findViewById(R.id.textView) as TextView
        imageView = findViewById(R.id.imageView) as ImageView
        viewArray = findViewById(R.id.viewArray) as TextView

        var intent = getIntent()
        textView!!.setText(""+intent.getStringExtra("TITLE"))
        imageView!!.setImageResource(intent.getIntExtra("IMAGE",0))

        setTitle(""+intent.getStringExtra("TITLE"))
    }
}
