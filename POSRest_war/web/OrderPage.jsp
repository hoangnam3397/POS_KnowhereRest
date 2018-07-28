<%-- 
    Document   : homepage
    Created on : Jul 17, 2018, 9:01:50 AM
    Author     : Nam_Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>POS - point of sale Dar Elweb</title>
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
                    <a class="navbar-brand" href="#"><img src="images/maroon-logo.png" alt="logo"  style='max-height: 45px; max-width: 200px;margin-top:5px;'></a>
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
                                <li class="flat-box"><a href="#"><i class="fa fa-truck"></i> <span class="menu-text">Suppliers</span></a></li>
                            </ul>
                        </li>
                        <li class="flat-box"><a href="#"><i class="fa fa-ticket"></i> <span class="menu-text">Sales</span></a></li>
                        <li class="flat-box"><a href="#"><i class="fa fa-usd"></i> <span class="menu-text">Expense</span></a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle flat-box" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-bookmark"></i> <span class="menu-text">Categories </span><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li class="flat-box"><a href="getProductServlet"><i class="fa fa-archive"></i> <span class="menu-text">Product</span></a></li>
                                <li class="flat-box"><a href="#"><i class="fa fa-usd"></i> <span class="menu-text">Expense</span></a></li>
                            </ul>
                        </li>
                        <li class="flat-box"><a href="#"><i class="fa fa-cogs"></i> <span class="menu-text">Setting</span></a></li>                 <li class="flat-box"><a href="http://www.dar-elweb.com/demos/zarest/stats"><i class="fa fa-line-chart"></i> <span class="menu-text">Reports</span></a></li>                                </ul>
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
                            <ul class="dropdown-menu">
                                <li class="flat-box"><a href="#"><img src="images/en.png" class="flag" alt="language"> English</a></li>
                                <li class="flat-box"><a href="#"><img src="images/vn.png" class="flag" alt="language"> Vietnam</a></li>
                            </ul>
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
                    <li data-toggle="tooltip"  data-html="true" data-placement="left" title="Return"><a href="pos/switshtable"><i class="fa fa-reply" aria-hidden="true"></i></a></li>
                    <li data-toggle="tooltip"  data-html="true" data-placement="left" title="Go&nbsp;to&nbsp;Kitchen&nbsp;page"><a href="kitchens"><i class="fa fa-cutlery" aria-hidden="true"></i></a></li>
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
                        <select class="js-select-options form-control" id="customerSelect">
                            <option value="0">Walk in Customer</option>
                            <option value="13">Floridalma Leiva Valdez / </option>
                            <option value="14">mohsinkhan / 9167118387</option>
                            <option value="15">roberto guardado / 943472452</option>
                            <option value="16">JAI / 9923231883</option>
                            <option value="17">jay / 9838389389</option>
                        </select>
                        <span class="hidden" id="customerS"></span>
                    </div>
                    <div class="col-sm-6">
                        <select class="js-select-options form-control" id="WaiterName">
                            <option value="0">without Waiter</option>
                            <option value="7">Sean Wong</option>
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
                        <!-- product List goes here  -->
                    </div>
                    <div class="footer-section">
                        <div class="table-responsive col-sm-12 totalTab">
                            <table class="table">
                                <tr>
                                    <td class="active" width="40%">SubTotal</td>
                                    <td class="whiteBg" width="60%"><span id="Subtot"></span> YTL                        <span class="float-right"><b id="ItemsNum"><span></span> items</b></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="active">Order TAX</td>
                                    <td class="whiteBg"><input type="text" value="18%" onchange="total_change()" id="num01" class="total-input TAX" placeholder="N/A"  maxlength="8">
                                        <span class="float-right"><b id="taxValue"></b></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="active">Discount</td>
                                    <td class="whiteBg"><input type="text" value="0" onchange="total_change()" id="num02" class="total-input Remise" placeholder="N/A"  maxlength="8">
                                        <span class="float-right"><b id="RemiseValue"></b></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="active">Total</td>
                                    <td class="whiteBg light-blue text-bold"><span id="total"></span> YTL</td>
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
                                <a href="javascript:void(0)" class="addPct" id="${pro.proId}" onclick="add_posale('154')">
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

        </script>




        <!-- slim scroll script -->
        <script type="text/javascript" src="js/jquery.slimscroll.min.js"></script>
        <!-- waves material design effect -->
        <script type="text/javascript" src="js/waves.min.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- keyboard widget dependencies -->
        <script type="text/javascript" src="js/jquery.keyboard.js"></script>
        <script type="text/javascript" src="js/jquery.keyboard.extension-all.js"></script>
        <script type="text/javascript" src="js/jquery.keyboard.extension-extender.js"></script>
        <script type="text/javascript" src="js/jquery.keyboard.extension-typing.js"></script>
        <script type="text/javascript" src="js/jquery.mousewheel.js"></script>
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

