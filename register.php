<?php 
require_once "recaptchalib.php";
  require_once 'init.php';
  $success = true;
  // your secret key
$secret = "6LdVKz8UAAAAAIuxgPiG15g8hKzude1tGd2_p_G7";
// empty response
$response = null;
// check secret key
$reCaptcha = new ReCaptcha($secret);
  
  if (!empty($_POST['fullname']) && !empty($_POST['email']) && !empty($_POST['password'])) {
    $email = strtolower($_POST['email']);
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $fullname = $_POST['fullname'];
    // Kiểm tra xem email có trùng không
    $user = findUserByEmail($email);
    if ($user) {
      $success = false;
    } else {
		// if submitted check response
		if ($_POST["g-recaptcha-response"]) {
			$response = $reCaptcha->verifyResponse(
				$_SERVER["REMOTE_ADDR"],
				$_POST["g-recaptcha-response"]);
			$insertId = createUser($fullname, $email, $password);
			$_SESSION['userId'] = $insertId;
			// Redirect to home page
			header('Location: index.php');
			exit();
		}
  }
  }

?>

<?php include 'header.php' ?>
<script src='https://www.google.com/recaptcha/api.js'></script>
<h1>Đăng ký tài khoản</h1>
<?php if (!$success) : ?>
<div class="alert alert-danger" role="alert">
  Email đã tồn tại đăng ký lại!
</div>
<?php endif; ?>
<form method="POST">
  <div class="form-group">
    <label for="fullname">Họ và tên</label>
    <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Điền họ và tên vào đây" value="<?php echo isset($_POST['fullname']) ? $_POST['fullname'] : '' ?>">
  </div>
  <div class="form-group">
    <label for="email">Địa chỉ email</label>
    <input type="email" class="form-control" id="email" name="email" placeholder="Điền email vào đây" value="<?php echo isset($_POST['email']) ? $_POST['email'] : '' ?>">
  </div>
  <div class="form-group">
    <label for="password">Mật khẩu</label>
    <input type="password" class="form-control" id="password" name="password" placeholder="Điền mật khẩu vào đây">
  </div>
    <div class="g-recaptcha" data-sitekey="6LdVKz8UAAAAAGsQvtUIaIW2etc8ZQEb0aO7PGDG"></div>
  <button type="submit" class="btn btn-primary">Đăng ký</button>
</form>
<?php include 'footer.php' ?>