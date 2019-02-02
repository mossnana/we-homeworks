package com.mossnana.week4

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import com.google.firebase.database.DatabaseReference
import com.google.firebase.database.FirebaseDatabase



class Firebase : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_firebase)

        val database = FirebaseDatabase.getInstance()
        val myRef = database.getReference("message")

        myRef.setValue("Hello, World!")
    }
}
