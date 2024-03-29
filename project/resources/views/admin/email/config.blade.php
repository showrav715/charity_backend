@extends('layouts.admin')

@section('title')
   @lang('Email Configuration')
@endsection

@section('breadcrumb')
 <section class="section">
    <div class="section-header">
        <h1>@lang('Email Configuration')</h1>
    </div>
</section>
@endsection

@section('content')
<div class="row justify-content-center mt-3">
    <div class="col-lg-12">
       <div class="card mb-4">
          <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
             <h6 class="m-0 font-weight-bold text-primary">{{ __('Email Configuration Form') }}</h6>
          </div>
          <div class="card-body">

             <form  action="{{route('admin.gs.update')}}" enctype="multipart/form-data" method="POST">
                @csrf
              
                   <input type="hidden" name="check_smtp" value="1">
                   <div class="form-group row mb-3">
                       <label class="col-sm-3 col-form-label" for="mail_type">{{ __('Mail System') }}</label>
                       <div class="col-sm-9">
                       <select class="form-control" id="mail_type" name="mail_type">
                           <option value="php_mail" {{$gs->mail_type == 'php_mail' ? 'selected' : ''}}>{{__('PHP Mail')}}</option>
                           <option value="php_mailer" {{$gs->mail_type == 'php_mailer' ? 'selected' : ''}}>{{__('SMTP Mail')}}</option>
                       </select>
                     </div>        
                   </div>        
               
                   <div class="smtp__check {{$gs->mail_type != 'php_mail' ? '' : 'd-none'}}">
                      <div class="form-group row mb-3">
                         <label for="smtp_host" class="col-sm-3 col-form-label">{{ __('SMTP Host') }}</label>
                         <div class="col-sm-9">
                            <input type="text" class="form-control" id="smtp_host" name="smtp_host" placeholder="{{ __('SMTP Host') }}" value="{{$gs->smtp_host}}">
                         </div>
                      </div>
                      <div class="form-group row mb-3">
                         <label for="smtp_port" class="col-sm-3 col-form-label">{{ __('SMTP Port') }}</label>
                         <div class="col-sm-9">
                            <input type="text" class="form-control" id="smtp_port" name="smtp_port" placeholder="{{ __('SMTP Port') }}" value="{{$gs->smtp_port}}">
                         </div>
                      </div>
                      <div class="form-group row mb-3">
                         <label for="smtp_user" class="col-sm-3 col-form-label">{{ __('SMTP Username') }}</label>
                         <div class="col-sm-9">
                            <input type="text" class="form-control" id="smtp_user" name="smtp_user" placeholder="{{ __('SMTP Username') }}" value="{{ $gs->smtp_user }}">
                         </div>
                      </div>
                      <div class="form-group row mb-3">
                         <label for="smtp_pass" class="col-sm-3 col-form-label">{{ __('SMTP Password') }}</label>
                         <div class="col-sm-9">
                            <input type="text" class="form-control" id="smtp_pass" name="smtp_pass" placeholder="{{ __('SMTP Password') }}" value="{{ $gs->smtp_pass }}">
                         </div>
                      </div>
                      <div class="form-group row mb-3">
                         <label class="col-sm-3 col-form-label" for="mail_encryption">{{ __('Mail Encryption') }}</label>
                         <div class="col-sm-9">
                         <select class="form-control" id="mail_encryption" name="mail_encryption">
                             <option value="tls" {{$gs->mail_encryption == 'tls' ? 'selected' : ''}}>{{__('TLS')}}</option>
                             <option value="ssl" {{$gs->mail_encryption == 'ssl' ? 'selected' : ''}}>{{__('SSL')}}</option>
                         </select>
                       </div>        
                     </div>
                   </div>
 
                <div class="form-group row mb-3">
                   <label for="from_email" class="col-sm-3 col-form-label">{{ __('From Email') }}</label>
                   <div class="col-sm-9">
                      <input type="text" class="form-control" id="from_email" name="from_email" placeholder="{{ __('From Email') }}" value="{{ $gs->from_email }}">
                      <code>@lang('If mail type smtp, please make sure username and from email is same.')</code>
                   </div>
                </div>
                <div class="form-group row mb-3">
                   <label for="from_name" class="col-sm-3 col-form-label">{{ __('From Name') }}</label>
                   <div class="col-sm-9">
                      <input type="text" class="form-control" id="from_name" name="from_name" placeholder="{{ __('From Name') }}" value="{{$gs->from_name}}">
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
      $('#mail_type').on('change', function() {
        if ($(this).val() == 'php_mail') {
          $('.smtp__check').addClass('d-none');
        } else {
          $('.smtp__check').removeClass('d-none');
        }
      });
    </script>
@endpush