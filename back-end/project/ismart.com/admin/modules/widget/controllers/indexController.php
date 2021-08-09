<?php

function construct()
{
    //    echo "DÙng chung, load đầu tiên";
    load_model('index');
    load('lib', 'validation');
    load('lib', 'email-function');
}

function indexAction()
{
    
    load_view('index');
}
function add_widgetAction(){
    load_view('add_widget');
}
function menuAction(){
    load_view('menu');
}
