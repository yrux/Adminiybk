<?php
namespace App\Http\Controllers\Adminiy\DNE;
use App\Http\Controllers\Adminiy\IndexController;
use View;
use File;
class PanelUpdateController extends IndexController
{
    public $files = array();
    public function __construct()
    {
        View()->share('v',config('app.vadminiy'));
    }
    public function updatePanel(){
        $file = base_path('/'.$_POST['file']);
        $data = $this->getGitFile($_POST['file']);
        if(file_exists($file)){
            file_put_contents($file, $data);
            $this->echoSuccess('file Updated');
        } else {
            $this->echoErrors('file does not exist');
        }
    }
    public function updateCoreJson(){
        $coreJson = $this->getGitV();
        $file =  base_path('/public/admin/core-files.json');
        if(file_exists($file)){
            file_put_contents($file, $coreJson);
            $this->echoSuccess("File Updated");
        } else {
            $this->echoErrors($file.' Not found');
        }
    }
    public function checkGitV(){
        return $this->getGitV();
    }
    public static function getGitV(){
        $endpoint = "https://raw.githubusercontent.com/yrux/Adminiy/master/public/admin/core-files.json";
        $client = new \GuzzleHttp\Client();
        $response = $client->request('GET',$endpoint);
        $statusCode = $response->getStatusCode();
        $content = $response->getBody();
        return $content;
    }
    public static function getGitFile($file){
        $endpoint = "https://raw.githubusercontent.com/yrux/Adminiy/master/".$file;
        $client = new \GuzzleHttp\Client();
        $response = $client->request('GET',$endpoint);
        $statusCode = $response->getStatusCode();
        $content = $response->getBody();
        return $content;
    }
}
