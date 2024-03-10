@extends('layouts.admin')
@section('title')
@lang('Edit Campaign')
@endsection

@section('breadcrumb')
<section class="section">
    <div class="section-header  d-flex justify-content-between">
        <h1>@lang('Edit Campaign')</h1>
        <a href="{{route('admin.campaign.index')}}" class="btn btn-primary"><i class="fas fa-backward"></i>
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
                <h6 class="m-0 font-weight-bold text-primary">{{ __('Edit Campaign Form') }}</h6>
            </div>
            <div class="card-body">

                <form action="{{route('admin.campaign.update',$data->id)}}" enctype="multipart/form-data" method="POST">
                    @csrf
                    @method('PUT')
                    <div class="col-md-12 ShowImage mb-3  text-center">
                        <img src="{{ getPhoto($data->photo) }}" class="img-fluid" alt="image" width="400">
                    </div>

                    <div class="row">
                        <div class="col-md-6 ">
                            <div class="form-group">
                                <label for="categorys">{{ __('Category') }}</label>
                                <select class="form-control  mb-3" id="categorys" name="category_id" required>
                                    <option value="" selected disabled>{{__('Select Category')}}</option>
                                    @foreach ($categories as $item)
                                    <option value="{{$item->id}}" {{$data->category_id == $item->id ? 'selected' :
                                        ''}}>{{$item->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="image">{{ __('Feature Photo') }}</label>
                                <span class="ml-3">{{ __('(Extension:jpeg,jpg,png)') }}</span>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" name="photo" id="image"
                                        accept="image/*">
                                    <label class="custom-file-label" for="photo">{{ __('Choose file') }}</label>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="title">{{ __('Campaign Title') }}</label>
                        <input type="text" class="form-control" name="title" id="title" required
                            placeholder="{{ __('Campaign Title') }}" value="{{old('title',$data->title)}}">
                    </div>

                    <div class="form-group">
                        <label for="location">{{ __('Location') }}</label>
                        <input type="text" class="form-control" name="location" id="location" required
                            placeholder="{{ __('Location') }}" value="{{old('location',$data->location)}}">
                    </div>

                    <div class="form-group">
                        <label for="benefits">{{ __('People Benefits') }}</label>
                        <input type="number" class="form-control" name="benefits" id="benefits" required
                            placeholder="{{ __('People Benefits') }}" value="{{old('benefits',$data->benefits)}}">
                    </div>

                    <div class="form-group">
                        <label for="goal">{{ __('Goal Amount') }}</label>
                        <input type="number" step="any" class="form-control" name="goal" id="goal" required
                            placeholder="{{ __('Goal Amount') }}" value="{{old('goal',$data->goal)}}">
                    </div>


                    <div class="form-group">
                        <label for="end_date">{{ __('End Date') }}</label>
                        <input type="date" class="form-control" name="end_date" id="end_date" required
                            placeholder="{{ __('End Date') }}" value="{{old('end_date',$data->end_date)}}">
                    </div>

                    <div class="form-group">
                        <label for="video_link">{{ __('Youtube Video ID') }}</label>
                        <input type="text" step="any" class="form-control" name="video_link" id="video_link"
                            placeholder="{{ __('Youtube Video ID') }}"
                            value="{{old('video_link',$data->video_link)}}">
                    </div>


                    <div class="form-group">
                        <label for="description">{{ __('Description') }}</label>
                        <textarea id="area1" class="form-control summernote" name="description"
                            placeholder="{{ __('Description') }}"
                            required>{{old('description',$data->description)}}</textarea>
                    </div>



                    <h6 class="mb-4 mt-0  font-weight-bold text-primary">
                        {{ __('Campaign Gallery') }}
                    </h6>



                    <div class="form-group">
                        <label for="image">{{ __('Gallery Photo') }}</label>
                        <span class="ml-3">{{ __('(Extension:jpeg,jpg,png)') }}</span>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" multiple id="upload_gallery_image"
                                name="gallery[]" id="image" accept="image/*">
                            <label class="custom-file-label" for="photo">{{ __('Choose file') }}</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-label">@lang('Gallery Image')</label>
                        <div class="row gutters-sm" id="view_gallery_images">
                            @if ($data->galleries->count() > 0)
                            @foreach ($data->galleries as $gallery)
                            <div class="col-6 col-sm-4 my-3">
                                <figure class="imagecheck-figure gelllabsoluteposition-relative">
                                    <span class="badge badge-danger gelllabsolute removeGalleryPermanent"
                                        data-href="{{route('admin.campaign.gallery.remove',$gallery->id)}}"> <i
                                            class="fas fa-times"></i></span>
                                    <img src="{{$gallery->photo}}" alt="}" class="imagecheck-image">
                                </figure>
                            </div>
                            @endforeach

                            @endif
                        </div>
                    </div>



                    <div class="form-group">
                        <label class="mt-2">
                            <input type="checkbox" name="is_faq" class="custom-switch-input" {{$data->is_faq == 1 ?
                            'checked' : ''}} id="campaign_faq_checkbox">
                            <span class="custom-switch-indicator"></span>
                            <span class="custom-switch-description">@lang('Add Faq')</span>
                        </label>
                    </div>


                    <div class="{{$data->is_faq == 1 ? '' : 'd-none'}} faq_form_view">

                        <h6 class="mb-4 mt-0 mx-3 font-weight-bold text-primary">{{ __('Campaign Faq Form') }}
                            <button type="button" class="btn btn-success btn-sm add_more_btn"><i
                                    class="fas fa-plus"></i></button>
                        </h6>

                        <div id="showing_faq_form" faq-title="{{ __('Faq Title') }}"
                            faq-content="{{ __('Faq Content') }}">

                            @if ($data->faqs->count() > 0)
                            @foreach ($data->faqs as $faq)

                            <div class="row d-flex justify-content-center align-items-center">
                                <div class="col-md-4 col-sm-12">
                                    <div class="form-group">
                                        <label for="faq_title">{{ __('Faq Title') }}</label>
                                        <input type="text" class="form-control" name="faq_title[]" id="faq_title"
                                            required placeholder="{{ __('Faq Title') }}" value="{{$faq->title}}">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label for="faq_content">{{ __('Faq Content') }}</label>
                                        <textarea type="number" step="any" class="form-control" name="faq_content[]"
                                            id="faq_content"
                                            placeholder="{{ __('Faq Content') }}">{{$faq->content}}</textarea>
                                    </div>
                                </div>
                                <div class="col-md-2 col-sm-12">
                                    <div class="">
                                        <button type="button" class="btn btn-danger btn-sm remove_faq"><i
                                                class="fas fa-minus"></i></button>
                                    </div>
                                </div>
                            </div>

                            @endforeach
                            @endif
                        </div>

                    </div>



                    <div class="form-group">
                        <label class="mt-2">
                            <input type="checkbox" name="is_preloaded" {{$data->is_preloaded == 1 ? 'checked' : ''}}
                            class="custom-switch-input" id="allow_preloaded">
                            <span class="custom-switch-indicator"></span>
                            <span class="custom-switch-description">@lang('Allow Preloaded Amount')</span>
                        </label>
                    </div>


                    <div class="form-group">
                        <label>{{ __('Status') }}</label>
                        <select class="form-control  mb-3" name="status" required>
                            <option value="1" {{$data->status == 1 ? 'selected' : ''}}>{{__('Active')}}</option>
                            <option value="0" {{$data->status == 0 ? 'selected' : ''}}>{{__('Inactive')}}</option>
                        </select>
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