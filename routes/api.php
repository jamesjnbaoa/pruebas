<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\Client\Response;
use Illuminate\Support\Facades\Mail;
use App\Acomodaciones;
use App\Hoteles;
use App\Habitaciones;
use Carbon\Carbon;
use App\Http\Requests\HotelRequest;
use App\Http\Requests\HabRequest;
use App\Tipos;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

//  Modulo de creacion de hoteles
Route::post('AddSucursal', function (HotelRequest $request) {

    $header = $request->header('Authorization');

    if($header=='testhotel'){

        $validar = Hoteles::where('suc_nit',$request->nit)->get()->count();
        if($validar == 0) {
            $suc = new Hoteles();
            $suc->suc_nit = $request->nit;
            $suc->suc_name = $request->nombre;
            $suc->suc_dir = $request->direccion;
            $suc->suc_hab = $request->numero;
            $suc->created_at = Carbon::now();
            $suc->save();
            if ($suc) {
                return array('Radicado' => $suc->sucursal_id, 'Msj'=> 'Se registro el hotel con exito');
            } else {
                return array('Msj' => '¡Error al registrar el hotel!');
            }
        }else{
            return array('Msj' => '¡El nit ya se encuentra registrado!');
        }
    }else{
        return array('Msj' => '¡Error en la comunicacion');
    }
    
});
Route::post('UpSucursal', function (HotelRequest $request) {

    $header = $request->header('Authorization');

    if($header=='testhotel'){

            $suc =  Hoteles::find($request->id);
            $suc->suc_nit = $request->nit;
            $suc->suc_name = $request->nombre;
            $suc->suc_dir = $request->direccion;
            $suc->suc_hab = $request->numero;
            $suc->created_at = Carbon::now();
            $suc->save();
            if ($suc) {
                return array('Radicado' => $suc->sucursal_id, 'Msj'=> 'Se edito el hotel con exito');
            } else {
                return array('Msj' => '¡Error al registrar el hotel!');
            }
        
    }else{
        return array('Msj' => '¡Error en la comunicacion');
    }
    
});
Route::get('Sucursales', function (Request $request) {
    $header = $request->header('Authorization');

    if($header=='testhotel'){

        $suc = Hoteles::all();
        return $suc;
    }else{
        return array('Msj' => '¡Error en la comunicacion');
    }
    
});
Route::get('Sucursales/{id}', function (Request $request, $id) {
    $header = $request->header('Authorization');

    if($header=='testhotel'){

        $suc = Hoteles::find($id);
        return $suc;
    }else{
        return array('Msj' => '¡Error en la comunicacion');
    }
    
});

Route::delete('Sucursales/{id}', function (Request $request, $id) {
    $header = $request->header('Authorization');

    if($header=='testhotel'){

        $suc = Hoteles::find($id);
        $suc->delete();
        return array('Radicado' => $id, 'Msj'=> 'Se elimino el hotel con exito');
    }else{
        return array('Msj' => '¡Error en la comunicacion');
    }
    
});
//  modulo de creacion de habitaciones

Route::post('AddHabitacion', function (HabRequest $request) {

    $header = $request->header('Authorization');

    if($header=='testhotel'){

        $validar = Habitaciones::where('hab_tipo',$request->tipo)->where('hab_acomodacion',$request->aco)->where('sucursal_id',$request->sucursal)->get()->count();
        if($validar == 0) {
            $hab = new Habitaciones();
            $hab->sucursal_id = $request->sucursal;
            $hab->hab_tipo = $request->tipo;
            $hab->hab_acomodacion = $request->aco;
            $hab->hab_numero = $request->numero;
            $hab->created_at = Carbon::now();
            
            if ($hab->save()) {
                return array('Radicado' => $hab->hab_id, 'Msj'=> 'Se registro la habitacion con exito');
            } else {
                return array('Msj' => '¡Error al registrar la habitacion!');
            }
        }else{
            return array('Msj' => '¡Ya hay una habitacion con estas caracteristicas!');
        }
    }else{
        return array('Msj' => '¡Error en la comunicacion');
    }
    
});
Route::post('UpHabitacion', function (HabRequest $request, $id) {

    $header = $request->header('Authorization');

    if($header=='testhotel'){

        $validar = Habitaciones::where('hab_tipo',$request->tipo)->where('hab_acomodacion',$request->aco)->where('sucursal_id',$request->sucursal)->get()->count();
        if($validar == 0) {
            $hab = Habitaciones::find($id);
            $hab->sucursal_id = $request->sucursal;
            $hab->hab_tipo = $request->tipo;
            $hab->hab_acomodacion = $request->aco;
            $hab->hab_numero = $request->numero;
            $hab->created_at = Carbon::now();
            
            if ($hab->save()) {
                return array('Radicado' => $hab->hab_id, 'Msj'=> 'Se registro la habitacion con exito');
            } else {
                return array('Msj' => '¡Error al registrar la habitacion!');
            }
        }else{
            return array('Msj' => '¡Ya hay una habitacion con estas caracteristicas!');
        }
    }else{
        return array('Msj' => '¡Error en la comunicacion');
    }
    
});
Route::get('Habitaciones/{id}', function (Request $request, $id) {
    $header = $request->header('Authorization');

    if($header=='testhotel'){

        $suc = Habitaciones::find($id);
        return $suc;
    }else{
        return array('Msj' => '¡Error en la comunicacion');
    }
    
});

Route::delete('Habitaciones/{id}', function (Request $request, $id) {
    $header = $request->header('Authorization');

    if($header=='testhotel'){

        $suc = Habitaciones::find($id);
        $suc->delete();
        return array('Radicado' => $id, 'Msj'=> 'Se elimino la habitacion con exito');
    }else{
        return array('Msj' => '¡Error en la comunicacion');
    }
    
});
Route::get('Acomodaciones', function (Request $request, $id) {
    $header = $request->header('Authorization');

    if($header=='testhotel'){

        $suc = Acomodaciones::all();
        return $suc;
    }else{
        return array('Msj' => '¡Error en la comunicacion');
    }
    
});
Route::get('Habitaciones', function (Request $request) {
    $header = $request->header('Authorization');

    if($header=='testhotel'){

        $suc = Hoteles::all();
        return $suc;
    }else{
        return array('Msj' => '¡Error en la comunicacion');
    }
    
});
Route::get('Tipos', function (Request $request) {
    $header = $request->header('Authorization');

    if($header=='testhotel'){

        $tipo = Tipos::all();
        return $tipo;
    }else{
        return array('Msj' => '¡Error en la comunicacion');
    }
    
});

Route::get('ConsultaHabitaciones', function (Request $request) {
    $header = $request->header('Authorization');

    if($header=='testhotel'){

        $tipo = DB::select('select * from sucursal a, habitaciones b, tipos c, acomodaciones d where a.sucursal_id=b.sucursal_id and b.hab_tipo=c.tipo_id and b.hab_acomodacion=d.aco_id;');
        return $tipo;
    }else{
        return array('Msj' => '¡Error en la comunicacion');
    }
    
});