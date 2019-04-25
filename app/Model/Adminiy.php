<?php
namespace App\Model;
use Illuminate\Database\Eloquent\Model;
class Adminiy extends Model
{
	protected $table = 'adminiy';
    protected $fillable = [
        'name', 'email', 'password',
    ];
    protected $hidden = [
        'password', 'remember_token',
    ];
}
