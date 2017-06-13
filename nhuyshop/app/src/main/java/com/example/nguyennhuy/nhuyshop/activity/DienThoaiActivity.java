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
import com.example.nguyennhuy.nhuyshop.adapter.DienthoaiAdapter;
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

public class DienThoaiActivity extends AppCompatActivity {
    Toolbar toolbardt;
    ListView lvdt;
    DienthoaiAdapter dienthoaiAdapter;
    ArrayList<Sanpham> mangdt;
    int iddt = 0;
    int page = 1;
    View Footerview;
    mHandler mHandler;
    boolean isLoading = false;
    boolean limitdata = false;
    boolean isShowToast = false;// để chặn hiển thị toast 2 lần khi dùng theard
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
       setContentView(R.layout.activity_dien_thoai);
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
        lvdt.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Intent intent = new Intent(getApplicationContext(), ChiTietSanPham.class);
                intent.putExtra("thongtinsanpham", mangdt.get(position));
                startActivity(intent);
            }
        });
        lvdt.setOnScrollListener(new AbsListView.OnScrollListener() {
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
        String duongdandienthoai = Server.Duongdandienthoai + String.valueOf(Page);
        StringRequest stringRequest = new StringRequest(Request.Method.POST, duongdandienthoai, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                int Id_DienThoai = 0;
                String Ten_DienThoai = "";
                int Gia_DienThoai = 0;
                String Hinh_DienThoai = "";
                String Mota_DienThoai = "";
                int IdLoai_DienThoai = 0;
                /*Nguyễn như ý: Chưa tìm được lý do tại sao xuất hiện kí tự rác nên phải xóa đi*/
                if(response.replaceAll("ï»¿","") != null && response.replaceAll("ï»¿","").length() != 2)
                {
                    try {
                        JSONArray jsonArray = new JSONArray(response.replaceAll("ï»¿",""));
                        for(int i = 0; i< jsonArray.length(); i++)
                        {
                            JSONObject jsonObject = jsonArray.getJSONObject(i);
                            Id_DienThoai = jsonObject.getInt("id");
                            Ten_DienThoai = jsonObject.getString("tensanpham");
                            Gia_DienThoai = jsonObject.getInt("giasanpham");
                            Hinh_DienThoai = jsonObject.getString("hinhanhsanpham");
                            Mota_DienThoai = jsonObject.getString("motasanpham");
                            IdLoai_DienThoai = jsonObject.getInt("idloaisanpham");
                            mangdt.add(new Sanpham(Id_DienThoai, Ten_DienThoai, Gia_DienThoai, Hinh_DienThoai, Mota_DienThoai, IdLoai_DienThoai));
                            dienthoaiAdapter.notifyDataSetChanged();

                        }

                    } catch (JSONException e) {
                        e.printStackTrace();

                    }
                }
                else
                {
                    limitdata = true;
                    lvdt.removeFooterView(Footerview);
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
                param.put("idsp", String.valueOf(iddt));
                return param;
            }
        };
        requestQueue.add(stringRequest);
    }

    private void ActionToolbar() {
        setSupportActionBar(toolbardt);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbardt.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
    }

    private void GetIdloaisp() {
        iddt = getIntent().getIntExtra("idloaisanpham", -1);
        Log.d("giatriloaisanpham",iddt + "");
    }


    private void Anhxa() {
        toolbardt = (Toolbar) findViewById(R.id.toolbardienthoai);
        lvdt = (ListView) findViewById(R.id.listviewdienthoai);
        mangdt = new ArrayList<>();
        dienthoaiAdapter = new DienthoaiAdapter(getApplicationContext(),mangdt);
        LayoutInflater inflater = (LayoutInflater) getSystemService(LAYOUT_INFLATER_SERVICE);
        Footerview = inflater.inflate(R.layout.footerview, null);
        mHandler = new mHandler();
        lvdt.addFooterView(Footerview);//Kinh Nghiệm quí báu, tìm lỗi sai sau 10 tiếng đồng hồ mới phát hiện được
        lvdt.setAdapter(dienthoaiAdapter);
    }
    public  class mHandler extends 	android.os.Handler{
        @Override
        public void handleMessage(Message msg) {
            switch (msg.what){
                case 0:
                    lvdt.removeFooterView(Footerview);
                    lvdt.addFooterView(Footerview);
                    break;
                case 1:
                    GetData(++page);
                    isLoading = false;
                    lvdt.removeFooterView(Footerview);
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
