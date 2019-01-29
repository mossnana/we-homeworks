# Symmetric Key Cryptography
### การเข้ารหัสข้อมูลด้วยกุญแจเดี่ยว

------------


#### องค์ประกอบ
- `Plaintext` ข้อความทั่วไป
- `Encryption Algorithm` และ `Decryption Algorithm` ลำดับขึ้นตอนในการดำเนินการเข้ารหัสและถอดรหัส
- `Secret Key` ข้อความที่เสมือนเป็นกุญแจ เพื่อควบคุมการเข้ารหัสและถอดรหัสข้อมูล
- `Ciphertext` ข้อความ Plaintext ที่ได้รับการเข้ารหัสเรียบร้อยแล้ว

#### Algorithm ในการดำเนินการเข้ารหัส
- `DES` : Data Encryption Standard
	- Key ในการเข้ารหัสต้องมีความยาว `56 Bits`
- `3-DES` : Triple Data Encryption Standard
	- Key ในการเข้ารหัสต้องมีความยาว `112 Bits`
- `IDEA` : International Data Encryption Algorithm
	- Key ในการเข้ารหัสต้องมีความยาว `128 Bits`
- `AES` : Advanced Encryption Standard
	- Key ในการเข้ารหัสต้องมีความยาว `128, 192, 256 Bits`

#### การดำเนินการกับบิต
- แบ่งออกเป็น 4 วิธีการ
	- `Permutation` การสลับบิต
	> เช่น สลับท้ายเป็นหัว สลับหัวเป็นท้าย
	- `Substitution` การแทนที่บิต
	> เช่น 1011 แทนที่ด้วย 0100
	- `Shift` การเลื่อนบิต
	> เช่นการหมุนไปด้านซ้าย 1 ครั้ง จาก 1011 เอา 1 หมุนไปต่อหลัง 1 ครั้งเป็น 0111
	- `Permutation Choise` การสลับบิตแล้วเลือก
	> เช่น สลับท้ายเป็นหัวแล้วเลือกบางตำแหน่งมาเท่านั้น

#### XOR
- ย่อมาจาก Exclusive OR

| XOR       | 0          | 1  |
| --- |:----:| ----:|
| 0  | 0 | 1 |
| 1    | 1      |   0 |


------------

#### `DES` : Data Encryption Standard
- เป็น อัลกอริทึมที่มีการเข้ารหัสข้อความเป็นท่อน ๆ (`Block Cipher`) โดยข้อความ 1 บล็อคจะมีขนาด 64 bit

	##### วิธีการเข้ารหัส
	1. รับบล็อคข้อมูลมาในแบบ 64 บิต ทำการสลับบิตก่อน 1 ครั้ง
	2. เข้าสู่บล็อคข้อมูลที่ 0 แบ่งข้อมูลออกเป็น 2 ฝั่ง L0 และ R0 อย่างละครึ่ง
	3. ข้อมูลฝั่ง R0 เอาไปเป็นข้อมูลในฝั่งซ้าย (L1) ของ บล็อคข้อมูลถัดไป
	4. Key ที่รับเข้ามา 64 บิต ทำการ Permutation Choise กับ Key 1 ครั้งโดยเลือกมาแค่ 56 บิตพอ เอา 56 บิตนั้น Shift ซ้าย 1 รอบ
	5. Key ในข้อที่ 4 ตอนนี้มี 56 บิต เอามา Permutation Choise อีกครั้งให้เหลือ 48 บิต กลายเป็น Key ที่เอาไปใช้กับ บล็อคข้อมูลที่ 0 (K0)
	6. ข้อมูลฝั่ง L0 ที่มี 32 บิต ต้องเพิ่มข้อมูลให้เป็น 48 บิตเพื่อจะสามารถนำมากวนบิตกับ K0 ที่มี 48 บิตได้ หลังจาก L0 กลายเป็น 48 บิตแล้ว นำมา XOR กับ K0 ที่ได้จาก ข้อที่ 5 จากนั้น จะลดผลลัพท์ของการ XOR กัน จาก 48 บิตให้เหลือ 32 บิต โดยมีวิธีการพิเศษจะมีตารางการเทียบบิต แบ่งเป็นช่อง ๆ ช่องละ 6 บิต เทียบกับตาราง ได้ กลับมา 4 บิต เมื่อนำ 4 บิตเหล่านั้นมารวมกันก็จะเหลือ 32 บิต
	7. ทำตาม บล็อคข้อมูล 0 อีก 15 ครั้ง รวมเป็น 16 ครั้ง โดย ฝั่ง Key เอาผลลัพท์ของบิตจากข้อที่ 4. มาหมุนบิตไปทางซ้าย 1 รอบ แล้วทำตามข้อ 5. ก่อนนำไปใช้ใน บล็อคข้อมูลต่าง ๆ
	8. หลังจากนั้นนำผลลัพท์ที่ได้จาก 16 รอบนั้นมาทำการแบ่งครึ่งซ้าย ขวา แล้ว สลับ ซ้ายไปขวา ขวาไปซ้าย แค่นั้น
	9. ทำการสลับบิตต่อแบบกลับทิศทางกับขั้นตอนในข้อที่ 1.

##### ภาพกลไกลการเข้ารหัส
- ภาพการทำงานโดยรวมของ DES

[![DES Overview](https://lh3.googleusercontent.com/1FQuMkKXeYz_hAoQTyfM96Ikaet5sUBjhcXjsTga89ugk8Lj1F8JSVGTFLXvafzcY5FJmsk8LECE9lZwbEx0iJ72LVNZbwsUIWStyYh2lNeJKtZ-ow7L8-tk8PgRArbX5Gr0mVNc5g=w609-h448-no "DES Overview")](https://photos.google.com/photo/AF1QipOvP4OmrkEYgPQ2IaTiuE6ZQTEcn5s7bQeGerVs?hl=th "DES Overview")

- ภาพการทำงานภายในบล็อคข้อมูล

[![DES Block Data](https://lh3.googleusercontent.com/UtfmW-hPfmhN77OL86Chpuj7RlOiPchAe1e5A9MtcrmKAJzJ234Zcx-Dz50uAfwIV7leE_d7YFY8DZjp8GG5sckYwIQ2CaLAlhzI1EZgCsKJ83nLlpKh-fnSeXvGptLOMqLoZ05lzg=w652-h419-no "DES Block Data")](https://photos.app.goo.gl/nEdF3gEqhJmMz3LP6 "DES Block Data")

- ภาพการทำงานภายใน ฟังก์ชั่นของการ XOR กันระหว่าง ข้อมูลกับ Key

[![DES Block Data](https://lh3.googleusercontent.com/ST5XRHOK1DYsbGVsXjy9T-gvsT2QZKCI8ZsYEcIVN_qPTWpAN-nAiaaE9L0UVJ-fXvKO9LXH4T-zyi6CF-mzvanTeBP9FhuVCF_THFW_Z4AYCVbpcDjBwgkPEEK3Ghz2Fv2fM7QPhA=w576-h407-no "DES Block Data")](https://photos.app.goo.gl/aQREh8bqkvoEQc2A9 "DES Block Data")

- ตารางการแปลง 48 บิต เป็น 32 บิต ไปดูได้ที่ [S-Box Table](https://www.chegg.com/homework-help/questions-and-answers/derive-32-bit-output-48-bit-input-using-s-box-table-given-des-q8431417 "S-Box Table")
