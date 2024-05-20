@extends('layouts.admin')
@section('title')
    @lang('Edit Role')
@endsection

@section('breadcrumb')
    <section class="section">
        <div class="section-header d-flex justify-content-between">
            <h1>@lang('Edit Role')</h1>
            <a href="{{ route('admin.role.index') }}" class="btn btn-primary"><i class="fas fa-backward"></i> @lang('Back')
            </a>
        </div>
    </section>
@endsection
@section('content')
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card mb-4">
                <div class="card-body">

                    <form action="{{ route('admin.role.update', $role->id) }}" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="form-group">
                            <label>@lang('Name')</label>
                            <input class="form-control" type="text" name="name" value="{{ $role->name }}">
                        </div>

                        @php
                            $data = json_decode($role->section, true);
                            if (!$data) {
                                $data = [];
                            }
                        @endphp
                        <div class="form-group">
                            <label>@lang('Permission')</label>
                            <select name="section[]" class="select2" multiple>
                                    <option value="Services"  {{ in_array('Services', $data) ? 'selected' : '' }}>@lang('Services')</option>
                                    <option value="Manage Contact" {{ in_array('Manage Contact', $data) ? 'selected' : '' }}>@lang('Manage Contact')</option>
                                    <option value="Blogs"  {{ in_array('Blogs', $data) ? 'selected' : '' }}>@lang('Blogs')</option>
                                    <option value="Manage Project"  {{ in_array('Manage Project', $data) ? 'selected' : '' }}>@lang('Manage Project')</option>
                                    <option value="Manage Pages"  {{ in_array('Manage Pages', $data) ? 'selected' : '' }}>@lang('Manage Pages')</option>
                                    <option value="General Settings"  {{ in_array('General Settings', $data) ? 'selected' : '' }}>@lang('General Settings')</option>
                                    <option value="Frontend Settings"  {{ in_array('Frontend Settings', $data) ? 'selected' : '' }}>@lang('Frontend Settings')</option>
                                    <option value="Manage Role"  {{ in_array('Manage Role', $data) ? 'selected' : '' }}>@lang('Manage Role')</option>
                                    <option value="Manage Staff"  {{ in_array('Manage Staff', $data) ? 'selected' : '' }}>@lang('Manage Staff')</option>
                                    <option value="Subscribers"  {{ in_array('Subscribers', $data) ? 'selected' : '' }}>@lang('Subscribers')</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">{{ __('Submit') }}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--Row-->
@endsection
