<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Bidding extends CI_Controller {

	public function __construct(){
		parent::__construct();
	}


	public function admin(){

 		$crud = new grocery_CRUD();
        $crud->set_table('biddings');
        $crud->set_subject('Convocatorias');
		$crud->columns('site_id', 'title','create_at','published_in','finish_in','code','description','slug', 'status_bidding');
		$crud->fields('site_id', 'title','create_at','published_in','finish_in','code','description','slug', 'status_bidding');
		$crud->display_as('site_id','Sitio')
			->display_as('title','Titulo')
			->display_as('create_at','Creado')
			->display_as('published_in','Publicado')
			->display_as('finish_in','Finaliza en')
			->display_as('code','Codigo')
			->display_as('description','Descrpcion')
			->display_as('status_bidding','Estado')
			->display_as('slug','URL');
		$crud->set_relation('site_id','site','{title}');
		$crud->field_type('status_bidding','dropdown',YES_NO_ARRAY);

 		$output = $crud->render();
        $this->_renderCrud($output);
    }

	private function _renderCrud($output = null){
        $this->load->view('example.php',$output);
    }
}
