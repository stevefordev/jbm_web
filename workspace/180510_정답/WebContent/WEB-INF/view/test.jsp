<%@page import="java.util.Scanner"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax로 파일 업로드예제</title>
<style>
#imgBox img {
	margin:10px;
	border:5px solid #424242;
	box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
}
</style>
</head>
<body>
<h1>ajax로 파일 업로드예제</h1>
 <input name="upload" id="upload" type="file"/>
 <div id="imgBox"></div>
 <script src="/js/jquery.js"></script>
 <script>
 var $upload = $('#upload');
 
 $upload.on("change",function() {
	 
     var data = new FormData();
     
    var file =  $upload.get(0).files[0];
     
    data.append('upload', file);
   	data.append('folder','profile');
   	data.append('size',160);

     $.ajax({
         url: 'ajax/upload',
         type: "post",
         dataType: "json",
         data: data,
         processData: false,
         contentType: false,
         success: function(json) {
      		 $("<img>").attr("src","/profile/"+json.name).appendTo("#imgBox");
        	
         }, error: function(jqXHR, textStatus, errorThrown) {
        	 
        	 alert(textStatus);
         }
     });
 });
 
 
 </script>
</body>
</html>  
    