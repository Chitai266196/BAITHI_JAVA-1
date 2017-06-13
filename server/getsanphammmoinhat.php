<?php
	include "connect.php";
	$mangspmoinhat = array();
	$query = "SELECT * FROM sanpham ORDER BY id DESC LIMIT 6";
	$data = mysqli_query($conn, $query);
	while ($row = mysqli_fetch_assoc($data)) {
		array_push($mangspmoinhat, new Sanphammoinhat(
			$row['id'],
			$row['tensanpham'],
			$row['giasanpham'],
			$row['hinhanhsanpham'],
			$row['motasanpham'],
			$row['idloaisanpham']));
	}

	echo json_encode($mangspmoinhat);


	class Sanphammoinhat{
		function Sanphammoinhat($id, $tensanpham, $giasanpham, $hinhanhsanpham, $motasanpham, $idloaisanpham){
			$this->id=$id;
			$this->tensanpham=$tensanpham;
			$this->giasanpham=$giasanpham;
			$this->hinhanhsanpham=$hinhanhsanpham;
			$this->motasanpham=$motasanpham;
			$this->idloaisanpham=$idloaisanpham;
		}
	}

?>