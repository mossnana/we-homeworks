package com.mossnana.firstapp

import android.content.Context
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import kotlinx.android.synthetic.main.model.view.*

class Xxx : AppCompatActivity() {

    var recyclerView: RecyclerView? = null
    var movies = arrayOf(
        "American Horror Story season 1",
        "American Horror Story season 2",
        "American Horror Story season 3",
        "American Horror Story season 4",
        "Game of Throne season 1",
        "Game of Throne season 2",
        "Game of Throne season 3",
        "Game of Throne season 4",
        "Game of Throne season 5",
        "Game of Throne season 6"
    )


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_xxx)
        this.setTitle("Recycler View");
        recyclerView = findViewById(R.id.recyclerView) as RecyclerView
        recyclerView!!.layoutManager = LinearLayoutManager(this)

        val myAdapter = MyAdapter(movies,this)
        recyclerView!!.setAdapter(myAdapter)
    }
}


