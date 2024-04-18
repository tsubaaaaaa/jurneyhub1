// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery3
//= require jquery_ujs
//= require_tree 

//require("turbolinks").start()
require("jquery")

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "./top"
import "./index"

Rails.start()
//Turbolinks.start()
ActiveStorage.start()

/*
$(window).on('load scroll', function () { //スクロール及び読み込んだら実行
    $('.gallery li').each(function () {
        var elemOffset = $(this).offset().top; //指定した要素の位置 の変数
        var scrollPos = $(window).scrollTop(); //スクロール量を取得する の変数
        var wh = $(window).height()* 0.8; //ウィンドウの高さを取得する(画面を80％スクロールしたとき) の変数
        if (scrollPos > elemOffset - wh) { //画面の80％スクロールすると要素にactiveクラスをつける
            $(this).addClass("active");
        }
    });
});
*/
