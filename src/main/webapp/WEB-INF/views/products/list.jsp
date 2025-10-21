<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<div class="d-flex justify-content-between align-items-center mb-3">
  <h2>Danh sách Sản phẩm</h2>
  <a class="btn btn-success" href="${pageContext.request.contextPath}/products/new?lang=${currentLang}">
    <i class="bi bi-plus-circle"></i> Thêm Sản phẩm
  </a>
</div>

<!-- Thông báo thành công -->
<c:if test="${not empty success}">
	<div class="alert alert-success alert-dismissible fade show" role="alert">
		<i class="bi bi-check-circle-fill"></i>
		<strong>Thành công!</strong> ${success}
		<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	</div>
</c:if>

<table class="table table-hover">
  <thead>
    <tr>
      <th>ID</th>
      <th>Price</th>
      <th>Weight</th>
      <th>Product Name</th>
      <th>Product Description</th>
      <th>Category Name</th>
      <th>Actions</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="p" items="${products}">
      <tr>
        <td><c:out value="${p.productId}"/></td>
        <td><c:out value="${p.price}"/></td>
        <td><c:out value="${p.weight}"/></td>
        <td><c:out value="${p.productName}"/></td>
        <td><c:out value="${p.description}"/></td>
        <td><c:out value="${p.productCategoryName}"/></td>
        <td>
          <a class="btn btn-info btn-sm" href="${pageContext.request.contextPath}/products/meanings/list?id=${p.productId}">
            <i class="bi bi-translate"></i> Quản lý nghĩa
          </a>
          <a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/products/delete?id=${p.productId}" onclick="return confirm('Bạn có muốn xóa?')">
            <i class="bi bi-trash"></i> Xóa
          </a>
        </td>
      </tr>
    </c:forEach>
  </tbody>
</table>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
