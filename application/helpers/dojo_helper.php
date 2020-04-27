<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('dd')){
	function dd($data){
		echo "<pre>";
		print_r($data);
		echo "</pre>";
		die();
	}
}

if ( ! function_exists('createSession')){
	function createSession($data){
		$CI= & get_instance();
		foreach ($data as $key => $value) {
			$CI->session->set_userdata($key, $value);
		}
	}
}

if ( ! function_exists('checkLogin')){
	function checkLogin(){
		$CI= & get_instance();
		if($CI->session->userdata('is_logged_in')){
			return true;
		}
	}
}
