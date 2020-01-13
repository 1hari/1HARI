<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	
<style> <!--토글 css 이 페이지에서 필수 -->
	.custom-template {
	position:fixed; 
 	top: 50%;
	transform: translateY(-50%);
	right: -325px;
	width: 325px;
	height: max-content;
	display: block;
	z-index: 1;
	background: #ffffff;
	transition: all .3s;
	z-index: 1003;
	box-shadow: -1px 1px 20px rgba(69, 65, 78, 0.15);
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	transition: all .5s;
}

.custom-template.open {
	right: 0px;
}

.custom-template .custom-toggle {
	position: absolute;
	width: 45px;
	height: 45px;
	background: #2ba2aa;
	top: 50%;
	left: -45px; 
	transform: translateY(-500%);
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-right: 1px solid #177dff;
	cursor: pointer;
	color: #ffffff;
	box-shadow: -5px 5px 20px rgba(69, 65, 78, 0.21);
}

.custom-template .custom-toggle i {
	font-size: 20px;
	animation: 1.5s spin linear infinite;
}

.custom-template .title{
    padding: 15px;
    text-align: left;
    font-size: 16px;
    font-weight: 600;
    color: #ffffff;
    border-top-left-radius: 5px;
    border-bottom: 1px solid #ebedf2;
    background: #2ab2aa;
}

.custom-template .custom-content{
	padding: 20px 15px;
	overflow: auto;
}

.custom-template .switcher {
	padding: 5px 0;
}

.custom-template .switch-block h4 {
	font-size: 13px;
	font-weight: 600;
	color: #444;
	line-height: 1.3;
	margin-bottom: 0;
	text-transform: uppercase;
}

.custom-template .btnSwitch {
	margin-top: 20px;
	margin-bottom: 25px;
}

.custom-template .btnSwitch button {
	border: 0px;
	height: 20px;
	width: 20px;
	outline: 0;
	margin-right: 10px;
	margin-bottom: 10px;
	cursor: pointer;
	padding: 0;
	border-radius: 50%;
	border: 2px solid #eee;
	position: relative;
	transition: all .2s;
}

.custom-template .btnSwitch button:hover{
	border-color: #0bf;
}

.custom-template .btnSwitch button.selected{
	border-color: #0bf;
}

.custom-template .img-pick {
	padding: 4px;
	min-height: 100px;
	border-radius: 5px;
	cursor: pointer;
}

.custom-template .img-pick img {
	height: 100%;
	height: 100px;
	width: 100%;
	border-radius: 5px;
	border: 2px solid transparent;
}

.custom-template .img-pick:hover img, .custom-template .img-pick.active img{
	border-color: #177dff;
}

.demo .btn, .demo .progress{
	margin-bottom: 15px !important;
}

.demo .form-check-label, .demo .form-radio-label{
	margin-right: 15px;
}

.demo .toggle, .demo .btn-group{
	margin-right: 15px;
}

.demo #slider{
	margin-bottom: 15px;
}

.table-typo tbody > tr > td{
	border-color: #fafafa;
}

.table-typo tbody > tr > td:first-child{
	min-width: 200px;
	vertical-align: bottom;
}

.table-typo tbody > tr > td:first-child p{
	font-size: 14px;
	color: #333;
}

.demo-icon {
	display: flex;
	flex-direction: row;
	align-items: center;
	margin-bottom: 20px;
	padding: 10px;
	transition: all .2s;
}

.demo-icon:hover{
	background-color: #f4f5f8;
	border-radius: 3px;
}

.demo-icon .icon-preview{
	font-size: 1.8rem;
	margin-right: 10px;
	line-height: 1;
	color: #333439;
}

.demo-icon .icon-class{
	font-weight: 300;
	font-size: 13px;
	color: #777;
}

.form-show-notify .form-control{
	margin-bottom: 15px;
}

.form-show-notify label{
	padding-top: 0.65rem;
}

.map-demo {
	height: 300px;
}

#instructions li{
	padding: 5px 0;
}

.row-demo-grid{
	margin-bottom: 15px;
}

.row-demo-grid [class^="col"]{
	text-align: center;
}

.row-demo-grid [class^="col"] .card-body{
	background: #ddd;
}

.btnSwitch button[data-color="default"] {
	background-color: #fff;
}
.btnSwitch button[data-color="black"] {
	background-color: #191919;
}
.btnSwitch button[data-color="dark"] {
	background-color: #282a3c;
}
.btnSwitch button[data-color="blue"] {
	background-color: #177dff;
}
.btnSwitch button[data-color="purple"] {
	background-color: #716aca;
}
.btnSwitch button[data-color="light-blue"] {
	background-color: #05b4d8;
}
.btnSwitch button[data-color="green"] {
	background-color: #35cd3a;
}
.btnSwitch button[data-color="orange"] {
	background-color: #ffa534;
}
.btnSwitch button[data-color="red"] {
	background-color: #f3545d;
}
.btnSwitch button[data-color="bg1"] {
	background-color: #fafafa;
}
.btnSwitch button[data-color="bg2"] {
	background-color: #fff;
}
.btnSwitch button[data-color="bg3"] {
	background-color: #f1f1f1;
}

@media screen and (max-width: 550px){
	.table-typo tr td{
		display: flex;
		align-items: center;
		word-break: break-word;
	}

	.table-typo tr td:first-child p{
		margin-bottom: 0px;
	}
}

@media screen and (max-width: 576px){
	.custom-template .custom-content {
		overflow: auto;
	}
	.form-show-notify > .text-right, .form-show-validation > .text-right {
		text-align: left !important;
	}
}

@media screen and (max-width: 400px) {
	.custom-template {
		width: 85% !important;
		right: -85%;
	}
}




/*     	Customable Layouts Colors  _layout.scss   */

