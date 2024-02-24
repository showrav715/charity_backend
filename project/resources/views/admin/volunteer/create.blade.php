@extends('layouts.admin')
@section('title')
@lang('Add New Volunteer')
@endsection

@section('breadcrumb')
<section class="section">
    <div class="section-header  d-flex justify-content-between">
        <h1>@lang('Add New Volunteer')</h1>
        <a href="{{route('admin.volunteer.index')}}" class="btn btn-primary"><i class="fas fa-backward"></i>
            @lang('Back')</a>
    </div>
</section>
@endsection
@section('content')

<div class="row justify-content-center">
    <div class="col-md-12">
        <!-- Form Basic -->
        <div class="card mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">{{ __('Add New Volunteer Form') }}</h6>
            </div>
            <div class="card-body">

                <form action="{{route('admin.volunteer.store')}}" enctype="multipart/form-data" method="POST">
                    @csrf
                    <div class="form-group d-flex justify-content-center">
                        <div id="image-preview" class="image-preview image-preview_alt"
                            style="background-image:url({{ getPhoto('') }});">
                            <label for="image-upload" id="image-label">@lang('Choose File')</label>
                            <input type="file" name="photo" id="image-upload" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name">{{ __('Name') }}</label>
                        <input type="text" class="form-control" name="name" id="name" required
                            placeholder="{{ __('Name') }}" value="{{old('name')}}">
                    </div>

                    <div class="form-group">
                        <label for="designation">{{ __('Designation') }}</label>
                        <input type="text" class="form-control" name="designation" id="designation" required
                            placeholder="{{ __('Designation') }}" value="{{old('designation')}}">
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="facebook">{{ __('Facebook Link') }}</label>
                                <input type="text" class="form-control" name="facebook" id="facebook" 
                                    placeholder="{{ __('Facebook') }}" value="{{old('facebook')}}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="instragram">{{ __('Instragram Link') }}</label>
                                <input type="text" class="form-control" name="instragram" id="instragram" 
                                    placeholder="{{ __('Instragram') }}" value="{{old('instragram')}}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="twitter">{{ __('Twitter Link') }}</label>
                                <input type="text" class="form-control" name="twitter" id="twitter" 
                                    placeholder="{{ __('Twitter') }}" value="{{old('twitter')}}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="linkedin">{{ __('Linkedin') }}</label>
                                <input type="text" class="form-control" name="linkedin" id="linkedin" 
                                    placeholder="{{ __('Linkedin') }}" value="{{old('linkedin')}}">
                            </div>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary">{{ __('Submit') }}</button>
                </form>
            </div>
        </div>
        <!-- Form Sizing -->
        <!-- Horizontal Form -->
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
                label_default: "{{__('Choose File')}}", // Default: Choose File
                label_selected: "{{__('Update Image')}}", // Default: Change File
                no_label: false, // Default: false
                success_callback: null // Default: null
            });
</script>
@endpush