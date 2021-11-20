<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Acomodaciones extends Model
{
    protected $table = 'acomodaciones';
    protected $primaryKey = 'aco_id';
    public $timestamps = false;
}