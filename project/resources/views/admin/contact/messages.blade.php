@extends('layouts.admin')

@section('title')
    @lang('Contact Messages')
@endsection

@section('breadcrumb')
    <section class="section">
        <div class="section-header">
            <h1>@lang('Contact Messages')</h1>
        </div>
    </section>
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="card mb-4">
                <div class="table-responsive p-3">
                    <table class="table table-striped" id="table">
                        <thead>
                            <tr>

                                <th>@lang('Name')</th>
                                <th>@lang('Email')</th>
                                <th>@lang('Phone')</th>
                                <th>@lang('Subject')</th>
                                <th>@lang('Message')</th>
                                <th class="text-right">@lang('Action')</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($messages as $item)
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
                                    <td data-label="@lang('Subject')">
                                        {{ $item->subject }}
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

 
    <div class="modal fade" id="removeMod" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <form action="{{ route('admin.contact.message.delete') }}" method="POST">
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