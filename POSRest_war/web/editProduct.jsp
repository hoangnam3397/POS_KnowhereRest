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
                <a class="navbar-brand" href="#"><img src="images/icons/Untitled.png" alt="logo"  style='max-height: 45px; max-width: 200px;margin-top:5px;'></a>
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
   </script>
<div class="container container-small">
   <div class="row" style="margin-top:100px;">
      <a class="btn btn-default float-right" href="#" onclick="history.back(-1)"style="margin-bottom:10px;">
         <i class="fa fa-arrow-left"></i> Back</a>
      <form action="editProductServlet" method="post">      
        <div class="form-group">
         <label for="ProductName">Name</label>
         <input type="text" name="pro_name" value="${proName}" maxlength="25" Required class="form-control" id="ProductName" placeholder="Name">
        </div>
        <div class="form-group">
         <label for="Category">Category</label>
         <select class="form-control" value="Juices" name="cate" id="Category">
                           <c:forEach var="z" items="${listCate}">
                                <c:if test="${z.catId==cateid}">
                                    <option selected value="${z.catId}">${z.catName}</option>
                                </c:if>
                                <c:if test="${z.catId!=cateid}">
                                    <option value="${z.catId}">${z.catName}</option>
                                </c:if>
                            </c:forEach> 
                     </select>
        </div>
        <div class="form-group" id="pushaceP">
         <label for="PurchasePrice">Price (|VNĐ)</label>
         <input type="number" step="any" value="${price}" Required name="price"  class="form-control" id="PurchasePrice" placeholder="Purchase Price">
        </div>
        <div class="form-group">
          <label for="Discount">Discount (%)</label>
          <input type="text" name="discount" maxlength="10" value="${dis}" class="form-control" id="Discount" placeholder="discount (%)">
        </div>
        <div class="form-group">
         <label for="exampleInputFile">Input Image</label>
         <input type="file" name="userfile" id="ImageInput">
        </div>
        <div class="form-group">
         <label for="ProductDescription">Product Description</label>
         <textarea class="form-control" name="des">${description}</textarea>
      </div>
        <div class="form-group">
           <div class="btn-group white" data-toggle="buttons">
              <p class="help-block">Choose color to Display in POS.</p>
              <label class="btn color01">
                 <input type="radio" name="color" id="option1" value="color01" autocomplete="off" > C1
              </label>
              <label class="btn color02">
                 <input type="radio" name="color" id="option2" value="color02" autocomplete="off" > C2
              </label>
              <label class="btn color03">
                 <input type="radio" name="color" id="option3" value="color03" autocomplete="off" > C3
              </label>
              <label class="btn color04">
                 <input type="radio" name="color" id="option4" value="color04" autocomplete="off" > C4
              </label>
              <label class="btn color05">
                 <input type="radio" name="color" id="option5" value="color05" autocomplete="off" > C5
              </label>
              <label class="btn color06">
                 <input type="radio" name="color" id="option6" value="color06" autocomplete="off" > C6
              </label>
              <label class="btn color07">
                 <input type="radio" name="color" id="option7" value="color07" autocomplete="off" checked> C7
              </label>
              <label class="btn color08">
                 <input type="radio" name="color" id="option8" value="color08" autocomplete="off" > C8
              </label>
           </div>
                    </div>
      <div class="form-group">
          <button type="submit" name="action" value="Submit" class="btn btn-green col-md-6 flat-box-btn">Submit</button>
      </div>
      </form>   </div>
</div>
   <!-- /.Modal -->
   

<!-- Modal close register -->

<!-- /.Modal -->




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

