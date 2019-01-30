# WE644 Week 2.1
## การส่งค่าไปอีกหน้าผ่าน Event Indent
### ขั้นตอนมีดังนี้
1. สร้าง Layout ออกแบบให้เรียบร้อย ในตัวอย่างมี
	- กล่องป้อนข้อความ `inputNameMain`
	- ปุ่มเพื่อเปลี่ยนหน้า `btnStartMain`

2. ไปที่ไฟล์ **MainActivity.kt**
- คำสั่ง `putExtra()` ใช้ในการส่งค่าออกไป โดยที่ 
- โดยที่ ค่า **"NAME"** เหมือนการตั้งค่า name="xxxx" ใน HTML ให้ PHP รู้จัก textfield นั้น ๆ ผ่าน $_GET["xxxx"]
```kotlin
// Send Data before Start Intent Event
btnStartClickEvent.putExtra("NAME",""+ inputNameMain!!.getText().toString())
```

3. ไปจัดการ Layout ใน **activity_main2.xml** ให้เรียบร้อย ในตัวอย่างตั้ง id ไว้ว่า
	- กล่องข้อความรับค่า `txtInputNameMain2`

4. ไปที่ไฟล์ **Main2Activity.kt**
	- คำสั่ง `getIntent()` ใช้ในการรับค่ามาจากหน้าที่แล้ว
	- แล้วทำการ `setText()` ให้กับเป้าหมายด้วย โดยที่ `getStringExtra` จะเปลี่ยนไปตามชนิดที่จะรับค่าเข้ามา
```kotlin
// Set Variable Get Data From Intent Event

var getNameEvent = getIntent()

// Set Data From Intent Event

getNameResult!!.setText(""+ getNameEvent.getStringExtra("NAME"))
```
