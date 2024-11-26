<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html>
<html >
<head>
	<link rel="icon" type="image/x-icon" href="/favicon.ico">
    <meta charset="UTF8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Đăng Nhập</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: #fff;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background: rgba(0, 0, 0, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
            width: 300px;
            text-align: center;
        }

        h1 {
            margin-bottom: 20px;
            font-size: 24px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px -10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            outline: none;
        }

        input[type="submit"],input[type="button"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            background-color: #2575fc;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover,input[type="button"]:hover {
            background-color: #6a11cb;
        }
                .form-footer {
            margin-top: 15px;
            font-size: 14px;
        }

        .form-footer a {
            color: #2575fc;
            text-decoration: none;
            transition: color 0.3s;
        }

        .form-footer a:hover {
            color: #6a11cb;
        }
    </style>
</head>
<body>
    <form action="CheckLoginandViewIndex" method="post">
        <h1>Đăng Nhập</h1>
        <label for="username">Tài Khoản</label>
        <input type="text" id="username" name="username" placeholder="Nhập tài khoản của bạn" required><br>
        <label for="password">Mật Khẩu</label>
        <input type="password" id="password" name="password" placeholder="Nhập mật khẩu của bạn" required><br>
        <input type="submit" value="Đăng Nhập">
        <div class="form-footer">
            Bạn chưa có tài khoản? <a href="Register.jsp">Đăng ký ở đây</a>
        </div>
    </form>
</body>
</html>
