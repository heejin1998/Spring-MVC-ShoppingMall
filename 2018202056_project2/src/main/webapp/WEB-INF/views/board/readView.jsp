<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
 
<head>

	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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

	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// Update 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/board/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// Delete
			$(".delete_btn").on("click", function(){
				
			
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
			// comment write
			$(".replyWriteBtn").on("click", function(){
				  var formObj = $("form[name='replyForm']");
				  if(fn_valiChk()){
					  return false;
				  }
				  formObj.attr("action", "/board/replyWrite");
				  formObj.submit();
				});

		})
		
		function fn_valiChk(){
			var regForm = $("form[name='replyForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		
		
	</script>

	
 
<body>
  <div class="container">
    <header>
      <a href="http://localhost:8080/board/list"><h1>천둥 마켓</h1></a>
      
    </header>
    <section class="content">
      <main>
      
			<section id="container">
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="bno" name="id" value="${read.id}" />
				</form>
					<table>
						<tbody>
							<tr>
								<td>
								
									<label for="id">PostNumber</label><input type="text" id="id" name="id" value="${read.id}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${read.writer}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="create_date">작성일</label>
									<fmt:formatDate value="${read.create_date}" pattern="yyyy.MM.dd hh:mm"/>					
								</td>
							</tr>
							<tr>
								<td>
									<label for="click_cnt">조회수</label><input type="text" id="click_cnt" name="click_cnt" value="${read.click_cnt}"/>
								</td>
							</tr>
							
							
							
							<tr>
								<td>
									<label for="content">상품설명</label><textarea id="content" name="content"><c:out value="${read.content}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="cost">가격</label><input type="text" id="cost" name="cost" value="${read.cost}" />
								</td>
							</tr>
									
						</tbody>			
					</table>
					<div>
						<button type="submit" class="update_btn">게시물 수정</button>
						<button type="submit" class="delete_btn">게시물 삭제</button>
					</div>
				</form>
			</section>
			
			<!-- Comment -->
				<div id="reply">
				  <ul class="replyList">
				    <c:forEach items="${replyList}" var="replyList">
				      <li>
				        <p>
				      		  작성자   ${replyList.writer}<br />
				        </p>
				        ${replyList.content}
				        (<fmt:formatDate value="${replyList.create_date}" pattern="yyyy.MM.dd hh:mm" />)
				      </li>
				    </c:forEach>   
				  </ul>
				</div>
				
				<form name="replyForm" method="post">
				  <input type="hidden" id="id" name="id" value="${read.id}" />				
				  <div>
				    <label for="writer">이름</label><input type="text" id="writer" name="writer" class="chk" title = "[이름, 비밀번호, 내용 란을 모두 채워 주십시오.]"/>
				    <br/>
				    <label for="userpass">비밀번호</label><input type="text" id="userpass" name="userpass" class="chk" title = "[이름, 비밀번호, 내용 란을 모두 채워 주십시오.]" />
				    <br/>
				    <label for="content"></label><input type="text" id="content" name="content"  class="chk" title = "[이름, 비밀번호, 내용 란을 모두 채워 주십시오.]"/>
				  </div>
				  <div>
				 	 <button type="button" class="replyWriteBtn">등록</button>
				  </div>
				</form>
					  	
      		
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
	          <a href ="http://localhost:8080/board/writeView"><input type='button', value='글쓰기'/></a>
        </ul>
        
         
   
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