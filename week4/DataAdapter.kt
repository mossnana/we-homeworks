package com.example.mycomic

import android.content.Intent
import android.support.v7.widget.RecyclerView
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import com.google.firebase.database.DataSnapshot
import com.google.firebase.database.DatabaseError
import com.google.firebase.database.FirebaseDatabase
import com.google.firebase.database.ValueEventListener
import com.squareup.picasso.Picasso

class DataAdapter (val dataModelList: List<DataModel>) : RecyclerView.Adapter<ViewHolder>(){

    private val TAG = "Comic"
    val mylist = ArrayList<String>()
    // Interaction with Row
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

        var databaseReference = FirebaseDatabase.getInstance().reference

        databaseReference.child("bookshelf/data").addValueEventListener(object : ValueEventListener {
            override fun onDataChange(dataSnapshot: DataSnapshot) {

                Log.d(TAG, "Count= " + dataSnapshot.childrenCount)
                for (childDataSnapshot in dataSnapshot.children) {
                    Log.d(TAG, "snapshot= " + childDataSnapshot.key!!)
                    mylist.add(childDataSnapshot.key!!)
                }
            }

            override fun onCancelled(databaseError: DatabaseError) {

            }
        })


        Picasso.with(p0.itemView.context).load(dataModel.photos)
            .error(R.mipmap.ic_launcher)
            .placeholder(R.mipmap.ic_launcher)
            .into(p0.imageView)

        p0.imageView.setOnClickListener(View.OnClickListener { v ->
            val filePath = dataModel.files
            Log.d(TAG, "filePath=$filePath")

            val readActivity = Intent(v.context, InformationActivity::class.java)
            readActivity.putExtra("filePath", filePath)
            readActivity.putExtra("keys", mylist[p1])
            v.context.startActivity(readActivity)
        })

    }
}

class ViewHolder(itemView: View): RecyclerView.ViewHolder(itemView) {
    var textTitle: TextView = itemView.findViewById(R.id.title)
    var imageView: ImageView

    init {
        imageView = itemView.findViewById(R.id.thumbnail)
    }
}