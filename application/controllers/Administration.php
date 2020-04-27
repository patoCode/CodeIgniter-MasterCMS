<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Administration extends CI_Controller {

	public function index()
	{
		$this->load->view('admin/login');
	}

}

/* End of file Administration.php */
/* Location: ./application/controllers/Administration.php */