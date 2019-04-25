<?php
namespace App\Model;
use Illuminate\Database\Eloquent\Model;
class inquiry extends Model
{
	protected $table = 'inquiry';
	public $primaryKey = 'id';
    protected $fillable = [
        'inquiries_name', 'inquiries_email', 'inquiries_phone','extra_content','is_read','type'
        ,'user_id','is_deleted','is_active','inquiries_lname',
    ];
}
