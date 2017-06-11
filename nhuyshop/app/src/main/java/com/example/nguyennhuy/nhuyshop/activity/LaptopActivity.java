package com.example.nguyennhuy.nhuyshop.activity;

import android.content.Context;
import android.content.Intent;
import android.os.Message;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.nguyennhuy.nhuyshop.R;
import com.example.nguyennhuy.nhuyshop.adapter.LaptopAdapter;
import com.example.nguyennhuy.nhuyshop.model.Sanpham;
import com.example.nguyennhuy.nhuyshop.ultil.CheckConnection;
import com.example.nguyennhuy.nhuyshop.ultil.Server;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Handler;

public class LaptopActivity extends AppCompatActivity {
    Toolbar toolbarlaptop;
    ListView lvlaptop;
    LaptopAdapter laptopAdapter;
    ArrayList<Sanpham> manglaptop;
    int idlaptop = 0;
    int page = 1;
    View Footerview;
    mHandler mHandler;
    boolean isLoading = false;
    boolean limitdata = false;
    boolean isShowToast = false;// để chặn hiển thị toast 2 lần khi dùng theard
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_laptop);
        Anhxa();
        if (CheckConnection.haveNetworkConnection(getApplicationContext())){
            GetIdloaisp();
            ActionToolbar();
            GetData(page);
            LoadMoreData();
        }else
        {
            CheckConnection.ShowToast_Short(getApplicationContext(),"Bạn hãy kiểm tra lại kết nối internet");
            finish();
        }
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
    private void LoadMoreData() {
        lvlaptop.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Intent intent = new Intent(getApplicationContext(), ChiTietSanPham.class);
                intent.putExtra("thongtinsanpham", manglaptop.get(position));
                startActivity(intent);
            }
        });
        lvlaptop.setOnScrollListener(new AbsListView.OnScrollListener() {
            @Override
            public void onScrollStateChanged(AbsListView view, int scrollState) {

            }

            @Override
            public void onScroll(AbsListView view, int FirstItem, int visibleItem, int totalItem) {
                if(FirstItem + visibleItem == totalItem & totalItem != 0 && isLoading == false && limitdata==false){
                    isLoading = true;
                    TheardData theardData = new TheardData();
                    theardData.start();
                }

            }
        });
    }


    private void GetData(int Page) {
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        String duongdanlaptop = Server.Duongdanlaptop + String.valueOf(Page);
        StringRequest stringRequest = new StringRequest(Request.Method.POST, duongdanlaptop, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                int Id_Laptop = 0;
                String Ten_Laptop = "";
                int Gia_Laptop = 0;
                String Hinh_Laptop = "";
                String Mota_Laptop = "";
                int IdLoai_Laptop = 0;
                /*Nguyễn như ý: Chưa tìm được lý do tại sao xuất hiện kí tự rác nên phải xóa đi*/
                if(response.replaceAll("ï»¿","") != null && response.replaceAll("ï»¿","").length() != 2)
                {
                    try {
                        JSONArray jsonArray = new JSONArray(response.replaceAll("ï»¿",""));
                        for(int i = 0; i< jsonArray.length(); i++)
                        {
                            JSONObject jsonObject = jsonArray.getJSONObject(i);
                            Id_Laptop = jsonObject.getInt("id");
                            Ten_Laptop = jsonObject.getString("tensanpham");
                            Gia_Laptop = jsonObject.getInt("giasanpham");
                            Hinh_Laptop = jsonObject.getString("hinhanhsanpham");
                            Mota_Laptop = jsonObject.getString("motasanpham");
                            IdLoai_Laptop = jsonObject.getInt("idloaisanpham");
                            manglaptop.add(new Sanpham(Id_Laptop, Ten_Laptop, Gia_Laptop, Hinh_Laptop, Mota_Laptop, IdLoai_Laptop));
                            laptopAdapter.notifyDataSetChanged();

                        }

                    } catch (JSONException e) {
                        e.printStackTrace();

                    }
                }
                else
                {
                    limitdata = true;
                    lvlaptop.removeFooterView(Footerview);
                    if(isShowToast == false)
                    {
                        isShowToast = true;
                        CheckConnection.ShowToast_Short(getApplicationContext(), "Đã hết dữ liệu");
                    }

                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

            }
        }){
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String,String> param = new HashMap<String, String>();
                param.put("idsp", String.valueOf(idlaptop));
                return param;
            }
        };
        requestQueue.add(stringRequest);
    }

    private void ActionToolbar() {
        setSupportActionBar(toolbarlaptop);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbarlaptop.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
    }

    private void GetIdloaisp() {
        idlaptop = getIntent().getIntExtra("idloaisanpham", -1);
        Log.d("giatriloaisanpham",idlaptop + "");
    }


    private void Anhxa() {
        toolbarlaptop = (Toolbar) findViewById(R.id.toolbarlaptop);
        lvlaptop = (ListView) findViewById(R.id.listviewlaptop);
        manglaptop = new ArrayList<>();
        laptopAdapter = new LaptopAdapter(getApplicationContext(),manglaptop);
        LayoutInflater inflater = (LayoutInflater) getSystemService(LAYOUT_INFLATER_SERVICE);
        Footerview = inflater.inflate(R.layout.footerview, null);
        mHandler = new mHandler();
        lvlaptop.addFooterView(Footerview);//Kinh Nghiệm quí báu, tìm lỗi sai sau 10 tiếng đồng hồ mới phát hiện được
        lvlaptop.setAdapter(laptopAdapter);
    }
    public  class mHandler extends 	android.os.Handler{
        @Override
        public void handleMessage(Message msg) {
            switch (msg.what){
                case 0:
                    lvlaptop.removeFooterView(Footerview);
                    lvlaptop.addFooterView(Footerview);
                    break;
                case 1:
                    GetData(++page);
                    lvlaptop.removeFooterView(Footerview);
                    isLoading = false;
                    break;
            }
            super.handleMessage(msg);
        }
    }

    public class TheardData extends Thread{
        @Override
        public void run() {
            mHandler.sendEmptyMessage(0);
            try {
                Thread.sleep(3000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            Message message = mHandler.obtainMessage(1);
            mHandler.sendMessage(message);
            super.run();
        }
    }
}
