<?php
namespace App\Http\Controllers\Adminiy\DNE;
use App\Http\Controllers\Adminiy\IndexController;
use View;

class PanelUpdateController extends IndexController
{
    public $files = array();
    public function __construct()
    {
        View()->share('v',config('app.vadminiy'));
        $this->getFiles();
    }
    public function updatePanel(){
        
    }
    public function updateCoreJson(){
        
    }
    public function checkGitV(){
        
    }
}
