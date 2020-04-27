<?php

class TypeCrud extends CI_Controller{

	public function __construct(){
		parent::__construct();
	}

	public function _createCrud($table, $title){

		$fields = $this->db->list_fields($table);

		if($fields[0] == 'id')
			unset($fields[0]);

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

}