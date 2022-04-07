<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
 
<head>

	<style type="text/css">
		.page li {list-style: none; float: left; padding: 6px;}
	</style>
	
	<style type="text/css">
		.write_btn{
		margin: auto;
   		width: 50%;
		} 
	</style>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <style>
    .container{
       
    }
     
    *{
      box-sizing: border-box;
    }
    .container{
      border:1px solid black;
    }
    .container>*{
      border:1px solid red;
    }
    .container>.content>*{
      border:1px solid green;
    }
    .container .content{
      padding-left:200px;
      padding-right:150px;
      overflow: hidden;
    }
    .container .content>*{
      float:left;
      padding-bottom:2500px;
      margin-bottom:-2500px;
    }
    .container .content main{
      width:100%;
    }
    .container .content nav{
      width:200px;
      margin-left: -100%;
      left:-200px;
      position: relative;
    }
    .container .content aside{
      width:150px;
      margin-right:-150px; 
    }
    .container footer{
      clear: both;
    }
     
    @media (max-width:599px){
      .container .content{
        padding-left:0;
        padding-right:0;
        overflow: visible;
      }
      .container .content>*{
        float:none;
        padding-bottom:0;
        margin-bottom:0;
      }
      .container .content main{
        width:100%;
      }
      .container .content nav{
        width:auto;
        margin-left: 0;
        left:0;
        position: relative;
      }
      .container .content aside{
        width:auto;
        margin-right:0; 
      }
    }
    
    ul{
   list-style:none;
   }
  </style>
</head>
 
<body>
  <div class="container">
    <header>
      <a href="http://localhost:8080/board/list"><h1>천둥 마켓</h1></a>
      
    </header>
    <section class="content">
      <main>
      
			<section id="container">
				<form role="form" method="post" action="/board/write">
					<table class = "table table-hover">
						<tr><th>PostNumber</th><th>상품사진</th><th>상품설명</th><th>가격</th>Fruits<th>작성자</th><th>조회수</th><th>작성일</th><th>상태</th></tr>
						
						<c:forEach items="${list_Fruits}" var = "list">
							<tr>
								<td><c:out value="${list.id}" /></td>
								<td><c:out value="${list.image}" /></td>
								<td><c:out value="${list.content}" /></td>
								<td><fmt:formatNumber pattern="###,###,###" value="${list.cost}" />&#8361;</td>
								<td><c:out value="${list.writer}" /></td>							
								<td><c:out value="${list.click_cnt}" /></td>
								<td><fmt:formatDate value="${list.create_date}" pattern="yyyy-MM-dd"/></td>
								<c:if test= "${list.state eq '판매중'}">
								<td><button type="button" class="btn btn-success"><a href="/board/readView?id=${list.id}"><c:out value="${list.state}" /></a></button></td></c:if>
								<c:if test= "${list.state eq '예약중'}">
								<td><button type="button" class="btn btn-warning"><a href="/board/readView?id=${list.id}"><c:out value="${list.state}" /></a></button></td></c:if>
								<c:if test= "${list.state eq '판매완료'}">
								<td><button type="button" class="btn btn-danger"><a href="/board/readView?id=${list.id}"><c:out value="${list.state}" /></a></button></td></c:if>
							</tr>
						</c:forEach>
						
					</table>
				</form>
			</section>
	  	
      		
      </main>
      <nav>
 
		<h4>카테고리</h4>
	        <hr>

        <ul>
	        
	          <a href ="http://localhost:8080/board/list"><li>- ALL</li></a>
	          <a href ="http://localhost:8080/board/list_Toys"><li>- Toys</li></a>
	          <a href ="http://localhost:8080/board/list_Clothes"><li>- Clothes</li></a>
	          <a href ="http://localhost:8080/board/list_Fruits"><li>- Fruits</li></a>
	          <a href ="http://localhost:8080/board/list_Electronics"><li>- Electronics</li></a>
	          <br>
	          <br>
	          <br>
	          
        </ul>
        
        	 <div class="page">
	          	  <ul >
				  
				  	
				    <c:if test="${pageMaker.prev}">
				    	<li><a href="list_Fruits${pageMaker.makeQuery(pageMaker.startPage - 1)}"><<</a></li>
				    </c:if> 
				
				    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				    	<li><a href="list_Fruits${pageMaker.makeQuery(idx)}">${idx}</a></li>
				    </c:forEach>
				
				    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				    	<li><a href="list_Fruits${pageMaker.makeQuery(pageMaker.endPage + 1)}">>></a></li>
				    </c:if> 
				  </ul>
				</div>
				
				
			<div class = "write_btn">
	          <a href ="http://localhost:8080/board/writeView"><input type='button', value='글쓰기'/></a>
	          </div>
        
         
   
      </nav>
      <aside>
        여기는 광고자리입니당
      </aside>
    </section>
    <footer>
      FOOTER
    </footer>
  </div>
</body>
 
</html>