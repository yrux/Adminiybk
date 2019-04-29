<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="{{url('/')}}"><?php 
print Helper::dynamicImages(asset('/'),'images/logo.png',array("data-width"=>"126","data-height"=>"46","alt"=>"logo","class"=>"img-responsive","style"=>"height:30px;"),'logo',true); 
?></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="{{url('/')}}">Home</a></li>
        <!-- <li><a href="#">About</a></li>
        <li><a href="#">Projects</a></li>
        <li><a href="#">Contact</a></li> -->
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="{{url('/login')}}"><span class="fa fa-user"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>