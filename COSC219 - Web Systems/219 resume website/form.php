<?php
$servername = "69.172.204.200";
$username = "jacobr_admin";
$password = "letmeinboi";
$dbname = "jacobr_mainDB";

$fname = filter_input(INPUT_POST, "fname");
$lname = filter_input(INPUT_POST, "lname");
$email = filter_input(INPUT_POST, "email");

//create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

//check connection
if($conn->connect_error){
	die("connection failed: " . $conn->connect_error);
}
echo "Connected Succesfully";
echo "<br>";


$sql = "INSERT INTO users (FirstName, LastName, Email) VALUES ('$fname', '$lname', '$email')";



if ($conn->query($sql) === TRUE) {
  echo "New record created successfully";
} else {
  echo "Error: " . $sql . "<br>" . $conn->error;
}

echo "<html><head></head><body><table>";
echo "<tbody>";
echo "<tr><th>First Name</th>";
echo "<th>Last Name</th>";
echo "<th>Email</th></tr>";
echo "<tr></tr>";
echo "<tr><td>$fname</td><td>$lname</td><td>$email</td></tr>";
echo "</tbody></table></body></html>";


$conn->close();


?>