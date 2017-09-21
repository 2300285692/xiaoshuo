<%@ page import="java.sql.*" import="java.util.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title>爱阅读小说网</title>
	<style type="text/css">
    /*设置超链接样式*/
    table
    {
    		border-collapse: collapse;
    		border-spacing: 0;
    }
    a 
    {
        color: #5086a5; 
        text-decoration: none;
        font-size: 12px;
    }
    a:hover 
    {
        color: #5086a5; 
        text-decoration: underline;
        font-size: 12px;
    }
    a:visited 
    {
        color: #5086a5;
        font-size: 12px;
    }
    /*整个tab层居中，宽度为600px*/
    #tabDiv 
    {
        width:600px;
        margin:1em auto;
        padding-bottom: 10px;
        border-right: #b2c9d3 1px solid; 
        border-top: #b2c9d3 1px solid; 
        border-left: #b2c9d3 1px solid; 
        border-bottom: #b2c9d3 1px solid;
        background: #ffffff;
    }
    /*tab头的样式*/
    #tabsHead 
    {
         padding-left: 0px; 
         height: 26px; 
         background-color: #e8f7fc;
         font-size: 1em; 
         margin: 1px 0px 0px; 
         color: #5086a5; 
         line-height: 26px;
    }
    /*已选tab头（超链接）的样式*/
    .curtab 
    {
        padding-top: 0px;
        padding-right: 10px; 
        padding-bottom: 0px; 
        padding-left: 10px; 
        border-right: #b2c9d3 1px solid; 
        font-weight: bold; 
        float: left;
        cursor: pointer; 
        background: #ffffff; 
    }
    /*未选tab头（超链接）的样式*/
    .tabs 
    {
        border-right: #c1d8e0 1px solid; 
        padding-top: 0px;
        padding-right: 10px; 
        padding-bottom: 0px; 
        padding-left: 10px; 
        font-weight: normal; 
        float: left;
        cursor: pointer; 
    }
    p
    {
        font-size:9pt;
        margin-left:20pt;
    }
    </style>

    <script type="text/jscript">
        //显示tab（tabHeadId：tab头中当前的超链接；tabContentId要显示的层ID）
        function showTab(tabHeadId,tabContentId) 
        {
            //tab层
            var tabDiv = document.getElementById("tabDiv");
            //将tab层中所有的内容层设为不可见
            //遍历tab层下的所有子节点
            var taContents = tabDiv.childNodes;
            for(i=0; i<taContents.length; i++) 
            {
                //将所有内容层都设为不可见
                if(taContents[i].id!=null && taContents[i].id != 'tabsHead')
                {
                    taContents[i].style.display = 'none';
                }
            }
            //将要显示的层设为可见
            document.getElementById(tabContentId).style.display = 'block';          
            //遍历tab头中所有的超链接
            var tabHeads = document.getElementById('tabsHead').getElementsByTagName('a');
            for(i=0; i<tabHeads.length; i++) 
            { 
                //将超链接的样式设为未选的tab头样式
                tabHeads[i].className='tabs'; 
            }
            //将当前超链接的样式设为已选tab头样式
            document.getElementById(tabHeadId).className='curtab';
            document.getElementById(tabHeadId).blur();
        }
    </script>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
<title>首页</title>
</head>

<body background="lp.jpg">
	<center>
		<jsp:useBean id="db" class="bean.DBBean" scope="page"></jsp:useBean>
		<%
			request.setCharacterEncoding("UTF-8");
			String name = request.getParameter("name");
			String pwd = request.getParameter("pwd");
		%>

	</center>
	<%
   int num;
   if(application.getAttribute("num")==null)
   {
	   application.setAttribute("num","1");
   }
   else
   {
	   num=Integer.parseInt((String)application.getAttribute("num"));
	   num++;
	   application.setAttribute("num",Integer.toString(num));
   }

%>
  <SCRIPT LANGUAGE="javascript">
function gettime()
{ var t = new Date();
var hours = t.getHours();
var minutes = t.getMinutes();
var seconds = t.getSeconds();
var show_str ="";
show_str +=(hours > 12) ? "下午 ": "上午 ";
show_str += ((hours > 12) ? hours-12 : hours);
show_str += ((minutes <10) ? ":0" : ":") + minutes;
show_str += ((seconds <10) ? ":0" : ":") + seconds;
document.show_time.name1.value = show_str;
timerID = setTimeout("gettime()",1000);
}
</SCRIPT>
<FORM NAME="show_time" onSubmit="0">
现在时间是：
<INPUT TYPE="text" NAME="name1" SIZE=16 VALUE="">
</FORM>
<BODY onLoad="gettime()">
    <div style="width: 100%; font-family: 微软雅黑; text-align: center">
       爱阅读小说网</div>
       <div>

