<?php
namespace App\Model;
use Illuminate\Database\Eloquent\Model;
class m_flag extends Model
{
	protected $table = 'm_flag';
	public $primaryKey = 'id';
    protected $fillable = [
        'flag_type', 'flag_value', 'flag_additionalText','is_active','has_image','is_config','flag_show_text','is_featured','is_deleted','user_id',
    ];
}
