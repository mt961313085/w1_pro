<?php
require_once('config.php');

//创建配置对象
$config=new config();
//读取test.ini中的配置信息
$config->read_config('test.ini');
$user=$config->user;
$pass=$config->pass;
$host=$config->host;
$link=mysql_connect($host,$user);
if(!$link){
	die('conner failed:').mysql_errno;
}
//选择数据库
mysql_query('use innovative_pro_db') or die('query failed'.mysql_errno."\r\n");

$sql="select id,a_id,o_id,step,proposer,content,rec_t from affair_pro_t where processor='12345' limit 0,10";
$res=mysql_query($sql);
$name=array();
$coment=array();
//将查询结果转移到二维数组中
$res_array=array();
while($row=mysql_fetch_assoc($res)){
	$res_array[]=$row;
	//name值，根据affair_pro_t表中的a_id，在affair_pro_flow_t表中获取
	$sql="select a_name from affair_pro_t where a_id='$row['a_id']'";
	$res_name=mysql_query($sql);
	$name[]=mysql_fetch_assoc($res_name);
	mysql_free_result($res_name);
	//comment字段值，根据o_id值，在affair_pro_t中查找获取
	$sql="select a_name from affair_pro_t where a_id='$row['o_id']'";
	$res_coment=mysql_query($sql);
	$coment[]=mysql_fetch_assoc($res_coment);
	mysql_free_result($res_coment);
}
mysql_free_result($res);
//print_r($res_array);
//php数组转json格式数据例子
/*$info=array();
$coment=array();
$coment[]=array('0'=>array('p'=>'u1','s'=>'gg gg gg'),'1'=>array('p'=>'u2','s'=>'good good good'));
//$coment[]=array('0'=>array('p'=>'u1','s'=>'gg gg gg'),'1'=>array('p'=>'u2','s'=>'good good good'));
//echo json_encode($coment);
$info[]=array('id'=>'001','name'=>'wdh','coment'=>$coment);
$array=array('info'=>$info);
//print_r($info);
$json=json_encode($array);
echo $json;*/
/*将数据库查询结果转换为json数据反馈给浏览器
 */


?>