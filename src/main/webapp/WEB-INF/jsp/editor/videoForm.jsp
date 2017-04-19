<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta name="description" content="WebRTC code samples">
<meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1, maximum-scale=1">
<meta itemprop="description" content="Client-side WebRTC code samples">
<meta itemprop="image" content="../../../images/webrtc-icon-192x192.png">
<meta itemprop="name" content="WebRTC code samples">
<meta name="mobile-web-app-capable" content="yes">
<meta id="theme-color" name="theme-color" content="#ffffff">

<base target="_blank">

<title>Multiple peer connections</title>

<link rel="icon" sizes="192x192" href="../../../images/webrtc-icon-192x192.png">
<link href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/editor/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/editor/editor.css" />


</head>
<body>

  <div id="container">

    <video id="video1" autoplay muted></video>
    <video id="video2" autoplay></video>
    <video id="video3" autoplay></video>

    <div>
      <button id="startButton">Start</button>
      <button id="callButton">Call</button>
      <button id="hangupButton">Hang Up</button>
    </div>

  </div>

  <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
  <script src="${pageContext.request.contextPath}/js/editor/common.js"></script>
  <script src="${pageContext.request.contextPath}/js/editor/main.js"></script>

  <script src="${pageContext.request.contextPath}/js/editor/ga.js"></script>


</body>
</html>