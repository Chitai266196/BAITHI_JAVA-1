<?php
include "connect.php";
$tenkhachhang = $_POST['post_tenkhachhang'];
$sodienthoai = $_POST['post_sdtkhachhang'];
$email = $_POST['post_emailkhachhang'];
if(strlen($tenkhachhang) > 0  && strlen($sodienthoai) > 0 && strlen($email) > 0){
	$query ="INSERT INTO Donhang(id, tenkhachhang, sodienthoai, email) VALUES (null,'$tenkhachhang','$sodienthoai','$email')" ;
	if(mysqli_query($conn, $query)){
		$iddonhang = $conn->insert_id;
		echo strval($iddonhang);
	}
	else{
		echo "-1";
	}
}
else echo "-1";
?>  