.main-header[data-background-color] {
	.btn-minimize {
		color: #fff !important;
	}
	.logo-header{
		background-color: rgba(31, 30, 30, 0.12) !important;
		.navbar-toggler {
			.navbar-toggler-icon {
				color: $white-color !important;
			}
		}
		.more {
			color: $white-color !important;
		}
	}
	.navbar-header{
		.nav-search{
			.input-group {
				border: 0;
				background: rgba(31, 30, 30, 0.12) !important;
				box-shadow: inset 0 1px 0 0 rgba(61, 70, 79, 0);
				transition: all .4s;
				.form-control {
					color: $white-color !important;
					&::-webkit-input-placeholder { /* Chrome/Opera/Safari */
						opacity: 1;
					}
					&::-moz-placeholder { /* Firefox 19+ */
						opacity: 1;
					}
					&:-ms-input-placeholder { /* IE 10+ */
						opacity: 1;
					}
					&:-moz-placeholder { /* Firefox 18- */
						opacity: 1;
					}
				}
				.search-icon {
					color: $white-color !important;
				}
				&.focus {
					background: #fff !important;
					.form-control {
						color: inherit !important;
						&::-webkit-input-placeholder { /* Chrome/Opera/Safari */
							color: #bfbfbf !important;
						}
						&::-moz-placeholder { /* Firefox 19+ */
							color: #bfbfbf !important;
						}
						&:-ms-input-placeholder { /* IE 10+ */
							color: #bfbfbf !important;
						}
						&:-moz-placeholder { /* Firefox 18- */
							color: #bfbfbf !important;
						}
					}
					.search-icon {
						color: #bfbfbf !important;
					}
				}
			}
		}
		.navbar-nav .nav-item {
			.nav-link {
				color: $white-color !important;
				&:hover, &:focus {
					background: rgba(31, 30, 30, 0.12) !important;
				}
			}
			&.active {
				.nav-link {
					background: rgba(31, 30, 30, 0.12) !important;
				}
			}
		}
	}
}

@mixin main-header-state-style($color) {
	background: $color !important;
}

@mixin logo-header-state-style($color) {
	background: $color !important;
	&:after {
		background: $transparent-bg !important;
	}
}

@mixin navbar-header-state-style($color) {
	.navbar-header {
		background: $color !important;
	}
}

@mixin sidebar-state-style($color, $opacity) {
	background: $color !important;
	.sidebar-background {
		&:after {
			background: $color;
			opacity: $opacity;
		}
	}
}

/* //[data-background-color="dark"] 
 */
.main-header[data-background-color="dark"] {
	@include main-header-state-style($default-color);
	@include navbar-header-state-style($default-color);
}

/* //[data-background-color="blue"] */

.main-header[data-background-color="blue"] {
	@include main-header-state-style($primary-color);
	@include navbar-header-state-style($primary-color);
}
/* 
//[data-background-color="purple"] */

.main-header[data-background-color="purple"] {
	@include main-header-state-style($secondary-color);
	@include navbar-header-state-style($secondary-color);
}
/* 
//[data-background-color="purple"] */

.main-header[data-background-color="light-blue"] {
	@include main-header-state-style($info-color);
	@include navbar-header-state-style($info-color);
}
/* 
//[data-background-color="orange"] */

.main-header[data-background-color="orange"] {
	@include main-header-state-style($warning-color);
	@include navbar-header-state-style($warning-color);
}
/* 
//[data-background-color="green"] */

.main-header[data-background-color="green"] {
	@include main-header-state-style($success-color);
	@include navbar-header-state-style($success-color);
}

/* //[data-background-color="red"] */

.main-header[data-background-color="red"] {
	@include main-header-state-style($danger-color);
	@include navbar-header-state-style($danger-color);
}



/*layouts.scss*/

/*    Layouts     */

body {
  min-height: 100vh;
  position: relative;
  background: #f9fbfd;
}

.no-bd{
  border: 0px !important;
}

.pull-right {
  float: right;
}

.pull-left {
  float: left;
}

.wrapper {
  min-height: 100vh;
  position: relative;
  top: 0;
  height: 100vh;
}

.main-header {
  background: $white-color;
  min-height: 55px;
  width: 100%;
  position: fixed;
  z-index: 1001;
  .logo-header {
    float: left;
    width: 240px;
    height: 57px;
    line-height: 55px;
    color: #333333;
    z-index: 1001;
    font-size: 17px;
    font-weight: $font-weight-normal;
    padding-left: 25px;
    padding-right: 25px;
    z-index: 1001;
    display: flex;
    align-items: center;
    position: relative;
    transition: all .3s;
    .big-logo {
      margin-right: 8px;
      &:hover {
        text-decoration: none;
      }
      .logo-img{
        width: 35px;
        height: 35px;
      }
    }
    .logo {
      color: $body-text-color;
      opacity: 1;
      position: relative;
      height: 100%;
      &:hover {
        text-decoration: none;
      }
      .navbar-brand{
        padding-top: 0px;
        padding-bottom: 0px;
        margin-right: 0px;
      }
    }
    .navbar-minimize{
      position: absolute;
      top: 0;
      right: 18px;
      z-index: 5;
    }
    .navbar-toggler {
      padding-left: 0px;
      padding-right: 0px;
      opacity: 0;
      display: none;
      .navbar-toggler-icon {
        height: 1em;
        width: 1em;
        color: #545454;
        font-size: 22px;
      }
    }
    .more {
      background: $transparent-bg;
      border: 0;
      font-size: 22px;
      padding: 0;
      opacity: 0;
      width: 0;
      display: none;
    }
  }
  .navbar-header {
    min-height: 57px;
  }
  .btn-minimize{
    font-size: 20px;
    line-height: 20px;
    padding: 0px;
    background: transparent !important;
    color: $body-text-color !important;
    &:hover, &:focus {
      opacity: 1;
    }
  }
}

#search-nav {
  flex: 1;
  max-width: 400px;
}

%nav-item-hover-before {
  background: #1d7af3;
  opacity: 1 !important;
  position: absolute;
  z-index: 1;
  width: 3px;
  height: 100%;
  content: '';
  left: 0;
  top: 0;
}

