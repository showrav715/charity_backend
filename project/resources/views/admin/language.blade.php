@extends('layouts.admin')

@section('title')
   @lang('Language Setting')
@endsection

@section('breadcrumb')
 <section class="section">
    <div class="section-header">
        <h1>@lang('Language Setting')</h1>
    </div>
</section>
@endsection

@section('content')
    <div class="card">
                <div class="card-body">
                    <form id="" action="{{route('admin.language.update')}}" class="row" method="POST" enctype="multipart/form-data">
                        @csrf
                        @foreach ($langs as  $key => $value)
                        <div class="col-md-6 col-xl-6 col-lg-12">
                            <div class="form-group">
                                <label>@lang('Language')</label>
                                <input class="form-control" type="text" readonly name="key[]" value="{{$key}}" required>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-6">
                            <div class="form-group">
                                <label>@lang('Value')</label>
                                <input class="form-control" type="text" name="value[]" value="{{$value}}" required>
                            </div>
                        </div>
                        @endforeach

                        <div class="col-12 text-center">
                            <button type="submit" class="btn btn-primary">{{ __('Submit') }}</button>
                        </div>
                    </form>
                </div>
            </div>
@endsection
