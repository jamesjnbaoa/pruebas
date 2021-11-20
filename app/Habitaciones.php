<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Habitaciones extends Model
{
    protected $table = 'habitaciones';
    protected $primaryKey = 'hab_id';
    public $timestamps = false;
}