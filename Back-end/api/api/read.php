<?php 
	

//headers
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');

//Initializing our api
require './../inc/initialize.php';

//Get API KEY from url
$API_KEY = isset($_GET['key']) ? $_GET['key'] : null ;

//Crreate Drug class object
$read = new Drug($API_KEY);

//Get all drug info from database
$result = $read->allDrug();

$data = array();
$data['data'] = array();

if($result){
	while($value = mysqli_fetch_array($result)){
		$drug_item = array(
			'id'                => $value['id'],
			'drug_name'         => $value['drug_name'],
			'drug_use'          => $value['drug_use'],
			'indication'        => $value['indication'],
			'contraindication'  => $value['contraindication'],
			'dosage'            => $value['dosage'],
			'drug_usage'        => $value['drug_usage'],
			'precaution'        => $value['precaution'],
			'side_effect'       => $value['side_effect'],
			'warning'           => $value['warning'],
			'storage_condition' => $value['storage_condition']
		);
		array_push($data['data'],$drug_item );
	}

	echo json_encode($data);
}else{
	$data['message'] = 'No drug found!';
	echo json_encode($data);
}


  

 
   
