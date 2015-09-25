<?php
//-------------m个人中随机选出n个人---------
//生成数组，数组值1~20
$array=range(0, 20);
print_r($array);
//数组顺序打乱
shuffle($array);
//从数组零开始，取五个数
$array=array_slice($array,0,5);
print_r($array);
?>