<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Admin User</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <!-- Favicon -->
    <link href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.5.0/webfonts/fa-solid-900.woff2"
          rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/owl.carousel/2.3.4/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.1.0/css/tempusdominus-bootstrap-4.min.css"
          rel="stylesheet">


    <!-- CDN Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <!-- Link CSS -->
    <link href="/css/admin.css" rel="stylesheet">

</head>
<body>
<div class="container-xxl position-relative bg-white d-flex p-0">
    <!-- Sidebar Start -->
    <div class="sidebar pe-4 pb-3">
        <nav class="navbar bg-light navbar-light">
            <a href="/admin/home" class="navbar-brand mx-4 mb-3">
                <h3 class="text-primary">ADMIN</h3>
            </a>
            <div class="d-flex align-items-center ms-4 mb-4">
                <div class="position-relative">
                    <div
                            class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1">
                    </div>
                </div>
                <div class="ms-3">
                    <h6 class="mb-0">Fmobile</h6>
                    <span>Admin</span>
                </div>
            </div>
            <div class="navbar-nav w-100">
                <a href="/admin/home" class="nav-item nav-link"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                <a href="/admin/user" class="nav-item nav-link"><i class="fa fa-user me-2"></i>User</a>
                <a href="/admin/order" class="nav-item nav-link"><i class="fa fa-shopping-cart me-2"></i>Order</a>
                <a href="/admin/product" class="nav-item nav-link"><i class="fa fa-tag me-2"></i>Product</a>
                <a href="/admin/brand" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Brand</a>
                <a href="/admin/category" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Category</a>
                <a href="/admin/image" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Image</a>
            </div>
        </nav>
    </div>
    <!-- Sidebar End -->


    <!-- Content Start -->
    <div class="content">
        <!-- Navbar Start -->
        <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
            <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
            </a>
            <a href="#" class="sidebar-toggler flex-shrink-0">
                <i class="fa fa-bars"></i>
            </a>
            <div class="navbar-nav align-items-center ms-auto">
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <span class="d-none d-lg-inline-flex">Fmobile</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                        <a href="#" class="dropdown-item">My Profile</a>
                        <a href="#" class="dropdown-item">Settings</a>
                        <form method="post" action="/logout">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <button class="dropdown-item">Logout</button>
                        </form>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Navbar End -->
        <div class="row">
            <h5 class="mb-4"><c:choose><c:when test="${isEdit}">Update Image</c:when>
                <c:otherwise>Add new image</c:otherwise></c:choose></h5>
            <form:form action="/admin/image/saveOrUpdate" method="post" modelAttribute="image" enctype="multipart/form-data">
                <div class="row">
                    <input type="hidden" name="id" value="${image.id}" />
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <!-- Chọn Sản phẩm -->
                    <div class="form-group col-md-3">
                        <label for="product">Choose Product:</label>
                        <select class="form-control" id="product" name="product.id" required>
                            <option value="">-- Choose Product --</option>
                            <c:forEach var="product" items="${products}">
                                <option value="${product.id}"
                                        <c:if test="${product.id == image.product.id}">selected</c:if>>
                                        ${product.productName}
                                </option>
                            </c:forEach>
                        </select>
                        <div class="error-message" id="productError" style="color: red; display: none;"></div> <!-- Thông báo lỗi cho product -->
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="image_name">Image Name:</label>
                            <form:input path="image_name" class="form-control" placeholder="Enter Image Name" />
                            <div class="error-message" id="imageNameError" style="color: red; display: none;"></div> <!-- Thêm thông báo lỗi -->
                            <p style="color: red"><form:errors path="image_name"></form:errors></p>
                        </div>
                    </div>
                    <div class="col-md-3 form-group">
                        <label for="image_url">Choose Image:</label>
                        <input type="file" class="form-control" id="image_url" name="image_url" required />
                        <div class="error-message" id="imageUrlError" style="color: red; display: none;"></div> <!-- Thông báo lỗi cho image_url -->
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary" id="submit-button">
                            <c:choose><c:when test="${isEdit}">Update Image</c:when>
                                <c:otherwise>Add new image</c:otherwise></c:choose>
                        </button>
                    </div>
                </div>
            </form:form>
        </div>

        <!-- Bảng image -->
        <div class="row">
            <div class="col-lg-12">
                <div class="bg-light rounded h-100 p-4">
                    <h5 class="mb-4">Image Table</h5>
                    <form action="" method="GET" class="d-none d-md-flex col-4" style="background-color: gainsboro">
                        <div class="input-group input-group-sm col-3">
                            <input class="form-control border-0" type="text" placeholder="Search by Image Name" name="keyword" value="${keyword}" >
                            <button type="submit" class="btn btn-group-lg"><i class="fa fa-search"></i></button>
                        </div>
                    </form>
                    <br>
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Product</th>
                            <th scope="col">Image Name</th>
                            <th scope="col">Image</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="img" items="${images}">
                            <tr>
                                <td>${img.id}</td>
                                <td>${img.product.productName}</td>
                                <td>${img.image_name}</td>
                                <td>
                                    <!-- Hiển thị ảnh thu nhỏ -->
                                    <c:choose>
                                        <c:when test="${not empty img.url}">
                                            <img src="${pageContext.request.contextPath}${img.url}" alt="${img.image_name}" class="img-thumbnail" width="100" height="100"/>
                                        </c:when>
                                        <c:otherwise>
                                            <span>Chưa có hình ảnh</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <!-- Nút Sửa -->
                                    <a href="${pageContext.request.contextPath}/admin/image/edit/${img.id}" class="btn btn-warning btn-sm">
                                        Edit
                                    </a>
                                    <!-- Nút Xóa -->
                                    <a href="${pageContext.request.contextPath}/admin/image/delete/${img.id}" class="btn btn-danger btn-sm"
                                       onclick="return confirm('Are you sure to delete?');">
                                        Del
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <!-- Pagination begin -->
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-end">
                            <!-- Nút Previous -->
                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                <a class="page-link" href="?pageNo=${currentPage - 1}&keyword=${keyword}">Previous</a>
                            </li>

                            <!-- Hiển thị các số trang, giới hạn tối đa 10 số trang -->
                            <c:forEach var="i" begin="${currentPage - 5 > 0 ? currentPage - 5 : 1}" end="${currentPage + 4 < totalPage ? currentPage + 4 : totalPage}">
                                <li class="page-item ${currentPage == i ? 'active' : ''}">
                                    <a class="page-link" href="?pageNo=${i}&keyword=${keyword}">${i}</a>
                                </li>
                            </c:forEach>

                            <!-- Nút Next -->
                            <li class="page-item ${currentPage == totalPage ? 'disabled' : ''}">
                                <a class="page-link" href="?pageNo=${currentPage + 1}&keyword=${keyword}">Next</a>
                            </li>
                        </ul>
                    </nav>
                    <!-- Pagination end -->
                </div>
            </div>
        </div>
        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light rounded-top p-4">
                <div class="row">
                    <div class="col-12 col-sm-6 text-center text-sm-start">
                        &copy;All
                        Right Reserved.
                    </div>
                    <div class="col-12 col-sm-6 text-center text-sm-end">
                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                        Designed By F Mobile
                        </br>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->
    </div>
