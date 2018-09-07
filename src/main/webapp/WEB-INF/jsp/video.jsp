<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>语音识别</title>
<link rel="stylesheet" href="../../source/css/video.css">
<script src="../../source/js/jquery.min.js"></script>
</head>
<body>
    <img src="../../source/images/wenzi.png" class="wenzi">
    <img src="../../source/images/wenzi2.png" class="wenzi2" style="display:none;margin-top:5px;">
    <br>
    <a onclick="changeTu()" class="change"><img src="../../source/images/demo.png" style="margin-top:35px;"></a>
    <a class="change2"><img src="../../source/images/demo2.png" class="change2"></a><br>
    <audio controls autoplay></audio>
<script type="text/javascript" src="../../source/js/HZRecorder.js"></script>
    <script>
    
        function changeTu(){
        	$(".change").hide();
        	$(".change2").show();
        	$(".wenzi").hide();
        	$(".wenzi2").show();
        	startRecording();
        }
        var recorder;

        var audio = document.querySelector('audio');

        function startRecording() {
            HZRecorder.get(function (rec) {
                recorder = rec;
                recorder.start();
                setTimeout("stopRecording()",6100); 
               setTimeout("uploadAudio()",6100);
            });
            
            
        }

        function stopRecording() {
            recorder.stop();
        }

        function playRecording() {
            recorder.play(audio);
        }

        function uploadAudio() {
            recorder.upload("uploadVideo.do", function (state, e) {
                switch (state) {
                    case 'uploading':
                        //var percentComplete = Math.round(e.loaded * 100 / e.total) + '%';
                        break;
                    case 'ok':
                        //alert(e.target.responseText);
                        //alert("上传成功");
                        top.location.href="videoSearch.do";
                        break;
                    case 'error':
                        alert("上传失败");
                        break;
                    case 'cancel':
                        alert("上传被取消");
                        break;
                }
            });
        }

    </script>
</body>
</html>