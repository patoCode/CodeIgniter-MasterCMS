<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once APPPATH.'libraries/DOJO/BaseCrud.php';

class Type extends BaseCrud {

	public function __construct(){
		parent::__construct();
	}

	public function typesForm(){
        $crud = $this->_createCrudTypes('types_form','Tipos de formulario');
        $crud->display_as('response','Respuesta Automatica');
        $crud->field_type('response','dropdown',YES_NO_ARRAY);
        $this->_renderCrud($crud->render());
	}

	public function typesFile(){
        $crud = $this->_createCrudTypes('types_files','Tipos de archivos');
        $this->_renderCrud($crud->render());
	}

	public function typesProject(){
        $crud = $this->_createCrudTypes('types_project','Tipos de proyectos');
        $this->_renderCrud($crud->render());
	}

	public function typesServer(){
        $crud = $this->_createCrudTypes('server_types','Tipos de servidores');
        $crud->display_as('ispublic','Publico');
        $crud->field_type('ispublic','dropdown',YES_NO_ARRAY);
        $this->_renderCrud($crud->render());
	}

}
