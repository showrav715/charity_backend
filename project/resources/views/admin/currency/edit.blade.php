@extends('layouts.admin')

@section('title')
    @lang('Edit Currency')
@endsection

@section('breadcrumb')
    <section class="section">
        <div class="section-header d-flex justify-content-between">
            <h1>@lang('Edit Currency')</h1>
            <a href="{{ route('admin.currency.index') }}" class="btn btn-primary btn-sm"><i class="fas fa-backward"></i>
                @lang('Back')</a>
        </div>
    </section>
@endsection

@section('content')
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    <form action="{{ route('admin.currency.update', $currency->id) }}" method="post">
                        @csrf
                        @method('PUT')
                        <div class="row">

                            <div class="form-group col-md-12">
                                <label>@lang('Currency Code')</label>
                                <input class="form-control" type="text" name="code" required
                                    value="{{ $currency->code }}">
                            </div>
                            <div class="form-group col-md-12">
                                <label>@lang('Currency Symbol')</label>
                                <input class="form-control" type="text" name="symbol" required
                                    value="{{ $currency->symbol }}">
                            </div>

                            <div class="form-group col-md-12">
                                <label>@lang('Currency Value')</label>
                                <div class="input-group has_append">
                                    <input type="text" class="form-control" placeholder="0" name="value"
                                        value="{{ numFormat($currency->value, 2) }}" />
                                    <div class="input-group-append">
                                        <div class="input-group-text">{{ $currency->code }}</div>
                                    </div>
                                </div>
                            </div>

                            @if ($currency->default != 1)
                                <div class="form-group col-md-6">
                                    <label>@lang('Set As Default') </label>
                                    <select class="form-control" name="default" required>
                                        <option value="">--@lang('Select')--</option>
                                        <option value="1" {{ $currency->default == 1 ? 'selected' : '' }}>
                                            @lang('Yes')</option>
                                        <option value="0" {{ $currency->default == 0 ? 'selected' : '' }}>
                                            @lang('No')</option>
                                    </select>
                                </div>
                            @endif

                            <div class="form-group col-md-6">
                                <label>@lang('Status') </label>
                                <select class="form-control" name="status" required>
                                    <option value="">--@lang('Select')--</option>
                                    <option value="1" {{ $currency->status == 1 ? 'selected' : '' }}>@lang('Active')
                                    </option>
                                    <option value="0" {{ $currency->status == 0 ? 'selected' : '' }}>@lang('Inactive')
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group text-right col-md-12">
                            <button class="btn  btn-primary btn-lg" type="submit">@lang('Update')</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
