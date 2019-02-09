package com.example.mycomic

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.util.Log
import com.google.firebase.database.*

class InformationActivity : AppCompatActivity() {

    private val TAG = "Comic"
    private lateinit var response_data: MutableList<DataModel>
    private var dataAdapter: ComicDataAdapter? = null
    private var mRecyclerView: RecyclerView? = null
    private var get_key: String? = null

    private lateinit var firebaseDatabase: FirebaseDatabase
    private lateinit var databaseReference: DatabaseReference

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_information)


        val intent = intent
        get_key = intent.getStringExtra("keys")

        firebaseDatabase = FirebaseDatabase.getInstance()
        databaseReference = firebaseDatabase!!.getReference("bookshelf/data/$get_key/pages")

        Log.d(TAG, "bookshelf/data/$get_key/pages")

        response_data = ArrayList()
        val layoutManager = LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false)
        mRecyclerView = findViewById(R.id.recycleComic) as RecyclerView
        mRecyclerView!!.layoutManager = layoutManager
        dataAdapter = ComicDataAdapter(response_data)
        mRecyclerView!!.adapter = dataAdapter

        comicBindingData()
    }

    private fun comicBindingData() {
        databaseReference!!.addChildEventListener(object : ChildEventListener {
            override fun onCancelled(p0: DatabaseError) {
                TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
            }

            override fun onChildMoved(p0: DataSnapshot, p1: String?) {
                TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
            }

            override fun onChildChanged(p0: DataSnapshot, p1: String?) {
                TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
            }

            override fun onChildAdded(dataSnapshot: DataSnapshot, p1: String?) {
                response_data!!.add(dataSnapshot.getValue(DataModel::class.java)!!)
                dataAdapter!!.notifyDataSetChanged()
            }

            override fun onChildRemoved(p0: DataSnapshot) {
                TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
            }
        })
    }

}
