<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Sale Manager</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/bootstrap2.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/AdminLTE.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/_all-skins.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/asset/css/morris.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

        <style type="text/css">
            .body {
                margin-top: 20px;
                background: #f8f8f8;
            }
            .thumbnail-img {
                width: 300px; /* Adjust the width as needed */
                height: auto;
                max-height: 100px !important; /* Adjust the max-height as needed */
                object-fit: cover;
            }

            .align-middle img {
                max-width: 100%;
                max-height: 100px;
            }
        </style>
        <style>

            body{
                background:#333;
            }
            .card {
                box-shadow: 0 20px 27px 0 rgb(0 0 0 / 5%);
            }
            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-clip: border-box;
                border: 10 solid rgba(0,0,0,.125);
                border-radius: 1rem;
            }
            .text-reset {
                --bs-text-opacity: 1;
                color: inherit!important;
            }
            a {
                color: #5465ff;
                text-decoration: none;
            }
            .d-flex {
                display: flex;
                justify-content: left; /* Thay đổi justify-content thành flex-end */
                align-items: center;
                padding: 1rem 0;
            }

            .h5 {
                margin-bottom: 0;
                margin-right: auto; /* Đẩy h2 về phía bên trái */
            }

            .filter-group {
                margin-left: 1rem;
            }

            .filter-group label {
                display: block;
                margin-bottom: 0.5rem;
            }

            .filter-group .form-control {
                width: auto;
                display: inline-block;
            }        </style>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <!-- Site wrapper -->
        <div class="wrapper">

            <header class="main-header">
                <!-- Logo -->
                <a href="../../index2.html" class="logo">
                    <span class="logo-mini"><b>S</b>M</span>
                    <span class="logo-lg"><b>Sale Manager</b></span>
                </a>
                <nav class="navbar navbar-static-top">
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                </nav>
            </header><!-- =============================================== -->
            <aside class="main-sidebar">
                <section class="sidebar">
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="../../dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p>Alexander Pierce</p>
                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <!-- search form -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                    </form>
                    <ul class="sidebar-menu">
                        <li class="header">MAIN NAVIGATION</li>
                        <li>
                            <a href="OrderListForStaff">
                                <i class="fa fa-th"></i> <span>Manage Order</span>
                            </a>
                        </li>


                    </ul>
                </section>
            </aside>
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                        Order Details
                    </h1>
                </section>
                <!-- Main content -->
                <section class="content">

                    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
                    <div class="container-fluid">

                        <div class="container">
                            <div class="d-flex align-items-center py-3">
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-lg-9">
                                <c:forEach items="${orderDetials}" var="c">
                                    <!-- Details -->
                                    <div class="card mb-4">
                                        <div class="card-body">
                                            <div class="mb-3 d-flex justify-content-between">
                                                <div>
                                                    <span class="me-3">Order ID: ${c.order.orderId} </span>
                                                    <br>
                                                    <span class="me-3">Order Date: ${c.order.formattedOrderDateTime} </span>
                                                </div>

                                            </div>
                                            <table class="table table-borderless">
                                                <thead>
                                                    <tr>
                                                        <th>Thumbnail</th>
                                                        <th>Name</th>
                                                        <th>Size</th>
                                                        <th>Color</th>
                                                        <th>Quantity</th>
                                                        <th class="text-end">Price</th>
                                                        <th class="text-end">Total</th>
                                                        <th>Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <div class="flex-shrink-0">
                                                                <img src="${c.productDetails.product.thumbnail}" alt="" width="55" class="img-fluid">
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="flex-lg-grow-1 ms-3">
                                                                <h6 class="small mb-0"><a href="#" class="text-reset">${c.productDetails.product.productName}</a></h6>
                                                            </div>
                                                        </td>
                                                        <td>${c.productDetails.size.name}</td> <!-- Assuming Size is not available, you can change as needed -->
                                                        <td>${c.productDetails.color.name}</td>
                                                        <td>${c.quantity}</td>
                                                        <td class="text-end">$${c.price}</td>
                                                        <td class="text-end">$${c.total}</td>
                                                        <td>${c.order.orderStatus.name}</td>
                                                    </tr>

                                                </tbody>
                                                <tfoot>
                                                    <tr class="fw-bold">
                                                        <td colspan="6" class="text-end">TOTAL: </td>
                                                        <td class="text-danger text-end">$${c.order.totalAmount}</td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                    <!-- Payment -->
                                    <div class="card mb-4">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-lg-4">
                                                        <h3 class="h4">Payment Method</h3>
                                                        <p><c:if test="${c.order.method.id == 1}">
                                                                 ${c.order.method.method}
                                                            </c:if>
                                                            <c:if test="${c.order.method.id == 2}">
                                                                ${c.order.method.method}
                                                            </c:if> <br>

                                                    </div>
                                                    <div class="col-lg-4">
                                                        <h3 class="h4">Status</h3>
                                                        <p><c:if test="${c.order.method.id == 1}">
                                                                Đã thanh toán
                                                            </c:if>
                                                            <c:if test="${c.order.method.id == 2}">
                                                                Thanh toán khi nhận hàng
                                                            </c:if> <br>

                                                    </div>
                                                    <div class="col-lg-4">
                                                        <h3 class="h4">Billing address</h3>
                                                        <address>
                                                            <strong>${c.order.fullName}</strong><br>
                                                            ${c.order.address}<br>
                                                            <abbr title="Phone">Phone: </abbr> ${c.order.phone}
                                                        </address>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                                <div class="col-lg-3">
                                    <!-- Customer Notes -->
                                    <div class="card mb-4">

                                    </div>

                                    <div class="card mb-4">
                                        <form method="POST" action="OrderDetailForStaff">
                                            <!-- Status information -->
                                            <div class="card-body">
                                                <h3 class="h6">Status</h3>
                                                <div class="d-flex align-items-center">
                                                    <input type="hidden" name="orderId" value="${c.order.orderId}">
                                                    <select class="form-control me-3" name="status" aria-label="Order status">
                                                        <c:forEach items="${status}" var="st">
                                                            <c:if test="${c.order.orderStatus.name == 'Confirm' && (st.name == 'Confirm'||st.name == 'Packing')}">
                                                                <option value="${st.id}">${st.name}</option>
                                                            </c:if>
                                                            <c:if test="${c.order.orderStatus.name == 'Packing' && (st.name == 'Packing'||st.name == 'Shipping')}">
                                                                <option value="${st.id}">${st.name}</option>
                                                            </c:if>
                                                            
                                                        </c:forEach>
                                                    </select>
                                                    <button class="btn btn-primary" type="submit">Update</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div> 

                    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>


                    <script type="text/javascript">

                    </script>
                </section>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/asset/js/app.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="${pageContext.request.contextPath}/asset/js/jquery-2.2.3.min.js"></script>
        <script src="${pageContext.request.contextPath}/asset/js/bootstrap2.min.js"></script>
        <script src="${pageContext.request.contextPath}/asset/js/jquery.slimscroll.min.js"></script>
        <script src="${pageContext.request.contextPath}/asset/js/fastclick.js"></script>
        <script src="${pageContext.request.contextPath}/asset/js/app.min.js"></script>
        <script src="${pageContext.request.contextPath}/asset/js/demo.js"></script>
        <script src="${pageContext.request.contextPath}/asset/js/morris.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    </body>
</html>
</body>
</html>
