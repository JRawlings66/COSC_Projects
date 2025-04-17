<?php
$servername = "69.172.204.200";
$username = "jacobr_admin";
$password = "letmeinboi";
$dbname = "jacobr_mainDB";

//create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

//check connection
if($conn->connect_error){
	die("connection failed: " . $conn->connect_error);
}
echo "Connected Succesfully";
echo "<br>";
echo "<h1><strong>ALL records from the Database, including the ones just added</strong></h1>";

$sql = "SELECT FirstName, LastName, Email FROM users";
$result = $conn->query($sql);

if($result->num_rows > 0){
	//output
	while($row = $result->fetch_assoc()){
		echo "Name: " . $row["FirstName"]. " " . $row["LastName"]. " " . $row["Email"]. "<br>";
	}		
}else{
	echo "0 results";
}
$conn->close();

?>