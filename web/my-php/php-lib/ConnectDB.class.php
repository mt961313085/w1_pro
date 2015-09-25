<?php
	// 从文件中读取 mysql 数据库用户、密钥等配置信息
	class ConnectDB {
			public $host;
		 	public $user;
			public $pass;
			public $db;
			public $upload_path;
			public $domain;
			public $key_1;

		public  function __construct() {
			//解析配置文件
			$res=parse_ini_file('configDB.ini');
			$this->host=$res['host'];
			$this->user=$res['user'];
			$this->pass=$res['pass'];
			$this->db=$res['db'];
		}

		public function connect(){
			$link=mysql_connect($this->host,$this->user,$this->pass);
			mysql_query("set names utf8");
			mysql_query("use $this->db");
			return $link;
		}

	}
	
?>