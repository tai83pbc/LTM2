<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<% String d = (String)session.getAttribute("account");
	if(d==null){
		response.sendRedirect("Login.jsp");
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TCT TUBE</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script type="text/javascript">
	    function toggleLogoutMenu() {
	        const menu = document.getElementById("logout-menu");
	        menu.classList.toggle("visible"); // Thêm/xóa lớp hiển thị menu
	    }
	
	    function logout() {
	        // Đăng xuất và điều hướng về trang đăng nhập
	        alert("Logging out...");
	        window.location.href = "Logout"; // Thay đổi URL phù hợp
	    }
	    function navigateTo(page) {
	        const iframe = document.querySelector('.main iframe'); // Lấy iframe
	        iframe.src = page; // Đổi URL của iframe

	        // Xóa trạng thái active cũ
	        const sidebarItems = document.querySelectorAll('.sidebar ul li');
	        sidebarItems.forEach(item => item.classList.remove('active'));

	        // Đặt trạng thái active cho mục được chọn
	        const clickedItem = [...sidebarItems].find(item => item.onclick?.toString().includes(page));
	        if (clickedItem) {
	            clickedItem.classList.add('active');
	        }
	    }



	    // Ẩn menu nếu click ra ngoài
	    document.addEventListener("click", function (event) {
	        const profileContainer = document.querySelector(".profile-container");
	        const menu = document.getElementById("logout-menu");
	
	        if (!profileContainer.contains(event.target)) {
	            menu.classList.remove("visible");
	        }
	    });
	    document.addEventListener('DOMContentLoaded', () => {
	        // Mặc định chọn Home
	        navigateTo('Home.jsp');
	    });
	    document.querySelectorAll('.sidebar ul li').forEach(item => {
	        item.addEventListener('click', () => {
	            navigateTo(item.getAttribute('data-page'));
	        });
	    });


	    
    </script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
		
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
        }
		html, body {
    		height: 100%;
		}
        /* Header */
        .header {
            background-color: #2575fc;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .header .logo {
            font-size: 24px;
            font-weight: bold;
            display: flex;
            align-items: center;
        }

        .header .logo i {
            margin-right: 10px;
        }
		.logo:hover {
		    cursor: pointer;
		}


        .header .search-bar {
        	
            flex: 1;
            margin: 0 20px;
            display: flex;
            align-items: center;
        }

        .header .search-bar input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 10px;
            outline: none;
        }

        .header .search-bar button {
            padding: 10px 15px;
            border: none;
            background-color: white;
            color: #333;
            border-radius:100%;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .header .search-bar button:hover {
            background-color: #ddd;
        }

 		/* Profile Container */
	    .profile-container {
	        position: relative;
	        display: inline-block;
	    }
	
	    /* Profile Image */
	    .profile img {
	        cursor: pointer;
	        border-radius: 50%;
	        transition: box-shadow 0.3s;
	    }
	
	    .profile img:hover {
	        box-shadow: 0 0 5px #2575fc;
	    }
	
	    /* Dropdown Menu */
	    .logout-menu {
	        position: absolute;
	        top: 50px;
	        right: 0;
	        background-color: white;
	        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	        border: 1px solid #ccc;
	        padding: 10px;
	        z-index: 1000;
	        border-radius: 5px;
	        width: 150px;
	        display: none; /* Ẩn menu theo mặc định */
	    }
	
	    .logout-menu.visible {
	        display: block; /* Hiển thị menu khi được kích hoạt */
	    }
	
	    .logout-menu button {
	        background-color: #2575fc;
	        color: white;
	        border: none;
	        padding: 8px 16px;
	        border-radius: 4px;
	        cursor: pointer;
	        width: 100%;
	    }
	
	    .logout-menu button:hover {
	        background-color: #1a5ec8;
	    }

        /* Sidebar */
        .sidebar {
            width: 220px;
            background-color: #fff;
            position: fixed;
            top: 60px;
            bottom: 0;
            left: 0;
            padding: 20px 0;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            overflow-y: auto;
        }

        .sidebar ul {
            list-style: none;
        }

        .sidebar ul li {
            padding: 15px 20px;
            display: flex;
            align-items: center;
            cursor: pointer;
            color: #333;
            transition: background-color 0.3s, color 0.3s;
        }

        .sidebar ul li i {
            margin-right: 15px;
            font-size: 18px;
        }

        .sidebar ul li:hover {
            background-color: #f0f0f0;
            color: #ff0000;
        }
        .sidebar ul li.active {
		    background-color: #2575fc;
		    color: white;
		    font-weight: bold;
		}

		
		.sidebar ul li:hover {
		    background-color: #f0f0f0;
		    color: #ff0000;
		}
        
        
        	/* Main Content */
		.main {
			position: fixed;
		    top: 60px;  /* Căn chỉnh dưới header */
		    margin-left: 240px; /* Căn chỉnh bên phải để tránh sidebar */
		    height: 100%; /* Đảm bảo nội dung không bị tràn qua màn hình */
		    width: 100%;
		}
		
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <div class="logo">
            <i class="fab fa-youtube"></i>
            TCT TUBE
        </div>
        <div class="search-bar">
            <input type="text" placeholder="Search">
            <button><i class="fas fa-search"></i></button>
        </div>
	        <div class="profile-container">
			    <div class="profile" onclick="toggleLogoutMenu()">
			        <img src="https://via.placeholder.com/35" alt="Profile">
			    </div>
			    <div id="logout-menu" class="logout-menu hidden">
			        <button onclick="logout()">Logout</button>
			    </div>
			</div>
    </div>

    <!-- Sidebar -->
    <div class="sidebar">
		<ul>
		    <li id="home" onclick="navigateTo('Home.jsp')"><i class="fas fa-home"></i> Trang Chủ</li>
		    <li id="trending" onclick="navigateTo('Trending.jsp')"><i class="fas fa-fire"></i> Thịnh Hành</li>
		    <li id="subscribe" onclick="navigateTo('Subscribe.jsp')"><i class="fas fa-play"></i> Đăng Ký</li>
		    <li id="library" onclick="navigateTo('Library.jsp')"><i class="fas fa-folder"></i> Thư Viện</li>
		    <li id="history" onclick="navigateTo('History.jsp')"><i class="fas fa-history"></i> Lịch Sử</li>
		</ul>
    </div>
    	<!-- Main Content -->
    <div class="main">
    	<iframe src="Home.jsp" title="Xem thêm nội dung" width="100%" height="100%" style="border: none; height: calc(100% - 60px)"></iframe>
    </div>
    
</body>
</html>
