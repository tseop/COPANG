<%@page import="notice.PageTo"%>
<%@ page contentType="text/html;charset=euc-kr"%>
<%
   PageTo to = (PageTo) request.getAttribute("page");
   int curPage = to.getCurPage();
   int perPage = to.getPerPage();
   int totalCount = to.getTotalCount();
   int totalPage = totalCount / perPage;
   if (totalCount % perPage != 0)
      totalPage++;

   for (int i = 1; i <= totalPage; i++) {
      if (curPage == i) {
         out.print(
               "<strong><font color='#0074E9' style='font-size: 0.75rem;'>" + i + "</font></strong>&nbsp;");
      } else {
         out.print("<a href='noticeList.no?curPage=" + i + "'>" + i + "</a>&nbsp;");
      }
   }
%>