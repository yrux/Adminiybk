<?php
namespace App\Model;
use Illuminate\Database\Eloquent\Model;
class table_notes extends Model
{
	protected $table = 'table_notes';
	public $primaryKey = 'id';
    protected $fillable = [
        'table_name', 'ref_id', 'note_value','user_id','is_deleted','is_active',
    ];
}
