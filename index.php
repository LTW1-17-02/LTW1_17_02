<?php 
require_once 'init.php';
  $resultSet = selectSanPhamMoi();

?>
<?php include 'header.php' ?>
<h1>Trang chủ</h1>
<?php if ($currentUser) : ?>
<p>Chào mừng <?php echo $currentUser['fullname'] ?> đã trở lại.</p>
<?php endif ?>
<h3 class="title">Sản Phẩm<strong>Mới</strong></h3>
    <ul id="new">
		<li>
			<div class="row">
				<?php foreach($resultSet as $row): ?>
				<div class="col-sm-4">
					<blink><FONT color=red  size=5><B><I>Mới</blink></b></i></font>
					<div class="products"  align='center'>
						
						<div class="thumbnail">
							<a href="chitiet.php?id=<?php echo $row['id']?>"><img src="<?php echo $row['image'] ?>" alt="TenSanPham"></a>
						</div>
						
						<div class="tensanpham"><?php echo $row['tensp'] ?></div>
						<h4 class="gia"><?php echo $row['gia'] ?>đ</h4>
						<div class="btn-group-vertical">
							<button class="button add-cart" type="button">
								<?php if (!$currentUser) : ?>
									<h8>Đăng Nhập Để Mua Hàng</h8>
								<?php else: ?>
									<a href="add.php?id=<?php echo $row['id']?>">Mua
							</button>
							<?php endif ?>
							<button class="button detail" type="button">
								<a href="chitiet.php?id=<?php echo $row['id'] ?>">Xem Thông Tin </a>
							</button>
						</div>
						
					</div>
				</div>
				<?php endforeach; ?>
			</div>
		</li>
	</ul>      

<?php include 'footer.php' ?>