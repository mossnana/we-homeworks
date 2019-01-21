<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script>
        $(document).ready(function () {
            $("input").keyup(function() {
                var name = $("input").val();
                $.post('register_process.php', {
                    suggestion : name
                }, function(data, status) {
                    $("#test").html(data);
                });
            });
        });
    </script>

</head>

<body>
<input list="test" type="text" name="name">
<datalist id="test" style="color:red"></datalist>



</body>

</html>