.sidebar {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  width: 240px;
  padding-top: 57px;
  display: block;
  z-index: 1000;
  color: $white-color;
  font-weight: 200;
  background: $white-color;
  -webkit-box-shadow: 1px 0 10px rgba(69, 65, 78, 0.06);
  -moz-box-shadow: 1px 0 10px rgba(69, 65, 78, 0.06);
  box-shadow: 1px 0 10px rgba(69, 65, 78, 0.06);
  transition: all .3s;
  .user {
    margin-top: 13.5px;
    padding-left: 15px;
    padding-right: 15px;
    padding-bottom: 12.5px;
    border-bottom: 1px solid #f1f1f1;
    display: block;
    margin-left: 10px;
    margin-right: 10px;
    .info {
      a {
        white-space: nowrap;
        display: block;
        position: relative;
        &:hover, &:focus {
          text-decoration: none;
        }
        > span {
          font-size: 13px;
          font-weight: $font-weight-normal;
          color: #777;
          display: flex;
          flex-direction: column;
          .user-level {
            color: #555;
            font-weight: $font-weight-bold;
            font-size: 11px;
            margin-top: 5px;
          }
        }
        .link-collapse {
          padding: 7px 0;
        }
      }
      .caret {
        position: absolute;
        top: 17px;
        right: 0px;
        border-top-color: #777;
      }
    }
  }
  .sidebar-wrapper {
    position: relative;
    max-height: calc(100vh - 75px);
    min-height: 100%;
    overflow: auto;
    width: 240px;
    z-index: 4;
    padding-bottom: 100px;
    transition: all .3s;
    .sidebar-content{
      padding-top: 0px;
      padding-bottom: 55px;
    }
    .scroll-element.scroll-y{
      top: 5px !important;
    }
  }
  .nav {
    display: block;
    float: none;
    margin-top: 20px;
    .nav-section{
      margin: 15px 0 0 0;
      .sidebar-mini-icon{
        text-align: center;
        font-size: 15px;
        color: rgb(144, 144, 147);
        display: none;
      }
      .text-section{
        padding: 2px 30px;
        font-size: 11px;
        color: #727275;
        font-weight: $font-weight-bold;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        margin-bottom: 12px;
        margin-top: 20px;
      }
    }
    > .nav-item {
      display: list-item;
      &.active {
        > a {
          color: $body-text-color !important;
          background: rgba(0, 0, 0, 0.03);
          &:before {
            @extend %nav-item-hover-before;
          }
          p {
            color: $body-text-color !important;
          }
        }
        &:hover > a:before {
          @extend %nav-item-hover-before;
        }
        a i {
          color: #4d7cfe;
        }
      }
      &.submenu{
        background: rgba(0, 0, 0, 0.03);
        > li {
          > a {
            i {
              color: rgba(23, 125, 255, 0.76);
            }
          }
        }
      }
      > a:hover, a:focus {
        background: rgba(0, 0, 0, 0.03);
      }
      a {
        display: flex;
        align-items: center;
        color: #575962;
        padding: 6px 25px;
        width: 100%;
        font-size: 14px;
        font-weight: $font-weight-normal;
        position: relative;
        margin-bottom: 3px;
        &:hover, &:focus {
          text-decoration: none;
          p {
            color: #575962 !important;
          }
          i {
            color: #4d7cfe !important;
          }
        }
      }
      a {
        .letter-icon{
          color: #a1a2a6;
          margin-right: 15px;
          width: 25px;
          text-align: center;
          vertical-align: middle;
          float: left;
          font-size: 20px;
          font-weight: 200;
        }
        i {
          color: #9a9a9a;
          margin-right: 15px;
          width: 25px;
          text-align: center;
          vertical-align: middle;
          float: left;
          &.fas, &.far, &.fab, &.fa {
            font-size: 18px;
            line-height: 30px;
          }
          &[class^="flaticon-"]{
            font-size: 20px;
          }
        }
        p {
          font-size: 13px;
          margin-bottom: 0px;
          margin-right: 5px;
          white-space: nowrap;
          font-weight: $font-weight-bold;
          color: #9a9a9a;
        }
        .caret{
          margin-left: auto;
          margin-right: 10px;
          transition: all .5s;
          color: #9a9a9a;
        }
      }
      a[data-toggle=collapse][aria-expanded=true]{
        background: transparent;
        p {
          color: #575962;
        }
        i {
          color: #4d7cfe;
        }
        .caret {
          filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=2);
          -webkit-transform: rotate(-180deg);
          transform: rotate(-180deg);
        }
        &:before {
          @extend %nav-item-hover-before;
        }
      }
    }
  }
  .nav-collapse{
    margin-top: 0px;
    margin-bottom: 15px;
    padding-bottom: 15px;
    padding-top: 10px;
    li {
      &.active {
        > a {
          font-weight: 600;
          background: rgba(0,0,0,0.05);
        }
      }
      a:before, a:hover:before{
        opacity: 0 !important;
      }
      a {
        margin-bottom: 0px !important;
        padding: 10px 25px !important;
        .sub-item{
          font-size: 13px;
          position: relative;
          margin-left: 25px;
          opacity: .85;
          &:before{
            content: '';
            height: 4px;
            width: 4px;
            background: rgba(131, 132, 138, 0.89);
            position: absolute;
            left: -15px;
            top: 50%;
            transform: translateY(-50%);
            border-radius: 100%;
          }
        }
        &:hover {
          .sub-item {
            opacity: 1;
          }
        }
        .sidebar-mini-icon {
          font-size: 18px;
          color: #C3C5CA;
          margin-right: 15px;
          width: 25px;
          text-align: center;
          vertical-align: middle;
          float: left;
          font-weight: $font-weight-light !important;
        }
      }
    }
    &.subnav {
      padding-bottom: 10px;
      margin-bottom: 0px;
      li {
        a {
          padding-left: 40px !important;
        }
      }
    }
  }
}

.sidebar[data-image] {
  .nav {
    .nav-item {
      opacity: .9;
    }
  }
}

.quick-sidebar{
  position: fixed;
  top: 0;
  bottom: 0;
  right: -380px;
  width: 380px;
  overflow: auto;
  overflow-x: hidden;
  height: 100vh;
  display: block;
  z-index: 1;
  background: $white-color;
  background-size: cover;
  background-position: center center;
  box-shadow: 2px 0px 20px rgba(69, 65, 78, 0.07);
  transition: all .3s;
  z-index: 1101;
  padding: 20px 20px;
  .scroll-wrapper {
    .scroll-element {
      opacity: 0.4 !important;
    }
    &:hover {
      .scroll-element {
        opacity: .8 !important;
      }
    }
  }
  .close-quick-sidebar{
    position: absolute;
    right: 25px;
    color: #999;
  }
  .nav-link {
    padding-top: 0px !important;
    padding-left: 10px !important;
    padding-right: 10px !important;
    margin-right: 15px !important; 
  }
  .quick-wrapper{
    .quick-scroll{
      height: calc(100vh - 115px);
      overflow: auto;
      margin-bottom: 15px;
    }
    .quick-content{
      padding-bottom: 25px;
    }
    .category-title {
      font-size: 16px;
      font-weight: $font-weight-bold;
      padding-bottom: 10px;
      margin-top: 25px;
      display: block;
      border-bottom: 1px solid #f1f1f1;
      margin-bottom: 15px;
    }
  }
}

