<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class LinkElements extends CI_Controller {

	public function __construct(){
		parent::__construct();
	}

	public function admin(){
 		$crud = new grocery_CRUD();
        $crud->set_table('link_elements');
        $crud->set_subject('Opciones');
		$crud->columns('link_elements_id','label_link','icon_link','url','_target','status','order_link');
		$crud->fields('link_elements_id','label_link','icon_link','url','_target','status','order_link');
		$crud->display_as('link_elements_id','Padre')
			 ->display_as('label_link','Etiqueta')
			 ->display_as('icon_link','Icono')
			 ->display_as('url','Link')
			 ->display_as('_target','Abrir otra ventana')
			 ->display_as('status','Estado')
			 ->display_as('order_link','Orden');
		$crud->order_by('order_link','asc');
		$crud->set_relation('link_elements_id','link_elements','{label_link}');
		$crud->field_type('status','dropdown',STATUS_ARRAY);
		$crud->field_type('_target','dropdown',YES_NO_ARRAY);

        $output = $crud->render();
        $this->_renderCrud($output);
	}

	private function _renderCrud($output = null){
        $this->load->view('example.php',$output);
    }
}
