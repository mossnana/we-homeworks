package com.example.mycomic

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.support.v7.widget.GridLayoutManager
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import com.google.firebase.database.*

class MainActivity : AppCompatActivity() {
    
    // TAG use in Log Activity to track log
    private val TAG = "Comic"
    // MutableList is received data from firebase
    private lateinit var response_data: MutableList<DataModel>
    // Class dataAdapter
    private var dataAdapter: DataAdapter? = null
    // recycler view
    private lateinit var recyclerView: RecyclerView
    // Firebase Variable
    private lateinit var firebaseDatabase: FirebaseDatabase
    private lateinit var databaseReference: DatabaseReference

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        // Recycler View is referenced by id
        recyclerView = findViewById(R.id.recyclerView)
        // Recycler View Grid Manager
        recyclerView!!.layoutManager = LinearLayoutManager(this)
        recyclerView!!.setLayoutManager(GridLayoutManager(this, 2))

        // Firebase Connection
        firebaseDatabase = FirebaseDatabase.getInstance()
        // Get data from collection name : bookshelf -> data
        databaseReference = firebaseDatabase!!.getReference("bookshelf/data")
        // Snapshot Time
        response_data = mutableListOf()
        
        // Received Data From Firebase and send to dataAdapter class
        dataAdapter = DataAdapter(response_data as ArrayList<DataModel>)
        recyclerView!!.setAdapter(dataAdapter)
        // Firebase Action Life Cycle
        bindingData()
    }
    
    // Firebase Action Life Cycle Function
    private fun bindingData(){
        // Auto Impremented functions by alt+enter at "addChildEventListener"
        databaseReference!!.addChildEventListener(object : ChildEventListener {
            override fun onCancelled(p0: DatabaseError) {
                TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
            }

            override fun onChildMoved(p0: DataSnapshot, p1: String?) {
                TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
            }

            override fun onChildChanged(dataSnapshot: DataSnapshot, p1: String?) {
                TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
            }
            // onChildAdded = when data is added in database -> do this function
            override fun onChildAdded(dataSnapshot: DataSnapshot, p1: String?) {
                // Add dataSnapshot to response_data MutableList
                response_data!!.add(dataSnapshot.getValue(DataModel::class.java)!!)
                dataAdapter!!.notifyDataSetChanged()
            }

            override fun onChildRemoved(p0: DataSnapshot) {
                TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
            }
        })
    }
}
