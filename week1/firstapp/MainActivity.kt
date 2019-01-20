package com.mossnana.firstapp

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.v7.widget.CardView

class MainActivity : AppCompatActivity() {

    // ref to element
    var card1: CardView? = null
    var card2: CardView? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // {variable name} = findViewById(R.id.{elementName}) as CardView
        card1 = findViewById(R.id.card1) as CardView
        card2 = findViewById(R.id.card2) as CardView

        // event section
        // !! is try and catch
        card1!!.setOnClickListener{
            // var for reuse ; val for 1 use
            var intent = Intent(this, Main2Activity::class.java)
            // start intent event
            startActivity(intent)
        }

        card2!!.setOnClickListener{
            val intent = Intent(this, Main3Activity::class.java)
            startActivity(intent)
        }




    }
}