.quick-sidebar-overlay{
  position: fixed;
  z-index: 1100;
  width: 100%;
  height: 100%;
  left: 0;
  top: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.63);
}

.main-panel {
  position: relative;
  width: calc(100% - 240px);
  height: 100vh;
  min-height: 100%;
  float: right;
  transition: all .3s;
  > .content {
    padding: 0px !important;
    min-height: calc(100% - 123px);
    margin-top: 57px;
    overflow: hidden;
  }
  > .content-full{
    padding: 0px !important;
    min-height: calc(100% - 123px);
    margin-top: 57px;
    overflow: hidden;
  }
  .page-header {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
    .page-title {
      margin-bottom: 0px;
    }
    .btn-page-header-dropdown {
      width: 35px;
      height: 35px;
      font-size: 14px;
      padding: 0px;
      color: #6b6b6b;
      box-shadow: 0 2px 14px 0 rgba(144, 116, 212, 0.1) !important;
      border: 0;
      &:after {
        display: none;
      }
    }
    .dropdown-menu {
      margin-top: 15px;
      top: 0px !important;
      &:after {
        width: 0;
        height: 0;
        border-left: 8px solid $transparent-bg;
        border-right: 8px solid $transparent-bg;
        border-bottom: 8px solid $white-color;
        position: absolute;
        top: -8px;
        right: 32px;
        content: '';
      }
    }
  }
  .page-divider {
    height: 0;
    margin: .3rem 0 1rem;
    overflow: hidden;
    border-top: 1px solid #ebecec;
  }
}

/*      Page Wrapper      */
.page-wrapper {
  min-height: calc(100vh - 57px);
  position: relative;
  &.has-sidebar {
    .page-inner {
      margin-right: 22.5rem;
    }
  }
}

.page-navs {
  position: relative;
  display: block;
  padding-right: 1rem;
  padding-left: 1rem;
  box-shadow: 0 1px 1px 0 rgba(0,0,0,.07);
  z-index: 1;
  .nav {
    .nav-link {
      padding: 1rem !important;
    }
  }
  .nav-line {
    border: 0px !important;
    .nav-link {
      border-bottom-width: 3px !important;
    }
  }
}

.nav-scroller {
  .nav {
    flex-wrap: nowrap;
    overflow-x: auto;
    white-space: nowrap;
  }
}

@media (min-width: 992px) {
  .page-navs {
    padding-right: 2rem;
    padding-left: 2rem;
  }
}

.page-inner {
  padding: 1.5rem 0;
}

@media (min-width: 576px) {
  .page-inner {
    padding-right: 1rem;
    padding-left: 1rem;
  }
}

@media (min-width: 992px) {
  .page-inner {
    padding-right: 2rem;
    padding-left: 2rem;
  }
}

.page-inner-fill {
  padding: 0;
  height: calc(100% - 57px);
  display: flex;
  flex-direction: column;
}

.page-sidebar {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  width: 100%;
  display: flex;
  flex-direction: column;
  max-width: 22.5rem;
  box-shadow: none;
  background-color: #fff;
  transform: translate3d(100%,0,0);
  overflow: auto;
  z-index: 999;
  transition: transform .2s ease-in-out;
  border-left: 1px solid rgba(61,70,79,.125)!important;
  .back {
    width: 100%;
    display: flex;
    align-items: center;
    padding: 1rem;
    box-shadow: 0 0 0 1px rgba(61,70,79,.05), 0 1px 3px 0 rgba(61,70,79,.15);
    font-size: 15px;
  }
}

.page-sidebar-section {
  flex: 1;
  overflow-y: auto;
}

@media (min-width: 1200px) {
  .page-sidebar {
    transform: translateZ(0);
  }
}

@media (max-width: 1200px) {
  .page-wrapper {
    &.has-sidebar {
      .page-inner {
        margin-right: 0px;
      }
    }
  }
  .pagesidebar_open {
    .page-sidebar {
      transform: translate3d(0, 0, 0) !important;
      max-width: unset;
    }
  }
}

.page-with-aside{
  display: flex;
  .page-aside{
    background: $white-color;
    width: 280px;
    min-height: 100vh;
    border-right: 1px solid #f1f1f1;
    border-left: 1px solid #f1f1f1;
    padding: 15px 0;    
    .aside-header{
      padding: 15px 22px;
      .title{
        font-size: 24px;
      }
      .description{
        font-size: 12px;
      }
    }
    .aside-nav{
      .nav{
        flex-direction: column;
        > li {
          padding: 8px 22px;
          margin-bottom: 5px;
          &:hover, &:focus, &.active {
            background: #fafafa;
          } 
          &.active{
            padding: 12px 22px;
            font-weight: $font-weight-bold;
            > a {
              color: #575962 !important;
            }
          }
          > a {
            color: #83848a;
            display: flex;
            align-items: center;
            font-size: 12px;
            &:hover, &:focus{
              text-decoration: none;
            }
            i {
              font-size: 20px;
              margin-right: 15px;
              color: #a1a2a6;
            }
          }
        }
      }
      .label {
        padding: 5px 22px;
        margin-top: 22px;
        margin-bottom: 5px;
        display: block
      }
    }
    .aside-compose{
      padding: 25px 22px;
    }
  }
  .page-content{
    width: calc(100% - 280px);
  }
}

.footer {
  border-top: 1px solid #eee;
  padding: 15px;
  background: $white-color;
  position: absolute;
  width: 100%;
  .container-fluid {
    display: flex;
    align-items: center;
  }
}

