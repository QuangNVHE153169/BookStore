<head>
    <title>User Profile</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
</head>
<%@ include file="../../layout/header.jsp" %>
<body>
    <div class="d-flex">
        <%@ include file="../../layout/LeftUserBar.jsp" %>
        <section style="margin-left: 280px; height: calc(92vh); overflow-y: auto;">
            <div class="card my-2 mx-2">
                <div class="card-header">
                    <div class="d-flex justify-content-between align-items-center">
                        <h1 class="fs-2 fw-bold">
                            My Order Details
                        </h1>
                    </div>
                </div>
                <div class="card-body">
                    <div class="p-4">                   
                        <div class="mt-3 container bg-white border rounded-1">  
                            <div class="row">
                                <label for="category-film" class="col-form-label">Full Name: ${requestScope.order.customerName}</label>
                                <label for="category-film" class="col-form-label">Email: ${requestScope.order.customerEmail}</label>
                                <label for="category-film" class="col-form-label">Phone: ${requestScope.order.customerPhone}</label>
                                <label for="category-film" class="col-form-label">Address: ${requestScope.order.customerAddress}</label>
                                <label for="category-film" class="col-form-label">Order date: ${requestScope.order.orderDate}</label>
                            </div>                       
                            <div class="mt-3 container bg-white border rounded-1">   
                                <h3 class="mt-2">Order details</h3>
                                <table class="table mt-3">
                                    <thead>
                                        <tr style="background-color: #00000010;">
                                            <th scope="col">Book Name</th>
                                            <th scope="col">Book Image</th>
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
                                                        <img src="${item.book.images.get(0).url}" width="50px" height="50px">
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
                <c:if test="${requestScope.order.status == 1}">
                    <div class="d-flex justify-content-center">
                        <form action="my-order" method="post">
                            <input hidden name="orderId" value="${order.orderId}">
                            <input hidden name="status" id="statusVal" value="6">
                            <button type="submit" class="btn btn-danger mr-2">Cancel</button>
                        </form>
                    </div>
                </c:if>
            </div>
        </section>
    </div>
</body>
<!-- Script using  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
