<?php 
print Helper::dynamicImages(asset('/').'/','images/logo.png',array("data-width"=>"126","data-height"=>"46","alt"=>"logo","class"=>"img-responsive"),'logo',true); 
?>
<!--Any config settings you want to fetch you will get in $config array, -->
{{$config['COMPANY']}}