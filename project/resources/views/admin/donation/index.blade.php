@extends('layouts.admin')

@section('title')
    @lang('Manage Donations')
@endsection

@section('breadcrumb')
    <section class="section">
        <div class="section-header">
            <h1>@lang('Manage Donations')</h1>
        </div>
    </section>
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="card mb-4">
                
                <div class="table-responsive p-3">
                    <table class="table table-striped">
                        <tr>
                            <th>@lang('Campaign Name')</th>
                            <th>@lang('Total')</th>
                            <th>@lang('Campaign Owner')</th>
                            <th>@lang('Donar Name')</th>
                            <th>@lang('Txn Id')</th>
                            <th>@lang('Payment Method')</th>
                            <th>@lang('Status')</th>
                            <th class="text-right">@lang('Action')</th>
                        </tr>
                        @forelse ($donations as $item)
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

                                <td data-label="@lang('Raised')">
                                    {{ $item->name ?? 'N/A' }}
                                </td>

                                <td data-label="@lang('Raised')">
                                    {{ $item->txn_id ?? 'N/A' }}
                                </td>
                                <td data-label="@lang('Raised')">
                                    {{ $item->payment_method ?? 'N/A' }}
                                </td>

                                <td data-label="@lang('Feature')">
                                    <div class="btn-group mb-2">
                                        <button
                                            class="btn btn-{{ $item->status == 1 ? 'success' : 'danger' }} btn-sm dropdown-toggle"
                                            type="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            @if ($item->status == 1)
                                                @lang('Yes')
                                            @else
                                                @lang('No')
                                            @endif
                                        </button>
                                        <div class="dropdown-menu" x-placement="bottom-start"
                                            style="position: absolute; transform: translate3d(0px, 29px, 0px); top: 0px; left: 0px; will-change: transform;">
                                            <a class="dropdown-item"
                                                href="{{ route('admin.campaign.status', [$item->id, 1]) }}">Yes</a>
                                            <a class="dropdown-item"
                                                href="{{ route('admin.campaign.status', [$item->id, 0]) }}">No</a>
                                        </div>
                                    </div>
                                </td>




                                <td data-label="@lang('Action')" class="text-right">
                                    <a href="{{ route('admin.campaign.edit', $item->id) }}"
                                        class="btn btn-primary approve btn-sm  mb-1" data-toggle="tooltip"
                                        title="@lang('Edit')"><i class="fas fa-edit"></i></a>
                                    <a href="javascript:void(0)" class="btn btn-danger btn-sm remove mb-1"
                                        data-id="{{ $item->id }}" data-toggle="tooltip" title="@lang('Remove')"><i
                                            class="fas fa-trash"></i></a>
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
@endsection
