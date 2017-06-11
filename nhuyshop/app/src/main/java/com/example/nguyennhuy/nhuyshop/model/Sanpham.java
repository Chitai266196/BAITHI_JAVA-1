package com.example.nguyennhuy.nhuyshop.model;

import java.io.Serializable;

/**
 * Created by NguyenNhuY on 5/19/2017.
 */

public class Sanpham implements Serializable{
    public int ID;
    public  String Tensanpham;
    public  Integer Giasanpham;
    public  String Hinhanhsanpham;
    public  String Motasanpham;
    public  int Idloaisanpham;

    public Sanpham(int ID, String tensanpham, Integer giasanpham, String hinhanhsanpham, String motasanpham, int idloaisanpham) {
        this.ID = ID;
        Tensanpham = tensanpham;
        Giasanpham = giasanpham;
        Hinhanhsanpham = hinhanhsanpham;
        Motasanpham = motasanpham;
        Idloaisanpham = idloaisanpham;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getTensanpham() {
        return Tensanpham;
    }

    public void setTensanpham(String tensanpham) {
        Tensanpham = tensanpham;
    }

    public Integer getGiasanpham() {
        return Giasanpham;
    }

    public void setGiasanpham(Integer giasanpham) {
        Giasanpham = giasanpham;
    }

    public String getHinhanhsanpham() {
        return Hinhanhsanpham;
    }

    public void setHinhanhsanpham(String hinhanhsanpham) {
        Hinhanhsanpham = hinhanhsanpham;
    }

    public String getMotasanpham() {
        return Motasanpham;
    }

    public void setMotasanpham(String motasanpham) {
        Motasanpham = motasanpham;
    }

    public int getIdloaisanpham() {
        return Idloaisanpham;
    }

    public void setIdloaisanpham(int idloaisanpham) {
        Idloaisanpham = idloaisanpham;
    }
}
