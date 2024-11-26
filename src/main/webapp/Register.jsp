<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
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
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
            width: 350px;
            text-align: center;
        }

        h1 {
            margin-bottom: 20px;
            font-size: 24px;
        }

        input[type="text"], input[type="password"], input[type="email"] {
            width: 100%;
            padding: 10px;
            margin: 10px -10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 10px -10px 0;
            border: none;
            border-radius: 5px;
            background-color: #2575fc;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #6a11cb;
        }

        label {
            display: block;
            text-align: left;
            margin: 10px -10px;
            font-size: 14px;
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
    <form action="Register" method="post">
        <h1>Register</h1>
        <label for="fullname">Họ và Tên</label>
        <input type="text" id="fullname" name="fullname" placeholder="Nhập họ và tên của bạn" required>

        <label for="email">Email</label>
        <input type="email" id="email" name="email" placeholder="Nhập email của bạn" required>

        <label for="username">Tài Khoản</label>
        <input type="text" id="username" name="username" placeholder="Nhập tên tài khoản của bạn" required>

        <label for="password">Mật Khẩu</label>
        <input type="password" id="password" name="password" placeholder="Nhập mật khẩu của bạn" required>

        <label for="confirm-password">Mật Khẩu Xác Nhận</label>
        <input type="password" id="confirm-password" name="confirm-password" placeholder="Nhập lại mật khẩu của bạn" required>

        <input type="submit" value="Đăng Ký">

        <div class="form-footer">
            Bạn	đã có tài khoản? <a href="Login.jsp">đăng nhập ở đây</a>
        </div>
    </form>
</body>
</html>
