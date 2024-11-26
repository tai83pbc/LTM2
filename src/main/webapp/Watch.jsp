<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    String account = (String) session.getAttribute("account");
    if (account == null) {
        response.sendRedirect("Login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TCT Tube</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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

        /* Header Styles */
        .header {
            background-color: #2575fc;
            color: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 20px;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .header .logo {
            display: flex;
            align-items: center;
            font-size: 24px;
            font-weight: bold;
        }

        .header .logo i {
            margin-right: 10px;
            cursor: pointer;
        }

        .header .search-bar {
            flex: 1;
            margin: 0 20px;
            display: flex;
        }

        .header .search-bar input {
            flex: 1;
            padding: 8px;
            border: none;
            border-radius: 3px 0 0 3px;
            outline: none;
        }

        .header .search-bar button {
            padding: 8px 12px;
            background: white;
            border: none;
            border-radius: 0 3px 3px 0;
            cursor: pointer;
            transition: background 0.3s;
        }

        .header .search-bar button:hover {
            background: #ddd;
        }

        /* Sidebar Styles */
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
            transform: translateX(0);
            transition: transform 0.3s ease-in-out;
        }

        .sidebar.hidden {
            transform: translateX(-100%);
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
        
        /* Main Content Styles */
        .main {
            margin-left: 260px;
            padding: 20px;
            margin-top: 70px;
        }

        .video-container {
            text-align: center;
        }

        .video-container video {
            width: 100%;
            max-width: 800px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .video-details {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }

        .video-details .stats {
            display: flex;
            gap: 20px;
        }

        .comments {
            margin-top: 20px;
        }

        .comments input {
            width: 80%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 3px;
        }

        .comments button {
            padding: 10px 15px;
            background-color: #2575fc;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .comments button:hover {
            background-color: #1a5ec8;
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
    </style>
     <script>
     function toggleLogoutMenu() {
	        const menu = document.getElementById("logout-menu");
	        menu.classList.toggle("visible"); // Thêm/xóa lớp hiển thị menu
	    }
	
	    function logout() {
	        // Đăng xuất và điều hướng về trang đăng nhập
	        alert("Logging out...");
	        window.location.href = "Logout"; // Thay đổi URL phù hợp
	    }
        function toggleSidebar() {
            const sidebar = document.getElementById("sidebar");
            sidebar.classList.toggle("hidden");
        }

        function addComment() {
            const input = document.getElementById("commentInput");
            const commentList = document.getElementById("commentList");
            const comment = input.value.trim();
            if (comment) {
                const li = document.createElement("li");
                li.textContent = comment;
                commentList.appendChild(li);
                input.value = '';
            }
        }
        const menuToggle = document.getElementById("menu-toggle");
        const sidebar = document.getElementById("sidebar");
        const mainContent = document.getElementById("mainContent");

        menuToggle.addEventListener("click", () => {
            sidebar.classList.toggle("hidden");
            mainContent.classList.toggle("sidebar-hidden");
        });
    </script>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <div class="logo">
            <i class="fas fa-bars" onclick="toggleSidebar()"></i>
            <i class="fab fa-youtube"></i>
            <span>TCT TUBE</span>
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
    <div class="sidebar" id="sidebar">
        <h2>Danh mục</h2>
        <ul>
            <li><i class="fas fa-video"></i> Video mới</li>
            <li><i class="fas fa-list"></i> Danh sách phát</li>
            <li><i class="fas fa-fire"></i> Video phổ biến</li>
            <li><i class="fas fa-thumbs-up"></i> Video đề xuất</li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main">
        <div class="video-container">
            <video controls>
                <source src="video1.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
        </div>
        <div class="video-details">
            <div class="stats">
                <span><i class="fas fa-eye"></i> 1,234 views</span>
                <span><i class="fas fa-thumbs-up"></i> 123 likes</span>
            </div>
            <button>Share</button>
        </div>
        <div class="comments">
            <h3>Comments</h3>
            <ul id="commentList">
                <li>Great video!</li>
                <li>Very helpful!</li>
            </ul>
            <input type="text" id="commentInput" placeholder="Add a comment...">
            <button onclick="addComment()">Comment</button>
        </div>
    </div>
</body>
</html>
