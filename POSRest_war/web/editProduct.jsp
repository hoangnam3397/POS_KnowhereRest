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
        <jsp:include page="<%= session.getAttribute("loginNavbar").toString() %>"></jsp:include>   
        <!-- Page Content -->


        <!-- Page Content -->
    </script>
    <div class="container container-small">
        <div class="row" style="margin-top:100px;">
            <a class="btn btn-default float-right" href="#" onclick="history.back(-1)"style="margin-bottom:10px;">
                <i class="fa fa-arrow-left"></i> <fmt:message key="admin.editproduct.button.back"/></a>
            <form id="editPro-form" action="editProductServlet" method="post" enctype="multipart/form-data" onsubmit="return checkForm();">      
                <div class="form-group">
                    <label for="ProductName"><fmt:message key="admin.editproduct.text.name"/><a style="color:red">*</a></label>
                    <input type="text" name="pro_name" value="${proName}" maxlength="50" Required class="form-control" id="pro_name" placeholder="Name">
                    <span id="proName-result" value="false"></span>
                </div>
                <div class="form-group">
                    <label for="Category"><fmt:message key="admin.editproduct.text.cate"/></label>
                    <select class="form-control" value="" name="cate" id="Category" required>
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
                    <label for="PurchasePrice"><fmt:message key="admin.editproduct.text.price"/> (|VNĐ)<a style="color:red">*</a></label>
                    <input type="number" step="any" value="${price}" maxlength="8" max="50000000" min="1000" Required name="price"  class="form-control" id="PurchasePrice" placeholder="Purchase Price">
                </div>
                <div class="form-group">
                    <label for="Discount"><fmt:message key="admin.editproduct.text.discount"/> (%)<a style="color:red">*</a></label>
                    <input type="number" name="discount" max="90" min="0" maxlength="2" value="${dis}" class="form-control" id="Discount" placeholder="discount (%)">
                </div>
                <div class="form-group">
                    <label for="exampleInputFile"><fmt:message key="admin.editproduct.text.inputimg"/></label>
                    <input type="file" name="imageInput" id="imageInput" accept="image/pjpeg,image/png" onchange="return fileValidation()">
                </div>
                <div class="form-group">
                    <label for="ProductDescription"><fmt:message key="admin.editproduct.text.description"/></label>
                    <textarea class="form-control" name="descrip" maxlength="200">${description}</textarea>
                </div>
                <div class="form-group">
                    <div class="btn-group white" data-toggle="buttons">
                        <p class="help-block"><fmt:message key="admin.editproduct.text.color"/></p>
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
                            <input type="radio" name="color" id="option7" value="color07" autocomplete="off" > C7
                        </label>
                        <label class="btn color08">
                            <input type="radio" name="color" id="option8" value="color08" autocomplete="off" > C8
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" name="action" id="submitProduct" value="Submit" class="btn btn-green col-md-6 flat-box-btn"><fmt:message key="admin.editproduct.button.submit"/></button>
                </div>
            </form>
            <br>
            <br>
            <br>
        </div>
    </div>
    <!-- /.Modal -->


    <!-- Modal close register -->

    <!-- /.Modal -->
    <script type="text/javascript">
        function fileValidation() {
            /*************** check image **********/
            var fileInput = document.getElementById('imageInput');
            var filePath = fileInput.value;
            var allowedExtensions = /(\.jpg|\.png)$/i;
            if (!allowedExtensions.exec(filePath)) {
                alert('Please upload file having extensions .jpg/.png only.');
                fileInput.value = '';
                return false;
            } else {
                //Image preview
                if (fileInput.files && fileInput.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        document.getElementById('imagePreview').innerHTML = '<img src="' + e.target.result + '"/>';
                    };
                    reader.readAsDataURL(fileInput.files[0]);
                }
            }
        }
        $('#submitProduct').click(function() {
            //kiem tra trinh duyet co ho tro File API
            if (window.File && window.FileReader && window.FileList && window.Blob)
            {
                // lay dung luong va kieu file tu the input file
                var fsize = $('#imageInput')[0].files[0].size;
                var ftype = $('#imageInput')[0].files[0].type;
                var fname = $('#imageInput')[0].files[0].name;

                if (fsize > 1048576)  //thuc hien dieu gi do neu dung luong file vuot qua 1MB
                {
                    alert("Type :" + ftype + " | " + fsize + " bites\n(File: " + fname + ") Too big!");
                    event.preventDefault();
                } else {
                    //alert("Type :" + ftype + " | " + fsize + " bites\n(File :" + fname + ") You are good to go!");

                }
            } else {
                alert("Please upgrade your browser, because your current browser lacks some new features we need!");
            }
        });
    </script>
    <script type="text/javascript">
        /*************** check proName unique **********/
        $(document).ready(function() {
            var x_timer;
            $("#pro_name").keyup(function(e) {
                clearTimeout(x_timer);
                var pro_id = "${pro_id}";
                var pro_name = $(this).val();
                x_timer = setTimeout(function() {
                    check_pro_name_ajax(pro_id, pro_name);
                }, 1000);
            });
            function check_pro_name_ajax(pro_id, pro_name) {
                $("#proName-result").html('<img src="images/ajax-loader.gif" />');
                $.post('ChkEditProName', {'pro_id': pro_id, 'pro_name': pro_name}, function(data) {
                    $("#proName-result").html(data);
                });
            }
        });
        /*************** focus proName error  **********/
        $('#editPro-form').submit(function(event) {
            var errors = $('#proName-resultError').attr('value');
            if (errors == 'false') {
                $('#pro_name').focus();
                event.preventDefault();
            }
        });
    </script>
    <script type="text/javascript">
            function checkForm() {
                var a = $('#PurchasePrice').val();
                var b = 100;
                var c = a % b;
                if (c != 0) {
                    alert("Price must be a multiple of 100");
                    event.preventDefault();
                    $('#PurchasePrice').focus();
                }
            }
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

