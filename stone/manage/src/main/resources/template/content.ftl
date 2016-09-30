<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<style type="text/css">
#main{
	left:75px; position: relative;
	width:1000px;text-align: center;
	border:1px solid #ccc;
	
 	padding-left: 200; 

	padding-top: 20; 
	padding-bottom: 50; 
}

#content{
	padding-top: 20; 
	width:800px;text-align: center;
	border:1px solid #ccc;
	
}

#line{
	height:1px;
	width:100%;
	background:#ccc;
	
}

.title{
	width:100%;text-align: center;	
	margin-bottom:20px;
}

.from{position: relative;
	float:left;width:200; margin:20;
	
}
.keywords{
	float:left;width:200;margin:20;
}
.status{
	float:left;width:200;margin:20;
}

.msg{
	height:50;text-align:center; width:100%;
}
.content{
	width:100%;
}

.btn{
	text-align: center;
	width:100%;
	margin-top:50px;
	margin-bottom:50px;
}
</style>
<script>
$(document).ready( function() {
	
});
</script>
<body>
<div id="main">
	<div id="content">
		<div class="title"><h3>${content.title}</h3></div>
		<div id="line"></div>
		<div class="msg">
			<div class="from">来源：${content.from}</div>
			<div class="keywords">关键字：${content.keywords}</div>
			<div class="status">
			是否显示：
			   <#if content.status==1>
			  显示
			  <#else>
			     隐藏
			 </#if>
			</div>
		</div>
		<br/>
		 <div class="content">
		 <#if (content.content)??>
				 ${content.content}
		 </#if>
		 </div>
		 <br style="clear:both;" /> 
	</div>
 </div>
</body>