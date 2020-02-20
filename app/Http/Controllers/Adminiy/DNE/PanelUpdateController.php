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
        if(!file_exists($file)){
            File::put($file,'');
        }
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
        //https://api.github.com/repos/yrux/Adminiy/contents
        //https://api.github.com/repos/yrux/Adminiy/contents/public/admin/core-files.json?ref=master
        //curl https://api.github.com/repos/yrux/Adminiy/contents/public/admin/core-files.json
        $endpoint = "https://api.github.com/repos/yrux/Adminiybk/contents/public/admin/core-files.json?ref=master";
        $client = new \GuzzleHttp\Client();
        $response = $client->request('GET',$endpoint);
        $statusCode = $response->getStatusCode();
        $content = json_decode($response->getBody());
        $data = base64_decode($content->content);
        return $data;
    }
    public static function getGitFile($file){
        $endpoint = "https://api.github.com/repos/yrux/Adminiybk/contents/".$file;
        $client = new \GuzzleHttp\Client();
        $response = $client->request('GET',$endpoint);
        $statusCode = $response->getStatusCode();
        $content = base64_decode(json_decode($response->getBody())->content);
        return $content;
    }
}
