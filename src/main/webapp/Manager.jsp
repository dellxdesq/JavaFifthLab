<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10.03.2024
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<<%@ page import="java.io.File" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String directory = request.getParameter("path");
    File file = new File(directory);
    String parentDirectoryPath = file.getParent();

    if (parentDirectoryPath == null) {
        parentDirectoryPath = "/";
    }


%>

<html>
<head>
    <title>Manager</title>
</head>
<body>
<p><b><%= request.getAttribute("currentTime") %></b></p>
<html>
<head>
    <title>Менеджер файлов</title>
</head>
<body>
<h1>Текущая директория: "<%=directory%> "</h1>
<p><a href=<%="?path="+parentDirectoryPath.replace("\\","/")%>/>Назад</p>
<table>
    <tr>
        <th>Папка</th>
        <th>Перейти</th>
        <th>Размер(байты)</th>
        <th>Последнее изменение</th>
    </tr>
    <%
        File[] itemList = (File[]) request.getAttribute("folders");
        for (File item : itemList) {
    %>
    <tr>
        <th><%= item.getName()%></th>
        <th><a href="<%= "?path=" + URLEncoder.encode(item.getAbsolutePath(), "UTF-8") %>">Перейти</a></th>
        <th><%= item.length()%></th>
        <th><%= new Date(item.lastModified())%></th>
    </tr>
    <% } %>
    <tr>
        <th>Файл</th>
        <th>Ссылка на скачивание</th>
        <th>Размер(байты)</th>
        <th>Последнее изменение</th>
    </tr>
    <%
        File[] list = (File[]) request.getAttribute("files");
        for (File item : list) {
    %>
    <tr>
        <th><%= item.getName()%></th>
        <th><a href=<%="http://localhost:8080/ThirdLabJava_war_exploded/Download?path="+ item.getAbsolutePath().replace("\\", "/")%>> Скачать </a> </th>
        <th><%= item.length()%></th>
        <th><%= new Date(item.lastModified())%></th>
    </tr>
    <% } %>
</table>
<p></p>
</body>
</html>
