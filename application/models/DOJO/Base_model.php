<?php
abstract class Base_model extends CI_Model{

    abstract public function create($input);
    abstract public function update($input, $id);
    abstract public function delete();
    abstract public function list();
    abstract public function findById($id);

}