<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- CSRF Token -->
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>{{isset($title)?$title:adminiy()->name.' Adminiy '.$v}}</title>
        <link rel="icon" type="image/png" href="{{asset(isset($favicon)?$favicon:'')}}">
        <link rel="icon" type="image/jpg" href="{{asset(isset($favicon)?$favicon:'')}}">
        <!-- Vendor styles -->
        <link rel="stylesheet" href="{{asset('admin/vendors/material-design-iconic-font/css/material-design-iconic-font.min.css')}}">
        <link rel="stylesheet" href="{{asset('admin/vendors/animate.css/animate.min.css')}}">
        <link rel="stylesheet" href="{{asset('admin/vendors/jquery-scrollbar/jquery.scrollbar.css')}}">
        <link rel="stylesheet" href="{{asset('admin/vendors/fullcalendar/fullcalendar.min.css')}}">
        <!-- App styles -->
        @yield('hcss')
        <link rel="stylesheet" href="{{asset('admin/css/app.min.css')}}">
        @yield('css')
        <style type="text/css">
            div.adminiy-upgradeProgress {
                margin-bottom: 10px;
            }
        </style>
</head>
<body data-ma-theme="{{Helper::returnFlag(499)}}">
<main>
<div class="page-loader">
<div class="page-loader__spinner">
<svg viewBox="25 25 50 50">
<circle cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
</svg>
</div>
</div>
    @if(!is_adminiy())
        @yield('content')
    @else
    <input type="hidden" id="web_base_url" value="{{url('/')}}" />
    <input type="hidden" id="loggedinid" value="{{adminiy()->id}}" />
      @include('adminiy.layout.header')
      @include('adminiy.layout.sidebar')
      <section class="content">
    <header class="content__title">
        <h1>{{isset($title)?$title:adminiy()->name.' Adminiy '.$v}}</h1>
    </header>
    <div class="card">
        @yield('content-header')
        <div class="card-body">
        <h4 class="adminiy-upgradeProgress adminiy-upgrade-status" style="display: none;"></h4>
        <div class="progress progress-bar-striped adminiy-upgradeProgress" style="display: none;">
            <div class="progress-bar bg-warning adminiy-upgrade-bar" role="progressbar" style="width: 0%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
            @yield('content')
        </div>
    </div>
    @include('adminiy.layout.footer')
    @include('adminiy.fullwidgets.changepasswordmodal')
</section>
    @endif
</main>
<script src="{{asset('admin/vendors/jquery/jquery.min.js')}}"></script>
<script src="{{asset('admin/vendors/popper.js/popper.min.js')}}"></script>
<script src="{{asset('admin/vendors/bootstrap/js/bootstrap.min.js')}}"></script>
<script src="{{asset('admin/vendors/jquery-scrollbar/jquery.scrollbar.min.js')}}"></script>
<script src="{{asset('admin/vendors/jquery-scrollLock/jquery-scrollLock.min.js')}}"></script>
<script src="{{asset('admin/vendors/bootstrap-notify/bootstrap-notify.min.js')}}"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- App functions and actions -->
<script src="{{asset('admin/js/app.min.js')}}"></script>
<script src="{{asset('js/public.js')}}"></script>
<script src="{{asset('js/ycommon.js')}}"></script>
@include('adminiy.layout.errorhandler')
@include('adminiy.fullwidgets.updater')
@yield('js')
</body>
</html>
