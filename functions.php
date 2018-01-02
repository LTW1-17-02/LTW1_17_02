<?php 
function findUserByEmail($email) {
  global $db;
  $stmt = $db->prepare("SELECT * FROM users WHERE email = ?");
  $stmt->execute(array(strtolower($email)));
  $user = $stmt->fetch(PDO::FETCH_ASSOC);
  return $user;
}
function findUserById($id) {
  global $db;
  $stmt = $db->prepare("SELECT * FROM users WHERE id = ?");
  $stmt->execute(array($id));
  $user = $stmt->fetch(PDO::FETCH_ASSOC);
  return $user;
}
function createUser($fullname, $email, $password) {
  global $db;
  $stmt = $db->prepare("INSERT INTO users (email, password, fullname) VALUE (?, ?, ?)");
  $stmt->execute(array($email, $password, $fullname));
  return $db->lastInsertId();
}
function updateUser($user) {
  global $db;
  $stmt = $db->prepare("UPDATE users SET fullname = ?, phone = ? WHERE id = ?");
  $stmt->execute(array($user['fullname'], $user['phone'], $user['id']));
  return $user;
}
function updateUserPassword($userId, $hashPassword) {
  global $db;
  $stmt = $db->prepare("UPDATE users SET password = ? WHERE id = ?");
  $stmt->execute(array($hashPassword, $userId));
}
function selectSanPhamMoi()
{	
  global $db;
  $stmt = $db->prepare("SELECT * from san_pham  group by id, tensp, loai, id_nsx, gia, soluong, mota, image, xuatsu, created_at, luotxem order by created_at desc limit 9");
  $stmt->execute();
  $posts = $stmt->fetchAll(PDO::FETCH_ASSOC);
  return $posts;
}