<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Administration extends CI_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->model('User_model','user');
	}
	public function index(){
		$this->login();
	}

	public function login(){
		$this->load->view('admin/login');
	}

	public function processLogin(){
		$username = $this->input->post('username');
		$password = $this->input->post('password');
		if($this->user->checkUser($username, $password)){
			$data = array('username' => $username, 'is_logged_in' => true);
			createSession($data);
			redirect('Administration/admin');
		}
	}

	public function admin(){
		$this->load->view('admin/main_template');
	}


	public function Logout(){
		$this->session->sess_destroy();
		redirect('Site/Home');
	}
}