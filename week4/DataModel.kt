package com.example.mycomic

class DataModel {
    // Key Variables Declaring
    var title: String?=null
    var desc: String?=null
    // Comic Cover
    var photos: String?=null
    var files: String?=null
    var key: String?=null
    // Comic Photo Set
    var photo: String?=null
    
    // Constructor with null argument
    // use when no data received
    constructor()
    
    // Constructor with received firebase 
    constructor(title: String?, desc: String?, photos: String?, files: String?, key: String?, photo: String?) {
        this.title = title
        this.desc = desc
        this.photos = photos
        this.files = files
        this.key = key
        this.photo = photo
    }
    
    // Map Received Data to HashMap
    // Hashmap is easy to input data than list
    fun toMap(): Map<String, Any> {
        val result = HashMap<String, Any>()
        result.put("title", title!!)
        result.put("desc", desc!!)
        result.put("thumbnail", photos!!)
        result.put("key", key!!)
        result.put("files", files!!)
        result.put("photo", photo!!)
        return result
    }
}
