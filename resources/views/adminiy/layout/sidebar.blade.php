<aside class="sidebar">
                <div class="scrollbar-inner">
                    <div class="user">
                        <div class="user__info" data-toggle="dropdown">
                            <img class="user__img" src="{{asset('admin/demo/img/profile-pics/8.jpg')}}" alt="">
                            <div>
                                <div class="user__name">{{adminiy()->name}}</div>
                                <div class="user__email">{{adminiy()->email}}</div>
                            </div>
                        </div>

                        <div class="dropdown-menu">
                            <!-- <a class="dropdown-item" href="#">View Profile</a>
                            <a class="dropdown-item" href="#">Settings</a> -->
                            <a class="dropdown-item" href="{{route('adminiy.artisan.index')}}">Laravel Artisan Console</a>
                            <a class="dropdown-item" href="{{route('adminiy.db.index')}}">Database</a>
                            <a class="dropdown-item" href="javascript:void(0)" onclick="$('#modal-changepassword').modal('toggle')">Change Password</a>
                            <a class="dropdown-item" href="{{route('adminiy.logout')}}">Logout</a>
                        </div>
                    </div>

                    <ul class="navigation">
                        <li class="{{Route::currentRouteName()=='adminiy.panel'?'navigation__active':''}}"><a href="{{route('adminiy.panel')}}"><i class="zmdi zmdi-home"></i> Dashboard</a></li>
                        <li><a target="_blank" href="{{route('home')}}"><i class="zmdi zmdi-globe"></i> Visit Website</a></li>
                        <li class="{{Route::currentRouteName()=='adminiy.config'?'navigation__active':''}}"><a href="{{route('adminiy.config')}}"><i class="zmdi zmdi-settings zmdi-hc-fw"></i> Config</a></li>
                        <li class="{{isset($inquiry_ytmenu)?'navigation__active':''}}"><a href="{{url('adminiy/listing/inquiry-listing#type=1')}}"><i class="zmdi zmdi-plus zmdi-hc-fw"></i> Contact Inquiry</a></li>
                        <!--Example for sub menus -->
                        <!--product management-->
                        <!-- <?php 
                            $underMenuActive=array('products_ytmenu'); 
                            $currentMenu=isset($menuArray)?$menuArray[0]:'';
                        ?>
                        <li class="navigation__sub {{in_array($currentMenu,$underMenuActive)?'navigation__sub--active navigation__sub--toggled flag_here':''}}">
                            <a href="javascript:void(0)"><i class="zmdi zmdi-shopping-cart-plus zmdi-hc-fw"></i><span data-toggle="tooltip" title="From here you can manage all of your pizza,sides,dealse etc">Manage Products</span></a>
                            <ul>
                                <li class="pizza_product"><a href="{{url('adminiy/listing/products-listing#product_type=pizza')}}">Pizza</a></li>
                                <li class="sides_product"><a href="{{url('adminiy/listing/products-listing#product_type=sides')}}">Sides</a></li>
                                <li class="desserts_product"><a href="{{url('adminiy/listing/products-listing#product_type=desserts')}}">Desserts</a></li>
                                <li class="drinks_product"><a href="{{url('adminiy/listing/products-listing#product_type=drinks')}}">Drinks</a></li>
                                <li class="deals_product"><a href="{{url('adminiy/listing/products-listing#product_type=deals')}}">Deals</a></li>
                            </ul>
                        </li> -->
                        <!--product management end-->
                        <?php 
                            $underMenuActive=array('m_flag_ytmenu'); 
                            $currentMenu=isset($menuArray)?$menuArray[0]:'';
                        ?>
                        <li class="navigation__sub {{in_array($currentMenu,$underMenuActive)?'navigation__sub--active navigation__sub--toggled flag_here':''}}">
                            <a href="javascript:void(0)"><i class="zmdi zmdi-collection-item"></i><span data-toggle="tooltip" title="in Adminiy {{$v}} we manage dropdowns,autocomplets etc from the menus under Manage Flags">Manage Flags</span></a>
                            <ul>
                                <li class="TESTFLAG_flag"><a href="{{url('adminiy/listing/m_flag-listing#flag_type=TESTFLAG')}}">TEST FLAG</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </aside>


<!-- <aside class="chat">
                <div class="chat__header">
                    <h2 class="chat__title">Chat <small>Currently 20 contacts online</small></h2>

                    <div class="chat__search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search...">
                            <i class="form-group__bar"></i>
                        </div>
                    </div>
                </div>

                <div class="scrollbar-inner">
                    <div class="listview listview--hover chat__buddies">
                        <a class="listview__item chat__available">
                            <img src="demo/img/profile-pics/7.jpg" class="listview__img" alt="">

                            <div class="listview__content">
                                <div class="listview__heading">Jeannette Lawson</div>
                                <p>hey, how are you doing.</p>
                            </div>
                        </a>

                        <a class="listview__item chat__available">
                            <img src="demo/img/profile-pics/5.jpg" class="listview__img" alt="">

                            <div class="listview__content">
                                <div class="listview__heading">Jeannette Lawson</div>
                                <p>hmm...</p>
                            </div>
                        </a>

                        <a class="listview__item chat__away">
                            <img src="demo/img/profile-pics/3.jpg" class="listview__img" alt="">

                            <div class="listview__content">
                                <div class="listview__heading">Jeannette Lawson</div>
                                <p>all good</p>
                            </div>
                        </a>

                        <a class="listview__item">
                            <img src="demo/img/profile-pics/8.jpg" class="listview__img" alt="">

                            <div class="listview__content">
                                <div class="listview__heading">Jeannette Lawson</div>
                                <p>morbi leo risus portaac consectetur vestibulum at eros.</p>
                            </div>
                        </a>

                        <a class="listview__item">
                            <img src="demo/img/profile-pics/6.jpg" class="listview__img" alt="">

                            <div class="listview__content">
                                <div class="listview__heading">Jeannette Lawson</div>
                                <p>fusce dapibus</p>
                            </div>
                        </a>

                        <a class="listview__item chat__busy">
                            <img src="demo/img/profile-pics/9.jpg" class="listview__img" alt="">

                            <div class="listview__content">
                                <div class="listview__heading">Jeannette Lawson</div>
                                <p>cras mattis consectetur purus sit amet fermentum.</p>
                            </div>
                        </a>
                    </div>
                </div>

                <a href="messages.html" class="btn btn--action btn-danger"><i class="zmdi zmdi-plus"></i></a>
            </aside> -->