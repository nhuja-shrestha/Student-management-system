<?php
session_start();
include('D:\xampp\xampp\htdocs\Student-management-system\config\db.php');

if (!isset($_SESSION['user_id'])) {
    header("Location: ../public/login.php");
    exit();
}

$user_id = $_SESSION['user_id'];
$notice_id = intval($_GET['notice_id'] ?? 0);

// Step 1: If user clicked "Yes" button, delete the notice
if (isset($_POST['confirm_delete'])) {
    $sql = "DELETE FROM notices WHERE notice_id = '$notice_id' AND posted_by = '$user_id'";
    $result = $conn->query($sql);

    if ($conn->affected_rows > 0) {
        $message = "Notice deleted successfully!";
        $type = "success";
    } else {
        $message = "You cannot delete this notice.";
        $type = "error";
    }
    ?>
    <!DOCTYPE html>
    <html>
    <head>
      <style>
        body {
          font-family: Poppins, sans-serif;
          background-color: #0a0a0a;
          color: #fff;
        }
        .message-box {
          position: fixed;
          top: 50%;
          left: 50%;
          transform: translate(-50%, -50%);
          padding: 20px 30px;
          border-radius: 10px;
          text-align: center;
          font-size: 18px;
          font-weight: 500;
          width: 400px;
          box-shadow: 0 4px 10px rgba(0,0,0,0.3);
          animation: fadeInOut 2s ease-in-out;
        }
        .success {
          background-color: #d4edda;
          color: #155724;
          border: 2px solid #c3e6cb;
        }
        .error {
          background-color: #f8d7da;
          color: #721c24;
          border: 2px solid #f5c6cb;
        }
        @keyframes fadeInOut {
          0% { opacity: 0; }
          10% { opacity: 1; }
          90% { opacity: 1; }
          100% { opacity: 0; }
        }
      </style>
    </head>
    <body>
      <div class="message-box <?php echo $type; ?>">
        <?php echo $message; ?>
      </div>
      <script>
        setTimeout(() => {
          window.location = "view_notice.php";
        }, 2000);
      </script>
    </body>
    </html>
    <?php
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
  <style>
    body {
      font-family: Poppins, sans-serif;
      background-color: #0a0a0a;
      color: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .confirm-box {
      background-color: #1a1a1a;
      border: 2px solid #0462a1;
      padding: 25px 40px;
      border-radius: 12px;
      text-align: center;
      width: 400px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.3);
    }
    .confirm-box h2 {
      color: #fff;
      margin-bottom: 20px;
    }
    .confirm-box button {
      padding: 10px 20px;
      border: none;
      border-radius: 6px;
      font-size: 16px;
      cursor: pointer;
      margin: 0 10px;
      transition: 0.3s;
    }
    .yes-btn {
      background-color: #0462a1;
      color: white;
    }
    .no-btn {
      background-color: #555;
      color: white;
    }
    .yes-btn:hover {
      background-color: #0587db;
    }
    .no-btn:hover {
      background-color: #777;
    }
  </style>
</head>
<body>
  <div class="confirm-box">
    <h2>Are you sure you want to delete this notice?</h2>
    <form method="POST">
      <button type="submit" name="confirm_delete" class="yes-btn">Yes, Delete</button>
      <button type="button" class="no-btn" onclick="window.location='view_notice.php'">Cancel</button>
    </form>
  </div>
</body>
</html>
