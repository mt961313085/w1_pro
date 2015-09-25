<?php
	session_start();
	require_once('ConnectDB.php');
	$db=new ConnectDB();
	$link=$db->connect();


	//账号注册
	
	function regiseter($identity,$email,$password,$name,$com,$sex,$sid){
		$sql="insert into p_info_t (name,sex,)"
	}
	//发表新闻
	function submitNews($title1,$title2='',$publicer,$submit_p,$col,$path=''){

		$submit_p=$_SESSION['user'];
		$sql="insert into news_t (title1,title2,path,publicer,submit_p,submit_t,col) values($title1,$title2,$path,$publicer,$submit_p,now(),$col)";
		mysql_query($sql);

	}

	showNews($top,$normal){
		//筛选置顶新闻，
		$sql="select title1,title2,path,submit_p,submit_p,col from news_t where flag='1' and top_e > now() order by top_s desc limit $top";
		$result=mysql_query($sql);
		$row1=array();
		while($row1[]=mysql_fetch_assoc($result));
		$sql="select title1,title2,path,submit_p,submit_p,col from news_t where flag='1' and top_s='' order by public_t limit $normal";
		$result=mysql_query($sql);
		$row2=array();
		while($row2=mysql_fetch_assoc($result));
		$row=array_merge($row1,$row2);
		echo json_encode($row);
		mysql_free_result($result);

	}

	//事务处理
	function processAffair($id,$step,$comment,$res){

		$sql="select content,step from affair_pro_t where id=$id";
		$result=mysql_query($sql,$link);
		$row=mysql_fetch_row($result);
		$step=$row['step'];
		echo "<br>$row['content']</br>";

		//更新处理人结果
		$end_t=time();
		$sql="update affair_pro_t set comment=$comment,res=$res,end_t=$time where id=$id";
		if(mysql_query($sql))
			echo "<br>评审成功</br>";
		else
			echo "<br>评审失败</br>";

		$sql="select weight from affair_pro_flow_t where  step=$step and a_id=$id";
		$result=mysql_query($sql);
		$row=mysql_fetch_assoc($result);
		$weight=$row["weight"];
		$type=substr($weight,0,1);

		//每个人的权值相等的时候
		if($type=="e"){

			$n=substr($pass,1,1);
			$m=substr($pass,3,1);
			$sql="select count(*) from affair_pro_t where o_id=$id and step=$step and res='pass'";
			$resutl=mysql_query($sql);
			$row=mysql_fetch_array($result);

			//判断是否符合进入一下个流程的条件
			//判断同意的人数是否符合条件
			if($row[0]>=$n){

				echo "事务当前流程通过，进入一下个流程</br>";
				$sql="update affair_pro_flow_t set pass='pass' where a_id=$id and step=$step";
				mysql_query($sql);
				$sql="insert into message_t (sendTime,sender,reciver,message) values(now(),0,$reciver,$message)";
				mysql_query($sql);
				$sql="select res_fb from affair_pro_flow_t where a_id=$id and step=$step";
				$result=mysql_query($sql);
				$row=mysql_fetch_assoc($result);
				$res=$row['res_fb'];

				if($res==""){
					echo "本项事务已完成</br>";
				}
				else{
					echo "通知处理人开始处理</br>结果已发往知情人员</br>";
				}
			}

			else{

				$sql="select count(*) from affair_pro_t where o_id=$id and step=$step and res='refuse'";
				$result=mysql_query($sql);
				$row=mysql_fetch_array($result);
				if($row[0]>=($m-$n+1)){
					echo "当前事务流程终止";
					$sql="update affair_pro_flow_t set pass='refuse' where o_id=$id and step=0";		
					mysql_query($sql);
				}
				else
					echo "等待其他处理人处理后进入到下一个流程";
			}
		}
	}
?>