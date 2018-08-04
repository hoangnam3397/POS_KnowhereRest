<%-- 
    Document   : homepage
    Created on : Jul 17, 2018, 9:01:50 AM
    Author     : Nam_Nguyen
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>POS - point of sale WA</title>
        <!-- jQuery -->
        <script type="text/javascript" src="js/jquery-2.2.2.min.js"></script>
        <script type="text/javascript" src="js/loading.js"></script>
        <!-- normalize & reset style -->
        <link rel="stylesheet" href="css/normalize.min.css"  type='text/css'>
        <link rel="stylesheet" href="css/reset.min.css"  type='text/css'>
        <link rel="stylesheet" href="css/jquery-ui.css"  type='text/css'>
        <!-- google lato/Kaushan/Pinyon fonts -->
        <link href='https://fonts.googleapis.com/css?family=Lato:400,700,900,300' rel='stylesheet' type='text/css'>
        <link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Pinyon+Script" rel="stylesheet">
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- bootstrap-horizon -->
        <link href="css/bootstrap-horizon.css" rel="stylesheet">
        <!-- datatable style -->
        <link href="css/dataTables.bootstrap.css" rel="stylesheet">
        <!-- font awesome -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- include summernote css-->
        <link href="css/summernote.css" rel="stylesheet">
        <!-- waves -->
        <link rel="stylesheet" href="css/waves.min.css">
        <!-- daterangepicker -->
        <link rel="stylesheet" type="text/css" href="css/daterangepicker.css" />
        <!-- css for the preview keyset extension -->
        <link href="css/keyboard-previewkeyset.css" rel="stylesheet">
        <!-- keyboard widget style -->
        <link href="css/keyboard.css" rel="stylesheet">
        <!-- Select 2 style -->
        <link href="css/select2.min.css" rel="stylesheet">
        <!-- Sweet alert swal -->
        <link rel="stylesheet" type="text/css" href="css/sweetalert.css">
        <!-- datepicker css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap-datepicker.min.css">
        <!-- Custom CSS -->
        <link href="css/Style-Light.css" rel="stylesheet">
        <!-- favicon -->
        <link rel="shortcut icon" href="http://www.dar-elweb.com/demos/zarest//favicon.ico?v=2" type="image/x-icon">
        <link rel="icon" href="http://www.dar-elweb.com/demos/zarest//favicon.ico?v=2" type="image/x-icon">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="getStoreServlet"><img src="images/maroon-logo.png" alt="logo"  style='max-height: 45px; max-width: 200px;margin-top:5px;'></a>
                </div>
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="flat-box"><a href="#"><i class="fa fa-credit-card"></i> <span class="menu-text">POS</span></a></li>                            
                        <li class="flat-box"><a href="getProductServlet"><i class="fa fa-archive"></i> <span class="menu-text">Product</span></a></li>
                        <li class="flat-box"><a href="viewStoreServlet"><i class="fa fa-hospital-o"></i> <span class="menu-text">Stores</span></a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle flat-box" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-users"></i> <span class="menu-text">People</span> <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li class="flat-box"><a href="#"><i class="fa fa-user"></i> <span class="menu-text">Waiters</span></a></li>
                                <li class="flat-box"><a href="#"><i class="fa fa-user"></i> <span class="menu-text">Customers</span></a></li>
                            </ul>
                        </li>
                        <li class="flat-box"><a href="#"><i class="fa fa-ticket"></i> <span class="menu-text">Sales</span></a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle flat-box" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-bookmark"></i> <span class="menu-text">Categories </span><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li class="flat-box"><a href="getProductServlet"><i class="fa fa-archive"></i> <span class="menu-text">Product</span></a></li>

                            </ul>
                        </li>
                        <li class="flat-box"><a href="getEmployeesServlet"><i class="fa fa-cogs"></i> <span class="menu-text">Setting</span></a></li>                 <li class="flat-box"><a href="http://www.dar-elweb.com/demos/zarest/stats"><i class="fa fa-line-chart"></i> <span class="menu-text">Reports</span></a></li>                                </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="">
                                <img class="img-circle topbar-userpic hidden-xs" src="http://www.dar-elweb.com/demos/zarest/files/Avatars/9fff9cc26e539214e9a5fd3b6a10cde9.jpg" width="30px" height="30px">
                                <span class="hidden-xs"> &nbsp;&nbsp;admin Doe </span>
                            </a>
                        </li>
                        <li class="dropdown language">
                            <a href="#" class="dropdown-toggle flat-box" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <img src="images/en.png" class="flag" alt="language">
                                <span class="caret"></span></a>
                        </li>
                        <li class="flat-box"><a href="index.html" title="Logout"><i class="fa fa-sign-out fa-lg"></i></a></li>
                    </ul>
                </div>
                <div id="loadingimg"></div>
            </div>
            <!-- /.container -->
        </nav>
        <!-- Page Content -->


        <!-- Page Content -->
        <!-- *************************************************** if a table was choosen ********************************** -->
        <div class="container-fluid">
            <div class="row text-center">
                <h3 style="font-family: 'Kaushan Script', cursive;">Table - ${table}</h3>

            </div>
            <div class="row">
                <ul class="cbp-vimenu2">
                    <li data-toggle="tooltip"  data-html="true" data-placement="left" title="Cancel&nbsp;All"><a href="javascript:void(0)" onclick="CloseTable()"><i class="fa fa-times" aria-hidden="true"></i></a></li>
                    <li data-toggle="tooltip"  data-html="true" data-placement="left" title="Return"><a href="getTableOfZoneFromStore?storeid=${storeid}"><i class="fa fa-reply" aria-hidden="true"></i></a></li>
                    <li data-toggle="tooltip"  data-html="true" data-placement="left" title="Go&nbsp;to&nbsp;Kitchen&nbsp;page"><a href="getTableToKitchen?storeid=${storeid}"><i class="fa fa-cutlery" aria-hidden="true"></i></a></li>
                </ul>
                <div class="col-md-5 left-side">
                    <div class="col-xs-8">
                        <h2>Choose Client</h2>
                    </div>
                    <div class="col-xs-4 client-add">
                        <a href="javascript:void(0)" data-toggle="modal" data-target="#AddCustomer">
                            <span class="fa-stack fa-lg" data-toggle="tooltip" data-placement="top" title="Add New Customer">
                                <i class="fa fa-square fa-stack-2x grey"></i>
                                <i class="fa fa-user-plus fa-stack-1x fa-inverse dark-blue"></i>
                            </span>
                        </a>
                        <a href="javascript:void(0)" onclick="showticket()">
                            <span class="fa-stack fa-lg" data-toggle="tooltip" data-placement="top" title="Show last Receipt">
                                <i class="fa fa-square fa-stack-2x grey"></i>
                                <i class="fa fa-ticket fa-stack-1x fa-inverse dark-blue"></i>
                            </span>
                        </a>
                    </div>
                    <div class="col-sm-6">
                        <select class="js-select-options form-control"  name="customer" id="customerSelect">
                            <c:forEach items="${listCus}" var="cus">
                                <option value="${cus.cusId}">${cus.cusName}</option>
                            </c:forEach>

                        </select>
                        <span class="hidden" id="customerS"></span>
                    </div>
                    <div class="col-sm-6">
                        <select class="js-select-options form-control" name="employee" id="WaiterName">
                            <c:forEach items="${listEmp}" var="emp">
                                <option value="${emp.empId}">${emp.empName}</option>
                            </c:forEach>
                        </select>
                        <span class="hidden" id="waiterS"></span>
                    </div>
                    <div class="col-xs-5 table-header">
                        <h3>Product</h3>
                    </div>
                    <div class="col-xs-2 table-header">
                        <h3>Price</h3>
                    </div>
                    <div class="col-xs-3 table-header nopadding">
                        <h3 class="text-left">Quantity</h3>
                    </div>
                    <div class="col-xs-2 table-header nopadding">
                        <h3>Total</h3>
                    </div>
                    <div id="productList">


                    </div>
                    <div class="footer-section">
                        <div class="table-responsive col-sm-12 totalTab">
                            <table class="table">
                                <tr>
                                    <td class="active" width="40%">SubTotal</td>
                                    <td class="whiteBg" width="60%"><span id="Subtot"></span> VND                        <span class="float-right"><b id="ItemsNum"><span></span> items</b></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="active">Order TAX</td>
                                    <td class="whiteBg"><input type="text" name="tax" value="10" onchange="total_change()" id="tax" class="total-input TAX" placeholder="%"  maxlength="8">%
                                        <span class="float-right"><b id="taxValue"></b></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="active">Discount</td>
                                    <td class="whiteBg"><input type="text" value="0" name="discount" onchange="total_change()" id="disc" class="total-input Remise" placeholder="%"  maxlength="8">%
                                        <span class="float-right"><b id="RemiseValue"></b></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="active">Total</td>
                                    <td class="whiteBg light-blue text-bold"><span  id="total"></span> VND</td>
                                </tr>
                            </table>
                        </div>
                        <button type="button" onclick="cancelPOS()" class="btn btn-red col-md-6 flat-box-btn"><h5 class="text-bold">CANCEL</h5></button>
                        <button type="button" class="btn btn-green col-md-6 flat-box-btn" data-toggle="modal" data-target="#AddSale"><h5 class="text-bold">PAYMENT</h5></button>
                    </div>

                </div>
                <div class="col-md-7 right-side nopadding">
                    <div class="row row-horizon">
                        <span class="categories selectedGat" id=""><i class="fa fa-home"></i></span>
                            <c:forEach items="${listCate}" var="cate">
                            <span class="categories" id="${cate.catId}">${cate.catName}</span>
                        </c:forEach>
                    </div>
                    <div class="col-sm-12">
                        <div id="searchContaner">
                            <div class="input-group stylish-input-group">
                                <input type="text" id="searchProd" class="form-control"  placeholder="Search" >
                                <span class="input-group-addon">
                                    <button type="submit">
                                        <span class="glyphicon glyphicon-search"></span>
                                    </button>
                                </span>
                            </div>
                        </div>
                    </div>
                    <!-- product list section -->
                    <div id="productList2">
                        <c:forEach items="${listPro}" var="pro">
                            <div class="col-sm-2 col-xs-4">
                                <a href="javascript:void(0)" class="addPct" id="${pro.proId}" onclick="add_posale('${tableId}', '${pro.proId}')">
                                    <div class="product ${pro.color} flat-box">
                                        <h3 id="proname">${pro.proName}</h3>
                                        <input type="hidden" id="idname" name="name" value="${pro.proName}" />
                                        <input type="hidden" id="idprice" name="price" value="${pro.price}" />
                                        <input type="hidden" id="category" name="category" value="${pro.catId}" />
                                        <div class="mask">
                                            <h3>${pro.price}</h3>
                                            <p><p>"${pro.description}"</p></p>
                                        </div>
                                        <img src="http://www.dar-elweb.com/demos/zarest/files/products/1edf7ab30f3069cd7d448e3bd78db98b_thumb.jpg" alt="Menu 02">                        </div>
                                </a>
                            </div>
                        </c:forEach>


                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $(document).ready(function() {
                var tableid = "${tableId}";
                $('#productList').load("loadOrderDetail?tableid=" + tableid);
                $('#Subtot').load("subTotServlet?tableid=" + tableid, null, total_change);
                $('#ItemsNum span, #ItemsNum2 span').load("loadItemServlet?tableid=" + tableid);

                $('.Paid').show();
                $('.ReturnChange').show();
                $('.CreditCardNum').hide();
                $('.CreditCardHold').hide();
                $('.ChequeNum').hide();
                $('.stripe-btn').hide();
                



                $("#paymentMethod").change(function() {

                    var p_met = $(this).find('option:selected').val();

                    if (p_met === '0') {
                        $('.Paid').show();
                        $('.ReturnChange').show();
                        $('.CreditCardNum').hide();
                        $('.CreditCardHold').hide();
                        $('.CreditCardMonth').hide();
                        $('.CreditCardYear').hide();
                        $('.CreditCardCODECV').hide();
                        $('#CreditCardNum').val('');
                        $('#CreditCardHold').val('');
                        $('#CreditCardYear').val('');
                        $('#CreditCardMonth').val('');
                        $('#CreditCardCODECV').val('');
                        $('.stripe-btn').hide();
                        $('.ChequeNum').hide();
                    } else if (p_met === '1') {
                        $('.Paid').show();
                        $('.ReturnChange').hide();
                        $('.CreditCardNum').show();
                        $('.CreditCardHold').show();
                        $('.CreditCardMonth').show();
                        $('.CreditCardYear').show();
                        $('.CreditCardCODECV').show();
                        $('.stripe-btn').show();
                        $('.ChequeNum').hide();
                    } else if (p_met === '2') {
                        $('.Paid').hide();
                        $('.ReturnChange').hide();
                        $('.CreditCardNum').hide();
                        $('.CreditCardHold').hide();
                        $('.CreditCardMonth').hide();
                        $('.CreditCardYear').hide();
                        $('.CreditCardCODECV').hide();
                        $('#CreditCardNum').val('');
                        $('#CreditCardHold').val('');
                        $('#CreditCardYear').val('');
                        $('#CreditCardMonth').val('');
                        $('#CreditCardCODECV').val('');
                        $('.stripe-btn').hide();
                        $('.ChequeNum').show();
                    }

                });
                /********************************* Credit Card infos section ****************************************/
                $('#CreditCardNum').validateCreditCard(function(result) {
                    var cardtype = result.card_type == null ? '-' : result.card_type.name;
                    $('.CreditCardNum i').removeClass('dark-blue');
                    $('#' + cardtype).addClass('dark-blue');
                });

                $('#CreditCardNum').keypress(function(e) {
                    var data = $(this).val();
                    if (data.length > 22) {

                        if (e.keyCode == 13) {
                            e.preventDefault();

                            var c = new SwipeParserObj(data);

                            $('#CreditCardNum').val(c.account);
                            $('#CreditCardHold').val(c.account_name);
                            $('#CreditCardYear').val(c.exp_year);
                            $('#CreditCardMonth').val(c.exp_month);
                            $('#CreditCardCODECV').val('');

                        }
                        else {
                            $('#CreditCardNum').val('');
                            $('#CreditCardHold').val('');
                            $('#CreditCardYear').val('');
                            $('#CreditCardMonth').val('');
                            $('#CreditCardCODECV').val('');
                        }

                        $('#CreditCardCODECV').focus();
                        $('#CreditCardNum').validateCreditCard(function(result) {
                            var cardtype = result.card_type == null ? '-' : result.card_type.name;
                            $('.CreditCardNum i').removeClass('dark-blue');
                            $('#' + cardtype).addClass('dark-blue');
                        });
                    }

                });


                // ********************************* change calculations
                $('#Paid').on('keyup', function() {
                    var change = -(parseFloat($('#total').text()) - parseFloat($(this).val()));
                    if (change < 0) {
                        $('#ReturnChange span').text(change.toFixed(1));
                        $('#ReturnChange span').addClass("red");
                        $('#ReturnChange span').removeClass("light-blue");
                    } else {
                        $('#ReturnChange span').text(change.toFixed(1));
                        $('#ReturnChange span').removeClass("red");
                        $('#ReturnChange span').addClass("light-blue");
                    }
                });



                //  search product
                $("#searchProd").keyup(function() {
                    // Retrieve the input field text
                    var filter = $(this).val();
                    // Loop through the list
                    $("#productList2 #proname").each(function() {
                        // If the list item does not contain the text phrase fade it out
                        if ($(this).text().search(new RegExp(filter, "i")) < 0) {
                            $(this).parent().parent().parent().hide();
                            // Show the list item if the phrase matches
                        } else {
                            $(this).parent().parent().parent().show();
                        }
                    });
                });
            });
            function total_change() {
                var subtot = $('#Subtot').text();
                var tax = parseInt(subtot) * (parseFloat($('#tax').val()) / 100);
                var discount = parseFloat(subtot) * (parseFloat($('#disc').val()) / 100);

                $('#total').text((parseFloat(subtot) + Math.floor(tax)) - discount);

            }
            $("#customerSelect").change(function() {
                var id = $("#customerSelect option:selected").attr("value");
                var cusname = $("#customerSelect option:selected").text();
                $('#customerName span').text(cusname);

                $.ajax({
                    url: "loadDiscountServlet?id=" + id,
                    type: "GET",
                    success: function(responseText)
                    {
                        $('#disc').val(responseText);
                        total_change();
                    },
                    error: function(jqXHR, textStatus, errorThrown)
                    {
                        alert("error")
                    }
                });
            });



            $(".categories").on("click", function() {
// Retrieve the input field text
                var filter = $(this).attr('id');
                $(this).parent().children().removeClass('selectedGat');

                $(this).addClass('selectedGat');
// Loop through the list
                $("#productList2 #category").each(function() {
                    // If the list item does not contain the text phrase fade it out
                    if ($(this).val().search(new RegExp(filter, "i")) < 0) {
                        $(this).parent().parent().parent().hide();
                        // Show the list item if the phrase matches
                    } else {
                        $(this).parent().parent().parent().show();
                    }
                });
            });
            function delete_posale(orderid, productid)
            {
                // ajax delete data to database
                var tableid = "${tableId}";

                $.ajax({
                    url: "deleteOrderDetailServlet?orderid=" + orderid + "&productid=" + productid,
                    type: "POST",
                    success: function()
                    {

                        $('#productList').load("loadOrderDetail?tableid=" + tableid);
                        $('#Subtot').load("subTotServlet?tableid=" + tableid, null, total_change);
                        $('#ItemsNum span, #ItemsNum2 span').load("loadItemServlet?tableid=" + tableid);
                    },
                    error: function(jqXHR, textStatus, errorThrown)
                    {
                        alert(productid);
                    }
                });

            }


            function add_posale(tableid, productid)
            {
                // ajax delete data to database
                $.ajax({
                    url: "AddOrderServlet?tableid=" + tableid + "&productid=" + productid,
                    type: "POST",
                    //data: {name: name1, price: price1, product_id: id, number: number, registerid: 75, waiter: waiterID},
                    success: function()
                    {
                        $('#productList').load("loadOrderDetail?tableid=" + tableid);
                        $('#Subtot').load("subTotServlet?tableid=" + tableid, null, total_change);
                        $('#ItemsNum span, #ItemsNum2 span').load("loadItemServlet?tableid=" + tableid);
                    },
                    error: function(jqXHR, textStatus, errorThrown)
                    {
                        alert("error");
                    }
                });



            }
            function edit_posale(orderid, productid)
            {
                var qt1 = $('#qt' + orderid + productid).val();
                $.ajax({
                    url: "editOrderDetail?orderid=" + orderid + "&productid=" + productid + "&quantity=" + qt1,
                    type: "POST",
                    success: function()
                    {
                        $('#productList').load("loadOrderDetail?tableid=" + tableid);
                        $('#Subtot').load("subTotServlet?tableid=" + tableid, null, total_change);
                        $('#ItemsNum span, #ItemsNum2 span').load("loadItemServlet?tableid=" + tableid);
                    },
                    error: function(jqXHR, textStatus, errorThrown)
                    {
                        alert(orderid + "\n" + qt1 + "\n" + productid);
                    }
                });

            }
            function showticket() {
                var hold = $('.selectedHold').attr("id");
                var Total = $('#total').text();
                var totalItems = $('#ItemsNum span').text();
                var waiter = $('#WaiterName').val();
                $('#printSection').load("http://www.dar-elweb.com/demos/zarest/pos/showticket/" + hold + "/" + Total + "/" + totalItems + "/" + waiter);
                $('#ticket').modal('show');
            }

            function saleBtn() {
                var Cusid = $("#customerSelect option:selected").attr("value");
                var Discount = $('.Remise').val();
                var Subtotal = $('#Subtot').text();
                var Tax = $('.TAX').val();
                var paid = $('#Paid').val();
                var tableid = "${tableId}";
                var storeid = "${storeid}";
                var change = $('#ReturnChange span').text();


                $('#printSection').html();
                $('#printSection').load("showTicketServlet?tableid=" + tableid + "&storeid=" + storeid + "&discount=" + Discount + "&Tax=" + Tax + "&paid=" + paid + "&change=" + change + "&customerid=" + Cusid);
                $.ajax({
                    url: "AddnewSaleServlet?tableid=" + tableid + "&paymethod=Cash" + "&discount=" + Discount + "&tax=" + Tax,
                    type: "POST",
                    success: function()
                    {

                        $('#productList').html("");
                        $('#Subtot').load("subTotServlet?tableid=" + tableid, null, total_change);
                        $('#ItemsNum span, #ItemsNum2 span').load("loadItemServlet?tableid=" + tableid);
                        $('#AddSale').modal('hide');
                        $('#ticket').modal('show');
                        $('#ReturnChange span').text('0');
                        $('#Paid').val('0');
                        $('#Subtot').text('0');
                        $('.TAX').val('0');
                        $('.Remise').val('0')


                    },
                    error: function(jqXHR, textStatus, errorThrown)
                    {
                        alert("error");
                    }
                });
            }
            function PrintTicket() {
                    $('.modal-body').removeAttr('id');
                    window.print();
                    $('.modal-body').attr('id', 'modal-body');
                }



        </script>


        <!-- Modal -->
        <div class="modal fade" id="AddSale" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="AddSale">Add Sale</h4>
                    </div>
                    <form>
                        <div class="modal-body">
                            <div class="form-group">
                                <h2 id="customerName">Customer <span>Walk in Customer</span></h2>
                            </div>
                            <div class="form-group">
                                <h3 id="ItemsNum2"><span></span> items</h3>
                            </div>
                            <div class="form-group">
                                <h2 id="TotalModal"></h2>
                            </div>

                            <div class="form-group Paid">
                                <label for="Paid">Paid</label>
                                <input type="text" value="0" name="paid" class="form-control paidk" id="Paid" placeholder="Paid">
                            </div>
                            <div class="form-group CreditCardNum">
                                <i class="fa fa-cc-visa fa-2x" id="visa" aria-hidden="true"></i>
                                <i class="fa fa-cc-mastercard fa-2x" id="mastercard" aria-hidden="true"></i>
                                <i class="fa fa-cc-amex fa-2x" id="amex" aria-hidden="true"></i>
                                <i class="fa fa-cc-discover fa-2x" id="discover" aria-hidden="true"></i>
                                <label for="CreditCardNum">Credit Card Number (swipe)</label>
                                <input type="text" class="form-control cc-num" id="CreditCardNum" placeholder="Credit Card Number (swipe)">
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group CreditCardHold col-md-4 padding-s">
                                <input type="text" class="form-control" id="CreditCardHold" placeholder="Credit Card Holder">
                            </div>
                            <div class="form-group CreditCardHold col-md-2 padding-s">
                                <input type="text" class="form-control" id="CreditCardMonth" placeholder="Month">
                            </div>
                            <div class="form-group CreditCardHold col-md-2 padding-s">
                                <input type="text" class="form-control" id="CreditCardYear" placeholder="Year">
                            </div>
                            <div class="form-group CreditCardHold col-md-4 padding-s">
                                <input type="text" class="form-control" id="CreditCardCODECV" placeholder="CODE CV">
                            </div>
                            <div class="form-group ChequeNum">
                                <label for="ChequeNum">Cheque Number</label>
                                <input type="text" name="chequenum" class="form-control" id="ChequeNum" placeholder="Cheque Number">
                            </div>
                            <div class="form-group ReturnChange">
                                <h3 id="ReturnChange">Change <span>0</span> VND</h3>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-add" onclick="saleBtn()">Submit</button>
                        </div>
                    </form>    </div>
            </div>
        </div>
        <!-- /.Modal -->


        <!-- Modal ticket -->
        <div class="modal fade" id="ticket" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document" id="ticketModal">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="ticket">Receipt</h4>
                    </div>
                    <div class="modal-body" id="modal-body">
                        <div id="printSection">
                            <!-- Ticket goes here -->
                            <center><h1 style="color:#34495E">Empty</h1></center>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default hiddenpr" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-add hiddenpr" onclick="PrintTicket()">Print</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.Modal -->

        <!-- Modal options -->
        <div class="modal fade" id="options" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document" id="ticketModal">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="ticket">Options</h4>
                    </div>
                    <div class="modal-body" id="modal-body">
                        <div id="optionsSection">
                            <!-- Ticket goes here -->
                            <center><h1 style="color:#34495E">Empty</h1></center>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default hiddenpr" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-add" onclick="addPoptions()">Submit</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.Modal -->

        <!-- Modal add user -->
        <div class="modal fade" id="AddCustomer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Add Customer</h4>
                    </div>
                    <form action="http://www.dar-elweb.com/demos/zarest/customers/add" method="post" accept-charset="utf-8" enctype="multipart/form-data">      <div class="modal-body">
                            <div class="form-group">
                                <label for="CustomerName">Customer Name</label>
                                <input type="text" name="name" class="form-control" id="CustomerName" placeholder="Customer Name">
                            </div>
                            <div class="form-group">
                                <label for="CustomerPhone">Phone</label>
                                <input type="text" name="phone" class="form-control" id="CustomerPhone" placeholder="Phone">
                            </div>
                            <div class="form-group">
                                <label for="CustomerEmail">Email</label>
                                <input type="email" name="email" class="form-control" id="CustomerEmail" placeholder="Email">
                            </div>
                            <div class="form-group">
                                <label for="CustomerDiscount">Discount</label>
                                <input type="text" name="discount" class="form-control" id="CustomerDiscount" placeholder="Discount">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-add">Submit</button>
                        </div>
                    </form>    </div>
            </div>
        </div>
        <!-- /.Modal -->

        <!-- slim scroll script -->
        <script type="text/javascript" src="js/jquery.slimscroll.min.js"></script>
        <!-- waves material design effect -->
        <script type="text/javascript" src="js/waves.min.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- keyboard widget dependencies -->

        <!-- select2 plugin script -->
        <script type="text/javascript" src="js/select2.min.js"></script>
        <!-- dalatable scripts -->
        <script src="js/jquery.dataTables.min.js"></script>
        <script src="js/dataTables.bootstrap.js"></script>
        <!-- summernote js -->
        <script src="js/summernote.js"></script>
        <!-- chart.js script -->
        <script src="js/Chart.js"></script>
        <!-- moment JS -->
        <script type="text/javascript" src="js/moment.min.js"></script>
        <!-- Include Date Range Picker -->
        <script type="text/javascript" src="js/daterangepicker.js"></script>
        <!-- Sweet Alert swal -->
        <script src="js/sweetalert.min.js"></script>
        <!-- datepicker script -->
        <script src="js/bootstrap-datepicker.min.js"></script>
        <!-- creditCardValidator script -->
        <script src="js/jquery.creditCardValidator.js"></script>
        <!-- creditCardValidator script -->
        <script src="js/credit-card-scanner.js"></script>
        <script src="js/jquery.redirect.js"></script>
        <!-- ajax form -->
        <script src="js/jquery.form.min.js"></script>
        <!-- custom script -->
        <script src="js/app.js"></script>
    </body>
</html>

