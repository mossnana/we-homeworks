package com.example.myapplicationxx

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView

class Main2Activity : AppCompatActivity() {

    // Variable Global Declaring
    var getNameResult: TextView? = null
    var btnBackMain2: Button? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main2)

        // Object Reference with Variable
        getNameResult = findViewById(R.id.txtInputNameMain2) as TextView
        btnBackMain2 = findViewById(R.id.btnBackMain2) as Button

        // Set Variable Get Data From Intent Event
        var getNameEvent = getIntent()

        // Set Data From Intent Event
        getNameResult!!.setText(""+ getNameEvent.getStringExtra("NAME"))

        // Event Function
        btnBackMain2!!.setOnClickListener{
            // Set Event Variable
            var btnBackClick = Intent(this, MainActivity::class.java)

            // Start Event Variable
            startActivity(btnBackClick)
        }
    }
}
