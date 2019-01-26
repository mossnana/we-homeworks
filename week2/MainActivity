package com.mossnana.firstapp

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.v7.widget.CardView
import android.widget.Button
import android.widget.EditText

class MainActivity : AppCompatActivity() {

    var txtName: EditText? = null;
    var txtEmail: EditText? = null;
    var txtPhone: EditText? = null;
    var buttonSubmit: Button? = null;

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        txtName = findViewById(R.id.txtName) as EditText;
        txtEmail = findViewById(R.id.txtEmail) as EditText;
        txtPhone = findViewById(R.id.txtPhone) as EditText;
        buttonSubmit = findViewById(R.id.buttonSubmit) as Button;

        buttonSubmit!!.setOnClickListener {
            var intent = Intent(this, Xxx::class.java);

            // save inputs data
            intent.putExtra("txtName",""+txtName!!.getText().toString());
            intent.putExtra("txtEmail",""+txtEmail!!.getText().toString());
            intent.putExtra("txtPhone",""+txtPhone!!.getText().toString());

            startActivity(intent);
        }


        }

    }

