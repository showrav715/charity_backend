@extends('layouts.admin')
@section('title')
    @lang('Admin Dashboard')
@endsection
@section('breadcrumb')
    <section class="section">
        <div class="section-header">
            <h1>@lang('Dashboard')</h1>
        </div>
    </section>
@endsection
@section('content')
    <div class="row">
        <div class="col-xl-3 col-lg-3 col-sm-6 col-12">
            <div class="card card-statistic-1">
                <div class="card-icon bg-primary">
                    <i class="fas fa-users"></i>
                </div>
                <div class="card-wrap">
                    <div class="card-header">
                        <h4>@lang('Total Contact Messages')</h4>
                    </div>
                    <div class="card-body">
                        {{ $total_getintouchs }}
                    </div>
                </div>
            </div>
        </div>
        
    

        <div class="col-xl-3 col-lg-3 col-sm-6 col-12">
            <div class="card card-statistic-1">
                <div class="card-icon bg-primary">
                    <i class="far fa-user"></i>
                </div>
                <div class="card-wrap">
                    <div class="card-header">
                        <h4>@lang('Total Team Members')</h4>
                    </div>
                    <div class="card-body">
                        {{ $total_teams }}
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-lg-3 col-sm-6 col-12">
            <div class="card card-statistic-1">
                <div class="card-icon bg-primary">
                    <i class="far fa-user"></i>
                </div>
                <div class="card-wrap">
                    <div class="card-header">
                        <h4>@lang('Total Blogs')</h4>
                    </div>
                    <div class="card-body">
                        {{ $total_blogs }}
                    </div>
                </div>
            </div>
        </div>


    </div>

    <div class="row">
        <div class="col-12 col-md-12 col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>@lang('Recent Get in Touch Message')</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                <th>@lang('Name')</th>
                                <th>@lang('Email')</th>
                                <th>@lang('Phone')</th>
                                <th>@lang('Message')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($getintouchs as $item)
                                <tr>
                                    <td data-label="@lang('Name')">
                                        {{ $item->name }}
                                    </td>
                                    <td data-label="@lang('Email')">
                                        {{ $item->email }}
                                    </td>
                                    <td data-label="@lang('Phone')">
                                        {{ $item->phone }}
                                    </td>
                                    
                                    <td data-label="@lang('Message')">
                                        {{ $item->message }}
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>




    </div>
@endsection