/* //sidebar minimized  */
@media screen and (min-width: 991px) {
  .sidebar_minimize{
    .main-panel {
      width: calc(100% - 75px);
      transition: all .3s;
    }
    .logo-header {
      width: 75px;
      transition: all .3s;
      padding: 0px;
      text-align: center;
      .big-logo {
        margin-right: 0px;
      }
      .logo {
        position: absolute;
        transform: translate3d(25px,0,0);
        opacity: 0;
        img {
          display: none;
        }
      }
    }
    .navbar-minimize {
      position: absolute;
      left: 50%;
      transform: translateX(-50%);
      height: 100%;
      right: 0 !important;
    }
    .sidebar{
      width: 75px;
      transition: all .3s;
      .sidebar-wrapper{
        width: 75px;
        transition: all .3s;
        .user {
          padding-left: 0px;
          padding-right: 0px;
          [class^="avatar-"] {
            float: none !important;
            margin: auto;
          }
          .info{
            display: none;
            span {
              display: none;
            }
          }
        }
        .nav-item {
          position : relative;
          a {
            .letter-icon {
              display: block !important;
            }
            .badge, span, .caret, p {
              display: none;
              transition: all .3s;
            }
            .sidebar-mini-icon{
              display: block !important;
              margin-right: 0px;
            }
          }
          &.submenu, &.active{
            .nav-collapse {
              display: none;
            }
          }
        }
        .nav-section{
          .text-section{
            display: none;
          }
          .sidebar-mini-icon{
            display: block;
          }
        }
      }
    }
    .sidebar:hover{
      width: 240px;
      .sidebar-wrapper{
        width: 240px;
        .user {
          padding-left: 15px;
          padding-right: 15px;
          [class^="avatar-"] {
            float: left !important;
            margin-right: 11px !important;
          }
          .info{
            display: block;
            span {
              display: block;
            }
          }
        }
        .nav-item {
          a {
            .badge, span, .caret, p {
              display: block;
            }
            .sidebar-mini-icon{
              display: block !important;
              margin-right: 15px;
            }
          }
          &.submenu, &.active{
            .nav-collapse {
              display: block;
            }
          }
        }
        .nav-section{
          .sidebar-mini-icon {
            display: none;
          }
          .text-section{
            display: block;
          }
        }
      }
    }
    &.sidebar_minimize_hover {
      .logo-header{
        width: 240px;
        padding-left: 25px;
        padding-right: 25px;
        text-align: left;
        .big-logo {
          margin-right: 8px;
        }
        .logo {
          opacity: 1 !important;
          transform: translate3d(0, 0, 0) !important;
          position: relative !important;
          img {
            display: inline-block !important;
          }
        }
      }
      .main-panel {
        width: calc(100% - 240px);
      }
    }
  }
  .sidebar_minimize_hover {
    .navbar-minimize {
      right: 18px !important;
      transform: translateX(0%) !important;
      left: unset;
    }
  }
}

.quick_sidebar_open{
  .quick-sidebar {
    right: 0px !important;
  }
}

/*    Flex-1    */

.flex-1 {
  -ms-flex: 1;
  flex: 1;
}

/*    Metric    */
.metric {
  display: flex;
  padding: 1rem;
  flex-direction: column;
}



/*     Responsive     */
@media screen and (max-width: 700px) {
  .row-card-no-pd { 
    [class*=col-] .card:before {
      width: 0px !important;
    }
    .card {
      border-bottom-width: 1px;
      &:last-child {
        border-bottom-width: 0px;
      }
    }
  }
}

@media screen and (min-width: 991px) {
  .main-header .logo-header {
    line-height: 52px;
  }
  .toggle-nav-search {
    display: none;
  }
  #search-nav {
    display: block !important;
  }
  .sidebar {
    .scroll-element {
      opacity: 0;
      transition: all .2s;
    }
    &:hover .scroll-element {
      opacity: 1;
    }
  }
  .sidebar[data-background-color] {
    &:before {
      background: rgba(255, 255, 255, 0.2) !important;
      z-index: 1000;
    }
  }
}

@media screen and (max-width: 991px) {
  .main-header[data-background-color] {
    .navbar-header {
      border-top: 1px solid rgba(0, 0, 0, 0.1);
    }
  }
  .sidebar {
    position: fixed;
    left: 0 !important;
    right: 0;
    -webkit-transform: translate3d(-270px, 0, 0);
    -moz-transform: translate3d(-270px, 0, 0);
    -o-transform: translate3d(-270px, 0, 0);
    -ms-transform: translate3d(-270px, 0, 0);
    transform: translate3d(-270px, 0, 0) !important;
    transition: all .5s;
    padding-top: 0px;
    &:before {
      background: none;
    }
  }
  .nav_open .sidebar {
    -webkit-transform: translate3d(0px, 0, 0);
    -moz-transform: translate3d(0px, 0, 0);
    -o-transform: translate3d(0px, 0, 0);
    -ms-transform: translate3d(0px, 0, 0);
    transform: translate3d(0px, 0, 0) !important;
    border-right: 1px solid #f1f1f1;
  }
  .sidebar .sidebar-wrapper {
    padding-top: 0px;
    .sidebar-content {
      padding-top: 0px !important;
    }
    .scroll-element.scroll-y {
      top: 0px !important;
    }
  }
  .nav_open {
    overflow: hidden !important;
    .wrapper {
      overflow-x: hidden;
    }
    .main-panel, .main-header {
      -webkit-transform: translate3d(240px, 0, 0);
      -moz-transform: translate3d(240px, 0, 0);
      -o-transform: translate3d(240px, 0, 0);
      -ms-transform: translate3d(240px, 0, 0);
      transform: translate3d(240px, 0, 0) !important;
    }
  }
  .quick_sidebar_open .quick-sidebar {
    width: 350px;
  }
  .main-header {
    transition: all .5s;
  }
  #search-nav {
    margin: 0 auto !important;
  }
  .main-panel {
    width: 100%;
    transition: all .5s;
    .page-header {
      .dropdown-menu {
        &:after {
          right: 16px !important;
        }
      }
    }
  }
  .page-inner {
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
  }
  .main-header .logo-header {
    display: flex;
    width: 100% !important;
    text-align: left;
    position: relative;
    padding-left: 15px;
    padding-right: 15px;
    .logo {
      position: absolute;
      left: 50%;
      transform: translateX(-50%);
    }
    .navbar-toggler {
      height: 100%;
      margin-left: 0px !important;
      opacity: 1;
      display: block;
      order: 1;
    }
    .more {
      opacity: 1;
      color: #545454;
      cursor: pointer;
      display: inline-block;
      line-height: 56px;
      order: 3;
      width: unset;
      margin-left: auto;
    }
    .navbar-brand {
      position: unset !important;
    }
    .big-logo{
      .logo-img {
        width: 35px;
        height: 35px;
      }
    }
  }
  .nav-search {
    width: 100%;
    margin-right: 0 !important;
  }
  .navbar-header {
    position: absolute;
    width: 100%;
    transform: translate3d(0, -200px, 0) !important;
    transition: all .5s;
  }
  .topbar_open {
    .navbar-header {
      transform: translate3d(0, 56px, 0) !important;
      padding: 6px;
      .navbar-nav {
        > .nav-item {
          .nav-link {
            i {
              font-size: 19px;
            }
          }
          &:last-child {
            .nav-link {
              padding: 0px !important;
            }
            .quick-sidebar-toggler {
              padding-left: 5px !important;
            }
          }
        }
      }
    }
    .toggle-nav-search {
      display: list-item;
    }
    #search-nav {
      text-align: center;
      width: 100%;
      padding: 10px 15px 0px;
      order: 1;
    }
    .main-panel {
      transform: translate3d(0, 65px, 0) !important;
    }
    > .content {
      margin-top: 0px !important;
    }
  }
  .nav_open.topbar_open .main-panel {
    transform: translate3d(240px, 60px, 0) !important;
  }
  .navbar-header .navbar-nav {
    width: 100%;
    flex-direction: row;
    justify-content: center;
    margin-left: 0px !important;
    position: relative;
    .dropdown {
      position: unset;
    }
    .dropdown-menu {
      position: absolute;
      left: 0;
      right: 0;
      margin: 0 auto;
      max-width: 280px;
    }
  }
  .profile-pic span {
    display: none;
  }
  .navbar-minimize{
    display: none;
  }
  .page-title{
    font-size: 18px;
  }
  .card {
    .card-title {
      font-size: 16px;
    }
  }

  /* Dropzone */
  .dropzone {
    padding: 20px 15px !important;
    .dz-message {
      .message {
        font-size: 23px;
      }
      .note {
        font-size: 15px;
      }
    }
  }
}

