<?php

/**
 * Drug class
 */

class Drug extends Controller{


	function __construct($key){
		parent::__construct($key);
	}


    //Get all drug from database
    public function allDrug(){
        $query = "SELECT * FROM tbl_drug ";
        $red = $this->db->select($query);
        if($red){
            $row   = mysqli_num_rows($red);
            if($row > 0){
                return $red;
            }
        }else{
            return false;
        }
    }

    //Get drug from database By it's name
    public function drugByName($name){
        $query = "SELECT * FROM tbl_drug WHERE drug_name = '$name' ";
        $red = $this->db->select($query);
        if($red){
            $row   = mysqli_num_rows($red);
            if($row > 0){
                return $red;
            }
        }else{
            return false;
        }
    }


     //Add drug into the database
    public function addDrug($data){
        $drug_name         = $this->fm->validation($data->drug_name);
        $drug_use          = $this->fm->validation($data->drug_use);
        $indication        = $this->fm->validation($data->indication);
        $contraindication  = $this->fm->validation($data->contraindication);
        $dosage            = $this->fm->validation($data->dosage);
        $drug_usage        = $this->fm->validation($data->drug_usage);
        $precaution        = $this->fm->validation($data->precaution);
        $side_effect       = $this->fm->validation($data->side_effect);
        $warning           = $this->fm->validation($data->warning);
        $storage_condition = $this->fm->validation($data->storage_condition);

        $insert ="INSERT INTO  tbl_drug (
                    drug_name,
                    drug_use,
                    indication,
                    contraindication,
                    dosage,
                    drug_usage,
                    precaution,
                    side_effect,
                    warning,
                    storage_condition
                )
                VALUES (
                    '$drug_name',
                    '$drug_use',
                    '$indication',
                    '$contraindication',
                    '$dosage',
                    '$drug_usage',
                    '$precaution',
                    '$side_effect',
                    '$warning',
                    '$storage_condition'
                )";
        $run = $this->db->insert($insert);
        if($run== true){
            return true;
            exit();
        }else{
            return false;
            exit();
        }
    }

     //Update drug into the database
    public function updateDrug($data){
        $id                = $this->fm->validation($data->id);
        $drug_name         = $this->fm->validation($data->drug_name);
        $drug_use          = $this->fm->validation($data->drug_use);
        $indication        = $this->fm->validation($data->indication);
        $contraindication  = $this->fm->validation($data->contraindication);
        $dosage            = $this->fm->validation($data->dosage);
        $drug_usage        = $this->fm->validation($data->drug_usage);
        $precaution        = $this->fm->validation($data->precaution);
        $side_effect       = $this->fm->validation($data->side_effect);
        $warning           = $this->fm->validation($data->warning);
        $storage_condition = $this->fm->validation($data->storage_condition);

        $update ="UPDATE  tbl_drug 
                    SET
                      drug_name         = '$drug_name',
                      drug_use          = '$drug_use',
                      indication        = '$indication',
                      contraindication  = '$contraindication',
                      dosage            = '$dosage',
                      drug_usage        = '$drug_usage',
                      precaution        = '$precaution',
                      side_effect       = '$side_effect',
                      warning           = '$warning',
                      storage_condition = '$storage_condition'
                    WHERE id = '$id'
                    ";

        $run = $this->db->update($update);
        if($run== true){
            return true;
            exit();
        }else{
            return false;
            exit();
        }
    }

     //Delete drug into the database
    public function deleteDrug($data){
        $id = $this->fm->validation($data->id);
        
        $delete ="DELETE FROM tbl_drug WHERE id = '$id' ";
        $run = $this->db->delete($delete);
        if($run== true){
            return true;
            exit();
        }else{
            return false;
            exit();
        }
    }









             

}