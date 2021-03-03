<?php

/**
 * Main controller class
 */

class Controller{
	
	protected $db;
	protected $fm;
	
	function __construct($key){
		$this->db   = new Database();
  		$this->fm   = new Format();
  		$this->APIAuthCheck($key);
	}

	//DB connection
	private function APIAuthCheck($key){
		if($key !== $this->db->API_KEY){
			echo json_encode(array('Warning' => 'Un Authorization access put valid API KEY'));
			exit();
		}
	}

}