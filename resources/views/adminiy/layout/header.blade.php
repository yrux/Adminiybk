<header class="header">
            <div class="navigation-trigger hidden-xl-up" data-ma-action="aside-open" data-ma-target=".sidebar">
                <div class="navigation-trigger__inner">
                    <i class="navigation-trigger__line"></i>
                    <i class="navigation-trigger__line"></i>
                    <i class="navigation-trigger__line"></i>
                </div>
            </div>

            <div class="header__logo hidden-sm-down">
                <h1><a href="{{url('/adminiy')}}">{{adminiy()->name}} Adminiy {{$v}}</a></h1>
            </div>

            <form class="search" method="GET" action="{{route('adminiy.mainsearch')}}">
                <div class="search__inner">
                    <input value="{{isset($_GET['q'])?$_GET['q']:''}}" type="text" name="q" class="search__text" placeholder="Search for images">
                    <i class="zmdi zmdi-search search__helper" data-ma-action="search-close"></i>
                </div>
            </form>

            <ul class="top-nav">
                <li class="hidden-xl-up">
                    <a href="#" data-ma-action="search-open"><i class="zmdi zmdi-search"></i></a>
                </li>
                <li class="dropdown top-nav__notifications">
                    <!-- <a href="#" data-toggle="dropdown" class="top-nav__notify">
                        <i class="zmdi zmdi-notifications"></i>
                    </a> -->
                    <div class="dropdown-menu dropdown-menu-right dropdown-menu--block">
                        <div class="listview listview--hover">
                            <div class="listview__header">
                                Notifications

                                <div class="actions">
                                    <a href="#" class="actions__item zmdi zmdi-check-all" data-ma-action="notifications-clear"></a>
                                </div>
                            </div>

                            <div class="listview__scroll scrollbar-inner">
                                <a href="#" class="listview__item">
                                    <img src="{{asset('admin/demo/img/profile-pics/1.jpg')}}" class="listview__img" alt="">

                                    <div class="listview__content">
                                        <div class="listview__heading">David Belle</div>
                                        <p>Cum sociis natoque penatibus et magnis dis parturient montes</p>
                                    </div>
                                </a>
                            </div>

                            <div class="p-1"></div>
                        </div>
                    </div>
                </li>
                <li class="dropdown hidden-xs-down">
                    <a href="#" data-toggle="dropdown"><i class="zmdi zmdi-apps"></i></a>

                    <div class="dropdown-menu dropdown-menu-right dropdown-menu--block" role="menu">
                        <div class="row app-shortcuts">
                            <a class="col-4 app-shortcuts__item" href="#">
                                <i class="zmdi zmdi-calendar"></i>
                                <small class="">Calendar</small>
                                <span class="app-shortcuts__helper bg-red"></span>
                            </a>
                            <a class="col-4 app-shortcuts__item" href="#">
                                <i class="zmdi zmdi-file-text"></i>
                                <small class="">Files</small>
                                <span class="app-shortcuts__helper bg-blue"></span>
                            </a>
                            <a class="col-4 app-shortcuts__item" href="{{route('adminiy.sendmail')}}">
                                <i class="zmdi zmdi-email"></i>
                                <small class="">Email</small>
                                <span class="app-shortcuts__helper bg-teal"></span>
                            </a>
                            <a class="col-4 app-shortcuts__item" href="javascript:void(0)" onclick="_adminiyUpgradeCheck()">
                                <i class="zmdi zmdi-github zmdi-hc-fw"></i>
                                <small class="">Upgrade Adminiy {{$v}}</small>
                                <span class="app-shortcuts__helper bg-blue-grey"></span>
                            </a>
                            <a class="col-4 app-shortcuts__item" href="#">
                                <i class="zmdi zmdi-view-headline"></i>
                                <small class="">News</small>
                                <span class="app-shortcuts__helper bg-orange"></span>
                            </a>
                            <a class="col-4 app-shortcuts__item" href="#">
                                <i class="zmdi zmdi-image"></i>
                                <small class="">Gallery</small>
                                <span class="app-shortcuts__helper bg-light-green"></span>
                            </a>
                        </div>
                    </div>
                </li>

                <li class="dropdown hidden-xs-down">
                    <a href="#" data-toggle="dropdown"><i class="zmdi zmdi-more-vert"></i></a>

                    <div class="dropdown-menu dropdown-menu-right">
                        <div class="dropdown-item theme-switch">
                            Theme Switch

                            <div class="btn-group btn-group-toggle btn-group--colors" data-toggle="buttons">
                                <label class="btn bg-green active"><input type="radio" value="green" autocomplete="off" checked></label>
                                <label class="btn bg-blue"><input type="radio" value="blue" autocomplete="off"></label>
                                <label class="btn bg-red"><input type="radio" value="red" autocomplete="off"></label>
                                <label class="btn bg-orange"><input type="radio" value="orange" autocomplete="off"></label>
                                <label class="btn bg-teal"><input type="radio" value="teal" autocomplete="off"></label>

                                <div class="clearfix mt-2"></div>

                                <label class="btn bg-cyan"><input type="radio" value="cyan" autocomplete="off"></label>
                                <label class="btn bg-blue-grey"><input type="radio" value="blue-grey" autocomplete="off"></label>
                                <label class="btn bg-purple"><input type="radio" value="purple" autocomplete="off"></label>
                                <label class="btn bg-indigo"><input type="radio" value="indigo" autocomplete="off"></label>
                                <label class="btn bg-brown"><input type="radio" value="brown" autocomplete="off"></label>
                            </div>
                        </div>
                        <a href="javascript:void(0)" onclick="document.documentElement.requestFullscreen();" class="dropdown-item">Fullscreen</a>
                        <!-- <a href="#" class="dropdown-item">Clear Local Storage</a> -->
                    </div>
                </li>

                <!-- <li class="hidden-xs-down">
                    <a href="#" data-ma-action="aside-open" data-ma-target=".chat" class="top-nav__notify">
                        <i class="zmdi zmdi-comment-alt-text"></i>
                    </a>
                </li> -->
            </ul>
        </header>