</div>
<%--CDN Javascript--%>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- CDN jQuery Validation -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.21.0/jquery.validate.min.js"
        integrity="sha512-KFHXdr2oObHKI9w4Hv1XPKc898mE4kgYx58oqsc/JqqdLMDI4YjOLzom+EMlW8HFUd0QfjfAvxSL6sEq/a42fQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- Bootstrap Bundle JS (Bootstrap 5.0) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Chart.js (nếu cần biểu đồ) -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- Owl Carousel (nếu sử dụng carousel) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"
        integrity="sha512-YDr/FllsYt5mPpDsytI+Y1twc4Lgf/Xrh/1hYIS2BEPxDfevPcfovtRUFa+VDP4kNeh4+srDOFexlIn/ksz+wA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- Moment.js (nếu cần xử lý thời gian) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"
        integrity="sha512-qTXRIMyZIFb8JdNgwO1Br6Lq3EY7dx6h7nBbg78X6hfXqUBSXGXk43kO5nc7u7+L2e5jrS3T1KNczHD8Qq9Kog=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- Bootstrap Bundle JS (đã bao gồm cả Popper.js) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<!-- Template Javascript -->
<script src="/js/admin.js"></script>

<script>
    document.getElementById("submit-button").onclick = function(event) {
        // Lấy giá trị của imageName, product và image_url
        var imageName = document.getElementById("image_name").value.trim();
        var product = document.getElementById("product").value;
        var imageUrl = document.getElementById("image_url").value;

        // Reset thông báo lỗi
        var imageNameErrorElement = document.getElementById("imageNameError");
        var productErrorElement = document.getElementById("productError");
        var imageUrlErrorElement = document.getElementById("imageUrlError");

        imageNameErrorElement.style.display = "none"; // Ẩn thông báo lỗi ban đầu
        productErrorElement.style.display = "none";  // Ẩn thông báo lỗi ban đầu
        imageUrlErrorElement.style.display = "none"; // Ẩn thông báo lỗi ban đầu

        // Kiểm tra nếu imageName rỗng hoặc chỉ chứa khoảng trắng
        if (!imageName) {
            imageNameErrorElement.innerText = "Image Name cannot be empty!";
            imageNameErrorElement.style.display = "block"; // Hiện thông báo lỗi
            event.preventDefault(); // Ngăn chặn gửi biểu mẫu
            return;
        }

        // Kiểm tra độ dài của imageName
        if (imageName.length > 255) {
            imageNameErrorElement.innerText = "Image Name cannot exceed 255 characters!";
            imageNameErrorElement.style.display = "block"; // Hiện thông báo lỗi
            event.preventDefault(); // Ngăn chặn gửi biểu mẫu
            return;
        }

        // Kiểm tra ký tự đặc biệt trong imageName
        var regex = /^[a-zA-Z0-9\s]+$/; // Chỉ cho phép chữ cái, số và khoảng trắng
        if (!regex.test(imageName)) {
            imageNameErrorElement.innerText = "Image Name can only contain letters, numbers, and spaces!";
            imageNameErrorElement.style.display = "block"; // Hiện thông báo lỗi
            event.preventDefault(); // Ngăn chặn gửi biểu mẫu
            return;
        }

        // Kiểm tra nếu product chưa được chọn
        if (!product) {
            productErrorElement.innerText = "Product is required!";
            productErrorElement.style.display = "block"; // Hiện thông báo lỗi
            event.preventDefault(); // Ngăn chặn gửi biểu mẫu
            return;
        }

        // Kiểm tra nếu ảnh chưa được chọn
        if (!imageUrl) {
            imageUrlErrorElement.innerText = "Image is required!";
            imageUrlErrorElement.style.display = "block"; // Hiện thông báo lỗi
            event.preventDefault(); // Ngăn chặn gửi biểu mẫu
            return;
        }
        // Nếu tất cả kiểm tra đều hợp lệ, biểu mẫu sẽ được gửi
    };
</script>

</body>
</html>
