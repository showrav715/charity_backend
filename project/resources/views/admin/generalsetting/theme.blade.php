@extends('layouts.admin')
@section('breadcrumb')
 <section class="section">
        <div class="section-header">
        <h1>@lang('Theme Settings')</h1>
        </div>
</section>
@endsection
@section('title')
   @lang('Theme Settings')
@endsection
@section('content')

<div class="row">
    <div class="col-md-6">
        <div class="card">
            <div class="card-header">
               <h6 class="text-primary"> @lang('Theme1')</h6>
            </div>
            <div class="card-body">
              <form id="" action="{{ route('admin.gs.update') }}" enctype="multipart/form-data" method="POST">
                @csrf
                <input type="hidden" name="type" value="theme">
                <input type="hidden" name="theme" value="theme1">
                 <div class="form-group d-flex justify-content-center">
                    <img width="200" src="{{ asset('assets/admin/theme1.png') }}" alt="">
                 </div>
                   <div class="form-group row">
                    <div class="col-sm-12 text-center">
                        @if ($gs->theme == 'theme1')
                            <button type="button" class="btn btn-success btn-block">{{ __('Active') }}</button>
                        @else
                            <button type="submit" class="btn btn-primary btn-block">{{ __('Update') }}</button>
                        @endif
                    </div>
                  </div>
              </form>
            </div>
        </div>
    </div>

   
    <div class="col-md-6">
      <div class="card">
        <div class="card-header  d-flex flex-row align-items-center justify-content-between">
          <h6 class="m-0 font-weight-bold text-primary">{{ __('Theme2') }}</h6>
        </div>
        <div class="card-body">
            <form id="" action="{{ route('admin.gs.update') }}" enctype="multipart/form-data" method="POST">
              @csrf
              <input type="hidden" name="type" value="theme">
              <input type="hidden" name="theme" value="theme2">
              <div class="form-group d-flex justify-content-center">
                <img width="200" src="{{ asset('assets/admin/theme2.png') }}" alt="">
             </div>
             <div class="form-group row">
              <div class="col-sm-12 text-center">
                @if ($gs->theme == 'theme2')
                <button type="button" class="btn btn-success btn-block">{{ __('Active') }}</button>
            @else
                <button type="submit" class="btn btn-primary btn-block">{{ __('Update') }}</button>
            @endif
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
</div>



@endsection
