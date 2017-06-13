<?php
	include "connect.php";
	$json = $_POST['json'];
	$data = json_decode($json, true);
	foreach ($data as $key => $value) {
		$giasanpham = $value['giasanpham'];
		$madonhang = $value['madonhang'];
		$soluongsanpham = $value['soluongsanpham'];
		$tensanpham = $value['tensanpham'];
		$masanpham = $value['masanpham'];
		$query = "INSERT INTO Chitietdonhang(id, madonhang, masanpham, tensanpham, giasanpham, soluongsanpham) 
		VALUES (null,'$madonhang','$masanpham','$tensanpham','$giasanpham','$soluongsanpham')";
		$Dta = mysqli_query($conn,$query);
	}
	if ($Dta) {
		echo "1";
	}else
	{
		echo "0";
	}


?>