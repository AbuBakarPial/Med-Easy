<?php 
	

//headers
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods,Authorization,X-Requested-With');

//Initializing our api
require './../inc/initialize.php';

//Get API KEY from url
$API_KEY = isset($_GET['key']) ? $_GET['key'] : null ;

//Crreate Drug class object
$insert = new Drug($API_KEY);

//Get raw posted data
$post_data = json_decode(file_get_contents("php://input"));

//Insert drug to the database
$result = $insert->addDrug($post_data);

$data = array();

if($result === true){
	$data['status'] = 'success';
	$data['message'] = 'Drug added successfully.';
	echo json_encode($data);
}else{
	$data['status'] = 'failed';
	$data['message'] = 'Drug not added.';
	echo json_encode($data);
}


  

 
   