@media screen and (max-width: 767px){
  .wizard-container {
    margin-left: 15px;
    margin-right: 15px;
  }
  .main-panel {
    .page-header {
      flex-direction: column;
      align-items: normal;
      position: relative;
      min-height: 43px;
      justify-content: center;
      .breadcrumbs {
        margin-left: 0px;
        padding-top: 15px;
        padding-left: 5px;
        padding-bottom: 0px;
        border-left: 0px;
      }
      .btn-group-page-header{
        position: absolute;
        right: 0px;
      }
    }
  }
  .footer .container-fluid{
    flex-direction: column;
    .copyright {
      margin-left: 0 !important;
      margin-top: 10px;
      margin-bottom: 15px;
    }
  }
}

@media screen and (max-width: 576px){
  #chart-container {
    min-height: 250px;
  }

  .form-check-inline {
    display: flex;
    flex-direction: column;
    align-items: left;
  }

  #calendar {
    .fc-toolbar {
      display: flex;
      flex-direction: column;
      %fc-position-margin {
        margin: auto;
        margin-bottom: 15px;
      }
      .fc-left {
        @extend %fc-position-margin;
        order: 1;
      }
      .fc-right {
        @extend %fc-position-margin;
        order: 3;
      }
      .fc-center {
        @extend %fc-position-margin;
        order: 2;
      }
    }
  }

  .conversations {
    .conversations-body {
      padding: 1.5rem 1rem;
    }
  }
}

@media screen and (max-width: 350px){
  .quick_sidebar_open .quick-sidebar {
    width: 100%;
    padding: 20px;
  }
}


/*_toggle.scss*/

/*      Toggle     */
.checkbox label .toggle, .checkbox-inline .toggle {
  margin-left: -20px;
  margin-right: 5px;
}

.toggle {
  position: relative;
  overflow: hidden;
  padding: .6rem .5rem;
}

.toggle-group, .toggle-off, .toggle-on {
  position: absolute;
  top: 0;
  bottom: 0;
}

.toggle input[type=checkbox] {
  display: none;
}

.toggle-group {
  width: 200%;
  left: 0;
  transition: left .35s;
  -webkit-transition: left .35s;
  -moz-user-select: none;
  -webkit-user-select: none;
}

.toggle.off .toggle-group {
  left: -100%;
}

.toggle-on {
  left: 0;
  right: 50%;
  margin: 0;
  border: 0;
  border-radius: 0;
  padding-left: 12px !important;
  padding-top: 6px !important;
  padding-bottom: 6px !important;
  font-size: 11px !important;
}

.toggle-off {
  left: 50%;
  right: 0;
  margin: 0;
  border: 0;
  border-radius: 0;
  padding-top: 6px !important;
  padding-bottom: 6px !important;
  font-size: 11px !important;
  color: $white-color !important;
}

.toggle-handle {
  position: relative;
  margin: 0 auto;
  padding-top: 0;
  padding-bottom: 0;
  height: 100%;
  width: 0;
  border-width: 0 1px;
}

.toggle.btn {
  min-width: 54px !important;
  height: 30px !important;
}

.toggle-on.btn {
  padding-right: 24px;
}

.toggle-off.btn {
  padding-left: 24px;
}

.toggle.btn-lg {
  min-width: 79px;
  min-height: 45px;
}

.toggle-on.btn-lg {
  padding-right: 31px;
}

.toggle-off.btn-lg {
  padding-left: 31px;
}

.toggle-handle.btn-lg {
  width: 40px;
}

.toggle.btn-sm {
  min-width: 50px;
  min-height: 30px;
}

.toggle-on.btn-sm {
  padding-right: 20px;
}

.toggle-off.btn-sm {
  padding-left: 20px;
}

.toggle.btn-xs {
  min-width: 35px;
  min-height: 22px;
}

.toggle-on.btn-xs {
  padding-right: 12px;
}

.toggle-off.btn-xs {
  padding-left: 12px;
}
</style>
<body>
	
