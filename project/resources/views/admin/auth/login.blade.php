@extends('layouts.admin_auth')
@section('title')
    @lang('Admin login')
@endsection
@section('content')

<div class="col-12 mt-5 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
    <div class="card card-primary logincard">
      <div class="card-header d-flex justify-content-between">
          <h4>@lang('Admin Login')</h4>
        </div>

      <div class="card-body">
          @if(session()->has('error'))
            <div class="my-2 text-center creds  p-2">
              <span class="text-danger  mt-2">{{ session('error') }}</span>
            </div>
         @endif
        <form method="POST" action="" class="needs-validation">
            @csrf
                <div class="form-group">
                    <label for="email">@lang('Email')</label>
                    <input id="email" type="email" class="form-control  @error('email') is-invalid  @enderror" name="email" placeholder="Enter Email" tabindex="1" required>
                    @error('email')
                     <span class="text-danger mt-2">{{ $message }}</span>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="password" class="control-label">@lang('Password')</label>
                    <input id="password" type="password" class="form-control @error('password') is-invalid  @enderror" placeholder="Enter Password" name="password" tabindex="2">
                    @error('password')
                        <span class="text-danger mt-2">{{ $message }}</span>
                    @enderror
                </div>

                <div class="form-group text-right">
                <a href="{{route('admin.forgot.password')}}" class="float-left mt-3">
                    @lang('Forgot Password')?
                </a>
                <button type="submit" class="btn btn-primary btn-lg btn-icon icon-right" tabindex="4">
                    @lang('Login')
                </button>
                </div>
            </form>
      </div>
    </div>

  </div>

@endsection
