
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Customer Report</title>
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
        <script type="text/javascript" src="js/dataTable/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="js/dataTable/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript" src="js/dataTable/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="js/dataTable/buttons.bootstrap.min.js"></script>
        <script type="text/javascript" src="js/dataTable/jszip.min.js"></script>
        <script type="text/javascript" src="js/dataTable/pdfmake.min.js"></script>
        <script type="text/javascript" src="js/dataTable/vfs_fonts.js"></script>
        <script type="text/javascript" src="js/dataTable/buttons.html5.min.js"></script>
        <script type="text/javascript" src="js/dataTable/buttons.print.min.js"></script>
        <script type="text/javascript" src="js/dataTable/buttons.colVis.min.js"></script>
        <link href="css/dataTable/bootstrap.min.css" rel="stylesheet">
        <link href="css/dataTable/dataTables.bootstrap.min.css" rel="stylesheet">
        <link href="css/dataTable/buttons.bootstrap.min.css" rel="stylesheet">
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
        <link href="css/Style-Light2.css" rel="stylesheet">
        <!-- favicon -->
        <link rel="shortcut icon" href="images/icon.png" type="image/x-icon">
        <link rel="icon" href="images/icon.png" type="image/x-icon">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <c:import url="set_Locale.jsp"/>
        <fmt:setBundle basename="i18n/myLanguage"/>
    </head>
    <body>
        <!-- Navigation -->
        <jsp:include page="<%= session.getAttribute("loginNavbar").toString() %>"></jsp:include>   
        <!-- Page Content -->


        <!-- Page Content -->
        <div class="container">
            <h1><fmt:message key="admin.cusreport.text.cusreport"/>(${dateRange})</h1>
            <h4><fmt:message key="admin.cusreport.text.cusname"/> ${cus_name}</h4>
            <h4><fmt:message key="admin.cusreport.text.email"/>${email}</h4>
            <h4><fmt:message key="admin.cusreport.text.phone"/> ${phone}</h4>
            <div class="row" style="margin-top:100px;">
                <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th><fmt:message key="admin.cusreport.table.saleno"/></th>
                            <th><fmt:message key="admin.cusreport.table.cusname"/></th>
                            <th><fmt:message key="admin.cusreport.table.discountC"/></th>
                            <th><fmt:message key="admin.cusreport.table.proname"/></th>
                            <th><fmt:message key="admin.cusreport.table.price"/></th>
                            <th><fmt:message key="admin.cusreport.table.quantity"/></th>
                            <th><fmt:message key="admin.cusreport.table.discountP"/></th>
                            <th><fmt:message key="admin.cusreport.table.tax"/></th>
                            <th><fmt:message key="admin.cusreport.table.time"/></th>
                            <th><fmt:message key="admin.cusreport.table.total"/></th>
                        </tr>
                    </thead>                  
                    <tbody>
                        <c:forEach var="p" items="${listCusReport}">               
                            <tr>
                                <td>${p.orderId}</td>
                                <td>${p.cusName}</td>
                                <td><fmt:formatNumber value="${p.discountC}" minFractionDigits="0"/> %</td>
                                <td>${p.proName}</td>
                                <td><fmt:formatNumber value="${p.price}" minFractionDigits="0"/> VND</td>
                                <td>${p.quantity}</td>
                                <td><fmt:formatNumber value="${p.discountP}" minFractionDigits="0"/> %</td>
                                <td><fmt:formatNumber value="${p.tax}" minFractionDigits="0"/> %</td>
                                <td><fmt:formatDate value="${p.ordertime}" pattern="yyyy-MM-dd HH:mm" /></td>                              
                                <td><fmt:formatNumber value="${p.total}" maxFractionDigits="0"/> VND</td>
                            </tr>                                                   
                        </c:forEach>
                    </tbody>                    
                </table>
                <h1><fmt:message key="admin.cusreport.text.total"/> : <span class="ReportTotal"><fmt:formatNumber value="${Total}" maxFractionDigits="0"/> VND</span></h1>
                <br>
                <br>
                <br>
            </div>
            <script type="text/javascript">
                $(document).ready(function() {
                    $('#example').DataTable({
                        dom: 'Bfrtip',
                        buttons: [
                            'copy', 'csv', 'excel', 'pdf', 'print'
                        ]
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

