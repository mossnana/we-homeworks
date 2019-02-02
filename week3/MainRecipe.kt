package com.mossnana.week4

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.v7.widget.GridLayoutManager
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView

class MainRecipe : AppCompatActivity() {

    var menuView: RecyclerView? = null;

    var foods = arrayOf(
        "ข้าวไข่เจียวหมูสับ",
        "กระเพราหมู/ไก่/กุ้ง",
        "สัมตำปู",
        "ไข่ต้มใบมะตูม",
        "ผัดไทย",
        "ผัดหมี่โคราช",
        "สลัดมันกุ้ง",
        "ต้มแซ่บเอ็นหมู",
        "ห่อหมกทะเล",
        "ข้าวเปล่า",
        "หมูยอทอดน้ำปลา",
        "หมูปิ้ง",
        "ใบเหลียงผัดไข่",
        "หมูหันครัวลุงรงค์"
    )

    var arrImg = arrayOf<Int>(
        R.drawable.image1,
        R.drawable.image2,
        R.drawable.image3,
        R.drawable.image4,
        R.drawable.image5,
        R.drawable.image6,
        R.drawable.image7,
        R.drawable.image8,
        R.drawable.image9,
        R.drawable.image10,
        R.drawable.image11,
        R.drawable.image12,
        R.drawable.image13,
        R.drawable.image14
    )

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main_recipe)
        this.setTitle("ครัวลุงรงค์")

        menuView = findViewById(R.id.menuView) as RecyclerView
        menuView!!.layoutManager = LinearLayoutManager(this)
        menuView!!.setLayoutManager(GridLayoutManager(this, 2))

        val myAdapter = MyAdapter(foods,arrImg, this)
        menuView!!.setAdapter(myAdapter)
    }
}
