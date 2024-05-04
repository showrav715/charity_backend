@extends('layouts.admin')
@section('title')
    @lang('Edit Cta Section')
@endsection

@section('breadcrumb')
    <section class="section">
        <div class="section-header d-flex justify-content-between">
            <h1>@lang('Edit Cta Section')</h1>
        </div>
    </section>
@endsection
@section('content')
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card mb-4">
                <div class="card-body">

                    <form action="{{ route('admin.gs.update') }}" method="POST" enctype="multipart/form-data">
                        @method('post')
                        @csrf

                        <div class="row">

                            <div class="col-6 text-center">
                                <label for="">@lang('Cta Section Photo For Home 1')</label>
                                <div class="form-group d-flex justify-content-center">
                                    <div id="image-preview" class="image-preview image-preview_alt"
                                        style="background-image:url({{ getPhoto($gs->cta_photo) }});">
                                        <label for="image-upload" id="image-label">@lang('Choose File')</label>
                                        <input type="file" name="cta_photo" id="image-upload" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-6 text-center">
                                <label for="">@lang('Cta Section Photo For Home 2')</label>
                                <div class="form-group d-flex justify-content-center">
                                    <div id="image-preview1" class="image-preview image-preview_alt"
                                        style="background-image:url({{ getPhoto($gs->cta_photo2) }});">
                                        <label for="image-upload1" id="image-label">@lang('Choose File')</label>
                                        <input type="file" name="cta_photo2" id="image-upload1" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <input type="hidden" name="type" value="cta" id="">
                        <div class="form-group">
                            <label>@lang('Title')</label>
                            <textarea class="form-control" type="text" name="cta_title">{{ $gs->cta_title }}</textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">{{ __('Update') }}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--Row-->
@endsection

@push('script')
    <script>
        'use strict';
        $.uploadPreview({
            input_field: "#image-upload", // Default: .image-upload
            preview_box: "#image-preview", // Default: .image-preview
            label_field: "#image-label", // Default: .image-label
            label_default: "{{ __('Choose File') }}", // Default: Choose File
            label_selected: "{{ __('Update Image') }}", // Default: Change File
            no_label: false, // Default: false
            success_callback: null // Default: null
        });
        $.uploadPreview({
            input_field: "#image-upload1", // Default: .image-upload
            preview_box: "#image-preview1", // Default: .image-preview
            label_field: "#image-label1", // Default: .image-label
            label_default: "{{ __('Choose File') }}", // Default: Choose File
            label_selected: "{{ __('Update Image') }}", // Default: Change File
            no_label: false, // Default: false
            success_callback: null // Default: null
        });
    </script>
@endpush
