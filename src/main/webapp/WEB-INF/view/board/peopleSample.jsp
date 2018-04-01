<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<title>Introduce</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4 {font-family:"Lato", sans-serif}
.mySlides {display:none}
.w3-tag, .fa {cursor:pointer}
.w3-tag {height:15px;width:15px;padding:0;margin-top:6px}
.w3-theme-d2 {
    color: #fff !important;
    background-color: #4d636f !important;
}


.w3-bars {
width: 100%;
    overflow: hidden;

}

.w3-theme-d4 {
    color: #fff !important;
    background-color: #3F5E9F!important;
}

.w3-theme-d2 {
    color: #fff !important;
    background-color:#3F5E9F!important;
}


</style>
<body>

<!-- Links (sit on top) -->
  <div class="w3-top">
 <div class="w3-bars w3-theme-d2 w3-left-align w3-large">

  <a href="/" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>Scodule</a>
<a href="/samplePeople" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white w3-right" title="Messages"><i class="fa fa-group"></i></a>
  <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white w3-right" title="Account Settings"><i class="fa fa-film"></i></a>
  <a href="/sample" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white w3-right" title="News"><i class="fa fa-search"></i></a> 
 </div>
</div>

<!-- Content -->
<div class="w3-content" style="max-width:1100px;margin-top:80px;margin-bottom:80px">




  <!-- Grid -->
  <div class="w3-row-padding" id="about">
    <div class="w3-center w3-padding-64">
      <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">How it Works</span>
    </div>

    <div class="w3-third w3-margin-bottom">
      <div class="w3-card-4">
          <img src="/static/img/intro.png"  alt="John" style="width:100%">
      
      </div>
    </div>

    <div class="w3-third w3-margin-bottom">
      <div class="w3-card-4">
       <img src="/static/img/intro2.png"  alt="John" style="width:100%">
      </div>
    </div>

    <div class="w3-third w3-margin-bottom">
      <div class="w3-card-4">
     <img src="/static/img/intro3.png"  alt="John" style="width:100%">
      </div>
    </div>
  </div>
  
  

</div>
<script>
// Slideshow
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demodots");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length} ;
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-white", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-white";
}
</script>

</body>
</html>
    
    