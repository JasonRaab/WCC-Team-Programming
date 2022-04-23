<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
html {
	background-image:
		url(https://paliorestaurant.com/wp-content/uploads/2021/08/wood.jpg);
	background-repeat: no-repeat;
	background-position: center;
	background-attachment: fixed;
	background-size: cover
}
body:not(.template-slider) #Header_wrapper {
	background-image:
		url(https://paliorestaurant.com/wp-content/uploads/2021/08/palio-header.png);
	background-repeat: no-repeat;
	background-position: center bottom
}
#Subheader {
	background-image:
		url(https://paliorestaurant.reslogic.us/wp-content/uploads/2021/08/palio-header.png);
	background-repeat: no-repeat;
	background-position: center top
}
html {
	background-color: #FCFCFC;
}
#Wrapper, #Content {
	background-color: #FCFCFC;
}
body:not(.template-slider) #Header {
	min-height: 0px;
}
body.header-below:not(.template-slider) #Header {
	padding-top: 0px;
}
#Subheader {
	padding: 100px 0;
}
#Footer .widgets_wrapper {
	padding: 40px 0 30px;
}
body, button, span.date_label, .timeline_items li h3 span, input[type="submit"],
	input[type="reset"], input[type="button"], input[type="text"], input[type="password"],
	input[type="tel"], input[type="email"], textarea, select, .offer_li .title h3
	{
	font-family: "Roboto", Helvetica, Arial, sans-serif;
}
#menu>ul>li>a, a.action_button, #overlay-menu ul li a {
	font-family: "Roboto", Helvetica, Arial, sans-serif;
}
#Subheader .title {
	font-family: "Roboto", Helvetica, Arial, sans-serif;
}
h1, h2, h3, h4, .text-logo #logo {
	font-family: "Josefin Sans", Helvetica, Arial, sans-serif;
}
h5, h6 {
	font-family: "Josefin Sans", Helvetica, Arial, sans-serif;
}
blockquote {
	font-family: "Roboto", Helvetica, Arial, sans-serif;
}
.chart_box .chart .num, .counter .desc_wrapper .number-wrapper,
	.how_it_works .image .number, .pricing-box .plan-header .price,
	.quick_fact .number-wrapper, .woocommerce .product div.entry-summary .price
	{
	font-family: "Roboto", Helvetica, Arial, sans-serif;
}
body {
	font-size: 14px;
	line-height: 25px;
	font-weight: 400;
	letter-spacing: 0px;
}
.big {
	font-size: 16px;
	line-height: 28px;
	font-weight: 400;
	letter-spacing: 0px;
}
#menu>ul>li>a, a.action_button, #overlay-menu ul li a {
	font-size: 14px;
	font-weight: 500;
	letter-spacing: 1px;
}
#overlay-menu ul li a {
	line-height: 21px;
}
#Subheader .title {
	font-size: 65px;
	line-height: 65px;
	font-weight: 900;
	letter-spacing: 0px;
}
h1, .text-logo #logo {
	font-size: 48px;
	line-height: 50px;
	font-weight: 400;
	letter-spacing: 0px;
	font-style: italic;
}
h2 {
	font-size: 40px;
	line-height: 42px;
	font-weight: 300;
	letter-spacing: 0px;
}
h3, .woocommerce ul.products li.product h3 {
	font-size: 30px;
	line-height: 32px;
	font-weight: 300;
	letter-spacing: 0px;
}
h4 {
	font-size: 21px;
	line-height: 25px;
	font-weight: 300;
	letter-spacing: 0px;
}
h5 {
	font-size: 15px;
	line-height: 25px;
	font-weight: 300;
	letter-spacing: 0px;
}
h6 {
	font-size: 14px;
	line-height: 25px;
	font-weight: 300;
	letter-spacing: 0px;
}
#Intro .intro-title {
	font-size: 70px;
	line-height: 70px;
	font-weight: 400;
	letter-spacing: 0px;
}
@media only screen and (min-width: 768px) and (max-width: 959px) {
	body {
		font-size: 13px;
		line-height: 21px;
		letter-spacing: 0px;
	}
	.big {
		font-size: 14px;
		line-height: 24px;
		letter-spacing: 0px;
	}
	#menu>ul>li>a, a.action_button, #overlay-menu ul li a {
		font-size: 13px;
		letter-spacing: 1px;
	}
	#overlay-menu ul li a {
		line-height: 19.5px;
		letter-spacing: 1px;
	}
	#Subheader .title {
		font-size: 55px;
		line-height: 55px;
		letter-spacing: 0px;
	}
	h1, .text-logo #logo {
		font-size: 41px;
		line-height: 43px;
		letter-spacing: 0px;
	}
	h2 {
		font-size: 34px;
		line-height: 36px;
		letter-spacing: 0px;
	}
	h3, .woocommerce ul.products li.product h3 {
		font-size: 26px;
		line-height: 27px;
		letter-spacing: 0px;
	}
	h4 {
		font-size: 18px;
		line-height: 21px;
		letter-spacing: 0px;
	}
	h5 {
		font-size: 13px;
		line-height: 21px;
		letter-spacing: 0px;
	}
	h6 {
		font-size: 13px;
		line-height: 21px;
		letter-spacing: 0px;
	}
	#Intro .intro-title {
		font-size: 60px;
		line-height: 60px;
		letter-spacing: 0px;
	}
	blockquote {
		font-size: 15px;
	}
	.chart_box .chart .num {
		font-size: 45px;
		line-height: 45px;
	}
	.counter .desc_wrapper .number-wrapper {
		font-size: 45px;
		line-height: 45px;
	}
	.counter .desc_wrapper .title {
		font-size: 14px;
		line-height: 18px;
	}
	.faq .question .title {
		font-size: 14px;
	}
	.fancy_heading .title {
		font-size: 38px;
		line-height: 38px;
	}
	.offer .offer_li .desc_wrapper .title h3 {
		font-size: 32px;
		line-height: 32px;
	}
	.offer_thumb_ul li.offer_thumb_li .desc_wrapper .title h3 {
		font-size: 32px;
		line-height: 32px;
	}
	.pricing-box .plan-header h2 {
		font-size: 27px;
		line-height: 27px;
	}
	.pricing-box .plan-header .price>span {
		font-size: 40px;
		line-height: 40px;
	}
	.pricing-box .plan-header .price sup.currency {
		font-size: 18px;
		line-height: 18px;
	}
	.pricing-box .plan-header .price sup.period {
		font-size: 14px;
		line-height: 14px;
	}
	.quick_fact .number {
		font-size: 80px;
		line-height: 80px;
	}
	.trailer_box .desc h2 {
		font-size: 27px;
		line-height: 27px;
	}
	.widget>h3 {
		font-size: 17px;
		line-height: 20px;
	}
}
@media only screen and (min-width: 480px) and (max-width: 767px) {
	body {
		font-size: 13px;
		line-height: 19px;
		letter-spacing: 0px;
	}
	.big {
		font-size: 13px;
		line-height: 21px;
		letter-spacing: 0px;
	}
	#menu>ul>li>a, a.action_button, #overlay-menu ul li a {
		font-size: 13px;
		letter-spacing: 1px;
	}
	#overlay-menu ul li a {
		line-height: 19.5px;
		letter-spacing: 1px;
	}
	#Subheader .title {
		font-size: 49px;
		line-height: 49px;
		letter-spacing: 0px;
	}
	h1, .text-logo #logo {
		font-size: 36px;
		line-height: 38px;
		letter-spacing: 0px;
	}
	h2 {
		font-size: 30px;
		line-height: 32px;
		letter-spacing: 0px;
	}
	h3, .woocommerce ul.products li.product h3 {
		font-size: 23px;
		line-height: 24px;
		letter-spacing: 0px;
	}
	h4 {
		font-size: 16px;
		line-height: 19px;
		letter-spacing: 0px;
	}
	h5 {
		font-size: 13px;
		line-height: 19px;
		letter-spacing: 0px;
	}
	h6 {
		font-size: 13px;
		line-height: 19px;
		letter-spacing: 0px;
	}
	#Intro .intro-title {
		font-size: 53px;
		line-height: 53px;
		letter-spacing: 0px;
	}
	blockquote {
		font-size: 14px;
	}
	.chart_box .chart .num {
		font-size: 40px;
		line-height: 40px;
	}
	.counter .desc_wrapper .number-wrapper {
		font-size: 40px;
		line-height: 40px;
	}
	.counter .desc_wrapper .title {
		font-size: 13px;
		line-height: 16px;
	}
	.faq .question .title {
		font-size: 13px;
	}
	.fancy_heading .title {
		font-size: 34px;
		line-height: 34px;
	}
	.offer .offer_li .desc_wrapper .title h3 {
		font-size: 28px;
		line-height: 28px;
	}
	.offer_thumb_ul li.offer_thumb_li .desc_wrapper .title h3 {
		font-size: 28px;
		line-height: 28px;
	}
	.pricing-box .plan-header h2 {
		font-size: 24px;
		line-height: 24px;
	}
	.pricing-box .plan-header .price>span {
		font-size: 34px;
		line-height: 34px;
	}
	.pricing-box .plan-header .price sup.currency {
		font-size: 16px;
		line-height: 16px;
	}
	.pricing-box .plan-header .price sup.period {
		font-size: 13px;
		line-height: 13px;
	}
	.quick_fact .number {
		font-size: 70px;
		line-height: 70px;
	}
	.trailer_box .desc h2 {
		font-size: 24px;
		line-height: 24px;
	}
	.widget>h3 {
		font-size: 16px;
		line-height: 19px;
	}
}
@media only screen and (max-width: 479px) {
	body {
		font-size: 13px;
		line-height: 19px;
		letter-spacing: 0px;
	}
	.big {
		font-size: 13px;
		line-height: 19px;
		letter-spacing: 0px;
	}
	#menu>ul>li>a, a.action_button, #overlay-menu ul li a {
		font-size: 13px;
		letter-spacing: 1px;
	}
	#overlay-menu ul li a {
		line-height: 19.5px;
		letter-spacing: 1px;
	}
	#Subheader .title {
		font-size: 39px;
		line-height: 39px;
		letter-spacing: 0px;
	}
	h1, .text-logo #logo {
		font-size: 29px;
		line-height: 30px;
		letter-spacing: 0px;
	}
	h2 {
		font-size: 24px;
		line-height: 25px;
		letter-spacing: 0px;
	}
	h3, .woocommerce ul.products li.product h3 {
		font-size: 18px;
		line-height: 19px;
		letter-spacing: 0px;
	}
	h4 {
		font-size: 13px;
		line-height: 19px;
		letter-spacing: 0px;
	}
	h5 {
		font-size: 13px;
		line-height: 19px;
		letter-spacing: 0px;
	}
	h6 {
		font-size: 13px;
		line-height: 19px;
		letter-spacing: 0px;
	}
	#Intro .intro-title {
		font-size: 42px;
		line-height: 42px;
		letter-spacing: 0px;
	}
	blockquote {
		font-size: 13px;
	}
	.chart_box .chart .num {
		font-size: 35px;
		line-height: 35px;
	}
	.counter .desc_wrapper .number-wrapper {
		font-size: 35px;
		line-height: 35px;
	}
	.counter .desc_wrapper .title {
		font-size: 13px;
		line-height: 26px;
	}
	.faq .question .title {
		font-size: 13px;
	}
	.fancy_heading .title {
		font-size: 30px;
		line-height: 30px;
	}
	.offer .offer_li .desc_wrapper .title h3 {
		font-size: 26px;
		line-height: 26px;
	}
	.offer_thumb_ul li.offer_thumb_li .desc_wrapper .title h3 {
		font-size: 26px;
		line-height: 26px;
	}
	.pricing-box .plan-header h2 {
		font-size: 21px;
		line-height: 21px;
	}
	.pricing-box .plan-header .price>span {
		font-size: 32px;
		line-height: 32px;
	}
	.pricing-box .plan-header .price sup.currency {
		font-size: 14px;
		line-height: 14px;
	}
	.pricing-box .plan-header .price sup.period {
		font-size: 13px;
		line-height: 13px;
	}
	.quick_fact .number {
		font-size: 60px;
		line-height: 60px;
	}
	.trailer_box .desc h2 {
		font-size: 21px;
		line-height: 21px;
	}
	.widget>h3 {
		font-size: 15px;
		line-height: 18px;
	}
}
.with_aside .sidebar.columns {
	width: 23%;
}
.with_aside .sections_group {
	width: 77%;
}
.aside_both .sidebar.columns {
	width: 18%;
}
.aside_both .sidebar.sidebar-1 {
	margin-left: -82%;
}
.aside_both .sections_group {
	width: 64%;
	margin-left: 18%;
}
@media only screen and (min-width:1240px) {
	#Wrapper, .with_aside .content_wrapper {
		max-width: 1240px;
	}
	.section_wrapper, .container {
		max-width: 1220px;
	}
	.layout-boxed.header-boxed #Top_bar.is-sticky {
		max-width: 1240px;
	}
}
@media only screen and (max-width: 767px) {
	.section_wrapper, .container, .four.columns .widget-area {
		max-width: 700px !important;
	}
}
.button-default .button, .button-flat .button, .button-round .button {
	background-color: #ffffff;
	color: #ffffff;
}
.button-stroke .button {
	border-color: #ffffff;
	color: #ffffff;
}
.button-stroke .button:hover {
	background-color: #ffffff;
	color: #fff;
}
.button-default .button_theme, .button-default button, .button-default input[type="button"],
	.button-default input[type="reset"], .button-default input[type="submit"],
	.button-flat .button_theme, .button-flat button, .button-flat input[type="button"],
	.button-flat input[type="reset"], .button-flat input[type="submit"],
	.button-round .button_theme, .button-round button, .button-round input[type="button"],
	.button-round input[type="reset"], .button-round input[type="submit"],
	.woocommerce #respond input#submit, .woocommerce a.button:not(.default),
	.woocommerce button.button, .woocommerce input.button, .woocommerce #respond input#submit:hover,
	.woocommerce a.button:hover, .woocommerce button.button:hover,
	.woocommerce input.button:hover {
	color: #000000;
}
.button-stroke .button_theme:hover, .button-stroke button:hover,
	.button-stroke input[type="submit"]:hover, .button-stroke input[type="reset"]:hover,
	.button-stroke input[type="button"]:hover, .button-stroke .woocommerce #respond input#submit:hover,
	.button-stroke .woocommerce a.button:not(.default):hover,
	.button-stroke .woocommerce button.button:hover, .button-stroke.woocommerce input.button:hover
	{
	color: #000000 !important;
}
.button-stroke .button_theme:hover .button_icon i {
	color: #000000 !important;
}
.button-default .single_add_to_cart_button, .button-flat .single_add_to_cart_button,
	.button-round .single_add_to_cart_button, .button-default .woocommerce .button:disabled,
	.button-flat .woocommerce .button:disabled, .button-round .woocommerce .button:disabled,
	.button-default .woocommerce .button.alt .button-flat .woocommerce .button.alt,
	.button-round .woocommerce .button.alt, .button-default a.remove,
	.button-flat a.remove, .button-round a.remove {
	color: #000000 !important;
}
.action_button, .action_button:hover {
	background-color: #a3680f;
	color: #000000;
}
.button-stroke a.action_button {
	border-color: #a3680f;
}
.button-stroke a.action_button:hover {
	background-color: #a3680f !important;
}
.footer_button {
	color: #65666C !important;
	background-color: transparent;
	box-shadow: none !important;
}
.footer_button:after {
	display: none !important;
}
.button-custom .button, .button-custom .action_button, .button-custom .footer_button,
	.button-custom button, .button-custom input[type="button"],
	.button-custom input[type="reset"], .button-custom input[type="submit"],
	.button-custom .woocommerce #respond input#submit, .button-custom .woocommerce a.button,
	.button-custom .woocommerce button.button, .button-custom .woocommerce input.button
	{
	font-family: Arial;
	font-size: 14px;
	line-height: 14px;
	font-weight: 400;
	letter-spacing: 0px;
	padding: 12px 20px 12px 20px;
	border-width: 0px;
	border-radius: 0px;
}
.button-custom .button {
	color: #626262;
	background-color: #dbdddf;
	border-color: transparent;
}
.button-custom .button:hover {
	color: #626262;
	background-color: #d3d3d3;
	border-color: transparent;
}
.button-custom .button_theme, .button-custom button, .button-custom input[type="button"],
	.button-custom input[type="reset"], .button-custom input[type="submit"],
	.button-custom .woocommerce #respond input#submit, .button-custom .woocommerce a.button:not(.default),
	.button-custom .woocommerce button.button, .button-custom .woocommerce input.button
	{
	color: #ffffff;
	background-color: #0095eb;
	border-color: transparent;
}
.button-custom .button_theme:hover, .button-custom button:hover,
	.button-custom input[type="button"]:hover, .button-custom input[type="reset"]:hover,
	.button-custom input[type="submit"]:hover, .button-custom .woocommerce #respond input#submit:hover,
	.button-custom .woocommerce a.button:not(.default):hover,
	.button-custom .woocommerce button.button:hover, .button-custom .woocommerce input.button:hover
	{
	color: #ffffff;
	background-color: #007cc3;
	border-color: transparent;
}
.button-custom .action_button {
	color: #626262;
	background-color: #dbdddf;
	border-color: transparent;
}
.button-custom .action_button:hover {
	color: #626262;
	background-color: #d3d3d3;
	border-color: transparent;
}
.button-custom .single_add_to_cart_button, .button-custom .woocommerce .button:disabled,
	.button-custom .woocommerce .button.alt, .button-custom a.remove {
	line-height: 14px !important;
	padding: 12px 20px 12px 20px !important;
	color: #ffffff !important;
	background-color: #0095eb !important;
}
.button-custom .single_add_to_cart_button:hover, .button-custom .woocommerce .button:disabled:hover,
	.button-custom .woocommerce .button.alt:hover, .button-custom a.remove:hover
	{
	color: #ffffff !important;
	background-color: #007cc3 !important;
}
#Top_bar #logo, .header-fixed #Top_bar #logo, .header-plain #Top_bar #logo,
	.header-transparent #Top_bar #logo {
	height: 60px;
	line-height: 60px;
	padding: 0px 0;
}
.logo-overflow #Top_bar:not(.is-sticky) .logo {
	height: 60px;
}
#Top_bar .menu>li>a {
	padding: 0px 0;
}
.menu-highlight:not(.header-creative) #Top_bar .menu>li>a {
	margin: 5px 0;
}
.header-plain:not(.menu-highlight) #Top_bar .menu>li>a span:not(.description)
	{
	line-height: 60px;
}
.header-fixed #Top_bar .menu>li>a {
	padding: 15px 0;
}
.logo-overflow #Top_bar.is-sticky #logo {
	padding: 0 !important;
}
.twentytwenty-before-label::before {
	content: "Before"
}
.twentytwenty-after-label::before {
	content: "After"
}
#Side_slide {
	right: -250px;
	width: 250px;
}
#Side_slide.left {
	left: -250px;
}
.blog-teaser li .desc-wrapper .desc {
	background-position-y: -1px;
}
@media only screen and ( max-width: 767px ) {
}
@media only screen and (min-width: 1240px) {
	body:not(.header-simple) #Top_bar #menu {
		display: block !important
	}
	.tr-menu #Top_bar #menu {
		background: none !important
	}
	#Top_bar .menu>li>ul.mfn-megamenu {
		width: 984px
	}
	#Top_bar .menu>li>ul.mfn-megamenu>li {
		float: left
	}
	#Top_bar .menu>li>ul.mfn-megamenu>li.mfn-megamenu-cols-1 {
		width: 100%
	}
	#Top_bar .menu>li>ul.mfn-megamenu>li.mfn-megamenu-cols-2 {
		width: 50%
	}
	#Top_bar .menu>li>ul.mfn-megamenu>li.mfn-megamenu-cols-3 {
		width: 33.33%
	}
	#Top_bar .menu>li>ul.mfn-megamenu>li.mfn-megamenu-cols-4 {
		width: 25%
	}
	#Top_bar .menu>li>ul.mfn-megamenu>li.mfn-megamenu-cols-5 {
		width: 20%
	}
	#Top_bar .menu>li>ul.mfn-megamenu>li.mfn-megamenu-cols-6 {
		width: 16.66%
	}
	#Top_bar .menu>li>ul.mfn-megamenu>li>ul {
		display: block !important;
		position: inherit;
		left: auto;
		top: auto;
		border-width: 0 1px 0 0
	}
	#Top_bar .menu>li>ul.mfn-megamenu>li:last-child>ul {
		border: 0
	}
	#Top_bar .menu>li>ul.mfn-megamenu>li>ul li {
		width: auto
	}
	#Top_bar .menu>li>ul.mfn-megamenu a.mfn-megamenu-title {
		text-transform: uppercase;
		font-weight: 400;
		background: none
	}
	#Top_bar .menu>li>ul.mfn-megamenu a .menu-arrow {
		display: none
	}
	.menuo-right #Top_bar .menu>li>ul.mfn-megamenu {
		left: auto;
		right: 0
	}
	.menuo-right #Top_bar .menu>li>ul.mfn-megamenu-bg {
		box-sizing: border-box
	}
	#Top_bar .menu>li>ul.mfn-megamenu-bg {
		padding: 20px 166px 20px 20px;
		background-repeat: no-repeat;
		background-position: right bottom
	}
	.rtl #Top_bar .menu>li>ul.mfn-megamenu-bg {
		padding-left: 166px;
		padding-right: 20px;
		background-position: left bottom
	}
	#Top_bar .menu>li>ul.mfn-megamenu-bg>li {
		background: none
	}
	#Top_bar .menu>li>ul.mfn-megamenu-bg>li a {
		border: none
	}
	#Top_bar .menu>li>ul.mfn-megamenu-bg>li>ul {
		background: none !important;
		-webkit-box-shadow: 0 0 0 0;
		-moz-box-shadow: 0 0 0 0;
		box-shadow: 0 0 0 0
	}
	.mm-vertical #Top_bar .container {
		position: relative;
	}
	.mm-vertical #Top_bar .top_bar_left {
		position: static;
	}
	.mm-vertical #Top_bar .menu>li ul {
		box-shadow: 0 0 0 0 transparent !important;
		background-image: none;
	}
	.mm-vertical #Top_bar .menu>li>ul.mfn-megamenu {
		width: 98% !important;
		margin: 0 1%;
		padding: 20px 0;
	}
	.mm-vertical.header-plain #Top_bar .menu>li>ul.mfn-megamenu {
		width: 100% !important;
		margin: 0;
	}
	.mm-vertical #Top_bar .menu>li>ul.mfn-megamenu>li {
		display: table-cell;
		float: none !important;
		width: 10%;
		padding: 0 15px;
		border-right: 1px solid rgba(0, 0, 0, 0.05);
	}
	.mm-vertical #Top_bar .menu>li>ul.mfn-megamenu>li:last-child {
		border-right-width: 0
	}
	.mm-vertical #Top_bar .menu>li>ul.mfn-megamenu>li.hide-border {
		border-right-width: 0
	}
	.mm-vertical #Top_bar .menu>li>ul.mfn-megamenu>li a {
		border-bottom-width: 0;
		padding: 9px 15px;
		line-height: 120%;
	}
	.mm-vertical #Top_bar .menu>li>ul.mfn-megamenu a.mfn-megamenu-title {
		font-weight: 700;
	}
	.rtl .mm-vertical #Top_bar .menu>li>ul.mfn-megamenu>li:first-child {
		border-right-width: 0
	}
	.rtl .mm-vertical #Top_bar .menu>li>ul.mfn-megamenu>li:last-child {
		border-right-width: 1px
	}
	.header-plain:not(.menuo-right) #Header .top_bar_left {
		width: auto !important
	}
	.header-stack.header-center #Top_bar #menu {
		display: inline-block !important
	}
	.header-simple #Top_bar #menu {
		display: none;
		height: auto;
		width: 300px;
		bottom: auto;
		top: 100%;
		right: 1px;
		position: absolute;
		margin: 0
	}
	.header-simple #Header a.responsive-menu-toggle {
		display: block;
		right: 10px
	}
	.header-simple #Top_bar #menu>ul {
		width: 100%;
		float: left
	}
	.header-simple #Top_bar #menu ul li {
		width: 100%;
		padding-bottom: 0;
		border-right: 0;
		position: relative
	}
	.header-simple #Top_bar #menu ul li a {
		padding: 0 20px;
		margin: 0;
		display: block;
		height: auto;
		line-height: normal;
		border: none
	}
	.header-simple #Top_bar #menu ul li a:after {
		display: none
	}
	.header-simple #Top_bar #menu ul li a span {
		border: none;
		line-height: 44px;
		display: inline;
		padding: 0
	}
	.header-simple #Top_bar #menu ul li.submenu .menu-toggle {
		display: block;
		position: absolute;
		right: 0;
		top: 0;
		width: 44px;
		height: 44px;
		line-height: 44px;
		font-size: 30px;
		font-weight: 300;
		text-align: center;
		cursor: pointer;
		color: #444;
		opacity: 0.33;
	}
	.header-simple #Top_bar #menu ul li.submenu .menu-toggle:after {
		content: "+"
	}
	.header-simple #Top_bar #menu ul li.hover>.menu-toggle:after {
		content: "-"
	}
	.header-simple #Top_bar #menu ul li.hover a {
		border-bottom: 0
	}
	.header-simple #Top_bar #menu ul.mfn-megamenu li .menu-toggle {
		display: none
	}
	.header-simple #Top_bar #menu ul li ul {
		position: relative !important;
		left: 0 !important;
		top: 0;
		padding: 0;
		margin: 0 !important;
		width: auto !important;
		background-image: none
	}
	.header-simple #Top_bar #menu ul li ul li {
		width: 100% !important;
		display: block;
		padding: 0;
	}
	.header-simple #Top_bar #menu ul li ul li a {
		padding: 0 20px 0 30px
	}
	.header-simple #Top_bar #menu ul li ul li a .menu-arrow {
		display: none
	}
	.header-simple #Top_bar #menu ul li ul li a span {
		padding: 0
	}
	.header-simple #Top_bar #menu ul li ul li a span:after {
		display: none !important
	}
	.header-simple #Top_bar .menu>li>ul.mfn-megamenu a.mfn-megamenu-title {
		text-transform: uppercase;
		font-weight: 400
	}
	.header-simple #Top_bar .menu>li>ul.mfn-megamenu>li>ul {
		display: block !important;
		position: inherit;
		left: auto;
		top: auto
	}
	.header-simple #Top_bar #menu ul li ul li ul {
		border-left: 0 !important;
		padding: 0;
		top: 0
	}
	.header-simple #Top_bar #menu ul li ul li ul li a {
		padding: 0 20px 0 40px
	}
	.rtl.header-simple #Top_bar #menu {
		left: 1px;
		right: auto
	}
	.rtl.header-simple #Top_bar a.responsive-menu-toggle {
		left: 10px;
		right: auto
	}
	.rtl.header-simple #Top_bar #menu ul li.submenu .menu-toggle {
		left: 0;
		right: auto
	}
	.rtl.header-simple #Top_bar #menu ul li ul {
		left: auto !important;
		right: 0 !important
	}
	.rtl.header-simple #Top_bar #menu ul li ul li a {
		padding: 0 30px 0 20px
	}
	.rtl.header-simple #Top_bar #menu ul li ul li ul li a {
		padding: 0 40px 0 20px
	}
	.menu-highlight #Top_bar .menu>li {
		margin: 0 2px
	}
	.menu-highlight:not(.header-creative) #Top_bar .menu>li>a {
		margin: 20px 0;
		padding: 0;
		-webkit-border-radius: 5px;
		border-radius: 5px
	}
	.menu-highlight #Top_bar .menu>li>a:after {
		display: none
	}
	.menu-highlight #Top_bar .menu>li>a span:not(.description) {
		line-height: 50px
	}
	.menu-highlight #Top_bar .menu>li>a span.description {
		display: none
	}
	.menu-highlight.header-stack #Top_bar .menu>li>a {
		margin: 10px 0 !important
	}
	.menu-highlight.header-stack #Top_bar .menu>li>a span:not(.description)
		{
		line-height: 40px
	}
	.menu-highlight.header-transparent #Top_bar .menu>li>a {
		margin: 5px 0
	}
	.menu-highlight.header-simple #Top_bar #menu ul li, .menu-highlight.header-creative #Top_bar #menu ul li
		{
		margin: 0
	}
	.menu-highlight.header-simple #Top_bar #menu ul li>a, .menu-highlight.header-creative #Top_bar #menu ul li>a
		{
		-webkit-border-radius: 0;
		border-radius: 0
	}
	.menu-highlight:not(.header-fixed):not(.header-simple) #Top_bar.is-sticky .menu>li>a
		{
		margin: 10px 0 !important;
		padding: 5px 0 !important
	}
	.menu-highlight:not(.header-fixed):not(.header-simple) #Top_bar.is-sticky .menu>li>a span
		{
		line-height: 30px !important
	}
	.header-modern.menu-highlight.menuo-right .menu_wrapper {
		margin-right: 20px
	}
	.menu-line-below #Top_bar .menu>li>a:after {
		top: auto;
		bottom: -4px
	}
	.menu-line-below #Top_bar.is-sticky .menu>li>a:after {
		top: auto;
		bottom: -4px
	}
	.menu-line-below-80 #Top_bar:not(.is-sticky) .menu>li>a:after {
		height: 4px;
		left: 10%;
		top: 50%;
		margin-top: 20px;
		width: 80%
	}
	.menu-line-below-80-1 #Top_bar:not(.is-sticky) .menu>li>a:after {
		height: 1px;
		left: 10%;
		top: 50%;
		margin-top: 20px;
		width: 80%
	}
	.menu-link-color #Top_bar .menu>li>a:after {
		display: none !important
	}
	.menu-arrow-top #Top_bar .menu>li>a:after {
		background: none repeat scroll 0 0 rgba(0, 0, 0, 0) !important;
		border-color: #ccc transparent transparent;
		border-style: solid;
		border-width: 7px 7px 0;
		display: block;
		height: 0;
		left: 50%;
		margin-left: -7px;
		top: 0 !important;
		width: 0
	}
	.menu-arrow-top #Top_bar.is-sticky .menu>li>a:after {
		top: 0 !important
	}
	.menu-arrow-bottom #Top_bar .menu>li>a:after {
		background: none !important;
		border-color: transparent transparent #ccc;
		border-style: solid;
		border-width: 0 7px 7px;
		display: block;
		height: 0;
		left: 50%;
		margin-left: -7px;
		top: auto;
		bottom: 0;
		width: 0
	}
	.menu-arrow-bottom #Top_bar.is-sticky .menu>li>a:after {
		top: auto;
		bottom: 0
	}
	.menuo-no-borders #Top_bar .menu>li>a span {
		border-width: 0 !important
	}
	.menuo-no-borders #Header_creative #Top_bar .menu>li>a span {
		border-bottom-width: 0
	}
	.menuo-no-borders.header-plain #Top_bar a#header_cart, .menuo-no-borders.header-plain #Top_bar a#search_button,
		.menuo-no-borders.header-plain #Top_bar .wpml-languages,
		.menuo-no-borders.header-plain #Top_bar a.action_button {
		border-width: 0
	}
	.menuo-right #Top_bar .menu_wrapper {
		float: right
	}
	.menuo-right.header-stack:not(.header-center) #Top_bar .menu_wrapper {
		margin-right: 150px
	}
	body.header-creative {
		padding-left: 50px
	}
	body.header-creative.header-open {
		padding-left: 250px
	}
	body.error404, body.under-construction, body.template-blank, body.under-construction.header-rtl.header-creative.header-open
		{
		padding-left: 0 !important;
		padding-right: 0 !important
	}
	.header-creative.footer-fixed #Footer, .header-creative.footer-sliding #Footer,
		.header-creative.footer-stick #Footer.is-sticky {
		box-sizing: border-box;
		padding-left: 50px;
	}
	.header-open.footer-fixed #Footer, .header-open.footer-sliding #Footer,
		.header-creative.footer-stick #Footer.is-sticky {
		padding-left: 250px;
	}
	.header-rtl.header-creative.footer-fixed #Footer, .header-rtl.header-creative.footer-sliding #Footer,
		.header-rtl.header-creative.footer-stick #Footer.is-sticky {
		padding-left: 0;
		padding-right: 50px;
	}
	.header-rtl.header-open.footer-fixed #Footer, .header-rtl.header-open.footer-sliding #Footer,
		.header-rtl.header-creative.footer-stick #Footer.is-sticky {
		padding-right: 250px;
	}
	#Header_creative {
		background-color: #fff;
		position: fixed;
		width: 250px;
		height: 100%;
		left: -200px;
		top: 0;
		z-index: 9002;
		-webkit-box-shadow: 2px 0 4px 2px rgba(0, 0, 0, .15);
		box-shadow: 2px 0 4px 2px rgba(0, 0, 0, .15)
	}
	#Header_creative .container {
		width: 100%
	}
	#Header_creative .creative-wrapper {
		opacity: 0;
		margin-right: 50px
	}
	#Header_creative a.creative-menu-toggle {
		display: block;
		width: 34px;
		height: 34px;
		line-height: 34px;
		font-size: 22px;
		text-align: center;
		position: absolute;
		top: 10px;
		right: 8px;
		border-radius: 3px
	}
	.admin-bar #Header_creative a.creative-menu-toggle {
		top: 42px
	}
	#Header_creative #Top_bar {
		position: static;
		width: 100%
	}
	#Header_creative #Top_bar .top_bar_left {
		width: 100% !important;
		float: none
	}
	#Header_creative #Top_bar .logo {
		float: none;
		text-align: center;
		margin: 15px 0
	}
	#Header_creative #Top_bar #menu {
		background-color: transparent
	}
	#Header_creative #Top_bar .menu_wrapper {
		float: none;
		margin: 0 0 30px
	}
	#Header_creative #Top_bar .menu>li {
		width: 100%;
		float: none;
		position: relative
	}
	#Header_creative #Top_bar .menu>li>a {
		padding: 0;
		text-align: center
	}
	#Header_creative #Top_bar .menu>li>a:after {
		display: none
	}
	#Header_creative #Top_bar .menu>li>a span {
		border-right: 0;
		border-bottom-width: 1px;
		line-height: 38px
	}
	#Header_creative #Top_bar .menu li ul {
		left: 100%;
		right: auto;
		top: 0;
		box-shadow: 2px 2px 2px 0 rgba(0, 0, 0, 0.03);
		-webkit-box-shadow: 2px 2px 2px 0 rgba(0, 0, 0, 0.03)
	}
	#Header_creative #Top_bar .menu>li>ul.mfn-megamenu {
		margin: 0;
		width: 700px !important;
	}
	#Header_creative #Top_bar .menu>li>ul.mfn-megamenu>li>ul {
		left: 0
	}
	#Header_creative #Top_bar .menu li ul li a {
		padding-top: 9px;
		padding-bottom: 8px
	}
	#Header_creative #Top_bar .menu li ul li ul {
		top: 0
	}
	#Header_creative #Top_bar .menu>li>a span.description {
		display: block;
		font-size: 13px;
		line-height: 28px !important;
		clear: both
	}
	#Header_creative #Top_bar .top_bar_right {
		width: 100% !important;
		float: none;
		height: auto;
		margin-bottom: 35px;
		text-align: center;
		padding: 0 20px;
		top: 0;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		box-sizing: border-box
	}
	#Header_creative #Top_bar .top_bar_right:before {
		content: none
	}
	#Header_creative #Top_bar .top_bar_right .top_bar_right_wrapper {
		flex-wrap: wrap;
		justify-content: center
	}
	#Header_creative #Top_bar .top_bar_right .top-bar-right-icon,
		#Header_creative #Top_bar .top_bar_right .wpml-languages,
		#Header_creative #Top_bar .top_bar_right .top-bar-right-button,
		#Header_creative #Top_bar .top_bar_right .top-bar-right-input {
		min-height: 30px;
		margin: 5px
	}
	#Header_creative #Top_bar .search_wrapper {
		left: 100%;
		top: auto;
		bottom: 0
	}
	#Header_creative #Top_bar .banner_wrapper {
		display: block;
		text-align: center
	}
	#Header_creative #Top_bar .banner_wrapper img {
		max-width: 100%;
		height: auto;
		display: inline-block
	}
	#Header_creative #Action_bar {
		display: none;
		position: absolute;
		bottom: 0;
		top: auto;
		clear: both;
		padding: 0 20px;
		box-sizing: border-box
	}
	#Header_creative #Action_bar .contact_details {
		text-align: center;
		margin-bottom: 20px
	}
	#Header_creative #Action_bar .contact_details li {
		padding: 0
	}
	#Header_creative #Action_bar .social {
		float: none;
		text-align: center;
		padding: 5px 0 15px
	}
	#Header_creative #Action_bar .social li {
		margin-bottom: 2px
	}
	#Header_creative #Action_bar .social-menu {
		float: none;
		text-align: center
	}
	#Header_creative #Action_bar .social-menu li {
		border-color: rgba(0, 0, 0, .1)
	}
	#Header_creative .social li a {
		color: rgba(0, 0, 0, .5)
	}
	#Header_creative .social li a:hover {
		color: #000
	}
	#Header_creative .creative-social {
		position: absolute;
		bottom: 10px;
		right: 0;
		width: 50px
	}
	#Header_creative .creative-social li {
		display: block;
		float: none;
		width: 100%;
		text-align: center;
		margin-bottom: 5px
	}
	.header-creative .fixed-nav.fixed-nav-prev {
		margin-left: 50px
	}
	.header-creative.header-open .fixed-nav.fixed-nav-prev {
		margin-left: 250px
	}
	.menuo-last #Header_creative #Top_bar .menu li.last ul {
		top: auto;
		bottom: 0
	}
	.header-open #Header_creative {
		left: 0
	}
	.header-open #Header_creative .creative-wrapper {
		opacity: 1;
		margin: 0 !important;
	}
	.header-open #Header_creative .creative-menu-toggle, .header-open #Header_creative .creative-social
		{
		display: none
	}
	.header-open #Header_creative #Action_bar {
		display: block
	}
	body.header-rtl.header-creative {
		padding-left: 0;
		padding-right: 50px
	}
	.header-rtl #Header_creative {
		left: auto;
		right: -200px
	}
	.header-rtl #Header_creative .creative-wrapper {
		margin-left: 50px;
		margin-right: 0
	}
	.header-rtl #Header_creative a.creative-menu-toggle {
		left: 8px;
		right: auto
	}
	.header-rtl #Header_creative .creative-social {
		left: 0;
		right: auto
	}
	.header-rtl #Footer #back_to_top.sticky {
		right: 125px
	}
	.header-rtl #popup_contact {
		right: 70px
	}
	.header-rtl #Header_creative #Top_bar .menu li ul {
		left: auto;
		right: 100%
	}
	.header-rtl #Header_creative #Top_bar .search_wrapper {
		left: auto;
		right: 100%;
	}
	.header-rtl .fixed-nav.fixed-nav-prev {
		margin-left: 0 !important
	}
	.header-rtl .fixed-nav.fixed-nav-next {
		margin-right: 50px
	}
	body.header-rtl.header-creative.header-open {
		padding-left: 0;
		padding-right: 250px !important
	}
	.header-rtl.header-open #Header_creative {
		left: auto;
		right: 0
	}
	.header-rtl.header-open #Footer #back_to_top.sticky {
		right: 325px
	}
	.header-rtl.header-open #popup_contact {
		right: 270px
	}
	.header-rtl.header-open .fixed-nav.fixed-nav-next {
		margin-right: 250px
	}
	#Header_creative.active {
		left: -1px;
	}
	.header-rtl #Header_creative.active {
		left: auto;
		right: -1px;
	}
	#Header_creative.active .creative-wrapper {
		opacity: 1;
		margin: 0
	}
	.header-creative .vc_row[data-vc-full-width] {
		padding-left: 50px
	}
	.header-creative.header-open .vc_row[data-vc-full-width] {
		padding-left: 250px
	}
	.header-open .vc_parallax .vc_parallax-inner {
		left: auto;
		width: calc(100% - 250px);
	}
	.header-open.header-rtl .vc_parallax .vc_parallax-inner {
		left: 0;
		right: auto;
	}
	#Header_creative.scroll {
		height: 100%;
		overflow-y: auto
	}
	#Header_creative.scroll:not(.dropdown) .menu li ul {
		display: none !important
	}
	#Header_creative.scroll #Action_bar {
		position: static
	}
	#Header_creative.dropdown {
		outline: none
	}
	#Header_creative.dropdown #Top_bar .menu_wrapper {
		float: left
	}
	#Header_creative.dropdown #Top_bar #menu ul li {
		position: relative;
		float: left
	}
	#Header_creative.dropdown #Top_bar #menu ul li a:after {
		display: none
	}
	#Header_creative.dropdown #Top_bar #menu ul li a span {
		line-height: 38px;
		padding: 0
	}
	#Header_creative.dropdown #Top_bar #menu ul li.submenu .menu-toggle {
		display: block;
		position: absolute;
		right: 0;
		top: 0;
		width: 38px;
		height: 38px;
		line-height: 38px;
		font-size: 26px;
		font-weight: 300;
		text-align: center;
		cursor: pointer;
		color: #444;
		opacity: 0.33;
	}
	#Header_creative.dropdown #Top_bar #menu ul li.submenu .menu-toggle:after
		{
		content: "+"
	}
	#Header_creative.dropdown #Top_bar #menu ul li.hover>.menu-toggle:after
		{
		content: "-"
	}
	#Header_creative.dropdown #Top_bar #menu ul li.hover a {
		border-bottom: 0
	}
	#Header_creative.dropdown #Top_bar #menu ul.mfn-megamenu li .menu-toggle
		{
		display: none
	}
	#Header_creative.dropdown #Top_bar #menu ul li ul {
		position: relative !important;
		left: 0 !important;
		top: 0;
		padding: 0;
		margin-left: 0 !important;
		width: auto !important;
		background-image: none
	}
	#Header_creative.dropdown #Top_bar #menu ul li ul li {
		width: 100% !important
	}
	#Header_creative.dropdown #Top_bar #menu ul li ul li a {
		padding: 0 10px;
		text-align: center
	}
	#Header_creative.dropdown #Top_bar #menu ul li ul li a .menu-arrow {
		display: none
	}
	#Header_creative.dropdown #Top_bar #menu ul li ul li a span {
		padding: 0
	}
	#Header_creative.dropdown #Top_bar #menu ul li ul li a span:after {
		display: none !important
	}
	#Header_creative.dropdown #Top_bar .menu>li>ul.mfn-megamenu a.mfn-megamenu-title
		{
		text-transform: uppercase;
		font-weight: 400
	}
	#Header_creative.dropdown #Top_bar .menu>li>ul.mfn-megamenu>li>ul {
		display: block !important;
		position: inherit;
		left: auto;
		top: auto
	}
	#Header_creative.dropdown #Top_bar #menu ul li ul li ul {
		border-left: 0 !important;
		padding: 0;
		top: 0
	}
	#Header_creative {
		transition: left .5s ease-in-out, right .5s ease-in-out;
	}
	#Header_creative .creative-wrapper {
		transition: opacity .5s ease-in-out, margin 0s ease-in-out .5s;
	}
	#Header_creative.active .creative-wrapper {
		transition: opacity .5s ease-in-out, margin 0s ease-in-out;
	}
}
@media only screen and (min-width: 1240px) {
	#Top_bar.is-sticky {
		position: fixed !important;
		width: 100%;
		left: 0;
		top: -60px;
		height: 60px;
		z-index: 701;
		background: #fff;
		opacity: .97;
		-webkit-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.1);
		-moz-box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.1);
		box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.1)
	}
	.layout-boxed.header-boxed #Top_bar.is-sticky {
		max-width: 1240px;
		left: 50%;
		-webkit-transform: translateX(-50%);
		transform: translateX(-50%)
	}
	#Top_bar.is-sticky .top_bar_left, #Top_bar.is-sticky .top_bar_right,
		#Top_bar.is-sticky .top_bar_right:before {
		background: none;
		box-shadow: unset
	}
	#Top_bar.is-sticky .logo {
		width: auto;
		margin: 0 30px 0 20px;
		padding: 0
	}
	#Top_bar.is-sticky #logo, #Top_bar.is-sticky .custom-logo-link {
		padding: 5px 0 !important;
		height: 50px !important;
		line-height: 50px !important
	}
	.logo-no-sticky-padding #Top_bar.is-sticky #logo {
		height: 60px !important;
		line-height: 60px !important
	}
	#Top_bar.is-sticky #logo img.logo-main {
		display: none
	}
	#Top_bar.is-sticky #logo img.logo-sticky {
		display: inline;
		max-height: 35px
	}
	.logo-sticky-width-auto #Top_bar.is-sticky #logo img.logo-sticky {
		width: auto
	}
	#Top_bar.is-sticky .menu_wrapper {
		clear: none
	}
	#Top_bar.is-sticky .menu_wrapper .menu>li>a {
		padding: 15px 0
	}
	#Top_bar.is-sticky .menu>li>a, #Top_bar.is-sticky .menu>li>a span {
		line-height: 30px
	}
	#Top_bar.is-sticky .menu>li>a:after {
		top: auto;
		bottom: -4px
	}
	#Top_bar.is-sticky .menu>li>a span.description {
		display: none
	}
	#Top_bar.is-sticky .secondary_menu_wrapper, #Top_bar.is-sticky .banner_wrapper
		{
		display: none
	}
	.header-overlay #Top_bar.is-sticky {
		display: none
	}
	.sticky-dark #Top_bar.is-sticky, .sticky-dark #Top_bar.is-sticky #menu {
		background: rgba(0, 0, 0, .8)
	}
	.sticky-dark #Top_bar.is-sticky .menu>li:not(.current-menu-item)>a {
		color: #fff
	}
	.sticky-dark #Top_bar.is-sticky .top_bar_right .top-bar-right-icon {
		color: rgba(255, 255, 255, .9)
	}
	.sticky-dark #Top_bar.is-sticky .top_bar_right .top-bar-right-icon svg .path
		{
		stroke: rgba(255, 255, 255, .9)
	}
	.sticky-dark #Top_bar.is-sticky .wpml-languages a.active, .sticky-dark #Top_bar.is-sticky .wpml-languages ul.wpml-lang-dropdown
		{
		background: rgba(0, 0, 0, 0.1);
		border-color: rgba(0, 0, 0, 0.1)
	}
	.sticky-white #Top_bar.is-sticky, .sticky-white #Top_bar.is-sticky #menu
		{
		background: rgba(255, 255, 255, .8)
	}
	.sticky-white #Top_bar.is-sticky .menu>li:not(.current-menu-item)>a {
		color: #222
	}
	.sticky-white #Top_bar.is-sticky .top_bar_right .top-bar-right-icon {
		color: rgba(0, 0, 0, .8)
	}
	.sticky-white #Top_bar.is-sticky .top_bar_right .top-bar-right-icon svg .path
		{
		stroke: rgba(0, 0, 0, .8)
	}
	.sticky-white #Top_bar.is-sticky .wpml-languages a.active, .sticky-white #Top_bar.is-sticky .wpml-languages ul.wpml-lang-dropdown
		{
		background: rgba(255, 255, 255, 0.1);
		border-color: rgba(0, 0, 0, 0.1)
	}
}
@media only screen and (min-width: 768px) and (max-width: 1240px) {
	.header_placeholder {
		height: 0 !important
	}
}
@media only screen and (max-width: 1239px) {
	#Top_bar #menu {
		display: none;
		height: auto;
		width: 300px;
		bottom: auto;
		top: 100%;
		right: 1px;
		position: absolute;
		margin: 0
	}
	#Top_bar a.responsive-menu-toggle {
		display: block
	}
	#Top_bar #menu>ul {
		width: 100%;
		float: left
	}
	#Top_bar #menu ul li {
		width: 100%;
		padding-bottom: 0;
		border-right: 0;
		position: relative
	}
	#Top_bar #menu ul li a {
		padding: 0 25px;
		margin: 0;
		display: block;
		height: auto;
		line-height: normal;
		border: none
	}
	#Top_bar #menu ul li a:after {
		display: none
	}
	#Top_bar #menu ul li a span {
		border: none;
		line-height: 44px;
		display: inline;
		padding: 0
	}
	#Top_bar #menu ul li a span.description {
		margin: 0 0 0 5px
	}
	#Top_bar #menu ul li.submenu .menu-toggle {
		display: block;
		position: absolute;
		right: 15px;
		top: 0;
		width: 44px;
		height: 44px;
		line-height: 44px;
		font-size: 30px;
		font-weight: 300;
		text-align: center;
		cursor: pointer;
		color: #444;
		opacity: 0.33;
	}
	#Top_bar #menu ul li.submenu .menu-toggle:after {
		content: "+"
	}
	#Top_bar #menu ul li.hover>.menu-toggle:after {
		content: "-"
	}
	#Top_bar #menu ul li.hover a {
		border-bottom: 0
	}
	#Top_bar #menu ul li a span:after {
		display: none !important
	}
	#Top_bar #menu ul.mfn-megamenu li .menu-toggle {
		display: none
	}
	#Top_bar #menu ul li ul {
		position: relative !important;
		left: 0 !important;
		top: 0;
		padding: 0;
		margin-left: 0 !important;
		width: auto !important;
		background-image: none !important;
		box-shadow: 0 0 0 0 transparent !important;
		-webkit-box-shadow: 0 0 0 0 transparent !important
	}
	#Top_bar #menu ul li ul li {
		width: 100% !important
	}
	#Top_bar #menu ul li ul li a {
		padding: 0 20px 0 35px
	}
	#Top_bar #menu ul li ul li a .menu-arrow {
		display: none
	}
	#Top_bar #menu ul li ul li a span {
		padding: 0
	}
	#Top_bar #menu ul li ul li a span:after {
		display: none !important
	}
	#Top_bar .menu>li>ul.mfn-megamenu a.mfn-megamenu-title {
		text-transform: uppercase;
		font-weight: 400
	}
	#Top_bar .menu>li>ul.mfn-megamenu>li>ul {
		display: block !important;
		position: inherit;
		left: auto;
		top: auto
	}
	#Top_bar #menu ul li ul li ul {
		border-left: 0 !important;
		padding: 0;
		top: 0
	}
	#Top_bar #menu ul li ul li ul li a {
		padding: 0 20px 0 45px
	}
	.rtl #Top_bar #menu {
		left: 1px;
		right: auto
	}
	.rtl #Top_bar a.responsive-menu-toggle {
		left: 20px;
		right: auto
	}
	.rtl #Top_bar #menu ul li.submenu .menu-toggle {
		left: 15px;
		right: auto;
		border-left: none;
		border-right: 1px solid #eee
	}
	.rtl #Top_bar #menu ul li ul {
		left: auto !important;
		right: 0 !important
	}
	.rtl #Top_bar #menu ul li ul li a {
		padding: 0 30px 0 20px
	}
	.rtl #Top_bar #menu ul li ul li ul li a {
		padding: 0 40px 0 20px
	}
	.header-stack .menu_wrapper a.responsive-menu-toggle {
		position: static !important;
		margin: 11px 0 !important
	}
	.header-stack .menu_wrapper #menu {
		left: 0;
		right: auto
	}
	.rtl.header-stack #Top_bar #menu {
		left: auto;
		right: 0
	}
	.admin-bar #Header_creative {
		top: 32px
	}
	.header-creative.layout-boxed {
		padding-top: 85px
	}
	.header-creative.layout-full-width #Wrapper {
		padding-top: 60px
	}
	#Header_creative {
		position: fixed;
		width: 100%;
		left: 0 !important;
		top: 0;
		z-index: 1001
	}
	#Header_creative .creative-wrapper {
		display: block !important;
		opacity: 1 !important
	}
	#Header_creative .creative-menu-toggle, #Header_creative .creative-social
		{
		display: none !important;
		opacity: 1 !important
	}
	#Header_creative #Top_bar {
		position: static;
		width: 100%
	}
	#Header_creative #Top_bar .one {
		display: flex
	}
	#Header_creative #Top_bar #logo, #Header_creative #Top_bar .custom-logo-link
		{
		height: 50px;
		line-height: 50px;
		padding: 5px 0
	}
	#Header_creative #Top_bar #logo img.logo-sticky {
		max-height: 40px !important
	}
	#Header_creative #logo img.logo-main {
		display: none
	}
	#Header_creative #logo img.logo-sticky {
		display: inline-block
	}
	.logo-no-sticky-padding #Header_creative #Top_bar #logo {
		height: 60px;
		line-height: 60px;
		padding: 0
	}
	.logo-no-sticky-padding #Header_creative #Top_bar #logo img.logo-sticky
		{
		max-height: 60px !important
	}
	#Header_creative #Action_bar {
		display: none
	}
	#Header_creative #Top_bar .top_bar_right:before {
		content: none
	}
	#Header_creative.scroll {
		overflow: visible !important
	}
}
#Header_wrapper, #Intro {
	background-color: #000000;
}
#Subheader {
	background-color: rgba(247, 247, 247, 0);
}
.header-classic #Action_bar, .header-fixed #Action_bar, .header-plain #Action_bar,
	.header-split #Action_bar, .header-stack #Action_bar {
	background-color: #2C2C2C;
}
#Sliding-top {
	background-color: #545454;
}
#Sliding-top a.sliding-top-control {
	border-right-color: #545454;
}
#Sliding-top.st-center a.sliding-top-control, #Sliding-top.st-left a.sliding-top-control
	{
	border-top-color: #545454;
}
#Footer {
	background-color: #000000;
}
.grid .post-item {
	background-color: #ffffff;
}
.portfolio_group .portfolio-item .desc {
	background-color: #ffffff;
}
.woocommerce ul.products li.product {
	background-color: transparent;
}
body, ul.timeline_items, .icon_box a .desc, .icon_box a:hover .desc,
	.feature_list ul li a, .list_item a, .list_item a:hover,
	.widget_recent_entries ul li a, .flat_box a, .flat_box a:hover,
	.story_box .desc, .content_slider.carouselul li a .title,
	.content_slider.flat.description ul li .desc, .content_slider.flat.description ul li a .desc,
	.post-nav.minimal a i {
	color: #ffffff;
}
.post-nav.minimal a svg {
	fill: #ffffff;
}
.themecolor, .opening_hours .opening_hours_wrapper li span,
	.fancy_heading_icon .icon_top, .fancy_heading_arrows .icon-right-dir,
	.fancy_heading_arrows .icon-left-dir, .fancy_heading_line .title,
	.button-love a.mfn-love, .format-link .post-title .icon-link,
	.pager-single>span, .pager-single a:hover, .widget_meta ul,
	.widget_pages ul, .widget_rss ul, .widget_mfn_recent_comments ul li:after,
	.widget_archive ul, .widget_recent_comments ul li:after,
	.widget_nav_menu ul, .woocommerce ul.products li.product .price,
	.shop_slider .shop_slider_ul li .item_wrapper .price, .woocommerce-page ul.products li.product .price,
	.widget_price_filter .price_label .from, .widget_price_filter .price_label .to,
	.woocommerce ul.product_list_widget li .quantity .amount, .woocommerce .product div.entry-summary .price,
	.woocommerce .star-rating span, #Error_404 .error_pic i, .style-simple #Filters .filters_wrapper ul li a:hover,
	.style-simple #Filters .filters_wrapper ul li.current-cat a,
	.style-simple .quick_fact .title, .mfn-cart-holder .mfn-ch-content .mfn-ch-product .woocommerce-Price-amount,
	.woocommerce .comment-form-rating p.stars a:before, .wishlist .wishlist-row .price,
	.mfn-wish-button:not(.link) .icon-heart-fa {
	color: #ffffff;
}
.themebg, #comments .commentlist>li .reply a.comment-reply-link,
	#Filters .filters_wrapper ul li a:hover, #Filters .filters_wrapper ul li.current-cat a,
	.fixed-nav .arrow, .offer_thumb .slider_pagination a:before,
	.offer_thumb .slider_pagination a.selected:after, .pager .pages a:hover,
	.pager .pages a.active, .pager .pages span.page-numbers.current,
	.pager-single span:after, .portfolio_group.exposure .portfolio-item .desc-inner .line,
	.Recent_posts ul li .desc:after, .Recent_posts ul li .photo .c,
	.slider_pagination a.selected, .slider_pagination .slick-active a,
	.slider_pagination a.selected:after, .slider_pagination .slick-active a:after,
	.testimonials_slider .slider_images, .testimonials_slider .slider_images a:after,
	.testimonials_slider .slider_images:before, #Top_bar .header-cart-count,
	#Top_bar .header-wishlist-count, .widget_categories ul,
	.widget_mfn_menu ul li a:hover, .widget_mfn_menu ul li.current-menu-item:not(.current-menu-ancestor)>a,
	.widget_mfn_menu ul li.current_page_item:not(.current_page_ancestor)>a,
	.widget_product_categories ul, .widget_recent_entries ul li:after,
	.woocommerce-account table.my_account_orders .order-number a,
	.woocommerce-MyAccount-navigation ul li.is-active a, .style-simple .accordion .question:after,
	.style-simple .faq .question:after, .style-simple .icon_box .desc_wrapper .title:before,
	.style-simple #Filters .filters_wrapper ul li a:after, .style-simple .article_box .desc_wrapper p:after,
	.style-simple .sliding_box .desc_wrapper:after, .style-simple .trailer_box:hover .desc,
	.tp-bullets.simplebullets.round .bullet.selected, .tp-bullets.simplebullets.round .bullet.selected:after,
	.tparrows.default, .tp-bullets.tp-thumbs .bullet.selected:after,
	.woocommerce span.onsale.onsale-label, .fake-tabs>ul li a:after,
	.fake-tabs>ul li a .number {
	background-color: #ffffff;
}
.Latest_news ul li .photo, .Recent_posts.blog_news ul li .photo,
	.style-simple .opening_hours .opening_hours_wrapper li label,
	.style-simple .timeline_items li:hover h3, .style-simple .timeline_items li:nth-child(even):hover h3,
	.style-simple .timeline_items li:hover .desc, .style-simple .timeline_items li:nth-child(even):hover,
	.style-simple .offer_thumb .slider_pagination a.selected {
	border-color: #ffffff;
}
a {
	color: #ffffff;
}
a:hover {
	color: #ffffff;
}
*::-moz-selection {
	background-color: #ffffff;
	color: black;
}
*::selection {
	background-color: #ffffff;
	color: black;
}
.blockquote p.author span, .counter .desc_wrapper .title, .article_box .desc_wrapper p,
	.team .desc_wrapper p.subtitle, .pricing-box .plan-header p.subtitle,
	.pricing-box .plan-header .price sup.period, .chart_box p,
	.fancy_heading .inside, .fancy_heading_line .slogan, .post-meta,
	.post-meta a, .post-footer, .post-footer a span.label, .pager .pages a,
	.button-love a .label, .pager-single a, #comments .commentlist>li .comment-author .says,
	.fixed-nav .desc .date, .filters_buttons li.label, .Recent_posts ul li a .desc .date,
	.widget_recent_entries ul li .post-date, .tp_recent_tweets .twitter_time,
	.widget_price_filter .price_label, .shop-filters .woocommerce-result-count,
	.woocommerce ul.product_list_widget li .quantity, .widget_shopping_cart ul.product_list_widget li dl,
	.product_meta .posted_in, .woocommerce .shop_table .product-name .variation>dd,
	.shipping-calculator-button:after, .shop_slider .shop_slider_ul li .item_wrapper .price del,
	.woocommerce .product .entry-summary .woocommerce-product-rating .woocommerce-review-link,
	.woocommerce .product.style-default .entry-summary .product_meta .tagged_as,
	.woocommerce .tagged_as, .wishlist .sku_wrapper, .woocommerce .column_product_rating .woocommerce-review-link,
	.woocommerce #reviews #comments ol.commentlist li .comment-text p.meta .woocommerce-review__verified,
	.woocommerce #reviews #comments ol.commentlist li .comment-text p.meta .woocommerce-review__dash,
	.woocommerce #reviews #comments ol.commentlist li .comment-text p.meta .woocommerce-review__published-date,
	.testimonials_slider .testimonials_slider_ul li .author span,
	.testimonials_slider .testimonials_slider_ul li .author span a,
	.Latest_news ul li .desc_footer, .share-simple-wrapper .icons a {
	color: #a8a8a8;
}
h1, h1 a, h1 a:hover, .text-logo #logo {
	color: #ffffff;
}
h2, h2 a, h2 a:hover {
	color: #ffffff;
}
h3, h3 a, h3 a:hover {
	color: #ffffff;
}
h4, h4 a, h4 a:hover, .style-simple .sliding_box .desc_wrapper h4 {
	color: #ffffff;
}
h5, h5 a, h5 a:hover {
	color: #ffffff;
}
h6, h6 a, h6 a:hover, a.content_link .title {
	color: #ffffff;
}
.woocommerce #respond .comment-reply-title, .woocommerce #reviews #comments ol.commentlist li .comment-text p.meta .woocommerce-review__author
	{
	color: #ffffff
}
.dropcap, .highlight:not(.highlight_image) {
	background-color: #ffffff;
}
.button-default .button_theme, .button-default button, .button-default input[type="button"],
	.button-default input[type="reset"], .button-default input[type="submit"],
	.button-flat .button_theme, .button-flat button, .button-flat input[type="button"],
	.button-flat input[type="reset"], .button-flat input[type="submit"],
	.button-round .button_theme, .button-round button, .button-round input[type="button"],
	.button-round input[type="reset"], .button-round input[type="submit"],
	.woocommerce #respond input#submit, .woocommerce a.button:not(.default),
	.woocommerce button.button, .woocommerce input.button, .woocommerce #respond input#submit:hover,
	.woocommerce a.button:not(.default):hover, .woocommerce button.button:hover,
	.woocommerce input.button:hover {
	background-color: #ffffff;
}
.button-stroke .button_theme, .button-stroke .button_theme .button_icon i,
	.button-stroke button, .button-stroke input[type="submit"],
	.button-stroke input[type="reset"], .button-stroke input[type="button"],
	.button-stroke .woocommerce #respond input#submit, .button-stroke .woocommerce a.button:not(.default),
	.button-stroke .woocommerce button.button, .button-stroke.woocommerce input.button
	{
	border-color: #ffffff;
	color: #ffffff !important;
}
.button-stroke .button_theme:hover, .button-stroke button:hover,
	.button-stroke input[type="submit"]:hover, .button-stroke input[type="reset"]:hover,
	.button-stroke input[type="button"]:hover {
	background-color: #ffffff;
}
.button-default .single_add_to_cart_button, .button-flat .single_add_to_cart_button,
	.button-round .single_add_to_cart_button, .button-default .woocommerce .button:disabled,
	.button-flat .woocommerce .button:disabled, .button-round .woocommerce .button:disabled,
	.button-default .woocommerce .button.alt, .button-flat .woocommerce .button.alt,
	.button-round .woocommerce .button.alt {
	background-color: #ffffff !important;
}
.button-stroke .single_add_to_cart_button:hover, .button-stroke #place_order:hover
	{
	background-color: #ffffff !important;
}
a.mfn-link {
	color: #ffffff;
}
a.mfn-link-2 span, a:hover.mfn-link-2 span:before, a.hover.mfn-link-2 span:before,
	a.mfn-link-5 span, a.mfn-link-8:after, a.mfn-link-8:before {
	background: #ffffff;
}
a:hover.mfn-link {
	color: #ffffff;
}
a.mfn-link-2 span:before, a:hover.mfn-link-4:before, a:hover.mfn-link-4:after,
	a.hover.mfn-link-4:before, a.hover.mfn-link-4:after, a.mfn-link-5:before,
	a.mfn-link-7:after, a.mfn-link-7:before {
	background: #ffffff;
}
a.mfn-link-6:before {
	border-bottom-color: #ffffff;
}
.column_column ul, .column_column ol, .the_content_wrapper:not(.is-elementor) ul,
	.the_content_wrapper:not(.is-elementor) ol {
	color: #ffffff;
}
hr.hr_color, .hr_color hr, .hr_dots span {
	color: #7b6852;
	background: #7b6852;
}
.hr_zigzag i {
	color: #7b6852;
}
.highlight-left:after, .highlight-right:after {
	background: #ffffff;
}
@media only screen and (max-width: 767px) {
	.highlight-left .wrap:first-child, .highlight-right .wrap:last-child {
		background: #ffffff;
	}
}
#Header .top_bar_left, .header-classic #Top_bar, .header-plain #Top_bar,
	.header-stack #Top_bar, .header-split #Top_bar, .header-fixed #Top_bar,
	.header-below #Top_bar, #Header_creative, #Top_bar #menu,
	.sticky-tb-color #Top_bar.is-sticky {
	background-color: #000000;
}
#Top_bar .wpml-languages a.active, #Top_bar .wpml-languages ul.wpml-lang-dropdown
	{
	background-color: #000000;
}
#Top_bar .top_bar_right:before {
	background-color: #000000;
}
#Header .top_bar_right {
	background-color: #000000;
}
#Top_bar .top_bar_right .top-bar-right-icon, #Top_bar .top_bar_right .top-bar-right-icon svg .path
	{
	color: #333333;
	stroke: #333333;
}
#Top_bar .menu>li>a, #Top_bar #menu ul li.submenu .menu-toggle {
	color: #ffffff;
}
#Top_bar .menu>li.current-menu-item>a, #Top_bar .menu>li.current_page_item>a,
	#Top_bar .menu>li.current-menu-parent>a, #Top_bar .menu>li.current-page-parent>a,
	#Top_bar .menu>li.current-menu-ancestor>a, #Top_bar .menu>li.current-page-ancestor>a,
	#Top_bar .menu>li.current_page_ancestor>a, #Top_bar .menu>li.hover>a {
	color: #f2f2f2;
}
#Top_bar .menu>li a:after {
	background: #f2f2f2;
}
.menuo-arrows #Top_bar .menu>li.submenu>a>span:not(.description)::after
	{
	border-top-color: #ffffff;
}
#Top_bar .menu>li.current-menu-item.submenu>a>span:not(.description)::after,
	#Top_bar .menu>li.current_page_item.submenu>a>span:not(.description)::after,
	#Top_bar .menu>li.current-menu-parent.submenu>a>span:not(.description)::after,
	#Top_bar .menu>li.current-page-parent.submenu>a>span:not(.description)::after,
	#Top_bar .menu>li.current-menu-ancestor.submenu>a>span:not(.description)::after,
	#Top_bar .menu>li.current-page-ancestor.submenu>a>span:not(.description)::after,
	#Top_bar .menu>li.current_page_ancestor.submenu>a>span:not(.description)::after,
	#Top_bar .menu>li.hover.submenu>a>span:not(.description)::after {
	border-top-color: #f2f2f2;
}
.menu-highlight #Top_bar #menu>ul>li.current-menu-item>a,
	.menu-highlight #Top_bar #menu>ul>li.current_page_item>a,
	.menu-highlight #Top_bar #menu>ul>li.current-menu-parent>a,
	.menu-highlight #Top_bar #menu>ul>li.current-page-parent>a,
	.menu-highlight #Top_bar #menu>ul>li.current-menu-ancestor>a,
	.menu-highlight #Top_bar #menu>ul>li.current-page-ancestor>a,
	.menu-highlight #Top_bar #menu>ul>li.current_page_ancestor>a,
	.menu-highlight #Top_bar #menu>ul>li.hover>a {
	background: #F2F2F2;
}
.menu-arrow-bottom #Top_bar .menu>li>a:after {
	border-bottom-color: #f2f2f2;
}
.menu-arrow-top #Top_bar .menu>li>a:after {
	border-top-color: #f2f2f2;
}
.header-plain #Top_bar .menu>li.current-menu-item>a, .header-plain #Top_bar .menu>li.current_page_item>a,
	.header-plain #Top_bar .menu>li.current-menu-parent>a, .header-plain #Top_bar .menu>li.current-page-parent>a,
	.header-plain #Top_bar .menu>li.current-menu-ancestor>a, .header-plain #Top_bar .menu>li.current-page-ancestor>a,
	.header-plain #Top_bar .menu>li.current_page_ancestor>a, .header-plain #Top_bar .menu>li.hover>a,
	.header-plain #Top_bar .wpml-languages:hover, .header-plain #Top_bar .wpml-languages ul.wpml-lang-dropdown
	{
	background: #F2F2F2;
	color: #f2f2f2;
}
.header-plain #Top_bar .top_bar_right .top-bar-right-icon:hover {
	background: #F2F2F2;
}
.header-plain #Top_bar, .header-plain #Top_bar .menu>li>a span:not(.description),
	.header-plain #Top_bar .top_bar_right .top-bar-right-icon,
	.header-plain #Top_bar .top_bar_right .top-bar-right-button,
	.header-plain #Top_bar .top_bar_right .top-bar-right-input,
	.header-plain #Top_bar .wpml-languages {
	border-color: #f2f2f2;
}
#Top_bar .menu>li ul {
	background-color: #F2F2F2;
}
#Top_bar .menu>li ul li a {
	color: #5f5f5f;
}
#Top_bar .menu>li ul li a:hover, #Top_bar .menu>li ul li.hover>a {
	color: #2e2e2e;
}
#Top_bar .search_wrapper {
	background: #7b6852;
}
#Top_bar .search_wrapper input[type="text"] {
	color: white;
}
#Top_bar .search_wrapper input::placeholder {
	color: white;
	opacity: 1;
}
#Top_bar .search_wrapper input::-ms-input-placeholder {
	color: white;
}
.overlay-menu-toggle {
	color: #b6997b !important;
	background: transparent;
}
#Overlay {
	background: rgba(123, 104, 82, 0.95);
}
#overlay-menu ul li a, .header-overlay .overlay-menu-toggle.focus {
	color: #FFFFFF;
}
#overlay-menu ul li.current-menu-item>a, #overlay-menu ul li.current_page_item>a,
	#overlay-menu ul li.current-menu-parent>a, #overlay-menu ul li.current-page-parent>a,
	#overlay-menu ul li.current-menu-ancestor>a, #overlay-menu ul li.current-page-ancestor>a,
	#overlay-menu ul li.current_page_ancestor>a {
	color: #f1d5b8;
}
#Top_bar .responsive-menu-toggle, #Header_creative .creative-menu-toggle,
	#Header_creative .responsive-menu-toggle {
	color: #b6997b;
	background: transparent;
}
#Side_slide {
	background-color: #191919;
	border-color: #191919;
}
#Side_slide, #Side_slide #menu ul li.submenu .menu-toggle, #Side_slide .search-wrapper input.field,
	#Side_slide a:not(.action_button) {
	color: #000000;
}
#Side_slide .extras .extras-wrapper a svg .path {
	stroke: #000000;
}
#Side_slide #menu ul li.hover>.menu-toggle, #Side_slide a.active,
	#Side_slide a:not(.action_button):hover {
	color: #FFFFFF;
}
#Side_slide .extras .extras-wrapper a:hover svg .path {
	stroke: #FFFFFF;
}
#Side_slide #menu ul li.current-menu-item>a, #Side_slide #menu ul li.current_page_item>a,
	#Side_slide #menu ul li.current-menu-parent>a, #Side_slide #menu ul li.current-page-parent>a,
	#Side_slide #menu ul li.current-menu-ancestor>a, #Side_slide #menu ul li.current-page-ancestor>a,
	#Side_slide #menu ul li.current_page_ancestor>a, #Side_slide #menu ul li.hover>a,
	#Side_slide #menu ul li:hover>a {
	color: #FFFFFF;
}
#Action_bar .contact_details {
	color: #ffffff
}
#Action_bar .contact_details a {
	color: #0095eb
}
#Action_bar .contact_details a:hover {
	color: #007cc3
}
#Action_bar .social li a, #Header_creative .social li a, #Action_bar:not(.creative) .social-menu a
	{
	color: #bbbbbb
}
#Action_bar .social li a:hover, #Header_creative .social li a:hover,
	#Action_bar:not(.creative) .social-menu a:hover {
	color: #FFFFFF
}
#Subheader .title {
	color: #ffffff;
}
#Subheader ul.breadcrumbs li, #Subheader ul.breadcrumbs li a {
	color: rgba(255, 255, 255, 0.6);
}
#Footer, #Footer .widget_recent_entries ul li a {
	color: #ffffff;
}
#Footer a {
	color: #7b6852;
}
#Footer a:hover {
	color: #63513c;
}
#Footer h1, #Footer h1 a, #Footer h1 a:hover, #Footer h2, #Footer h2 a,
	#Footer h2 a:hover, #Footer h3, #Footer h3 a, #Footer h3 a:hover,
	#Footer h4, #Footer h4 a, #Footer h4 a:hover, #Footer h5, #Footer h5 a,
	#Footer h5 a:hover, #Footer h6, #Footer h6 a, #Footer h6 a:hover {
	color: #2c2930;
}
#Footer .themecolor, #Footer .widget_meta ul, #Footer .widget_pages ul,
	#Footer .widget_rss ul, #Footer .widget_mfn_recent_comments ul li:after,
	#Footer .widget_archive ul, #Footer .widget_recent_comments ul li:after,
	#Footer .widget_nav_menu ul, #Footer .widget_price_filter .price_label .from,
	#Footer .widget_price_filter .price_label .to, #Footer .star-rating span
	{
	color: #000000;
}
#Footer .themebg, #Footer .widget_categories ul, #Footer .Recent_posts ul li .desc:after,
	#Footer .Recent_posts ul li .photo .c, #Footer .widget_recent_entries ul li:after,
	#Footer .widget_mfn_menu ul li a:hover, #Footer .widget_product_categories ul
	{
	background-color: #000000;
}
#Footer .Recent_posts ul li a .desc .date, #Footer .widget_recent_entries ul li .post-date,
	#Footer .tp_recent_tweets .twitter_time, #Footer .widget_price_filter .price_label,
	#Footer .shop-filters .woocommerce-result-count, #Footer ul.product_list_widget li .quantity,
	#Footer .widget_shopping_cart ul.product_list_widget li dl {
	color: #a8a8a8;
}
#Footer .footer_copy .social li a, #Footer .footer_copy .social-menu a {
	color: #65666C;
}
#Footer .footer_copy .social li a:hover, #Footer .footer_copy .social-menu a:hover
	{
	color: #FFFFFF;
}
#Footer .footer_copy {
	border-top-color: rgba(255, 255, 255, 0.1);
}
#Sliding-top, #Sliding-top .widget_recent_entries ul li a {
	color: #766D5B;
}
#Sliding-top a {
	color: #7b6852;
}
#Sliding-top a:hover {
	color: #63513c;
}
#Sliding-top h1, #Sliding-top h1 a, #Sliding-top h1 a:hover,
	#Sliding-top h2, #Sliding-top h2 a, #Sliding-top h2 a:hover,
	#Sliding-top h3, #Sliding-top h3 a, #Sliding-top h3 a:hover,
	#Sliding-top h4, #Sliding-top h4 a, #Sliding-top h4 a:hover,
	#Sliding-top h5, #Sliding-top h5 a, #Sliding-top h5 a:hover,
	#Sliding-top h6, #Sliding-top h6 a, #Sliding-top h6 a:hover {
	color: #2c2930;
}
#Sliding-top .themecolor, #Sliding-top .widget_meta ul, #Sliding-top .widget_pages ul,
	#Sliding-top .widget_rss ul, #Sliding-top .widget_mfn_recent_comments ul li:after,
	#Sliding-top .widget_archive ul, #Sliding-top .widget_recent_comments ul li:after,
	#Sliding-top .widget_nav_menu ul, #Sliding-top .widget_price_filter .price_label .from,
	#Sliding-top .widget_price_filter .price_label .to, #Sliding-top .star-rating span
	{
	color: #7b6852;
}
#Sliding-top .themebg, #Sliding-top .widget_categories ul, #Sliding-top .Recent_posts ul li .desc:after,
	#Sliding-top .Recent_posts ul li .photo .c, #Sliding-top .widget_recent_entries ul li:after,
	#Sliding-top .widget_mfn_menu ul li a:hover, #Sliding-top .widget_product_categories ul
	{
	background-color: #7b6852;
}
#Sliding-top .Recent_posts ul li a .desc .date, #Sliding-top .widget_recent_entries ul li .post-date,
	#Sliding-top .tp_recent_tweets .twitter_time, #Sliding-top .widget_price_filter .price_label,
	#Sliding-top .shop-filters .woocommerce-result-count, #Sliding-top ul.product_list_widget li .quantity,
	#Sliding-top .widget_shopping_cart ul.product_list_widget li dl {
	color: #a8a8a8;
}
blockquote, blockquote a, blockquote a:hover {
	color: #444444;
}
.image_frame .image_wrapper .image_links, .portfolio_group.masonry-hover .portfolio-item .masonry-hover-wrapper .hover-desc
	{
	background: rgba(255, 255, 255, 0.8);
}
.masonry.tiles .post-item .post-desc-wrapper .post-desc .post-title:after,
	.masonry.tiles .post-item.no-img, .masonry.tiles .post-item.format-quote,
	.blog-teaser li .desc-wrapper .desc .post-title:after, .blog-teaser li.no-img,
	.blog-teaser li.format-quote {
	background: #ffffff;
}
.image_frame .image_wrapper .image_links a {
	color: #ffffff;
}
.image_frame .image_wrapper .image_links a:hover {
	background: #ffffff;
	color: #ffffff;
}
.image_frame {
	border-color: #ffffff;
}
.image_frame .image_wrapper .mask::after {
	background: rgba(255, 255, 255, 0.4);
}
.sliding_box .desc_wrapper {
	background: #7b6852;
}
.sliding_box .desc_wrapper:after {
	border-bottom-color: #7b6852;
}
.counter .icon_wrapper i {
	color: #7b6852;
}
.quick_fact .number-wrapper {
	color: #7b6852;
}
.progress_bars .bars_list li .bar .progress {
	background-color: #7b6852;
}
a:hover.icon_bar {
	color: #7b6852 !important;
}
a.content_link, a:hover.content_link {
	color: #7b6852;
}
a.content_link:before {
	border-bottom-color: #7b6852;
}
a.content_link:after {
	border-color: #7b6852;
}
.get_in_touch, .infobox {
	background-color: #7b6852;
}
.google-map-contact-wrapper .get_in_touch:after {
	border-top-color: #7b6852;
}
.timeline_items li h3:before, .timeline_items:after, .timeline .post-item:before
	{
	border-color: #ffffff;
}
.how_it_works .image .number {
	background: #ffffff;
}
.trailer_box .desc .subtitle, .trailer_box.plain .desc .line {
	background-color: #7b6852;
}
.trailer_box.plain .desc .subtitle {
	color: #7b6852;
}
.icon_box .icon_wrapper, .icon_box a .icon_wrapper, .style-simple .icon_box:hover .icon_wrapper
	{
	color: #7b6852;
}
.icon_box:hover .icon_wrapper:before, .icon_box a:hover .icon_wrapper:before
	{
	background-color: #7b6852;
}
ul.clients.clients_tiles li .client_wrapper:hover:before {
	background: #ffffff;
}
ul.clients.clients_tiles li .client_wrapper:after {
	border-bottom-color: #ffffff;
}
.list_item.lists_1 .list_left {
	background-color: #7b6852;
}
.list_item .list_left {
	color: #7b6852;
}
.feature_list ul li .icon i {
	color: #7b6852;
}
.feature_list ul li:hover, .feature_list ul li:hover a {
	background: #7b6852;
}
/* .ui-tabs .ui-tabs-nav li a, .accordion .question .title, .faq .question .title, */
/* 	table th, .fake-tabs>ul li a { */
/* 	color: #444444; */
/* } */
.ui-tabs .ui-tabs-nav li.ui-state-active a, .accordion .question.active .title>.acc-icon-plus,
	.accordion .question.active .title>.acc-icon-minus, .accordion .question.active .title,
	.faq .question.active .title>.acc-icon-plus, .faq .question.active .title,
	.fake-tabs>ul li.active a {
	color: #7b6852;
}
.ui-tabs .ui-tabs-nav li.ui-state-active a:after {
	background: #7b6852;
}
/* body.table-hover:not(.woocommerce-page) table tr:hover td { */
/* 	background: #ffffff; */
/* } */
.pricing-box .plan-header .price sup.currency, .pricing-box .plan-header .price>span
	{
	color: #7b6852;
}
.pricing-box .plan-inside ul li .yes {
	background: #7b6852;
}
.pricing-box-box.pricing-box-featured {
	background: #7b6852;
}
input[type="date"], input[type="email"], input[type="number"], input[type="password"],
	input[type="search"], input[type="tel"], input[type="text"], input[type="url"],
	select, textarea, .woocommerce .quantity input.qty, .wp-block-search input[type="search"],
	.dark input[type="email"], .dark input[type="password"], .dark input[type="tel"],
	.dark input[type="text"], .dark select, .dark textarea {
	color: #4c4845;
	background-color: rgba(217, 208, 198, 1);
	border-color: #a59687;
}
::-webkit-input-placeholder {
	color: #929292;
}
::-moz-placeholder {
	color: #929292;
}
:-ms-input-placeholder {
	color: #929292;
}
input[type="date"]:focus, input[type="email"]:focus, input[type="number"]:focus,
	input[type="password"]:focus, input[type="search"]:focus, input[type="tel"]:focus,
	input[type="text"]:focus, input[type="url"]:focus, select:focus,
	textarea:focus {
	color: #4c4845;
	background-color: rgba(227, 218, 209, 1) !important;
	border-color: #2c2930;
}
:focus::-webkit-input-placeholder {
	color: #929292;
}
:focus::-moz-placeholder {
	color: #929292;
}
.woocommerce span.onsale, .shop_slider .shop_slider_ul li .item_wrapper span.onsale
	{
	border-top-color: #ffffff !important;
}
.woocommerce span.onsale i, .shop_slider .shop_slider_ul li .item_wrapper span.onsale i
	{
	color: black;
}
.woocommerce .widget_price_filter .ui-slider .ui-slider-handle {
	border-color: #ffffff !important;
}
@media only screen and ( min-width: 768px ) {
	.header-semi #Top_bar:not(.is-sticky) {
		background-color: rgba(0, 0, 0, 0.8);
	}
}
@media only screen and ( max-width: 767px ) {
	#Top_bar {
		background-color: #000000 !important;
	}
	#Action_bar {
		background-color: #FFFFFF !important;
	}
	#Action_bar .contact_details {
		color: #222222
	}
	#Action_bar .contact_details a {
		color: #0095eb
	}
	#Action_bar .contact_details a:hover {
		color: #007cc3
	}
	#Action_bar .social li a, #Action_bar .social-menu a {
		color: #bbbbbb !important
	}
	#Action_bar .social li a:hover, #Action_bar .social-menu a:hover {
		color: #777777 !important
	}
}
form input.display-none {
	display: none !important
}
</style>
</head>
<body>

</body>
</html>