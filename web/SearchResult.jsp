<%-- 
    Document   : SearchResult
    
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sn=request.getSession();
    String res=sn.getAttribute("SearchRes").toString();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Recommendation System</title>
        <link href="default1.css" rel="stylesheet" type="text/css" />
    </head>
    <script>
function startTime() {
    var today=new Date();
    var h=today.getHours();
    if(h>12)
      h=h-12;
    var m=today.getMinutes();
    var s=today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('dtm').innerHTML = today.toDateString()+"   "+h+":"+m+":"+s;
    var t = setTimeout(function(){startTime()},500);
}

function checkTime(i) {
    if (i<10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}
</script>
<body onload="startTime()">
<div id="header">
    <h1 style=" color: #254360">My e-Books</h1>
    <h2 style="color: darkred">Best Book Seller</h2>
    <!--<img src="image/logo2.jpg" width="325">-->
    <div id="dtm" style="text-align: right; font-family: Californian;  font-size: large;color: #254360"></div>
    <br>
    
        <div id="menu">
            <ul>
		               
                <li><a href="Home.jsp">Home</a></li>
            <li><a href="Search.jsp" class="active">Search</a></li>        
          <li><a href="buy.jsp">Buy</a></li>
            <li><a href="recommend.jsp">Recommendation</a></li>
            <li><a href="index.jsp">Logout</a></li>
	</ul>
             
</div>
</div>
    <br><br>
    <div id="bd">

    <div id="content">
    <br/>
    <h2 style=" color: #254360">Book Search Result</h2> <br/>
		<%
                    if(res.equals(""))
                    {%>
                      There is no book  
                    <%}
                    else
                    {
                        String r1[]=res.split("@");
                        
                    %>
                        
                        <div class="scrollit">
                        <table border="1">
                            <th style=" color: #254360">Book Id</th>
                            <th style=" color: #254360">Book Name</th>
                            <th style=" color: #254360">Category Id</th>
                            <th style=" color: #254360">Sub-Category Id</th>
                            <th style=" color: #254360">Author</th>
                            <th style=" color: #254360">Publisher</th>
                            <th style=" color: #254360">Price</th>
                            <th style=" color: #254360">Edition</th> 
                            
                            <%
                        for(int i=0;i<r1.length;i++)
                        {
                            String r2[]=r1[i].split("#");%>
                            <tr>
                                <td><%= r2[0]%></td>
                                <td><%= r2[1]%></td>
                                <td><%= r2[2]%></td>
                                <td><%= r2[3]%></td>
                                <td><%= r2[4]%></td>
                                <td><%= r2[5]%></td>
                                <td><%= r2[6]%></td>
                                <td><%= r2[7]%></td>
                            </tr>
                        <%}
                            %>
    </table>
                        </div>
                 <%   }
                %>
<br/> <br/>
	</div>
    </div>
<div id="footer">
	<p>Copyright &copy; 2021 my e-books  All Rights Reserved </p>
</div>
        
</body>
</html>

