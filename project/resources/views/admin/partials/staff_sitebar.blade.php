<aside id="sidebar-wrapper">
    <ul class="sidebar-menu mb-5">
        <li class="menu-header">@lang('Dashboard')</li>
        <li class="nav-item {{ menu('admin.dashboard') }}">
            <a href="{{ route('admin.dashboard') }}" class="nav-link"><i
                    class="fas fa-fire"></i><span>@lang('Dashboard')</span></a>
        </li>

        @if (access('Services'))
            <li class="nav-item dropdown {{ menu(['admin.service*']) }}">
                <a href="#" class="nav-link has-dropdown" data-toggle="dropdown">
                    <i class="fas fa-toolbox"></i>
                    <span>@lang('Services')</span></a>
                <ul class="dropdown-menu">
                    <li class="{{ menu('admin.service.index') }}"><a class="nav-link"
                            href="{{ route('admin.service.index') }}">@lang('Service')</a></li>
                    <li class="{{ menu('admin.service.faq.index') }}"><a class="nav-link"
                            href="{{ route('admin.service.faq.index') }}">@lang('Service Faq')</a></li>
                </ul>
            </li>
        @endif


        @if (access('Manage Contact'))
            <li class="nav-item dropdown {{ menu(['admin.contact*']) }}">
                <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i
                        class="fas fa-envelope-open-text"></i></i>
                    <span>@lang('Manage Contact')</span></a>
                <ul class="dropdown-menu">
                    <li class="{{ menu('admin.contact.getintouch.message') }}"><a class="nav-link"
                            href="{{ route('admin.contact.getintouch.message') }}">@lang('Get in Touch')</a>
                    </li>
                    <li class="{{ menu('admin.contact.message') }}"><a class="nav-link"
                            href="{{ route('admin.contact.message') }}">@lang('Contact Messages')</a>
                    </li>
                    <li class="{{ menu('admin.contact.setting.index') }}"><a class="nav-link"
                            href="{{ route('admin.contact.setting.index') }}">@lang('Contact Setting')</a></li>
                </ul>
            </li>
        @endif



        @if (access('Blogs'))
            <li class="nav-item dropdown {{ menu(['admin.bcategory*', 'admin.blog*']) }}">
                <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fab fa-blogger-b"></i>
                    <span>@lang('Blogs')</span></a>
                <ul class="dropdown-menu">
                    <li class="{{ menu('admin.bcategory.index') }}"><a class="nav-link"
                            href="{{ route('admin.bcategory.index') }}">@lang('Category')</a></li>
                    <li class="{{ menu('admin.blog.index') }}"><a class="nav-link"
                            href="{{ route('admin.blog.index') }}">@lang('Blogs')</a>
                    </li>
                </ul>
            </li>
        @endif


        @if (access('Manage Project'))
            <li class="nav-item dropdown {{ menu(['admin.pcategory*','admin.project*']) }}">
                <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fab fa-r-project"></i>
                    <span>@lang('Manage Project')</span></a>
                <ul class="dropdown-menu">

                    <li class="{{ menu('admin.pcategory.index') }}"><a class="nav-link"
                            href="{{ route('admin.pcategory.index') }}">@lang('Category')</a>
                    </li>
                    <li class="{{ menu('admin.project.index') }}"><a class="nav-link"
                            href="{{ route('admin.project.index') }}">@lang('Project')</a></li>
                </ul>
            </li>
        @endif

        @if (access('Manage Pages'))
            <li class="nav-item {{ menu('admin.page.index*') }}">
                <a href="{{ route('admin.page.index') }}" class="nav-link"><i
                        class="fas fa-file-alt"></i><span>@lang('Manage Pages')</span></a>
            </li>
        @endif


        @if (access('Manage Team'))
            <li class="nav-item {{ menu('admin.team.index') }}">
                <a href="{{ route('admin.team.index') }}" class="nav-link"><i class="fas fa-users-cog"></i>
                    <span>@lang('Manage Team')</span></a>
            </li>
        @endif




        @if (access('General Settings'))
            <li class="menu-header">@lang('General Settings')</li>

            <li class="nav-item dropdown {{ menu(['admin.gs*','admin.social.manage*','admin.language*', 'admin.cookie']) }}">
                <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i
                        class="fas fa-cog"></i><span>@lang('General Settings')</span></a>
                <ul class="dropdown-menu">

                    <li class="{{ menu('admin.gs.site.settings') }}"><a class="nav-link"
                            href="{{ route('admin.gs.site.settings') }}">@lang('Site Settings')</a></li>
                    <li class="{{ menu('admin.gs.theme.settings') }}"><a class="nav-link"
                            href="{{ route('admin.gs.theme.settings') }}">@lang('Theme Settings')</a></li>
                    <li class="{{ menu('admin.gs.logo') }}"><a class="nav-link"
                            href="{{ route('admin.gs.logo') }}">@lang('Logo & Favicon')</a></li>
                    <li class="{{ menu('admin.gs.breadcumb') }}"><a class="nav-link"
                            href="{{ route('admin.gs.breadcumb') }}">@lang('Breadcumb')</a></li>
                    <li class="{{ menu('admin.social.manage') }}"><a class="nav-link"
                            href="{{ route('admin.social.manage') }}">@lang('Social Links')</a></li>
                    <li class="{{ menu('admin.cookie') }}"><a class="nav-link"
                            href="{{ route('admin.cookie') }}">@lang('Cookie Concent')</a></li>
                    <li class="{{ menu('admin.gs.plugin.settings') }}"><a class="nav-link"
                            href="{{ route('admin.gs.plugin.settings') }}">@lang('Plugins')</a></li>
                    <li class="{{ menu('admin.gs.maintainance.settings') }}"><a class="nav-link"
                            href="{{ route('admin.gs.maintainance.settings') }}">@lang('Maintenance')</a></li>
                </ul>
            </li>
        @endif



        @if (access('Frontend Settings'))
            <li
                class="nav-item dropdown {{ menu(['admin.front*', 'admin.faq*', 'admin.testimonial*', 'admin.brand*', 'admin.contact.section', 'admin.about*', 'admin.slider*', 'admin.counter*', 'admin.frontend*']) }}">
                <a href="#" class="nav-link has-dropdown"><i class="fas fa-th"></i>
                    <span>@lang('Frontend Setting')</span></a>
                <ul class="dropdown-menu">
                    <li class="{{ menu('admin.slider.index') }}"><a class="nav-link"
                            href="{{ route('admin.slider.index') }}">@lang('Slider')</a></li>
                    <li class="{{ menu('admin.about.index') }}"><a class="nav-link"
                            href="{{ route('admin.about.index') }}">@lang('About')</a></li>
                    <li class="{{ menu('admin.counter.index') }}"><a class="nav-link"
                            href="{{ route('admin.counter.index') }}">@lang('Counter Section')</a></li>
                    <li class="{{ menu('admin.faq.index') }}"><a class="nav-link"
                            href="{{ route('admin.faq.index') }}">@lang('FAQ')</a></li>
                    <li class="{{ menu('admin.contact.section') }}"><a class="nav-link"
                            href="{{ route('admin.contact.section') }}">@lang('Contact Section')</a></li>
                    <li class="{{ menu('admin.testimonial.index') }}"><a class="nav-link"
                            href="{{ route('admin.testimonial.index') }}">@lang('Testimonials')</a></li>
                    <li class="{{ menu('admin.brand.index') }}"><a class="nav-link"
                            href="{{ route('admin.brand.index') }}">@lang('Brand')</a></li>
                </ul>
            </li>
        @endif



        @if (access('Manage Role'))
            <li class="nav-item {{ menu('admin.role*') }}">
                <a href="{{ route('admin.role.index') }}" class="nav-link"><i
                        class="far fa-question-circle"></i><span>@lang('Manage Role')</span></a>
            </li>
        @endif


        @if (access('Manage Staff'))
            <li class="nav-item {{ menu('admin.staff*') }}">
                <a href="{{ route('admin.staff.manage') }}" class="nav-link"><i
                        class="fas fa-user-shield"></i><span>@lang('Manage Staff')</span></a>
            </li>
        @endif



        @if (access('Subscribers'))
            <li class="nav-item {{ menu('admin.subscriber') }}">
                <a href="{{ route('admin.subscriber') }}" class="nav-link"><i class="fas fa-users"></i>
                    <span>@lang('Subscribers')</span></a>
            </li>
        @endif


        <li class="nav-item {{ menu('admin.clear.cache') }}">
            <a href="{{ route('admin.clear.cache') }}" class="nav-link"><i class="fas fa-broom"></i>
                <span>@lang('Clear Cache')</span></a>
        </li>


    </ul>
</aside>
