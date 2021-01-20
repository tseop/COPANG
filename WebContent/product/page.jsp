<%@page import="product.PageTo"%>
<%@ page contentType="text/html;charset=euc-kr"%>
<%
	PageTo to = (PageTo) request.getAttribute("page");
	int curPage = to.getCurPage();
	int perPage = to.getPerPage();
	int totalCount = to.getTotalCount();
	int totalPage = totalCount / perPage; // 보여줄 페이지 번호개수
	if (totalCount % perPage != 0)
		totalPage++;

      for( int i = 1 ; i <=  totalPage ; i++){
        if(  curPage == i ){
          out.print( "<strong><font color='#0074E9' style='font-size: 0.8rem;'>"+i+"</font></strong>&nbsp;" );            
        }else{
         out.print( "<a href='productList.pd?curPage="+i+"'>"+i+"</a>&nbsp;" );
        }//end if
      }
%>