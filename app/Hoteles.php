<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Hoteles extends Model
{
    protected $table = 'sucursal';
    protected $primaryKey = 'sucursal_id';
    public $timestamps = false;
}