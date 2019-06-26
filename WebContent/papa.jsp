 <!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<div style="margin: auto;width:30%;padding-top:50px">
<form id="form1" name="form1" method="post">
<div class="form-group">
<input type="text" class="form-control" placeholder= 'Search by rollno...' id="roll_no"><br>
<p align="center"><button type="submit" class="btn btn-primary btn-default" id="search">Submit</button></p><br>
<label for="city">Display city name of student:</label>
<input type="email" class="form-control" placeholder= 'City name' id="city_name"><br><br>
</div>
</form>
</div>
<script>
$("#search").click(function() {
var roll_no= $('#roll_no').val();
city_name.value = city_name;
$.ajax({
url: "process.jsp",
type: 'POST',
data: {roll_no: roll_no},
success: function(data) {
$('#city_name').val(data);
alert(data);
var city_name = data;
}
});
});
</script>
</body>
</html> 