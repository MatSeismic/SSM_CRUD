<%--
  Created by IntelliJ IDEA.
  User: John_
  Date: 6/4/2020
  Time: 10:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Employees</title>
  <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
    integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <!-- Optional theme -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
    integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
  <!-- Latest compiled and minified JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
    integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
    crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
    crossorigin="anonymous"></script>
</head>

<body>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <h1>SSM-CRUD</h1>
      </div>
    </div>
    <div class="row">
      <div class="col-md-4 col-md-offset-8">
        <button class="btn btn-primary">insert</button>
        <button class="btn btn-danger">delete</button>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12">
        <table class="table table-hover">
          <tr>
            <th>#</th>
            <th>empName</th>
            <th>gender</th>
            <th>email</th>
            <th>deptName</th>
            <th>Manipulate</th>
          </tr>

          <c:forEach items="${pageInfo.list}" var="emp">
            <tr>
              <th>${emp.empId}</th>
              <th>${emp.empName}</th>
              <th>${emp.gender}</th>
              <th>${emp.email}</th>
              <th>${emp.department.deptName}</th>
              <th>
                <button class="btn btn-primary btn-sm">
                  <span class="glyphicon glyphicon-pencil" aria-hidden="true">
                    edit
                  </span>
                </button>
                <button class="btn btn-danger btn-sm">
                  <span class="glyphicon glyphicon-trash" aria-hidden="true">
                    delete
                  </span>
                </button>
              </th>
            </tr>
          </c:forEach>

        </table>
      </div>
    </div>

    <div class="row">
      <div class="col-md-6">
        Current Page: ${pageInfo.pageNum}, total pages:${pageInfo.pages}, total records: ${pageInfo.total}
      </div>
      <div class="col-md-6">
        <nav aria-label="Page navigation example">
          <ul class="pagination">
            <li class="page-item"><a class="page-link" href="${APP_PATH}/emps?pn=1">First Page</a></li>
            <!-- pageInfo.pageNum: current pageNum
                 pageNum: all pageNums in the navigation bar-->
            <c:if test="${pageInfo.hasPreviousPage}">
              <li class="page-item"><a class="page-link" href="${APP_PATH}/emps?pn=${pageInfo.pageNum-1}"><<</a></li>
            </c:if>

            <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
              <c:if test="${pageNum==pageInfo.pageNum}">
                <li class="page-item active"><a class="page-link" href="#">${pageNum}</a></li>
              </c:if>
              <c:if test="${pageNum!=pageInfo.pageNum}">
                <li class="page-item"><a class="page-link" href="${APP_PATH}/emps?pn=${pageNum}">${pageNum}</a></li>
              </c:if>

            </c:forEach>
<%--            <li class="page-item"><a class="page-link" href="#">1</a></li>--%>
<%--            <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
<%--            <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
<%--            <li class="page-item"><a class="page-link" href="#">4</a></li>--%>
<%--            <li class="page-item"><a class="page-link" href="#">5</a></li>--%>
            <c:if test="${pageInfo.hasNextPage}">
              <li class="page-item"><a class="page-link" href="${APP_PATH}/emps?pn=${pageInfo.pageNum+1}">>></a></li>
            </c:if>
            <li class="page-item"><a class="page-link" href="${APP_PATH}/emps?pn=${pageInfo.pages}">Last Page</a></li>
          </ul>
        </nav>
      </div>

    </div>
  </div>

</body>

</html>