<?php
class Authenticate{
	protected $CI;
	protected $loginPage;
	public function __construct() {
		$this->CI = & get_instance();
		$this->loginPage  = "Login";
	}

  	public function checkLogin(){
		if(!$this->CI->session->userdata('is_logged_in')){
			return true;
		}

	}
}