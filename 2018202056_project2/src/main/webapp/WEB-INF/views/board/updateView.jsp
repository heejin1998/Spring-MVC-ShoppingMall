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
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/board/list";
			})
		})
	</script>
	
		<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/update");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='updateForm'] .chk").length;
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
      <h4>게시글 수정</h4>
			<hr>
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/board/update">
				<input type="hidden" name="id" value="${update.id}" readonly="readonly"/>
					<table>
						<tbody>
						
							<tr>
								<td>
									<label for="writer">닉네임</label><input type="text" id="writer" name="writer" value="${update.writer}" class="chk" title="닉네임을 입력하세요" />
								</td>
							</tr>
							<tr>	
								<td>
									<label for="userpass">비밀번호</label><input type="text" id="userpass" name="userpass" value="${update.userpass}" class="chk" title="비밀번호를 입력하세요" />
								</td>
								<td>
									카테고리
									<select name="category" value="${update.category}">				
									    <option value="Toys">Toys</option>
									    <option value="Clothes">Clothes</option>
									    <option value="Fruits">Fruits</option>
									    <option value="Electronics">Electronics</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<label for="create_date">작성일</label>
									<fmt:formatDate value="${update.create_date}" pattern="yyyy.MM.dd hh:mm"/>					
								</td>
							</tr>

							<tr>
								<td>
									<label for="content">내용</label><textarea id="content" name="content" class="chk" title="내용을 입력하세요"><c:out value="${update.content}"  /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="cost">가격</label><input type="text" id="cost" name="cost" value="${update.cost}" class="chk" title="가격을 입력하세요"  />
								</td>
							</tr>
							
							<tr>
								<td>									
									<input type='file', name = 'image' value="${update.image}" multiple/>  
								</td>
							</tr>
							
							
							<tr>
								
								<td>
									판매중<input type="radio" name="state" value="판매중" checked = "checked">
									예약중<input type="radio" name="state" value="예약중" checked>
									판매완료<input type="radio" name="state" value="판매완료" checked>
								</td>
								
				
								<script type="text/javascript">								      
						          var radioVal = $('input[name="state"]:checked').val();
						          ${update.state} = radioVal;
								</script>
							</tr>
									
						</tbody>			
					</table>
					<div>
						<button type="submit" class="update_btn" style="float: right;">등록</button>

					</div>
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