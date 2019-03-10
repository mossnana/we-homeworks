package com.example.myapplication
import android.content.ContentValues.TAG
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
import java.util.ArrayList

class DataAdapter(val dataModelList: List<DataModel>) : RecyclerView.Adapter<ViewHolder>() {
    // ตัวแปร mylist ใช้ในการ map ข้อมูลที่ได้จาก Firebase ส่งไปหน้า DataModel.kt
    val mylist = ArrayList<String>()
    
    // ViewHolder Methods
    override fun onCreateViewHolder(p0: ViewGroup, p1: Int): ViewHolder {
        return ViewHolder(LayoutInflater.from(p0.context).inflate(R.layout.model,p0,false))
    }
    
    override fun onBindViewHolder(p0: ViewHolder, p1: Int) {
        // dataModel เอาไว้ใส่ List ของ ViewHolder ตัวต่างๆ
        val dataModel = dataModelList[p1]
        // สร้างตัวแปรติดต่อกับฐานข้อมูล
        var databaseReference = FirebaseDatabase.getInstance().reference
        // ???
        p0.textTitle.text = dataModel.title
        // Firebase Query Method
        databaseReference.child("stream/channel").addValueEventListener(object : ValueEventListener {
            override fun onDataChange(dataSnapshot: DataSnapshot) {
                Log.d(TAG, "Count= " + dataSnapshot.childrenCount)
                for (childDataSnapshot in dataSnapshot.children) {
                    Log.d(TAG, "snapshot= " + childDataSnapshot.key!!)
                    mylist.add(childDataSnapshot.key!!)
                }
            }
            override fun onCancelled(databaseError: DatabaseError) {
                // None
            }
        })
        
        // ใช้ Picasso เก็บแคชของ viewholder
        Picasso.with(p0.itemView.context).load(dataModel.photos)
            .error(R.mipmap.ic_launcher)
            .placeholder(R.mipmap.ic_launcher)
            .into(p0.imageView)
        
        // กำหนด event ให้ คลิกที่ view holder ตัวนั้นแล้วไปหน้าอื่นแล้วส่งข้อมูลไปด้วย
        p0.imageView.setOnClickListener(View.OnClickListener { v ->
            // ???
            val content = dataModel.content
            val readActivity = Intent(v.context, WatchActivity::class.java)
            readActivity.putExtra("source", content)
            v.context.startActivity(readActivity)
        })
    }
    
    override fun getItemCount(): Int {
        return dataModelList.size
    }
}

// ViewHolder Class for Imprementation
class ViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
    var textTitle: TextView = itemView.findViewById(R.id.title)
    var imageView: ImageView
    init {
        imageView = itemView.findViewById(R.id.thumbnail)
    }
}
