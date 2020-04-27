<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ConfigServer extends CI_Controller {

	public function __construct(){
		parent::__construct();
	}

	public function admin(){

 		$crud = new grocery_CRUD();

        $crud->set_table('config_servers');
        $crud->set_subject('Configuraciones');

		$crud->columns('server_types_id','company_id','name','code','ip','port','use_for','wait_time','url','status');
		$crud->display_as('server_types_id','Tipo Server')
		 	 ->display_as('company_id','Empresa')
			 ->display_as('name','Servidor de ')
			 ->display_as('code','Codigo')
			 ->display_as('ip','Direccion ip')
			 ->display_as('port','Puerto')
			 ->display_as('use_for','Protocolo')
			 ->display_as('wait_time','Timeout')
			 ->display_as('status','Estado');

		$crud->set_relation('server_types_id','server_types','type',array('status' => '1'));
		$crud->set_relation('company_id','company','{company} - {initials}');
		$crud->field_type('status','dropdown',STATUS_ARRAY);


        $output = $crud->render();
        $this->_renderCrud($output);
	}

	private function _renderCrud($output = null){
        $this->load->view('example.php',$output);
    }

	public function list(){

	}

}
