### Bài thi java: Nhuyshop
### Họ tên      : Nguyễn Như Ý
### Mã số sv    : 56131778
### Lớp         : 56Th2
### Giáo viên hướng dẫn : Mai Cường Thọ
### _____________________________________________________
# `Ứng dụng  Nhuyshop gồm có  giao diện và  chức năng như sau`
Ngày nay việc mua hàng online đã không còn xa lạ với mỗi người chúng ta, bạn có thể đã mua hàng trên Lazada, Adayroi,... .  Và `Nhuyshop` là một hình thức bán hàng như vậy, nhưng với quy mô nhỏ hơn nhiều.
 #### Ứng dụng `Nhuyshop `được xây dựng với giao diện và  chức năng:
 ##### 1. `Màng hình chính`
![Nhuyshop | small ](https://github.com/nhuyk56/BAITHI_JAVA/blob/master/Anh_README/trangchinh.jpg?raw=true&&width=30 )
  - `Màng hình chính` được sử dụng hiệu ứng `Animation` để làm cho hình ảnh tự động lướt qua, lướt lại để tạo thêm sự sinh động cho ứng dụng
  - Màng hình chính có thể hiển thị` 6 sản phẩm` được cập nhật mới nhất từ database
  - Từ màng hình chính có thể truy cập thẳng vào màng hình giỏ hàng thông qua `Nút icon giỏ hàng` trên thanh toolbar
  - Từ màng hình chính có thể gọi `thanh menu`
  - Người mua hàng có thể chọn các sản phẩm trên màng hình chính, khi click vào lỗi sản phẩm ứng dụng sẽ hiển thị trang` chi tiết sản phẩm`.
##### 2. `Màng hình Menu`
![Nhuyshop](https://github.com/nhuyk56/BAITHI_JAVA/blob/master/Anh_README/menu.jpg?raw)
 - Cho phép người dùng có thể truy cập đến các trang khác của ứng dụng, lựa chọn loại mặt hàng mình muốn hoặc tìm hiểu thông tin tác giả
 - Đặc biệt có hai trang là `Điện thoại` và `Laptop` được lấy từ `server` trên cơ sở dữ liệu, còn các trang còn lại trong menu là các `trang tĩnh`
##### 3. `Màng hình điện thoại`
![Nhuyshop](https://github.com/nhuyk56/BAITHI_JAVA/blob/master/Anh_README/dienthoai.jpg?raw)
 -   `Trang màng hình điện thoại` hiển thị các sản phẩm từ` server`
    - Sử dụng `luồng` để vừa `load dữ liệu` vừa `hiển thị thanh 'đang xử lý'`  khi `phân trang`
    - Và khi click vào `sản phẩm bất kỳ`, thì sẽ chuyển tiếp đến` màng hình chi tiết sản phẩm`
##### 4. `Màng hình laptop`
![Nhuyshop](https://github.com/nhuyk56/BAITHI_JAVA/blob/master/Anh_README/laptop.jpg?raw)
-   `Tang màng hình lapto`p hiển thị các sản phẩm từ` server`
- Sử dụng `luồng` để vừa `load dữ liệu` vừa `hiển thị thanh 'đang xử lý'`  khi `phân trang`
- Và khi click vào `sản phẩm bất kỳ`, thì sẽ chuyển tiếp đến` màng hình chi tiết sản phẩm`
##### 5.` Màng hình chi tiết sản phẩm`
![Nhuyshop](https://github.com/nhuyk56/BAITHI_JAVA/blob/master/Anh_README/chitietsanpham.jpg?raw)
- Hiển thị `chi tiết sản phẩm` như:
    - Hình ảnh
    - Tên sản phẩm
    - Giá sản phẩm
    - Cho phếp chọn số lượng (từ 1 đến 10)
    - Thông tin mô tả sản phẩm
    - `Nút thêm vào giỏ hàng`
- `Khi click vào nút thêm vào giỏ hàng`, mặt hàng sẽ được `lưu thêm số lượng` và chuyển đến `trang giỏ hàng`
##### 6. `Màng hình giỏ hàng`
![Nhuyshop](https://github.com/nhuyk56/BAITHI_JAVA/blob/master/Anh_README/giohang.jpg?raw)
- Hiển thị các` sản phẩm` người dùng đã cho vào` giỏ hàng`
- Cho phép `chỉnh sửa số lượng` trong `từng mặt hàng`
- Cho phép `xóa bỏ từng mặt hàng`
- Cho phép truy cập vào `trang chính`
- Nếu đã hài lòng với giỏ hàng, người dùng có thể click vào nút `Thanh Toán` để chuyển sang màng hình thông tin khách hàng
- - Nếu người dùng muốn tiếp tục mua hàng thì click vào nút ` Tiếp tục mua hàng`
##### 7.` Màng hình thông tin khách hàng`
![Nhuyshop](https://github.com/nhuyk56/BAITHI_JAVA/blob/master/Anh_README/thongtinkhachhang.jpg?raw)
- Cho phép người dùng `nhập vào dữ liệu thông tin cá nhâ`n:
    - Tên khách hàng
    - Số điện thoại khách hàng
    - Email khách hàng
- Nếu đã nhập xong thông tin, người dùng có thể nhấn nút ` Xác Nhận` để tiến hành gửi đơn hàng và thông tin khách hàng lên `server`  
- Nếu người dùng muốn tiếp tục mua hàng thì click vào nút ` Trở về`
##### 8. `Màng hình thông tin`
![Nhuyshop](https://github.com/nhuyk56/BAITHI_JAVA/blob/master/Anh_README/thongtin.jpg?raw)
- Để biết thêm về `tác giả` người dùng có thể truy cập vào trang ` Thông tin`
- `Trang Thông tin` hiển thị một vài thông tin tác giả như:
    - Nghề
    - Trường
    - Map
##### 9. `Màng hình liên hệ`
![Nhuyshop](https://github.com/nhuyk56/BAITHI_JAVA/blob/master/Anh_README/lienhe.jpg?raw)
- Để liên hệ với `tác giả ` người dùng có thể truy cập vào trang ` Liên hệ`
- `Trang Liên hệ` hiển thị một vài thông tin` Liên hệ` tác giả như: 
    - Họ tên
    - Email
    - Số điện thoại