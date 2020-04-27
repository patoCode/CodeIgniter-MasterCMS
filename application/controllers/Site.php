<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Site extends CI_Controller {

	public function __construct(){
		parent::__construct();
	}

	public function admin(){

 		$crud = new grocery_CRUD();
        $crud->set_table('site');
        $crud->set_subject('Sitio Web');
		$crud->columns('company_id','title','subtitle','type','is_public');
		$crud->display_as('company_id','Empresa')
			->display_as('title','Titulo')
			->display_as('subtitle','Frase Principal')
			->display_as('type','Tipo')
			->display_as('is_public','Publico');
		$crud->set_relation('company_id','company','{company} - {initials}');
		$crud->field_type('is_public','dropdown',YES_NO_ARRAY);
 		$output = $crud->render();
        $this->_renderCrud($output);
    }

	private function _renderCrud($output = null){
        $this->load->view('example.php',$output);
    }
}
