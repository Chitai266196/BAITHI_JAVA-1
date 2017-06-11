package com.example.nguyennhuy.nhuyshop.activity;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.nguyennhuy.nhuyshop.R;
import com.example.nguyennhuy.nhuyshop.ultil.CheckConnection;
import com.example.nguyennhuy.nhuyshop.ultil.Server;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class Thongtinkhachhang extends AppCompatActivity {

    EditText editTextTenKhachHang, editTextEmail, editTextsdt;
    Button btnXacNhan, btnTroVe;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_thongtinkhachhang);
        Anhxa();
        btnTroVe.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
        if(CheckConnection.haveNetworkConnection(getApplicationContext())){
            EventButton();
        }else {
            CheckConnection.ShowToast_Short(getApplicationContext(),"Bạn hãy kiểm tra lại kết nối");
        }
    }

    private void EventButton() {
        btnXacNhan.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                final String ten = editTextTenKhachHang.getText().toString();
                final String sdt = editTextsdt.getText().toString();
                final String email = editTextEmail.getText().toString();
                if(ten.length() > 0 && sdt.length() > 0 && email.length() >0)
                {
                    RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
                    StringRequest stringRequest = new StringRequest(Request.Method.POST, Server.Duongdandonhang, new Response.Listener<String>() {
                        @Override
                        public void onResponse(final String madonhang) {
                            int int_madonhang = ChuanHoaString(madonhang);
                            final String str_madonhang = String.valueOf(ChuanHoaString(madonhang));
                            if(int_madonhang > 0){
                                RequestQueue queue = Volley.newRequestQueue(getApplicationContext());
                                StringRequest request = new StringRequest(Request.Method.POST, Server.Duongdanchitietdonhang, new Response.Listener<String>() {
                                    @Override
                                    public void onResponse(String response) {
                                        if(response.replaceAll("ï»¿","").replaceAll(" ","").equals("1")){
                                            MainActivity.manggiohang.clear();
                                            CheckConnection.ShowToast_Short(getApplicationContext(),"Đặt hàng thành công");
                                            Intent intent = new Intent(getApplicationContext(),MainActivity.class);
                                            startActivity(intent);
                                            CheckConnection.ShowToast_Short(getApplicationContext(),"Mời bạn tiếp tục mua hàng");
                                        }
                                        else {
                                            CheckConnection.ShowToast_Short(getApplicationContext(),"Dữ liệu giỏ hàng của bạn đã bị lỗi");

                                        }

                                    }
                                }, new Response.ErrorListener() {
                                    @Override
                                    public void onErrorResponse(VolleyError error) {

                                    }
                                }){
                                    @Override
                                    protected Map<String, String> getParams() throws AuthFailureError {
                                        JSONArray jsonArray = new JSONArray();
                                        for(int i = 0; i<MainActivity.manggiohang.size(); i++){
                                            JSONObject jsonObject = new JSONObject();
                                            try {
                                                jsonObject.put("madonhang",str_madonhang);
                                                jsonObject.put("masanpham",MainActivity.manggiohang.get(i).getIdsp());
                                                jsonObject.put("tensanpham",MainActivity.manggiohang.get(i).getTensp());
                                                jsonObject.put("giasanpham",MainActivity.manggiohang.get(i).getGiasp());
                                                jsonObject.put("soluongsanpham",MainActivity.manggiohang.get(i).getSoluongsp());
                                            } catch (JSONException e) {
                                                e.printStackTrace();
                                            }
                                            jsonArray.put(jsonObject);

                                        }
                                        HashMap<String,String> map = new HashMap<String, String>();
                                        map.put("json",jsonArray.toString().replaceAll("ï»¿",""));
                                        return map;
                                    }
                                };
                                queue.add(request);

                            }

                        }
                    }, new Response.ErrorListener() {
                        @Override
                        public void onErrorResponse(VolleyError error) {

                        }
                    }){
                        @Override
                        protected Map<String, String> getParams() throws AuthFailureError {
                            HashMap<String, String> hashMap = new HashMap<String, String>();
                            hashMap.put("post_tenkhachhang",ten);
                            hashMap.put("post_sdtkhachhang",sdt);
                            hashMap.put("post_emailkhachhang", email);
                            return hashMap;
                        }
                    };
                    requestQueue.add(stringRequest);

                }else {
                    CheckConnection.ShowToast_Short(getApplicationContext(),"Bạn chưa nhập đầy đủ dữ liệu, Hãy kiểm tra lại");
                }
            }
        });

    }

    private void Anhxa() {
        editTextTenKhachHang = (EditText) findViewById(R.id.edittexttenkhachhang);
        editTextsdt = (EditText) findViewById(R.id.edittextsodienthoaikhachhang);
        editTextEmail = (EditText) findViewById(R.id.edittextemail);
        btnXacNhan = (Button) findViewById(R.id.buttonxacnhan);
        btnTroVe = (Button) findViewById(R.id.buttontrove);
    }

    private int ChuanHoaString(String a)
    {
        int ChuanHoa = 0;
        for(int i = 0; i< a.length(); i++)
        {
            try{
                if(( (int) a.charAt(i) != 32) && ( (int) a.charAt(i) != 65279))
                    ChuanHoa=ChuanHoa*10 + Integer.parseInt(a.charAt(i)+"");
            }catch (Exception e)
            {
            }
        }
        return ChuanHoa;
    }
}
