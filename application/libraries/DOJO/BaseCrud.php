<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class BaseCrud extends CI_Controller {

    public function _createCrudTypes($table, $title){
		$fields = $this->db->list_fields($table);
		if($fields[0] == 'id'){
			unset($fields[0]);
		}
 		$crud = new grocery_CRUD();
        $crud->set_table($table);
        $crud->set_subject($title);
		$crud->columns($fields);
		$crud->fields($fields);
		$crud->display_as('type','Tipo')
			 ->display_as('status','Estado');

		if(in_array('status', $fields)){
			$crud->field_type('status','dropdown',STATUS_ARRAY);
		}

 		return $crud;
    }

	public function _renderCrud($output = null){
		if(checkLogin()){
        	$this->load->view('admin/main_template',$output);
		}else{
			redirect('Administration/login');
		}
    }

    public function _redirectHome($value='')
    {
    }

    public function _redirectAdministrationLogin($value='')
    {
    }
}
