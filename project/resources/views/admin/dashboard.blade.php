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
                        <h4>@lang('Total Campaign')</h4>
                    </div>
                    <div class="card-body">
                        167856246
                        <a href="{{ route('admin.campaign.index') }}">@lang('View')</a>
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
                        <h4>@lang('Total Donations')</h4>
                    </div>
                    <div class="card-body">
                        {{ $total_teams }}
                        <a href="{{ route('admin.donation.index') }}">@lang('View')</a>
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
                        <h4>@lang('Total Users')</h4>
                    </div>
                    <div class="card-body">
                        {{ $total_blogs }}
                        <a href="{{ route('admin.user.index') }}">@lang('View')</a>
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
                        <h4>@lang('Total Events')</h4>
                    </div>
                    <div class="card-body">
                        {{ $total_blogs }}
                        <a href="{{ route('admin.event.index') }}">@lang('View')</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-6 col-md-6 col-lg-6">
            <div class="card">
                <div class="card-header">
                    <h4>@lang('Recent Donations')</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <tr>
                                <th>@lang('Campaign Name')</th>
                                <th>@lang('Total')</th>
                                <th>@lang('Campaign Owner')</th>
                                <th>@lang('Donar Name')</th>
                                <th class="text-right">@lang('Action')</th>
                            </tr>
                            @forelse ($recent_donations as $item)
                                <tr>
                                    <td data-label="@lang('Campaign Name')">
                                        <a
                                            href="{{ route('admin.campaign.edit', $item->campaign->id) }}">{{ $item->campaign->title }}</a>
                                    </td>
                                    <td data-label="@lang('Total')">
                                        {{ showAdminAmount($item->total) }}
                                    </td>

                                    <td data-label="@lang('Raised')">
                                        <a href="">
                                            <strong>
                                                {{ $item->owner_id ? $item->owner->username : __('Admin') }}
                                            </strong>
                                        </a>
                                    </td>

                                    <td data-label="@lang('Donor Name')">
                                        {{ $item->name ?? 'N/A' }}
                                    </td>

                                    <td data-label="@lang('Action')" class="text-right">
                                        <a href="{{ route('admin.campaign.edit', $item->id) }}"
                                            class="btn btn-primary btn-sm  mb-1" data-toggle="tooltip"
                                            title="@lang('Edit')">@lang('Detail')</a>
                                    </td>
                                </tr>
                            @empty

                                <tr>
                                    <td class="text-center" colspan="100%">@lang('No Data Found')</td>
                                </tr>
                            @endforelse
                        </table>
                    </div>
                </div>
            </div>
        </div>


        <div class="col-6 col-md-6 col-lg-6">
            <div class="card">
                <div class="card-header">
                    <h4>@lang('Recent Campaigns')</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <tr>
                                <th>@lang('Photo')</th>
                                <th>@lang('Title')</th>
                                <th>@lang('Goal')</th>
                                <th>@lang('Status')</th>

                            </tr>
                            @forelse ($recent_campaigns as $item)
                                <tr>
                                    <td data-label="@lang('Photo')">
                                        <img src="{{ getPhoto($item->photo) }}" height="85" width="80"
                                            alt="icon">
                                    </td>
                                    <td data-label="@lang('Title')">
                                        <a href="{{ route('admin.campaign.edit', $item->id) }}"> {{ $item->title }}</a>
                                    </td>
                                    <td data-label="@lang('Goal')">
                                        {{ showAdminAmount($item->goal) }}
                                    </td>

                                    <td data-label="@lang('Status')">
                                        @if ($item->status == 1)
                                            <span class="badge badge-success"> @lang('Running') </span>
                                        @elseif($item->status == 2)
                                            <span class="badge badge-danger"> @lang('Closed') </span>
                                        @else
                                            <span class="badge badge-warning"> @lang('Pending') </span>
                                        @endif
                                    </td>
                                </tr>
                            @empty

                                <tr>
                                    <td class="text-center" colspan="100%">@lang('No Data Found')</td>
                                </tr>
                            @endforelse
                        </table>
                    </div>
                </div>
            </div>
        </div>


        <div class="col-6 col-md-6 col-lg-6">
            <div class="card">
                <div class="card-header">
                    <h4>@lang('Recent Customers')</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <tr>
                                <th>@lang('Sl')</th>
                                <th>@lang('Name')</th>
                                <th>@lang('Email')</th>
                                <th>@lang('Action')</th>
                            </tr>
                            @forelse ($recent_users as $key => $user)
                                <tr>
                                    <td data-label="@lang('Sl')">{{ $key }}</td>

                                    <td data-label="@lang('Name')">
                                        {{ $user->name }}
                                    </td>
                                    <td data-label="@lang('Email')">{{ $user->email }}</td>

                                    <td data-label="@lang('Action')">
                                        <a class="btn btn-primary details"
                                            href="{{ route('admin.user.details', $user->id) }}">@lang('Details')</a>
                                    </td>
                                </tr>
                            @empty

                                <tr>
                                    <td class="text-center" colspan="100%">@lang('No Data Found')</td>
                                </tr>
                            @endforelse
                        </table>
                    </div>
                </div>
            </div>
        </div>


        <div class="col-6 col-md-6 col-lg-6">
            <div class="card">
                <div class="card-header">
                    <h4>@lang('Recent Contact Messages')</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped" id="table">
                            <thead>
                                <tr>

                                    <th>@lang('Name')</th>
                                    <th>@lang('Email')</th>
                                    <th>@lang('Phone')</th>
                                    <th>@lang('Message')</th>
                                    <th class="text-right">@lang('Action')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($recent_messages as $item)
                                    <tr>
                                        <td data-label="@lang('Name')">
                                            {{ $item->name }}
                                        </td>
                                        <td data-label="@lang('Email')">
                                            {{ $item->email ?? 'N/A' }}
                                        </td>
                                        <td data-label="@lang('Phone')">
                                            {{ $item->phone ?? 'N/A' }}
                                        </td>

                                        <td data-label="@lang('Message')">
                                            {{ $item->message }}
                                        </td>
                                        <td data-label="@lang('Action')" class="text-right">
                                            <a href="javascript:void(0)" class="btn btn-danger btn-sm remove mb-1"
                                                data-id="{{ $item->id }}" data-toggle="tooltip"
                                                title="@lang('Remove')"><i class="fas fa-trash"></i></a>
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
