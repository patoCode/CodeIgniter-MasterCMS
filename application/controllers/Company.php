<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Company extends CI_Controller {

	public function __construct(){
		parent::__construct();
	}

	public function admin(){
 		$crud = new grocery_CRUD();
        $crud->set_table('company');
        $crud->set_subject('Empresa');
		$crud->columns('company','initials','geolocation','logo');
		$crud->fields('company','initials','geolocation','logo');
		$crud->display_as('company','Nombre de Empresa')
			 ->display_as('initials','Sigla')
			 ->display_as('geolocation','Localizacion')
			 ->display_as('logo','Logotipo');
		$crud->set_field_upload('logo',getenv('LOGO_COMPANY'));

        $output = $crud->render();
        $this->_renderCrud($output);
	}

	private function _renderCrud($output = null){
        $this->load->view('example.php',$output);
    }
}
