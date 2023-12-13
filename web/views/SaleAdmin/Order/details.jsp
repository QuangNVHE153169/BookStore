<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Order Management</title>
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css" />
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick-theme.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
</head>
<%@include file="../../../layout/header.jsp" %>
<body>
    <%@include file="../../../layout/LeftAdminSaleBar.jsp" %>
    <section style="margin-left: 280px; height: calc(92vh); overflow-y: auto;">
        <div class="card my-2 mx-2">
            <div class="card-header">
                <div class="row align-items-center">
                    <h1 class="col-10 fs-2 fw-bold">
                        Order Details
                    </h1>
                    <c:if test="${requestScope.order.status == 1}">
                        <div class="col-2 text-end align-items-center">
                            <a type="button" class="btn btn-danger" onclick="submitForm(this)" data-status="2">
                                REJECT</a>
                            <a type="button" class="btn btn-success" onclick="submitForm(this)" data-status="3">
                                ACCEPT</a>
                        </div>
                        <form action="admin-sale-orders" method="post" id="submitStatus">
                            <input hidden name="orderId" value="${order.orderId}">
                            <input hidden name="status" id="statusVal" value="">
                        </form>
                    </c:if>
                    <c:if test="${requestScope.order.status != 1}">
                        <h1 class="col-2 text-end">
                            <span class="badge ${requestScope.order.status != 3 ? "bg-danger" : "bg-success"}">
                                ${requestScope.order.status != 3 ? "REJECT" : "ACCEPT"}
                            </span>
                        </h1>
                    </c:if>

                </div>
            </div>
            <div class="card-body">
                <div class="col">
                    <div class="row">
                        <div class="col-6">
                            <label for="category-film" class="col-form-label">Full Name:</label>
                            <input type="text" class="form-control req" 
                                   value="${requestScope.order.customerName}" readonly disabled>
                        </div>
                        <div class="col-6">
                            <label for="category-film" class="col-form-label">Email:</label>
                            <input type="text" class="form-control req" 
                                   value="${requestScope.order.customerEmail}" readonly disabled>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label for="category-film" class="col-form-label">Phone: </label>
                            <input type="text" class="form-control req" 
                                   value="${requestScope.order.customerPhone}" readonly disabled>
                        </div>
                        <div class="col-6">
                            <label for="category-film" class="col-form-label">Address: </label>
                            <input type="text" class="form-control req" 
                                   value="${requestScope.order.customerAddress}" readonly disabled>
                        </div>
                    </div>                       
                    <div class="mt-3 container bg-white border rounded-1">   
                        <h3 class="mt-2">Order details</h3>
                        <table class="table mt-3">
                            <thead>
                                <tr style="background-color: #00000010;">
                                    <th scope="col">Book Name</th>
                                    <th scope="col">Author Name</th>
                                    <th scope="col">Unit Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${order.orderDetails}">
                                    <tr>
                                        <td style="height: 78px;">
                                            <div class="d-flex align-items-center h-100">
                                                ${item.book.title}
                                            </div>
                                        </td>
                                        <td style="height: 78px;">
                                            <div class="d-flex align-items-center h-100">
                                                ${item.book.author.authorName}
                                            </div>
                                        </td>
                                        <td style="height: 78px;">
                                            <div class="d-flex align-items-center h-100">
                                                ${item.book.price}
                                            </div>
                                        </td>                                       
                                        <td style="height: 78px;">
                                            <div class="d-flex align-items-center h-100">
                                                ${item.quantity}
                                            </div>
                                        </td>
                                        <td style="height: 78px;">
                                            <div class="d-flex align-items-center h-100">
                                                ${item.book.price * item.quantity}
                                            </div>
                                        </td>                                       
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>

<!-- Script using  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
<script>
                                function submitForm(input) {
                                    var value = input.getAttribute("data-status")
                                    document.getElementById("statusVal").value = value
                                    console.log(document.getElementById("statusVal").value);
                                    document.getElementById("submitStatus").submit();
                                }
</script>
