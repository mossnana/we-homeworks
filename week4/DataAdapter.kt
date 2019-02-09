package com.example.mycomic

import android.content.Intent
import android.util.Log
import android.view.View
import android.view.ViewGroup
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.widget.ImageView
import android.widget.TextView
// Firebase Library
import com.google.firebase.database.DataSnapshot
import com.google.firebase.database.DatabaseError
import com.google.firebase.database.FirebaseDatabase
import com.google.firebase.database.ValueEventListener
// Picasso is store data in cache, by don't load data everytime
import com.squareup.picasso.Picasso

class DataAdapter (val dataModelList: List<DataModel>) : RecyclerView.Adapter<ViewHolder>(){
    // TAG to check LOG
    private val TAG = "Comic"
    //
    val mylist = ArrayList<String>()
    // Interaction with List in Recycler View
    override fun onCreateViewHolder(p0: ViewGroup, p1: Int): ViewHolder {
        return ViewHolder(LayoutInflater.from(p0.context).inflate(R.layout.model,p0,false))
    }
    
    override fun getItemCount(): Int {
        return dataModelList.size
    }

    // Map with ViewHolder
    override fun onBindViewHolder(p0: ViewHolder, p1: Int) {
        val dataModel = dataModelList[p1]
        p0.textTitle.text = dataModel.title
        // Firebase Fetch Data from database
        var databaseReference = FirebaseDatabase.getInstance().reference
        // database connection and callback try ... catch ...
        databaseReference.child("bookshelf/data").addValueEventListener(object : ValueEventListener {
            override fun onDataChange(dataSnapshot: DataSnapshot) {
                // LOG to see received data from firebase
                Log.d(TAG, "Count= " + dataSnapshot.childrenCount)
                for (childDataSnapshot in dataSnapshot.children) {
                    Log.d(TAG, "snapshot= " + childDataSnapshot.key!!)
                    mylist.add(childDataSnapshot.key!!)
                }
            }
            override fun onCancelled(databaseError: DatabaseError) {

            }
        })
        
        // Picasso Started Work
        Picasso.with(p0.itemView.context).load(dataModel.photos)
            .error(R.mipmap.ic_launcher)
            .placeholder(R.mipmap.ic_launcher)
            .into(p0.imageView)
        
        // Link to Information Activity Page
        p0.imageView.setOnClickListener(View.OnClickListener { v ->
            val filePath = dataModel.files
            val readActivity = Intent(v.context, InformationActivity::class.java)
            Log.d(TAG, "filePath=$filePath")
            readActivity.putExtra("filePath", filePath)
            readActivity.putExtra("keys", mylist[p1])
            v.context.startActivity(readActivity)
        })
    }
}

// View Holder Imprementation Class by Recycler View
class ViewHolder(itemView: View): RecyclerView.ViewHolder(itemView) {
    var textTitle: TextView = itemView.findViewById(R.id.title)
    var imageView: ImageView
    init {
        imageView = itemView.findViewById(R.id.thumbnail)
    }
}
