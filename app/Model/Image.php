<?php
namespace App\Model;
use Illuminate\Database\Eloquent\Model;
class Image extends Model
{
	protected $table = 'images';
	public $primaryKey = 'id';
    protected $fillable = [
        'url', 'imageable_id', 'imageable_type','table_name',
    ];
    public function imageable()
    {
        return $this->morphTo();
    }
}
