<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MenuElement extends CI_Controller {

	public function __construct(){
		parent::__construct();
	}

	public function admin(){
 		$crud = new grocery_CRUD();
        $crud->set_table('menu_element');
        $crud->set_subject('Menu');
		$crud->columns('site_id','name','get_icons');
		$crud->fields('site_id','name','get_icons');
		$crud->display_as('site_id','Sitio')
			 ->display_as('name','Menu')
			 ->display_as('get_icons','Menu Icons');
		$crud->set_relation('site_id','site','{title}');
		$crud->field_type('get_icons','dropdown',STATUS_ARRAY);

		$crud->add_action('Elementos', '', 'MenuElement/admin','<i class="fas fa-th-list"></i>');

        $output = $crud->render();
        $this->_renderCrud($output);
	}

	private function _renderCrud($output = null){
        $this->load->view('example.php',$output);
    }
}
