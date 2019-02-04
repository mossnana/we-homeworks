package com.mossnana.week4

import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.content.Context
import android.content.Intent
import android.widget.Toast
import kotlinx.android.synthetic.main.model.view.*

class MyAdapter(val items: Array<String>, val imageId: Array<Int>, val context: Context) : RecyclerView.Adapter<ViewHolder>() {

    val store: ArrayList<String> = ArrayList()

    override fun onCreateViewHolder(p0: ViewGroup, p1: Int): ViewHolder {
        return ViewHolder(LayoutInflater.from(context).inflate(R.layout.model, p0, false))
    }

    override fun getItemCount(): Int {
        // return array size
        return items.size
    }

    override fun onBindViewHolder(p0: ViewHolder, p1: Int) {
        p0?.getNameTxt?.text = items.get(p1)
        p0?.getThumbnail?.setImageResource(imageId.get(p1))
        p0?.itemView.setOnClickListener {
            store.add(items.get(p1))
            Toast.makeText(context, "Click: "+items.get(p1), Toast.LENGTH_LONG).show()

            var intent = Intent(context, week32::class.java)

            intent.putExtra("TITLE",""+ items.get(p1))
            intent.putExtra("IMAGE", imageId.get(p1))
            intent.putExtra("array", store)

            context.startActivity(intent)

        }


    }

}

class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
    val getNameTxt = view.nameTxt
    val getThumbnail = view.thumbnail
}