<!-- 페이지 내 컨텐츠 제목 란 시작  -->
<!-- ============================================================== -->
<div class="page-wrapper">
	<!-- ============================================================== -->
	<!-- Bread crumb and right sidebar toggle -->
	<!-- ============================================================== -->
	<div class="page-breadcrumb">
		<div class="row">
			<div class="col-12 d-flex no-block align-items-center">
				<h4 class="page-title">대시보드</h4>
				<div class="ml-auto text-right"></div>
			</div>
		</div>
	</div>
	<!-- 페이지 내 컨텐츠 제목 란 끝  -->
	
	
 	

	<!-- 페이지내 컨텐츠 컨테이너 시작  -->
	<!-- ============================================================== -->
	<div class="container-fluid">
		<!-- ============================================================== -->
		<!-- Start Page Content -->
		<!-- ============================================================== -->
		<div class="row">
			<div class="col-md-6">
			
			
			
				
		
		

				<!-- 공지사항 시작  -->
				<div class="card">
					<div class="card-body">
						<h4 class="card-title m-b-0">공지사항</h4>
					</div>
					<ul class="list-style-none">

						<li class="d-flex no-block card-body border-top">
							<i class="fa fa-plus w-30px m-t-5"></i>
							<div>
								<a href="#" class="m-b-0 font-medium p-0">Maruti is a Responsive Admin theme</a>
								<span class="text-muted">But already everything was solved. It will ...</span>
							</div>
							<div class="ml-auto">
								<div class="tetx-right">
									<h5 class="text-muted m-b-0">19</h5>
									<span class="text-muted font-16">Jan</span>
								</div>
							</div>
						</li>
						
						<li class="d-flex no-block card-body border-top">
							<i class="fa fa-leaf w-30px m-t-5"></i>
							<div>
								<a href="#" class="m-b-0 font-medium p-0">Envato approved Maruti Admin template</a>
								<span class="text-muted">i am very happy to approved by TF</span>
							</div>
							<div class="ml-auto">
								<div class="tetx-right">
									<h5 class="text-muted m-b-0">20</h5>
									<span class="text-muted font-16">Jan</span>
								</div>
							</div>
						</li>
						
						<li class="d-flex no-block card-body border-top">
							<i class="fa fa-question-circle w-30px m-t-5"></i>
							<div>
								<a href="#" class="m-b-0 font-medium p-0"> I am alwayse here if you have any question</a>
								<span class="text-muted">we glad that you choose our template</span>
							</div>
							<div class="ml-auto">
								<div class="tetx-right">
									<h5 class="text-muted m-b-0">15</h5>
									<span class="text-muted font-16">Jan</span>
								</div>
							</div>
						</li>
						
						<li class="d-flex no-block card-body border-top">
							<i class="fa fa-plus w-30px m-t-5"></i>
							<div>
								<a href="#" class="m-b-0 font-medium p-0">Maruti is a Responsive Admin theme</a>
								<span class="text-muted">But already everything was solved. It will ...</span>
							</div>
							<div class="ml-auto">
								<div class="tetx-right">
									<h5 class="text-muted m-b-0">19</h5>
									<span class="text-muted font-16">Jan</span>
								</div>
							</div>
						</li>
						
					</ul>
				</div>
				<!--공지사항 끝 -->

				<!--time line 시작 -->
				<div class="card">
					<div class="card-body">
						<h4 class="card-title m-b-0">타임라인</h4>
					</div>
					
					<div class="comment-widgets scrollable">
						<!-- Comment Row -->
						<div class="d-flex flex-row comment-row m-t-0">
							<div class="p-2">
								<img src="resources/hari/assets/images/users/1.jpg" alt="user" width="50" class="rounded-circle">
							</div>
							<div class="comment-text w-100">
								<h6 class="font-medium">James Anderson</h6>
								<span class="m-b-15 d-block">Lorem Ipsum is simply dummy text of the printing and type setting industry. </span>
								<div class="comment-footer">
									<span class="text-muted float-right">April 14, 2016</span>
									<button type="button" class="btn btn-cyan btn-sm">Edit</button>
									<button type="button" class="btn btn-success btn-sm">Publish</button>
									<button type="button" class="btn btn-danger btn-sm">Delete</button>
								</div>
							</div>
						</div>

						<!-- Comment Row -->
						<div class="d-flex flex-row comment-row">
							<div class="p-2">
								<img src="resources/hari/assets/images/users/3.jpg" alt="user" width="50" class="rounded-circle">
							</div>
							<div class="comment-text w-100">
								<h6 class="font-medium">Johnathan Doeting</h6>
								<span class="m-b-15 d-block">Lorem Ipsum is simply dummy text of the printing and type setting industry. </span>
								<div class="comment-footer">
									<span class="text-muted float-right">August 1, 2016</span>
									<button type="button" class="btn btn-cyan btn-sm">Edit</button>
									<button type="button" class="btn btn-success btn-sm">Publish</button>
									<button type="button" class="btn btn-danger btn-sm">Delete</button>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!--타임 라인 끝-->

			</div>
			<!--col-md-6 컨텐츠 컨테이너 내에서 왼쪽 부분 (공지사항 + 타임라인 합친 부분) 끝 -->

			<!--오른쪽 div 컨테이너 부분 시작 (전자결재 + 투두리스트)-->
			<div class="col-md-6">

				<!--전자 결재 시작-->
				<div class="card">
					<div class="card-body">
						<h5 class="card-title m-b-0">전자 결재</h5>
					</div>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">진행중<br>문서
									<td>0</td>
								</th>
								<th scope="col">보류중<br>문서
									<td>2</td>
								</th>
							</tr>
							
							<tr>
								<th scope="col">결제중<br>문서
									<td>0</td>
								</th>
								<th scope="col">보류중<br>문서
									<td>2</td>
								</th>
							</tr>
						</thead>
					</table>
				</div>
				<!--전자 결재 끝 -->




			<!-- Custom template | don't include it in your project! 수정한 부분 나중에 다시 고칠 것 !!  2020.01.13 수연 -->
				
				
<!-- <div class="main-panel">
<div class="content">
	<div class="page-inner"> 
	 -->
		<div class="custom-template">
			<div class="title">Settings</div>
			<div class="custom-content">
				<div class="switcher">
					<div class="switch-block">
					
					
					
						<h4>Topbar</h4>
						<div class="btnSwitch">
							<button type="button" class="changeMainHeaderColor" data-color="blue"></button>
							<button type="button" class="selected changeMainHeaderColor" data-color="purple"></button>
							<button type="button" class="changeMainHeaderColor" data-color="light-blue"></button>
							<button type="button" class="changeMainHeaderColor" data-color="green"></button>
							<button type="button" class="changeMainHeaderColor" data-color="orange"></button>
							<button type="button" class="changeMainHeaderColor" data-color="red"></button>
						</div>
					</div>
					<div class="switch-block">
						<h4>Background</h4>
						<div class="btnSwitch">
							<button type="button" class="changeBackgroundColor" data-color="bg2"></button>
							<button type="button" class="changeBackgroundColor selected" data-color="bg1"></button>
							<button type="button" class="changeBackgroundColor" data-color="bg3"></button>
						</div>
					</div>
				</div>
			</div>
			<div class="custom-toggle">
				<i class="fas fa-cogs"></i>
				<!-- <i class="flaticon-settings"></i> -->
			</div>
		</div>
