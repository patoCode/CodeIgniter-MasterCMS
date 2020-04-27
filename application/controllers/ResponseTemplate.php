<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once APPPATH.'libraries/DOJO/BaseCrud.php';

class ResponseTemplate extends BaseCrud {

	public function __construct(){
		parent::__construct();
	}

	public function admin(){
 		$crud = new grocery_CRUD();
        $crud->set_table('response_template');
        $crud->set_subject('Template de respuesta');
		$crud->columns('types_form_id','subject','body');
		$crud->display_as('types_form_id','Tipo')
			->display_as('subject',$this->lang->line('subject'))
			->display_as('body','Cuerpo');
		$crud->set_relation('types_form_id','types_form','type');
 		$output = $crud->render();
        $this->_renderCrud($output);
    }

}

