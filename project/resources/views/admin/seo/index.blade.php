@extends('layouts.admin')

@section('title')
   @lang('SEO Settings')
@endsection

@section('breadcrumb')
 <section class="section">
    <div class="section-header">
        <h1>@lang('SEO Settings')</h1>
    </div>
</section>
@endsection



@section('content')

<div class="row justify-content-center mt-3">
   <div class="col-lg-12">
      <div class="card mb-4">
         <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
            <h6 class="m-0 font-weight-bold text-primary">{{ __('SEO Settings Form') }}</h6>
         </div>
         <div class="card-body">
           
            <form  action="{{route('admin.seo-setting.update',$seosetting->id)}}" enctype="multipart/form-data" method="POST">
               @csrf
               @method('PUT')
               @include('admin.partials.form-both')
                <div class="form-group row mb-3">
                    <label for="title" class="col-sm-3 col-form-label">{{ __('Title') }}</label>
                    <div class="col-sm-9">
                    <input type="text" class="form-control" id="title" name="title" placeholder="{{ __('Title') }}" value="{{$seosetting->title}}">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="tag" class="col-sm-3 col-form-label">{{ __('Meta Tags') }}</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control tagify__input"  id="tag" name="meta_tag" value="{{$seosetting->meta_tag}}" placeholder="{{ __('Meta Tags') }}" >
                    </div>
                </div>
                <div class="form-group row">
                    <label for="meta_description" class="col-sm-3 col-form-label">{{ __('Meta Description') }}</label>
                    <div class="col-sm-9">
                     <textarea id="meta_description" class="form-control" name="meta_description" placeholder="{{ __('Meta Description') }}">{{$seosetting->meta_description}}</textarea>
                    </div>
                </div>

               <div class="form-group row ">
                  <label for="" class="col-sm-3 col-form-label">@lang('Meta Image')</label>
                  <div class="col-sm-9">
                     <div class="gallery gallery-fw  mb-4" >
                        <img class="imageShow seo-og-img" src="{{getPhoto($seosetting->meta_image)}}" data-image="{{getPhoto($seosetting->meta_image)}}">
                     </div>
                     <div class="custom-file">
                        <input type="file" name="meta_image" class="custom-file-input imageUpload" id="customFile">
                        <label class="custom-file-label"  for="customFile">@lang('Choose file')</label>
                     </div>
                  </div>
               </div>

               <div class="form-group row">
                  <div class="col-sm-12 text-right">
                     <button type="submit" class="btn btn-primary btn-lg">{{__('Save')}}</button>
                  </div>
               </div>
            </form>
         </div>
      </div>
   </div>
</div>
@endsection

@push('script')
    <script>
      'use strict';
      $('input[name=meta_tag]').tagify();

       function imageShow(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $(input).parents('.form-group').find('.imageShow').attr('src',e.target.result)
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        $(".imageUpload").on('change', function () {
            imageShow(this);
        });

    </script>
@endpush