@extends('layout.site')

@section('content')

@include('site.cardapio.banner')
@include('site.cardapio.menu')
@include('site.cardapio.progresso')






@push('plugins')
<script src="{{ asset('restaurante/js/main.js') }}"></script> 
@endpush

@endsection
