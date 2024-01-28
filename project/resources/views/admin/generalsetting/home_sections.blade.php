@extends('layouts.admin')
@section('title')
@lang('Home Page Section')
@endsection

@section('breadcrumb')
<section class="section">
    <div class="section-header  d-flex justify-content-between">
        <h1>@lang('Home Page Section')</h1>
    </div>
</section>
@endsection
@section('content')

<div class="row justify-content-center">
    <div class="col-md-12">
        <div class="card mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h6 class="m-0 font-weight-bold text-primary">{{ __('Home Page Section Update') }}</h6>
            </div>
            <div class="card-body">
                <form action="{{route('admin.home.sections.update')}}" method="POST">
                    @csrf
                    <div class="form-group">
                        <label for="service_title">{{ __('Service Title') }}</label>
                        <input type="text" class="form-control" name="service_title" id="service_title" required
                            placeholder="{{ __('Service Title') }}"
                            value="{{old('service_title',$data->service_title)}}">
                    </div>

                    <div class="form-group">
                        <label for="service_text">{{ __('Service Text') }}</label>
                        <textarea type="text" class="form-control" name="service_text" id="service_text" required
                            placeholder="{{ __('Service Text') }}">{{$data->service_text}}</textarea>
                    </div>


                    <div class="form-group">
                        <label for="choose_title">{{ __('Choose Title') }}</label>
                        <input type="text" class="form-control" name="choose_title" id="choose_title" required
                            placeholder="{{ __('Choose Title') }}" value="{{old('choose_title',$data->choose_title)}}">
                    </div>

                    <div class="form-group">
                        <label for="choose_text">{{ __('Choose Text') }}</label>
                        <textarea type="text" class="form-control" name="choose_text" id="choose_text" required
                            placeholder="{{ __('Choose Text') }}">{{$data->choose_text}}</textarea>
                    </div>


                    <div class="form-group">
                        <label for="team_title">{{ __('Team Title') }}</label>
                        <input type="text" class="form-control" name="team_title" id="team_title" required
                            placeholder="{{ __('Team Title') }}" value="{{old('team_title',$data->team_title)}}">
                    </div>

                    <div class="form-group">
                        <label for="team_text">{{ __('Team Text') }}</label>
                        <textarea type="text" class="form-control" name="team_text" id="team_text" required
                            placeholder="{{ __('Team Text') }}">{{$data->team_text}}</textarea>
                    </div>


                    <div class="form-group">
                        <label for="testimonial_title">{{ __('Testimonial Title') }}</label>
                        <input type="text" class="form-control" name="testimonial_title" id="testimonial_title" required
                            placeholder="{{ __('Testimonial Title') }}"
                            value="{{old('testimonial_title',$data->testimonial_title)}}">
                    </div>

                    <div class="form-group">
                        <label for="testimonial_text">{{ __('Testimonial Text') }}</label>
                        <textarea class="form-control" name="testimonial_text" id="testimonial_text"
                            placeholder="{{ __('Testimonial Text') }}">{{$data->testimonial_text}}</textarea>
                    </div>

                    <div class="form-group">
                        <label for="blog_title">{{ __('Blog Title') }}</label>
                        <input type="text" class="form-control" name="blog_title" id="blog_title" required
                            placeholder="{{ __('Blog Title') }}" value="{{old('blog_title',$data->blog_title)}}">
                    </div>

                    <div class="form-group">
                        <label for="blog_text">{{ __('Blog Text') }}</label>
                        <textarea class="form-control" name="blog_text" id="blog_text" required
                            placeholder="{{ __('Blog Text') }}">{{$data->blog_text}}</textarea>
                    </div>

                    <button type="submit" class="btn btn-primary">{{ __('Submit') }}</button>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection