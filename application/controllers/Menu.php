<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once APPPATH.'libraries/DOJO/BaseCrud.php';
class Menu extends BaseCrud {

	public function __construct(){
		parent::__construct();
	}

	public function admin(){
 		$crud = new grocery_CRUD();
        $crud->set_table('menu');
        $crud->set_relation_n_n('elements', 'menu_element', 'link_elements', 'menu_id', 'link_elements_id', 'label_link', null, null, true);
		$crud->set_relation('site_id','site','{title}');
        $crud->set_subject('Menu');
		$crud->columns('site_id','name','get_icons','elements');
		$crud->display_as('site_id','Sitio')
			 ->display_as('name','Menu')
			 ->display_as('get_icons','Menu Icons')
			 ->display_as('elements','Elementos');
		$crud->field_type('get_icons','dropdown',STATUS_ARRAY);
        $output = $crud->render();
        $this->_renderCrud($output);
	}
}
