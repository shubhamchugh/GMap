@extends('backend.admin.layouts.app')

@section('styles')
@endsection

@section('content')

    <div class="row justify-content-between">
        <div class="col-9">
            <h1 class="h3 mb-2 text-gray-800">{{ __('backend.faq.edit-faq') }}</h1>
            <p class="mb-4">{{ __('backend.faq.edit-faq-desc') }}</p>
        </div>
        <div class="col-3 text-right">
            <a href="{{ route('admin.faqs.index') }}" class="btn btn-info btn-icon-split">
                <span class="icon text-white-50">
                  <i class="fas fa-backspace"></i>
                </span>
                <span class="text">{{ __('backend.shared.back') }}</span>
            </a>
        </div>
    </div>

    <!-- Content Row -->
    <div class="row bg-white pt-4 pl-3 pr-3 pb-4">
        <div class="col-12">
            <div class="row">
                <div class="col-12 col-md-8 col-lg-6">
                    <form method="POST" action="{{ route('admin.faqs.update', $faq->id) }}" class="">
                        @csrf
                        @method('PUT')

                        <div class="row form-group">
                            <div class="col-md-12">
                                <label for="faqs_question" class="text-black">{{ __('backend.faq.question') }}</label>
                                <input id="faqs_question" type="text" class="form-control @error('faqs_question') is-invalid @enderror" name="faqs_question" value="{{ old('faqs_question') ? old('faqs_question') : $faq->faqs_question }}" autofocus>
                                @error('faqs_question')
                                <span class="invalid-tooltip">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="row form-group">

                            <div class="col-md-12">
                                <label class="text-black" for="faqs_answer">{{ __('backend.faq.answer') }}</label>
                                <textarea rows="6" id="faqs_answer" type="text" class="form-control @error('faqs_answer') is-invalid @enderror" name="faqs_answer">{{ old('faqs_answer') ? old('faqs_answer') : $faq->faqs_answer }}</textarea>
                                @error('faqs_answer')
                                <span class="invalid-tooltip">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-md-12">
                                <label for="faqs_order" class="text-black">{{ __('backend.faq.order') }}</label>
                                <input id="faqs_order" type="number" class="form-control @error('faqs_order') is-invalid @enderror" name="faqs_order" value="{{ old('faqs_order') ? old('faqs_order') : $faq->faqs_order }}">
                                @error('faqs_order')
                                <span class="invalid-tooltip">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="row form-group justify-content-between">
                            <div class="col-8">
                                <button type="submit" class="btn btn-success py-2 px-4 text-white">
                                    {{ __('backend.shared.update') }}
                                </button>
                            </div>
                            <div class="col-4 text-right">
                                <a class="text-danger" href="#" data-toggle="modal" data-target="#deleteModal">
                                    {{ __('backend.shared.delete') }}
                                </a>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">{{ __('backend.shared.delete-confirm') }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    {{ __('backend.shared.delete-message', ['record_type' => __('backend.shared.faq'), 'record_name' => $faq->faqs_question]) }}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{{ __('backend.shared.cancel') }}</button>
                    <form action="{{ route('admin.faqs.destroy', $faq->id) }}" method="POST">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger">{{ __('backend.shared.delete') }}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('scripts')
@endsection