<!--  			</div>
		</div>
		</div> -->
		<!-- End Custom template -->

	
	

	
	
	
			


				<!-- todo list 시작 -->
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">To Do List</h4>
						<div class="todo-widget scrollable" style="height: 450px;">
							<ul class="list-task todo-list list-group m-b-0" data-role="tasklist">
								<li class="list-group-item todo-item" data-role="task">
								
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="customCheck">
										<label class="custom-control-label todo-label" for="customCheck">
											<span class="todo-desc">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</span>
											<span class="badge badge-pill badge-danger float-right">Today</span>
										</label>
									</div>
									
									<ul class="list-style-none assignedto">
										<li class="assignee">
											<img class="rounded-circle" width="40" src="resources/hari/assets/images/users/1.jpg" alt="user" data-toggle="tooltip" data-placement="top" title="" data-original-title="Steave">
										</li>
										
										<li class="assignee">
											<img class="rounded-circle" width="40" src="resources/hari/assets/images/users/2.jpg" alt="user" data-toggle="tooltip" data-placement="top" title="" data-original-title="Jessica">
										</li>
										
										<li class="assignee">
											<img class="rounded-circle" width="40" src="resources/hari/assets/images/users/3.jpg" alt="user" data-toggle="tooltip" data-placement="top" title="" data-original-title="Priyanka">
										</li>
										
										<li class="assignee">
											<img class="rounded-circle" width="40" src="resources/hari/assets/images/users/4.jpg" alt="user" data-toggle="tooltip" data-placement="top" title="" data-original-title="Selina">
										</li>
									</ul>
								</li>
								
								<li class="list-group-item todo-item" data-role="task">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="customCheck1">
										<label class="custom-control-label todo-label" for="customCheck1">
											<span class="todo-desc">Lorem Ipsum is simply dummy text of the printing</span>
											<span class="badge badge-pill badge-primary float-right">1 week </span>
										</label>
									</div>
									<div class="item-date">26 jun 2017</div>
								</li>
								
								<li class="list-group-item todo-item" data-role="task">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="customCheck2">
										<label class="custom-control-label todo-label" for="customCheck2">
											<span class="todo-desc">Give Purchase report to</span>
											<span class="badge badge-pill badge-info float-right">Yesterday</span>
										</label>
									</div>
									
									<ul class="list-style-none assignedto">
										<li class="assignee">
											<img class="rounded-circle" width="40" src="resources/hari/assets/images/users/3.jpg" alt="user" data-toggle="tooltip" data-placement="top" title="" data-original-title="Priyanka">
										</li>
										
										<li class="assignee">
											<img class="rounded-circle" width="40" src="resources/hari/assets/images/users/4.jpg" alt="user" data-toggle="tooltip" data-placement="top" title="" data-original-title="Selina">
										</li>
									</ul>
								</li>
								
								<li class="list-group-item todo-item" data-role="task">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="customCheck3">
										<label class="custom-control-label todo-label" for="customCheck3">
											<span class="todo-desc">Lorem Ipsum is simply dummy text of the printing </span>
											<span class="badge badge-pill badge-warning float-right">2 weeks</span>
										</label>
									</div>
									<div class="item-date">26 jun 2017</div>
								</li>
								
								<li class="list-group-item todo-item" data-role="task">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="customCheck4">
										<label class="custom-control-label todo-label" for="customCheck4">
											<span class="todo-desc">Give Purchase report to</span>
											<span class="badge badge-pill badge-info float-right">Yesterday</span>
										</label>
									</div>
									
									<ul class="list-style-none assignedto">
										<li class="assignee">
											<img class="rounded-circle" width="40" src="resources/hari/assets/images/users/3.jpg" alt="user" data-toggle="tooltip" data-placement="top" title="" data-original-title="Priyanka">
										</li>
										<li class="assignee">
											<img class="rounded-circle" width="40" src="resources/hari/assets/images/users/4.jpg" alt="user" data-toggle="tooltip" data-placement="top" title="" data-original-title="Selina">
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!--투두리스트 끝-->

			</div>
			<!--col-md-6 컨텐츠 컨테이너 내에서 왼쪽 부분 (전자 결재 + 투두리스트 합친 부분) 끝 -->

		</div>
		<!-- <div class="row"> 부분 끝 div-->
	</div>
	<!--<div class="container-fluid"> 부분 끝 div-->
	
	
	
	
	
	
</div>
</body>
<script>
//"use strict"; //setting-demo.js

//Setting Color

$(document).ready(function(){
	


$(window).resize(function() {
	$(window).width(); 
});


$('.changeMainHeaderColor').on('click', function(){
	if($(this).attr('data-color') == 'default'){
		$('#main-header').removeAttr('data-background-color');
	} else {
		$('#main-header').attr('data-background-color', $(this).attr('data-color'));
	}

	$(this).parent().find('.changeMainHeaderColor').removeClass("selected");
	$(this).addClass("selected");
/* 	layoutsColors(); */
});

$('.changeBackgroundColor').on('click', function(){
	$('.page-wrapper').removeAttr('data-background-color');
	$('.page-wrapper').attr('data-background-color', $(this).attr('data-color'));
	$(this).parent().find('.changeBackgroundColor').removeClass("selected");
	$(this).addClass("selected");
});

var toggle_customSidebar = false,
custom_open = 0;

if(!toggle_customSidebar) {
	var toggle = $('.custom-template .custom-toggle');

	toggle.on('click', (function(){
		if (custom_open == 1){
			$('.custom-template').removeClass('open');
			toggle.removeClass('toggled');
			custom_open = 0;
		}  else {
			$('.custom-template').addClass('open');
			toggle.addClass('toggled');
			custom_open = 1;
		}
	})
	);
	toggle_customSidebar = true;
}

});

/// ready.js 

</script>


