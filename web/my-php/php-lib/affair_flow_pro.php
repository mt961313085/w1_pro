<?php
	require_once "ConnectDB.class.php";
	//创建连接数据对象
	$con=new ConnectDB;
	$link=$con->connect();
	//接受处理人信息
	if(isset($_POST['proposer']) && trim($_POST['proposer']){
		$proposer=addslashes(trim($_POST['proposer']));
	}
	//接受a_id
	if(isset($_POST['a_id']) && trim($_POST['a_id'])){
		$a_id=addslashes(trim($_POST['a_id']));
	}
	//接受处理结果res
	if(isset($_POST['res']) && trim($_POST['res'])){
		$res=addslashes(trim($_POST['res']);
	}

	//更新结果
	$query="update affair_pro_t set res=$res where a_id=$a_id and proposer=$proposer";
	if(mysql_query($query)){
		echo "sucesses\r\n";
	}

	$query="select step from affair_pro_t where a_id=$a_id";
	$resource=mysql_query($query);
	$row=mysql_fetch_assoc($resource);
	$step=$row['step'];

	$query="select res from affair_pro_t where a_id=$a_id";
	$resource=mysql_query($query);
	while($row=mysql_fetch_assoc($resource)){
		$row[]=$row;
	}

?>