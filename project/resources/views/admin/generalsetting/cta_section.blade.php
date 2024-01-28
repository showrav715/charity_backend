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

                        <div class="col-8 offset-2 text-center">
                            <label for="">Cta Section Photo</label>
                            <div class="form-group d-flex justify-content-center">
                                <div id="image-preview" class="image-preview image-preview_alt"
                                    style="background-image:url({{ getPhoto($gs->cta_photo) }});">
                                    <label for="image-upload" id="image-label">@lang('Choose File')</label>
                                    <input type="file" name="cta_photo" id="image-upload" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <input type="hidden" name="type" value="cta" id="">
                    <div class="form-group">
                        <label>@lang('Title')</label>
                        <input class="form-control" type="text" name="cta_title" value="{{ $gs->cta_title }}">
                    </div>
                    <div class="form-group">
                        <label>@lang('Button Text')</label>
                        <input class="form-control" type="text" name="cta_btn_text" value="{{ $gs->cta_btn_text }}">
                    </div>
                    <div class="form-group">
                        <label>@lang('Button Url')</label>
                        <input class="form-control" type="text" name="cta_btn_url" value="{{ $gs->cta_btn_url }}">
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
</script>
@endpush