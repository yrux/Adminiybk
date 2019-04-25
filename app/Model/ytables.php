<?php
namespace App\Model;
use Illuminate\Database\Eloquent\Model;
class ytables extends Model
{
	protected $table = 'ytables';
	public $primaryKey = 'id';
    protected $fillable = [
        'js_file', 'page_heading', 'page_message','new_url','is_deleted','page_limit','fast_crud',
        'model_name','table_name',
    ];
}
