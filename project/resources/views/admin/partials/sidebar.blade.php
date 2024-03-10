<aside id="sidebar-wrapper">
        <ul class="sidebar-menu mb-5">
                <li class="menu-header">@lang('Dashboard')</li>
                <li class="nav-item {{ menu('admin.dashboard') }}">
                        <a href="{{ route('admin.dashboard') }}" class="nav-link"><i
                                        class="fas fa-fire"></i><span>@lang('Dashboard')</span></a>
                </li>

                <li class="nav-item dropdown {{ menu(['admin.contact*']) }}">
                        <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i
                                        class="fas fa-envelope-open-text"></i></i>
                                <span>@lang('Manage Campaigns')</span></a>
                        <ul class="dropdown-menu">

                                <li class="{{ menu('admin.contact.message') }}"><a class="nav-link"
                                                href="{{ route('admin.category.index') }}">@lang('Categories')</a>
                                </li>
                                <li class="{{ menu('admin.contact.message') }}"><a class="nav-link"
                                                href="{{ route('admin.preloaded.index') }}">@lang('Preloaded
                                                Amount')</a>
                                </li>
                                <li class="{{ menu('admin.campaign.index') }}"><a class="nav-link"
                                                href="{{ route('admin.campaign.index') }}">@lang('Manage Campaigns')</a>
                                </li>
                        </ul>
                </li>
                <li class="nav-item dropdown {{ menu(['admin.contact*']) }}">
                        <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i
                                        class="fas fa-envelope-open-text"></i></i>
                                <span>@lang('Manage Contact')</span></a>
                        <ul class="dropdown-menu">

                                <li class="{{ menu('admin.contact.message') }}"><a class="nav-link"
                                                href="{{ route('admin.contact.message') }}">@lang('Contact
                                                Messages')</a>
                                </li>
                                <li class="{{ menu('admin.contact.setting.index') }}"><a class="nav-link"
                                                href="{{ route('admin.contact.setting.index') }}">@lang('Contact
                                                Setting')</a></li>
                        </ul>
                </li>


                <li class="nav-item dropdown {{ menu(['admin.gateway*']) }}">
                        <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i
                                        class="fas fa-money-check-alt"></i> <span>@lang('Payment Gateway')</span></a>
                        <ul class="dropdown-menu">
                                <li class="{{ menu('admin.currency.index') }}"><a class="nav-link"
                                                href="{{ route('admin.currency.index') }}">@lang('Currency')</a></li>
                                <li class="{{ menu('admin.gateway') }}"><a class="nav-link"
                                                href="{{ route('admin.gateway') }}">@lang('Gateways')</a>
                                </li>
                        </ul>
                </li>




                <li class="nav-item dropdown {{ menu(['admin.bcategory*','admin.blog*']) }}">
                        <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i
                                        class="fab fa-blogger-b"></i>
                                <span>@lang('Blogs')</span></a>
                        <ul class="dropdown-menu">
                                <li class="{{ menu('admin.bcategory.index') }}"><a class="nav-link"
                                                href="{{ route('admin.bcategory.index') }}">@lang('Category')</a></li>
                                <li class="{{ menu('admin.blog.index') }}"><a class="nav-link"
                                                href="{{ route('admin.blog.index') }}">@lang('Blogs')</a>
                                </li>
                                <li class="{{ menu('admin.blog.comment') }}"><a class="nav-link"
                                                href="{{ route('admin.blog.comment') }}">@lang('Comments')</a>
                                </li>
                        </ul>
                </li>

                <li class="nav-item dropdown {{ menu(['admin.page*']) }}">
                        <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-file-alt"></i>
                                <span>@lang('Manage Pages')</span></a>
                        <ul class="dropdown-menu">
                                <li class="{{ menu('admin.about.index') }}"><a class="nav-link"
                                                href="{{ route('admin.counter.index') }}">@lang('About Counter')</a>
                                </li>
                                <li class="{{ menu('admin.counter.index') }}"><a class="nav-link"
                                                href="{{ route('admin.about.index') }}">@lang('About Page')</a></li>
                                <li class="{{ menu('admin.gateway') }}"><a class="nav-link"
                                                href="{{ route('admin.page.index') }}">@lang('Other Page')</a>
                                </li>
                        </ul>
                </li>


                <li class="nav-item {{ menu('admin.volunteer.index') }}">
                        <a href="{{ route('admin.volunteer.index') }}" class="nav-link">
                                <i class="fas fa-users-cog"></i>
                                <span>@lang('Manage Volunteer')</span>
                        </a>
                </li>

                <li class="menu-header">@lang('General')</li>

                <li
                        class="nav-item dropdown {{ menu(['admin.gs*','admin.social.manage*','admin.language*', 'admin.cookie']) }}">
                        <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i
                                        class="fas fa-cog"></i><span>@lang('General Settings')</span></a>
                        <ul class="dropdown-menu">

                                <li class="{{ menu('admin.gs.site.settings') }}"><a class="nav-link"
                                                href="{{ route('admin.gs.site.settings') }}">@lang('Site Settings')</a>
                                </li>
                                <li class="{{ menu('admin.gs.logo') }}"><a class="nav-link"
                                                href="{{ route('admin.gs.logo') }}">@lang('Logo')</a></li>
                                <li class="{{ menu('admin.gs.breadcumb') }}"><a class="nav-link"
                                                href="{{ route('admin.gs.breadcumb') }}">@lang('Breadcumb')</a></li>
                                <li class="{{ menu('admin.language') }}"><a class="nav-link"
                                                href="{{ route('admin.language') }}">@lang('Language')</a></li>

                                <li class="{{ menu('admin.gs.maintainance.settings') }}"><a class="nav-link"
                                                href="{{ route('admin.gs.maintainance.settings') }}">@lang('Maintenance')</a>
                                </li>
                        </ul>
                </li>



                <li
                        class="nav-item dropdown {{ menu(['admin.front*','admin.faq*','admin.testimonial*','admin.brand*','admin.contact.section','admin.slider*','admin.counter*', 'admin.frontend*']) }}">
                        <a href="#" class="nav-link has-dropdown"><i class="fas fa-th"></i>
                                <span>@lang('Frontend Setting')</span></a>
                        <ul class="dropdown-menu">

                                <li class="{{ menu('admin.hero.index') }}"><a class="nav-link"
                                                href="{{ route('admin.hero.index') }}">@lang('Hero Section')</a></li>
                                <li class="{{ menu('admin.about.index') }}"><a class="nav-link"
                                                href="{{ route('admin.about.index') }}">@lang('About')</a></li>

                                <li class="{{ menu('admin.testimonial.index') }}"><a class="nav-link"
                                                href="{{ route('admin.testimonial.index') }}">@lang('Testimonials')</a>
                                </li>

                                <li class="{{ menu('admin.testimonial.index') }}"><a class="nav-link"
                                                href="{{ route('admin.cta.index') }}">@lang('CTA Section')</a>
                                </li>

                                <li class="{{ menu('admin.home.sections') }}"><a class="nav-link"
                                                href="{{ route('admin.home.sections') }}">@lang('Home Page Sections
                                                ')</a>
                                </li>

                                <li class="{{ menu('admin.brand.index') }}"><a class="nav-link"
                                                href="{{ route('admin.brand.index') }}">@lang('Brand')</a>
                                </li>

                        </ul>
                </li>

                <li class="menu-header">@lang('Staff and Role')</li>
                <li class="nav-item {{ menu('admin.role*') }}">
                        <a href="{{ route('admin.role.index') }}" class="nav-link"><i
                                        class="far fa-question-circle"></i><span>@lang('Manage Role')</span></a>
                </li>


                <li class="nav-item {{ menu('admin.staff*') }}">
                        <a href="{{ route('admin.staff.manage') }}" class="nav-link"><i
                                        class="fas fa-user-shield"></i><span>@lang('Manage Staff')</span></a>
                </li>

                <li class="nav-item {{ menu('admin.clear.cache') }}">
                        <a href="{{ route('admin.clear.cache') }}" class="nav-link"><i class="fas fa-broom"></i>
                                <span>@lang('Clear Cache')</span></a>
                </li>
        </ul>
</aside>