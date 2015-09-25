<?php
	require_once("ConnectDB.class.php");

	session_start();

	if(isset($_POST['username'])&&trim($_POST['username']){
		$username=addcslashes(trim($_POST['username']));	
	}

	if(isset($_POST['password'])&&trim($_POST['password']){
		$password=addcslashes(trim($_POST['password']));
		$password=md5($password);
	}

	//连接数据库
	$con=new ConnectDB;
	$con->connect();

	if(strpos($username,'@')){
		$query="select * from p_info_t where email=$username and key=$password";
	}
	else{
		$query="select * from p_info_t where sid=$username and key=$password";
	}
	$res=mysql_query($query);
	
	if(mysql_affected_rows($res)==1){
		echo "登陆成功\r\n";
	}
	else{
		echo "账号或密码错误\r\n";
	}
?>