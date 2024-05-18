# E-Commerce-App

## Backend

### Bước 1: Clone repository

```commandline
git clone https://github.com/NguyenThiThanhHuyenn/E-Commerce-App.git
```

### Bước 2: Kích hoạt môi trường ảo: 

```commandline
env\Scripts\activate
```

#### Nếu chưa có môi trường, cài đặt:
```commandline
python3 -m venv env
```

### Bước 3: Cài đặt các gói phụ thuộc

```commandline
pip install -r requirements.txt
```

### Bước 4: Chạy migration và server

```commandline
python manage.py migrate
python manage.py runserver
```


## Frontend

### Yêu cầu
#### _Node.js,npm và Expo CLI_

### Cài đặt dependencies :

```commandline
npm install
```


### Chạy ứng dụng: 

```commandline
expo start
```



## Các tài khoản:

| Loại tài khoản | username | password  |
|----------------|----------|-----------|
| Admin (super)  | hyadmin  | 123abc!!! |
| Staff          | staff1   | abcdef    |
| Seller         | yejunn   | 123456    |
| Customer       | eunhodo  | 123456    |

### Link API: https://thanhhy.pythonanywhere.com/swagger/