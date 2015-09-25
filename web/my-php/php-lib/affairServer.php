<?php
	require_once('ConnectDB.class.php');
	require_once('serverApi.php');

	$action=$_POST['action'];
	
	session_start();


	//非法登陆
	/*if(!isset($_SESSION['user']))
		exit();*/

	switch ($action) {
		
		case 'login':
			

			break;

		case 'regiseter':
			$identity=$_POST['identity'];
			$sid=$_POST['sid'];
			$email=$_POST['email'];
			$password=$_POST['password'];
			$name=$_POST['name'];
			$com=$_POST['com'];
			$sex=$_POST['sex'];
			regiseter($identity,$email,$password,$name,$com,$sex);
			break;

		case 'exit':
			# code...
			break;

		case 'regiseter':
			break;

		//创建事务流程
		case 'releaseNews':
			break;

		case 'createAffair':
			break;

		case 'applyAffair':
			break;

		case 'submitNews':

			$title1=$_POST['title1'];
			$title2=$_POST['title2'];
			$submit_p=$_POST['submit_p'];
			$col=$_POST['col'];
			submitNews($title1,$title2,$submit_p,$col);
			break;

		case 'showNews':

			$top=$_POST['top'];
			$normal=$_POST['normal'];
			showNews($top,$normal);
			break;

		case 'processAffair':
			
			$id=$_POST['id'];
			$step=$_POST['step'];
			$comment=$_POST['conmment'];
			$res=$_POST['res'];
			processAffair($id,$step,$comment,$res);

			break;
	}

	
?>