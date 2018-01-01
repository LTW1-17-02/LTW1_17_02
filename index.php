<?php 
require_once 'init.php';
  $stmt = $db->prepare("SELECT id,tensp,loai,gia,soluong,mota,image,xuatsu,createAt,luotxem from sanpham group by tensp,giatien,hinhanh,ngaynhap order by soluongban desc limit 5 ");
  $stmt->execute();
  $posts = $stmt->fetchAll(PDO::FETCH_ASSOC);

$resultSet= selectSanPhamMoi();
?>
<?php include 'header.php' ?>
<h1>Trang chủ</h1>
<?php if ($currentUser) : ?>
<p>Chào mừng <?php echo $currentUser['fullname'] ?> đã trở lại.</p>
      
<div class="clearfix"></div>
    <div class="clearfix"></div>
         <div class="container_fullwidth">
            <div class="container">
               <div class="hot-products">
                  <h3 class="title">Sản Phẩm<strong> Mới</strong></h3>
                  
                  <ul id="hot">
                     <li>
                        <div class="row">
                           <?php foreach($resultSet as $row): ?>
                            <div class="col-md-3 col-sm-6">
                              <div class="products">
                                 <div class="offer">New</div>
                                 <div class="thumbnail"><a href="details.php?id=<?php echo $row['mahang']?>"><img src="<?php echo $row['image'] ?>" alt="Product Name"></a></div>
                                 <div class="productname"><?php echo $row['tensp'] ?></div>
                                 <h4 class="price"><?php echo $row['gia'] ?>đ</h4>
                                 
                                 </div>
                              </div>
                            </div>
                            <?php endforeach; ?>
                        </div>
                     </li>
                  </ul>
               </div>
              </div>
              </div>
               
 Bạn chưa đăng nhập
<?php endif ?>
<?php include 'footer.php' ?>