<%-- 
    Document   : Adminupdatebk
    
    Author     : 91790
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
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

function check1()
{
    bid=document.getElementById('sb1').value;
    bn=document.getElementById('bn').value;
    cid=document.getElementById('cid').value;
    scid=document.getElementById('scid').value;
    aut=document.getElementById('aut').value;
    pub=document.getElementById('pub').value;
    pc=document.getElementById('pc').value;
    ed=document.getElementById('ed').value;
    
    if(bid==""||bn==""||cid==""||scid==""||aut==""||pub==""||pc==""||ed=="")
    {
        alert("Enter all the values");
    }
    else
    {
        var ff=document.getElementById('ufrm1');
        ff.action="./UpdatebookServlet";
        ff.submit();    
    }
}
function check2()
{
    var ff=document.getElementById('ufrm1');
    ff.action="./DeletebookServlet";
    ff.submit();    
}

</script>
<body onload="startTime()">
    <form id="ufrm1">
<div id="header">
    <h1 style=" color: #254360">My e-Books</h1>
    <h2 style="color: darkred">Best Book Seller</h2>
    <!--<img src="image/logo2.jpg" width="325">-->
    <div id="dtm" style="text-align: right; font-family: Californian;  font-size: large;color: #254360"></div>
    <br>
    
        <div id="menu">
            <ul>
		               
                <li><a href="AdminHome.jsp">Home</a></li>
                <li><a href="Adminaddbk.jsp">Add Books</a></li>        
          <li><a href="Adminviewbk.jsp">View Books</a></li>
          <li><a href="Adminupdatebk.jsp" class="active">Update Books</a></li>
          <li><a href="Adminrecomm.jsp">Recommendation</a></li>
          <li><a href="index.jsp">LogOut</a></li>
          
          
	</ul>
             
</div>
</div>
    <br><br>
    <div id="bd">

    <div id="content">
    <br/>
    <h2 style=" color: #254360">Welcome to My e-Books</h2> <br/>
    <b>UPDATE BOOK DETAILS</b><br/>
    <br>
        <%
            BRS_Servlet.DBConnection db=new BRS_Servlet.DBConnection();
            Statement st=db.stt;
            ResultSet rs2=st.executeQuery("select * from book");
            //String sg="";
            //while(rs2.next())
            //{
                //sg=sg+rs2.getString(1)+"#"+rs2.getString(2)+"#"+rs2.getString(3)+"#"+rs2.getString(4);                
            //}
            
            ResultSet rs=st.executeQuery("select BookId from book");       
            
            //while(rs.next())
              //  ind=rs.getInt(1);
            
            
        %>
        <table>
            <tr>
                <td> BookId  </td> 
                <td> 
                    <select id="sb1" name="sb1">
                        <%while(rs.next())
                        {
                        %>
                        <option> <%= rs.getString(1) %>
                        </option>
                        <%}%>
                               
                    </select>
                </td>
            
        </tr>
        <tr>
            <td>BookName </td> 
            <td><input type="text" name="bn" id="bn"></td>
        </tr>
<tr>
    <td>CateId</td>
    <td><input type="text" name="cid" id="cid"></td>
        </tr>
<tr>
                <td>SubCateId</td>
                <td><input type="text" name="scid" id="scid"></td>
        </tr>
<tr>
                <td>Author</td><td><input type="text" name="aut" id="aut"></td>
        </tr>
<tr>
                <td>Publisher</td>
                <td><input type="text" name="pub" id="pub"></td>
        </tr>
<tr>
                <td>Price</td>
                <td><input type="text" name="pc" id="pc"></td>
        </tr>
<tr>
                <td>Edition</td>
                <td><input type="text" name="ed" id="ed"></td>
        </tr>
        <tr>
            <td><input type="button" value="Update" onclick="check1()"></td>
            <td><input type="button" value="Delete" onclick="check2()"></td>
        </tr>
        </table>
<br/> <br/>
	</div>
    </div>
<div id="footer">
	<p>Copyright &copy; 2021 my e-books  All Rights Reserved </p>
</div>
    </form>
</body>
</html>

