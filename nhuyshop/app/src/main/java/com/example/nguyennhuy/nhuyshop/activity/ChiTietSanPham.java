package com.example.nguyennhuy.nhuyshop.activity;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.Gravity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;

import com.example.nguyennhuy.nhuyshop.R;
import com.example.nguyennhuy.nhuyshop.model.Giohang;
import com.example.nguyennhuy.nhuyshop.model.Sanpham;
import com.squareup.picasso.Picasso;

import java.text.DecimalFormat;

public class ChiTietSanPham extends AppCompatActivity {

    Toolbar toolbarChiTiet;
    ImageView imageviewChiTiet;
    TextView txtTenChiTiet, txtGiaChiTiet, txtMoTaChiTiet;
    Spinner spinnerChiTiet;
    Button buttonDatMuaChiTiet;
    int id = 0;
    String TenChiTiet = "";
    int GiaChiTiet = 0;
    String HinhChiTiet = "";
    String MotaChiTiet = "";
    int IdLoaiSanPhamChiTiet = 0;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_chi_tiet_san_pham);
        Anhxa();
        ActionToolbar();
        GetInformation();
        CatchEventSpinner();
        EventButton();
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()){
            case R.id.menugiohang:
                Intent intent  = new Intent(getApplicationContext(), GioHang.class);
                startActivity(intent);
        }
        return super.onOptionsItemSelected(item);
    }
    private void EventButton() {
        buttonDatMuaChiTiet.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(MainActivity.manggiohang.size() > 0){
                    int sl = Integer.parseInt(spinnerChiTiet.getSelectedItem().toString());
                    boolean exists = false;
                    for(int i = 0; i<MainActivity.manggiohang.size(); i++)
                    {
                        if(MainActivity.manggiohang.get(i).getIdsp() == id){
                            MainActivity.manggiohang.get(i).setSoluongsp(MainActivity.manggiohang.get(i).getSoluongsp() + sl);
                           if(MainActivity.manggiohang.get(i).getSoluongsp() > 10){
                               MainActivity.manggiohang.get(i).setSoluongsp(10);
                           }

                           MainActivity.manggiohang.get(i).setGiasp(GiaChiTiet * MainActivity.manggiohang.get(i).getGiasp());
                            exists =  true;

                        }
                    }

                    if(exists == false){
                        int soluong = Integer.parseInt(spinnerChiTiet.getSelectedItem().toString());
                        long Giamoi = soluong * GiaChiTiet;
                        MainActivity.manggiohang.add(new Giohang(id, TenChiTiet, Giamoi, HinhChiTiet, soluong));
                    }

                }else
                {
                    int soluong = Integer.parseInt(spinnerChiTiet.getSelectedItem().toString());
                    long Giamoi = soluong * GiaChiTiet;
                    MainActivity.manggiohang.add(new Giohang(id, TenChiTiet, Giamoi, HinhChiTiet, soluong));
                }

                Intent intent  = new Intent(getApplicationContext(), GioHang.class);
                startActivity(intent);
            }
        });
    }

    private void CatchEventSpinner() {
        Integer[] soluong = new Integer[]{1,2,3,4,5,6,7,8,9,10};
        ArrayAdapter<Integer> arrayAdapter = new ArrayAdapter<Integer>(this,R.layout.support_simple_spinner_dropdown_item, soluong);
        spinnerChiTiet.setAdapter(arrayAdapter);
    }

    private void GetInformation() {
        Sanpham sanpham = (Sanpham) getIntent().getSerializableExtra("thongtinsanpham");
        id = sanpham.getID();
        TenChiTiet = sanpham.getTensanpham();
        GiaChiTiet = sanpham.getGiasanpham();
        HinhChiTiet = sanpham.getHinhanhsanpham();
        MotaChiTiet = sanpham.getMotasanpham();
        IdLoaiSanPhamChiTiet = sanpham.getIdloaisanpham();
        if(TenChiTiet.length() > 40) txtTenChiTiet.setTextSize(15);
        txtTenChiTiet.setText(TenChiTiet);
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        txtGiaChiTiet.setText("Giá : " + decimalFormat.format(GiaChiTiet) + " Đ");
        txtMoTaChiTiet.setText(MotaChiTiet);
        Picasso.with(getApplicationContext()).load(HinhChiTiet)
                .placeholder(R.drawable.noimage)
                .error(R.drawable.error)
                .into(imageviewChiTiet);
    }

    private void ActionToolbar() {
        setSupportActionBar(toolbarChiTiet);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbarChiTiet.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
    }

    private void Anhxa() {
        toolbarChiTiet = (Toolbar) findViewById(R.id.toolbarchitietsanpham);
        imageviewChiTiet = (ImageView) findViewById(R.id.imageviewhinhanhchitietsanpham);
        txtTenChiTiet = (TextView) findViewById(R.id.textviewtenchitietsanpham);
        txtGiaChiTiet = (TextView) findViewById(R.id.textviewgiachitietsanpham);
        txtMoTaChiTiet = (TextView) findViewById(R.id.textviewmotachitietsanpham);
        spinnerChiTiet = (Spinner) findViewById(R.id.spinnerchitietsanpham);
        buttonDatMuaChiTiet = (Button) findViewById(R.id.buttondatmuachitietsanpham);
    }
}
