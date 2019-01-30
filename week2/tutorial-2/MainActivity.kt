package com.example.myapplicationxx

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText

class MainActivity : AppCompatActivity() {

    // Variable Global Declaring
    var inputNameMain: EditText? = null
    var btnStart: Button? = null


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Object Reference with Variable
        inputNameMain = findViewById(R.id.inputNameMain) as EditText
        btnStart = findViewById(R.id.btnStartMain) as Button

        // Event Function
        btnStart!!.setOnClickListener {
            // Set Event Variable
            var btnStartClickEvent = Intent(this, Main2Activity::class.java)

            // Send Data before Start Intent Event
            btnStartClickEvent.putExtra("NAME",""+ inputNameMain!!.getText().toString())

            // Start Event Variable
            startActivity(btnStartClickEvent)
        }

    }
}
