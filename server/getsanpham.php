<?php
	include "connect.php";
	$page = $_GET['page'];
	$idsp = $_POST['idsp'];
	$space = 5;
	$limit = ($page -1) * $space; // vi tri dau tien trong trang
	$mangsanpham = array();
	$qrery = "SELECT * FROM sanpham WHERE idloaisanpham = $idsp LIMIT $limit, $space";
	$data = mysqli_query($conn, $qrery);
	while ($row = mysqli_fetch_assoc($data)) {
		array_push($mangsanpham, new Sanpham(
			$row['id'],
			$row['tensanpham'],
			$row['giasanpham'],
			$row['hinhanhsanpham'],
			$row['motasanpham'],
			$row['idloaisanpham']));
	}
	echo json_encode($mangsanpham);
	class Sanpham{
		function Sanpham($id, $tensanpham, $giasanpham, $hinhanhsanpham, $motasanpham, $idloaisanpham){
			$this->id=$id;
			$this->tensanpham=$tensanpham;
			$this->giasanpham=$giasanpham;
			$this->hinhanhsanpham=$hinhanhsanpham;
			$this->motasanpham=$motasanpham;
			$this->idloaisanpham=$idloaisanpham;
		}
	}
?>