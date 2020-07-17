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
    public function m_flag_main()
    {
        return $this->morphOne('App\Model\Image', 'imageable')->where('table_name', 'm_flag_main');
    }
    // public function m_flag_thumb()
    // {
    //     return $this->morphOne('App\Model\Image', 'imageable')->where('table_name', 'm_flag_thumb');
    // }
}
