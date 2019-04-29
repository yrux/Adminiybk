const mix = require('laravel-mix');

mix.styles([
    'public/css/bootstrap.min.css',
    'public/css/font-awesome.min.css',
	//'public/css/animate.css',
	//'public/css/slick.css',
	//'public/css/slick-theme.css',
	//'public/css/jquery.fancybox.min',
], 'public/css/all.css');

mix.scripts([
    'public/js/front/jquery.min.js',
    'public/js/front/bootstrap.min.js',
    //'public/js/front/slick.js',
    //'public/js/front/wow.min.js',
    //'public/js/front/jquery.fancybox.min.js',
    'public/js/front/bootstrap-notify.min.js',
], 'public/js/front/all.js');

