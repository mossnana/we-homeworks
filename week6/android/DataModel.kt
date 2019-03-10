package com.example.myapplication

class DataModel {
    var title: String?=null
    var content: String?=null

    constructor(title: String?, content: String?, photos: String?, key: String?) {
        this.title = title
        this.content = content
        this.photos = photos
        this.key = key
    }

    constructor()

    var photos: String?=null
    var key:String?=null

    fun toMap(): Map<String, Any> {
        val result = HashMap<String, Any>()
        result.put("title", title!!)
        result.put("content", content!!)
        result.put("photos", photos!!)
        result.put("key", key!!)
        return result
    }


}