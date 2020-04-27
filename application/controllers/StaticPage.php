<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class StaticPage extends CI_Controller {

	public function __construct(){
		parent::__construct();
	}

	public function admin(){
 		$crud = new grocery_CRUD();
        $crud->set_table('static_pages');
        $crud->set_subject('Paginas Estaticas');
		$crud->columns('site_id','title','subtitle','content', 'status', 'slug');
		$crud->fields('site_id','title','subtitle','content', 'status', 'slug');
		$crud->display_as('site_id','Sitio')
			 ->display_as('title','Titulo')
			 ->display_as('subtitle','Subtitulo')
			 ->display_as('content','Contenido')
			 ->display_as('status','Estado')
			 ->display_as('slug','url');

		$crud->set_relation('site_id','site','{title}');
		$crud->field_type('status','dropdown',STATUS_ARRAY);

        $output = $crud->render();
        $this->_renderCrud($output);
	}

	private function _renderCrud($output = null){
        $this->load->view('example.php',$output);
    }
}
