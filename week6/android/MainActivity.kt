package com.example.myapplication

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.v7.widget.GridLayoutManager
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import com.google.firebase.database.*

class MainActivity : AppCompatActivity() {


    private val TAG = "TV"
    private lateinit var response_data: MutableList<DataModel>
    private var dataAdapter: DataAdapter? = null
    private lateinit var recyclerView: RecyclerView

    private lateinit var firebaseDatabase: FirebaseDatabase
    private lateinit var databaseReference: DatabaseReference

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        recyclerView = findViewById(R.id.recyclerView)
        recyclerView!!.layoutManager = LinearLayoutManager(this)
        recyclerView!!.setLayoutManager(GridLayoutManager(this, 3))


        firebaseDatabase = FirebaseDatabase.getInstance()
        databaseReference = firebaseDatabase!!.getReference("stream/channel")
        response_data = mutableListOf()

        dataAdapter = DataAdapter(response_data as ArrayList<DataModel>)
        recyclerView!!.setAdapter(dataAdapter)
        bindingData()


    }

    private fun bindingData() {
        databaseReference!!.addChildEventListener(object : ChildEventListener {
            override fun onChildAdded(dataSnapshot: DataSnapshot, s: String?) {
                response_data!!.add(dataSnapshot.getValue(DataModel::class.java)!!)
                dataAdapter!!.notifyDataSetChanged()

            }

            override fun onChildChanged(dataSnapshot: DataSnapshot, s: String?) {

            }

            override fun onChildRemoved(dataSnapshot: DataSnapshot) {

            }

            override fun onChildMoved(dataSnapshot: DataSnapshot, s: String?) {

            }

            override fun onCancelled(databaseError: DatabaseError) {

            }
        })
    }

}
