<%-- 
    Document   : homepage
    Created on : Jul 17, 2018, 9:01:50 AM
    Author     : Nam_Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>WAPOS - point of sale</title>
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
        <jsp:include page="<%= session.getAttribute("loginNavbar").toString()%>"></jsp:include>   
            <!-- Page Content -->

            <!-- Page Content -->
            <div class="container container-small">
                <div class="row" style="margin-top:100px;">
                    <a class="btn btn-default float-right" href="#" onclick="history.back(-1)"style="margin-bottom:10px;">
                        <i class="fa fa-arrow-left"></i> <fmt:message key="admin.editCus.button.back"/></a>
                    <form id="editCusForm" action="editCustomerServlet?action=Submit" method="post" >      
                        <div class="form-group" >
                            <input type="hidden" step="any" value="${cus_id}" maxlength="50" Required name="cus_id"  class="form-control" id="cus_id" placeholder="Email">
                    </div>
                    <div class="form-group" id="pushaceP">
                        <label for="email"><fmt:message key="admin.editCus.text.email"/><a style="color:red">*</a></label>
                        <input type="email" step="any" value="${email}" maxlength="50" Required name="email"  class="form-control" id="email" placeholder="Email">
                        <span id="Emailresult" value="false"></span>
                    </div>
                    <div class="form-group">
                        <label for="phone"><fmt:message key="admin.editCus.text.phone"/><a style="color:red">*</a></label>
                        <input type="number" name="phone" maxlength="15" minlength="10"  value="${phone}" class="form-control" id="phone" placeholder="Phone Number">
                    </div>
                    <div class="form-group">
                        <label for="Discount"><fmt:message key="admin.editCus.text.discount"/> (%)<a style="color:red">*</a></label>
                        <input type="number" name="discount" max="90" min="0" maxlength="2" value="${dis}" class="form-control" id="Discount" placeholder="discount (%)">
                    </div>

                    <div class="form-group">
                        <button type="submit" name="action" value="Submit" class="btn btn-green col-md-6 flat-box-btn"><fmt:message key="admin.editCus.button.submit"/></button>
                    </div>
                </form>  
            </div>
        </div>
        <!-- /.Modal -->
        <script type="text/javascript">
            /*************** check userName unique **********/
            $(document).ready(function() {
                var x_timer;
                $('#email').keyup(function(e) {
                    clearTimeout(x_timer);

                    var email = $(this).val();
                    var cus_id = "${cus_id}";
                    x_timer = setTimeout(function() {
                        check_email_cus_ajax(cus_id, email);
                    }, 1000);
                });
                function check_email_cus_ajax(cus_id, email) {
                    $('#Emailresult').html('<img src="images/ajax-loader.gif" />');
                    $.post('ChkCusEditEmail', {'cus_id': cus_id, 'email': email}, function(data) {
                        $('#Emailresult').html(data);
                    });
                }
            });
            $('#editCusForm').submit(function(event) {
                var errors = $('#Email-resultError').attr('value');
                if (errors == 'false') {
                    $('#email').focus();
                    event.preventDefault();
                }
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

