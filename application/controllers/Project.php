<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Project extends CI_Controller {

	public function __construct(){
		parent::__construct();
	}


	public function admin(){

 		$crud = new grocery_CRUD();
        $crud->set_table('projects');
        $crud->set_subject('Proyectos');
		$crud->columns('site_id', 'types_project_id','title','target','is_main','order_project','_target','slug');
		$crud->fields('site_id', 'types_project_id','title','target','is_main','order_project','_target','slug');
		$crud->display_as('site_id','Sitio')
			->display_as('types_project_id','Tipo')
			->display_as('title','Titulo')
			->display_as('target','Objetivo')
			->display_as('is_main','Principal')
			->display_as('order_project','Orden')
			->display_as('_target','Abrir en otra ventana')
			->display_as('slug','URL');

		$crud->set_relation('site_id','site','{title}');
		$crud->set_relation('types_project_id','types_project','type');

		$crud->field_type('is_main','dropdown',YES_NO_ARRAY);
		$crud->field_type('_target','dropdown',YES_NO_ARRAY);

 		$output = $crud->render();
        $this->_renderCrud($output);
    }

	private function _renderCrud($output = null){
        $this->load->view('example.php',$output);
    }
}
