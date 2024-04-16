@extends('layouts.admin')

@section('title')
    @lang('Manage Campaign')
@endsection

@section('breadcrumb')
    <section class="section">
        <div class="section-header">
            <h1>@lang('Manage Campaign')</h1>
        </div>
    </section>
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="card mb-4">
                <div class="card-header d-flex justify-content-end">
                    <a href="{{ route('admin.campaign.create') }}" class="btn btn-primary">
                        <i class="fas fa-plus"></i> @lang('Add New')
                    </a>

                </div>
                <div class="table-responsive p-3">
                    <table class="table table-striped">
                        <tr>
                            <th>@lang('Photo')</th>
                            <th>@lang('Title')</th>
                            <th>@lang('Goal')</th>
                            <th>@lang('Resad')</th>
                            <th>@lang('Feature')</th>
                            <th>@lang('Close Type')</th>
                            <th>@lang('Status')</th>
                            <th class="text-right">@lang('Action')</th>
                        </tr>
                        @forelse ($campaigns as $item)
                            <tr>
                                <td data-label="@lang('Photo')">
                                    <img src="{{ getPhoto($item->photo) }}" alt="icon" class="img-fluid"
                                        style="width: 150px">
                                </td>
                                <td data-label="@lang('Title')">
                                    {{ $item->title }}
                                </td>
                                <td data-label="@lang('Goal')">
                                    {{ showAdminAmount($item->goal) }}
                                </td>
                                <td data-label="@lang('Raised')">
                                    {{ showAdminAmount($item->raised) }}
                                </td>

                                <td data-label="@lang('Feature')">
                                    <div class="btn-group mb-2">
                                        <button
                                            class="btn btn-{{ $item->is_feature == 1 ? 'success' : 'danger' }} btn-sm dropdown-toggle"
                                            type="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            @if ($item->is_feature == 1)
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

                              
                                <td data-label="@lang('Close Type')">
                                    @if ($item->close_type == 'end_date')
                                        <span class="badge badge-dark mb-1"> @lang('End Date') </span>
                                        <br>
                                        <b>{{ dateFormat($item->end_date) }}</b>
                                    @else
                                        <span class="badge badge-dark"> @lang('Goal Achieved') </span>
                                    @endif
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
                @if ($campaigns->hasPages())
                    {{ $campaigns->links('admin.partials.paginate') }}
                @endif
            </div>
        </div>
    </div>



    <!-- Modal -->
    <div class="modal fade" id="removeMod" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <form action="{{ route('admin.campaign.destroy') }}" method="POST">
                @method('DELETE')
                @csrf
                <input type="hidden" name="id">
                <div class="modal-content">
                    <div class="modal-body">
                        <h5>@lang('Are you sure to remove?')</h5>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-dark" data-dismiss="modal">@lang('Close')</button>
                        <button type="submit" class="btn btn-danger">@lang('Confirm')</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection

@push('script')
    <script>
        'use strict';
        $('.remove').on('click', function() {
            $('#removeMod').find('input[name=id]').val($(this).data('id'))
            $('#removeMod').modal('show')
        })
    </script>
@endpush
