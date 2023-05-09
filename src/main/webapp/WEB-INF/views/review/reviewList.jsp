<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../common/head.jsp"/>
<style type="text/css">
	.tablewrapper {
		min-height: 640px
	}
</style>
</head>
<jsp:include page="../common/header.jsp"/>
 
 <body>	
 				<div class="container">
 						<c:set var="types" value="T,C,W,TC,TW,CW,TCW"></c:set>
                        	<form>
                        		<div class="product-heading pull-left">
                        			<div class="con">
                        			<select name="type">
                        				<c:forTokens items="제목,내용,작성자,제목+내용,제목+작성자,내용+작성자,제목+내용+작성자" delims="," varStatus="stat" var='it'>
                        					<option value="${types.split(',')[stat.index]}" ${types.split(',')[stat.index] eq page.cri.type ? 'selected' : ''}>${it}</option>
                        				</c:forTokens>
                        			</select>
                           			<input name="keyword"  value="${page.cri.keyword}" type="text" class="" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                		<button><i class="flaticon-tool"></i>
                                		</button>	
                        			</div>
                        		</div>
                        		<input type="hidden" name="pageNum" value="1">
                        		<input type="hidden" name="amount" value="${page.cri.amount}">
                        	</form>
                        	<%-- <a href="register${page.cri.queryString}" class="btn btn-primary btn-sm pull-right">Register New review</a> --%>
                            <div class="tablewrapper">
                                <table class="table table-striped" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>수정일</th>
                                        </tr>
                                    </thead>
                              		<tbody>
                              		<c:forEach items="${list}" var="review">
                              			<tr>
                              				<td><c:out value="${review.reviewNo}"/></td>
                              				<td><a href="getReview${page.cri.fullQueryString}&reviewNo=${review.reviewNo}"><c:out value="${review.reviewTitle}"/></a><span class="text-muted"></span></td>
                              				<td><c:out value="${review.memberId}"/></td>
                              				<td><fmt:formatDate value="${review.reviewRegdate}" pattern="yyyy-MM-dd"/></td>
                              				<td><fmt:formatDate value="${review.reviewUpdatedate}" pattern="yyyy-MM-dd"/></td>
                              			</tr>
                              		</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                         	<ul class="pagination pull-right">
							<c:if test="${page.doublePrev}">
								<li class="page-item arrow"><a class="page-link" href="${pageContext.request.contextPath}/review/reviewList${page.cri.queryString}&pageNum=${page.startPage-1}"><i class="fas fa-angle-double-left"></i></a></li>
							</c:if>
							<c:if test="${page.prev}">
								<li class="page-item arrow"><a class="page-link" href="${pageContext.request.contextPath}/review/reviewList${page.cri.queryString}&pageNum=${page.cri.pageNum-1}"><i class="fas fa-angle-left"></i></a></li>
							</c:if>
							<c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
								<li class="page-item ${page.cri.pageNum == i ? 'active' : ''}"><a class="page-link" href="${pageContext.request.contextPath}/review/reviewList${page.cri.queryString}&pageNum=${i}">${i}</a></li>
							</c:forEach>
							<c:if test="${page.next}">
								<li class="page-item arrow"><a class="page-link" href="${pageContext.request.contextPath}/review/reviewList${page.cri.queryString}&pageNum=${page.cri.pageNum+1}"><i class="fas fa-angle-right"></i></a></li>
							</c:if>
							<c:if test="${page.doubleNext}">
								<li class="page-item arrow"><a class="page-link" href="${pageContext.request.contextPath}/review/reviewList${page.cri.queryString}&pageNum=${page.endPage+1}"><i class="fas fa-angle-double-right"></i></a></li>
							</c:if>
						 	</ul>
</div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>