</div>
      <div style = "text-align:right;">
   <input type="button" name="jump" value="查找" onclick="location.href='chazhao.jsp'">
   </div>
    <div id="tabDiv" style="width: 1000px">

        <div id="tabsHead">
            <a id="tabs1" class="curtab" href="javascript:showTab('tabs1','tabContent1')">玄幻</a>
            <a id="tabs2" class="tabs" href="javascript:showTab('tabs2','tabContent2')">仙侠</a>
            <a id="tabs3" class="tabs" href="javascript:showTab('tabs3','tabContent3')">历史</a>
            <a id="tabs4" class="tabs" href="javascript:showTab('tabs4','tabContent4')">军事</a>
            <a id="tabs5" class="tabs" href="javascript:showTab('tabs5','tabContent5')">武侠</a>
            <a id="tabs6" class="tabs" href="javascript:showTab('tabs6','tabContent6')">科幻</a>
            <a id="tabs7" class="tabs" href="javascript:showTab('tabs7','tabContent7')">灵异</a>
        </div>

        <div id="tabContent1" style="display: block">
            <table style="border-width: 0; width: 100%">
            <%
            String sql1="select shuming,zuozhe from shu where leibie='1'";
			String shuchu1;
			ResultSet rs1=db.executeQuery(sql1);
			while(rs1.next()){
				shuchu1=rs1.getString(1)+rs1.getString(2);
				out.println(rs1.getString(1)+"-----"+rs1.getString(2)+"<br/>");
			}
            %>
            </table>
        </div>
        
        <div id="tabContent2" style="display: none">
        <table style="border-width: 0; width: 100%">
         <%
            String sql2="select shuming,zuozhe from shu where leibie='2'";
			String shuchu2;
			ResultSet rs2=db.executeQuery(sql2);
			while(rs2.next()){
				shuchu2=rs2.getString(1)+"-----"+rs2.getString(2)+"<br/>";
				out.println(shuchu2);
			}
            %>
            </table>
        </div>
        
           <div id="tabContent3" style="display: none">
           <table style="border-width: 0; width: 100%">
           <%
            String sql3="select shuming,zuozhe from shu where leibie='3'";
			String shuchu3;
			ResultSet rs3=db.executeQuery(sql3);
			while(rs3.next()){
				shuchu3=rs3.getString(1)+"-----"+rs3.getString(2)+"<br/>";
				out.println(shuchu3);
			}
            %>
            </table>
           </div>
        
        <div id="tabContent4" style="display: none">
        <table style="border-width: 0; width: 100%">
        <%
            String sql4="select shuming,zuozhe from shu where leibie='4'";
			String shuchu4;
			ResultSet rs4=db.executeQuery(sql4);
			while(rs4.next()){
				shuchu4=rs4.getString(1)+"-----"+rs4.getString(2)+"<br/>";
				out.println(shuchu4);
			}
            %>
            </table>
        </div>
        <div id="tabContent5" style="display: none">
        <table style="border-width: 0; width: 100%">
        <%
            String sql5="select shuming,zuozhe from shu where leibie='5'";
			String shuchu5;
			ResultSet rs5=db.executeQuery(sql5);
			while(rs5.next()){
				shuchu5=rs5.getString(1)+"-----"+rs5.getString(2)+"<br/>";
				out.println(shuchu5);
			}
            %>
            </table>
        </div>
        <div id="tabContent6" style="display: none">
        <table style="border-width: 0; width: 100%">
        <%
            String sql6="select shuming,zuozhe from shu where leibie='6'";
			String shuchu6;
			ResultSet rs6=db.executeQuery(sql6);
			while(rs6.next()){
				shuchu6=rs6.getString(1)+"-----"+rs6.getString(2)+"<br/>";
				out.println(shuchu6);
			}
            %>
            </table>
        </div>
        <div id="tabContent7" style="display: none">
        <table style="border-width: 0; width: 100%">
        <%
            String sql7="select shuming,zuozhe from shu where leibie='7'";
			String shuchu7;
			ResultSet rs7=db.executeQuery(sql7);
			while(rs7.next()){
				shuchu7=rs7.getString(1)+"-----"+rs7.getString(2)+"<br/>";
				out.println(shuchu7);
			}
            %>		
            </table>
        </div>
    </div>

</body>
</html>