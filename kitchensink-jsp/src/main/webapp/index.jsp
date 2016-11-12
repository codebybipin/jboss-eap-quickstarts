<%--
    JBoss, Home of Professional Open Source
    Copyright 2013, Red Hat, Inc. and/or its affiliates, and individual
    contributors by the @authors tag. See the copyright.txt in the
    distribution for a full listing of individual contributors.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at
    http://www.apache.org/licenses/LICENSE-2.0
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<html>
<head>
<title>Corposoft</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Here we include the css file  -->
<link rel="stylesheet" type="text/css" href="resources/css/screen.css" />
</head>
    <% 
    String dbname = System.getenv("MYSQL_DATABASE");
    String host = System.getenv("MYSQL_SERVICE_HOST");
    String port = System.getenv("MYSQL_SERVICE_PORT");
    String user = System.getenv("MYSQL_USER");
    String pwd = System.getenv("MYSQL_PASSWORD");
    
    String databaseURL = "jdbc:mysql://";
    host = "172.31.8.223";
databaseURL += host;
databaseURL += ":3306/" + dbname;
Connection connection;
try {
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(databaseURL, user,
pwd);

PreparedStatement selectCash = connection.prepareStatement("select * from user");
ResultSet rs= selectCash.executeQuery();
     
    
    
%>
    
<body>
    
        <div >
            <table>
        <thead></thead>
        <tbody>
            <% while(rs.next()){ %>
        <tr>
            <td><%= host+":"+user %></td>
            <td><%= rs.getString("id") %></td>
            <td><%= rs.getString("name") %></td>
            </tr>
            
        <% }
        } catch (SQLException ex) {
        %>
        <div>"host " <%= host %></div>
            <div>"port " <%= port %></div>
            <div>"user " <%= user %></div>
            <div>"password " <%= pwd %></div>
            <div>"database " <%= dbname %></div>
 <% }
        
        %>
        </tbody>
    </table>
  
            

       
    </div>
</body>
</html>
