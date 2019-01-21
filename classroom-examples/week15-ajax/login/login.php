<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
  $("#btn").click(function(){
    $.post("checklogin.php",
    {
      UserName: $("#UserName").val(),
      UserPwd: $("#UserPwd").val()
    },
    function(data, status){
      //alert(data);
      if(data == "A"){
        window.location = "user_select.php";
      }
      else if(data == "U"){
        window.location = "index.php";
      }
      else{
        $("#msg").html("ข้อมูลชื่อผู้ใช้และรหัสผ่านไม่ถูกต้อง");
      }
    });
  });
});
</script>

<h4>ลงชื่อผู้ใช้งาน</h4>
<form action="#">
ชื่อผู้ใช้ : <input type="text" id="UserName" /> <br />
รหัสผ่าน : <input type="password" id="UserPwd" /> <br />
<input type="button" value="ตกลง" id="btn" />
<div id="msg" style="color:red"></div>
</form>
