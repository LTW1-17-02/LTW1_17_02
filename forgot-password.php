<?php 
require_once 'init.php';

$success = false;
  $codeRan = generateRandomString();
	
	echo $codeRan;
if (!empty($_POST['email'])) {
	
  $user = findUserByEmail($_POST['email']);
  echo $user['fullname'];
    $emailBody = "<div>Chào " . $user["fullname"] . ",<br><br><p>Click vào link sau để khôi phục mật khẩu <br><a href='http://localhost:8080/BTCN09/reset_password.php?code=" . $codeRan . "'>http://localhost:8080/BTCN09/reset_password.php?code=" . $codeRan . "</a><br><br></p>Thân ái,<br> Admin.</div>";

	echo $emailBody;
	
	if ($user) {
	$mail = new PHPMailer\PHPMailer\PHPMailer();
	$mail->SMTPDebug = 2;
    $mail->isSMTP();
    $mail->Host = 'smtp.gmail.com';
    $mail->SMTPAuth = true;
    $mail->Username = 'phantanhiepnt@gmail.com';
    $mail->Password = '01694424958';
    $mail->SMTPSecure = 'tls';
    $mail->Port = 587;

    //Recipients
    $mail->setFrom('phantanhiepnt@gmail.com', 'Mailer');
    $mail->addAddress('dapxekhongbanh@gmail.com', 'TH');

    //Content
    $mail->isHTML(true);
    $mail->Subject = 'Here is the subject';
    $mail->Body    = 'This is the HTML message body <b>in bold!</b>';
    $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

    $mail->send();
	
  }else {
    $success = false;
  }
	*/
  
}
?>
<?php include 'header.php' ?>
  <?php if (!$success) : ?>
   <div class="alert alert-success" role="alert">
	Email hướng dẫn khôi phục mật khẩu đã được gửi
  </div>
  <?php endif; ?>
<h1>Quên mật khẩu</h1>
<form method="POST">
  <div class="form-group">
    <label for="email">Địa chỉ email</label>
    <input type="email" class="form-control" id="email" name="email" placeholder="Điền email vào đây" value="<?php echo isset($_POST['email']) ? $_POST['email'] : '' ?>">
  </div>
  <button type="submit" class="btn btn-primary">Quên mật khẩu</button>
</form>
<?php include 'footer.php' ?>