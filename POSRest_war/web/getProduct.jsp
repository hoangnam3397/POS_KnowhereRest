<%-- 
    Document   : homepage
    Created on : Jul 17, 2018, 9:01:50 AM
    Author     : Nam_Nguyen
--%>

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
        <div class="container">
            <div class="row" style="margin-top:100px;">
                <table id="xTable" class="table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th><fmt:message key="admin.product.table.proid"/></th>
                            <th><fmt:message key="admin.product.table.name"/></th>
                            <th><fmt:message key="admin.product.table.cate"/></th>
                            <th class="hidden-xs"><fmt:message key="admin.product.table.description"/></th>
                            <th class="hidden-xs"><fmt:message key="admin.product.table.discount"/> (%)</th>
                            <th><fmt:message key="admin.product.table.price"/></th>
                            <th><i class="fa fa-eye" aria-hidden="true"></i></th>
                            <th><fmt:message key="admin.product.table.action"/></th>                        
                        </tr>
                    </thead>                  
                    <tbody>
                        <c:forEach var="p" items="${listPro}">
                            <tr>
                                <td>${p.proId}</td>
                                <td>${p.proName}</</td>
                                <td>${p.catId.catName}</td>
                                <td class="hidden-xs"><p>${p.description}</p></td>
                                <td><fmt:formatNumber value="${p.discount}" minFractionDigits="0"/>%</td>
                                <td  data-order="20"><fmt:formatNumber value="${p.price}" maxFractionDigits="0"/> VND</td>
                                <c:choose>
                                    <c:when test="${p.hide eq 0}">
                                        <td><label>
                                                <input class="checkboxPro" type="checkbox" proid="${p.proId}" proname="${p.proName}" name="invis" checked="">
                                                <span class="label-text"></span>
                                                </la
                                        </td>
                                    </c:when>    
                                    <c:otherwise>
                                        <td><label>
                                                <input class="checkboxPro" type="checkbox" proid="${p.proId}" proname="${p.proName}" name="invis">
                                                <span class="label-text"></span>
                                            </label>
                                        </td>
                                    </c:otherwise>
                                </c:choose>
                                <td><div class="btn-group">
                                        <a class="btn btn-default" href="javascript:void(0)" data-toggle="popover" data-placement="left"  data-html="true" title='Are you sure ?' data-content='<a class="btn btn-danger" href="deleteProductServlet?pro_id=${p.proId}">Yes, delete it!</a>'><i class="fa fa-times"></i></a>                      
                                        <a class="btn btn-default" href="editProductServlet?pro_id=${p.proId}" data-toggle="tooltip" data-placement="top" title="Edit"><i class="fa fa-pencil"></i></a>
                                        <a class="btn color03 white open-modalimage ViewImg" imgLink="${p.imagelink}" href="" data-toggle="modal" data-target="#ImageModal"><i class="fa fa-picture-o" data-toggle="tooltip" data-placement="top" title="View Image"></i></a>
                                        <a class="btn btn-default ViewBarcode" href="javascript:void(0)" barcodeid="${p.proId}" data-toggle="modal" data-target="#barcode"><i class="fa fa-barcode" data-toggle="tooltip" data-placement="top" title="" data-original-title="print barcode"></i></a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>                    
                </table>
            </div>

            <!-- Button trigger modal -->
            <button type="button" class="btn btn-add btn-lg" data-toggle="modal" data-target="#Addproduct"><fmt:message key="admin.product.button.addpro"/></button>

            <div class=" float-right">
                <a class="btn btn-red btn-xs" style="margin-bottom: 100px;" data-toggle="modal" data-target="#PrintMenu"><fmt:message key="admin.product.button.printmenu"/></a>
            </div>
        </div>
        <!-- /.Modal -->


        <!-- Modal close register -->

        <!-- /.Modal -->
        <div class="modal fade" id="Addproduct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel"><fmt:message key="admin.product.dialog.titleaddpro"/></h4>
                    </div>
                    <form id="insertPro-form" action="insertProductServlet" method="post" enctype="multipart/form-data" onsubmit="return checkForm();">      
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="ProductName"><fmt:message key="admin.product.dialog.proname"/> <a style="color: red">*</a></label>
                                <input type="text" name="pro_name" maxlength="50" Required class="form-control" id="pro_name" placeholder="Name">
                                <span id="proName-result" value="false"></span>
                            </div>
                            <div class="form-group">
                                <label for="Category"><fmt:message key="admin.product.dialog.cate"/></label>
                                <select class="form-control" value="" name="cate" id="Category" required>
                                    <c:forEach var="cat" items="${listCate}">
                                        <option value="${cat.catId}">${cat.catName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group" id="pushaceP">
                                <label for="PurchasePrice"><fmt:message key="admin.product.dialog.price"/> (|VNĐ)<a style="color: red">*</a></label>
                                <input type="number" step="any" name="price" max="50000000" min="1000" maxlength="8" class="form-control" id="PurchasePrice" placeholder="Purchase Price" Required>
                            </div>
                            <div class="form-group">
                                <label for="Discount"><fmt:message key="admin.product.dialog.discount"/> (%)<a style="color: red">*</a></label>
                                <input type="number" name="discount" maxlength="2" max="90" min="0" class="form-control" id="Discount" placeholder="discount (%)" Required>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputFile"><fmt:message key="admin.product.dialog.inputimg"/> </label>
                                <input type="file" name="imageInput" id="imageInput" accept="image/pjpeg,image/png" onchange="return fileValidation()">
                            </div>
                            <div class="form-group">
                                <label for="ProductDescription"><fmt:message key="admin.product.dialog.description"/> </label>                              
                                <textarea class="form-control" name="descrip" id="descrip" maxlength="200">                                  
                                </textarea>
                            </div>
                            <div class="form-group">
                                <div class="btn-group white" data-toggle="buttons">
                                    <p class="help-block"><fmt:message key="admin.product.dialog.color"/></p>
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
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal"><fmt:message key="admin.product.dialog.close"/></button>
                            <button type="submit" name="submitProduct" id="submitProduct" value="Submit" class="btn btn-add insertPro"><fmt:message key="admin.product.dialog.submit"/></button>
                        </div>
                    </form>    
                </div>
            </div>
        </div>
        <!-- /.Modal -->       

        <!-- Modal View Images -->
        <div class="modal fade" id="ImageModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel"><fmt:message key="admin.product.dialogImg.title"/></h4>
                    </div>    
                    <div class="modal-body">
                        <div class="form-group">                         
                            <img id="imgUrl" src="" class="img-responsive center" alt="">
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><fmt:message key="admin.product.dialogImg.close"/></button>
                    </div>    
                </div>
            </div>
        </div>


        <!-- Modal barcode -->
        <div class="modal fade" id="barcode" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document" id="stockModal">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="barcodeP"><fmt:message key="admin.getproduct.dialogbarcode.title"/></h4>
                    </div>
                    <div class="modal-body" id="modal-body">
                        <div id="printSection" style="text-align: center;">
                            <img id="imgBarcode1" src="" class="img-responsive center" alt="">
                            <img id="imgBarcode2" src="" class="img-responsive center" alt="">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default hiddenpr" data-dismiss="modal"><fmt:message key="admin.getproduct.dialogbarcode.close"/></button>
                        <button type="button" class="btn btn-add hiddenpr" onclick="Printbarcode()"><fmt:message key="admin.getproduct.dialogbarcode.print"/></button>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.Modal -->

        <div class="modal fade" id="PrintMenu" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Menu</h4>
                    </div>
                    <form>
                        <div class="modal-body" id="modal-body">
                            <div id="printmenusection">
                                <div id="printSectionInvoice">
                                    <center><h1 style="font-family: 'Pinyon Script', cursive;font-size:65px;">Menu</h1></center>
                                        <c:forEach var="Cate" items="${listCate}">
                                        <div class="headline">
                                            <h1>
                                                <i class="fa fa-star opacity-large"></i>
                                                <i class="fa fa-star opacity-medium"></i>
                                                <i class="fa fa-star opacity-medium"></i>
                                                <i class="fa fa-star opacity-small"></i>
                                                &nbsp;
                                                ${Cate.catName}                  &nbsp;
                                                <i class="fa fa-star opacity-small"></i>
                                                <i class="fa fa-star opacity-medium"></i>
                                                <i class="fa fa-star opacity-medium"></i>
                                                <i class="fa fa-star opacity-large"></i>
                                            </h1>
                                        </div><hr>
                                        <div class="row">
                                            <c:forEach var="Product" items="${listPro}">                                       
                                                <c:if test="${Cate.catId==Product.catId.catId}">
                                                    <div class="col-xs-6">
                                                        <div class="media" style="height: 100px;">
                                                            <div class="media-left">
                                                                <a href="#">
                                                                    <img class="img-rounded media-object" style="max-width: 64px;max-height: 64px;" src="${Product.imagelink}"/>
                                                                </a>
                                                            </div>
                                                            <div class="media-body">
                                                                <h4 class="media-heading" style="font-family: 'Kaushan Script', cursive;">${Product.proName} <span class="label label-danger pull-right"><fmt:formatNumber value="${Product.price}" minFractionDigits="0"/> VND</span></h4>
                                                                <div class="grey">${Product.description}</div>
                                                            </div>
                                                        </div>
                                                    </div>                                                                                                                                        
                                                </c:if>                                       
                                            </c:forEach>
                                        </div>     
                                    </c:forEach>
                                </div>
                            </div>
                        </div>                   
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal"><fmt:message key="admin.product.dialogmenu.buttonclose"/></button>
                            <button type="button" class="btn btn-add hiddenpr" id="print" onclick="PrintTicket()"><fmt:message key="admin.product.dialogmenu.buttonprint"/></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- // -->
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

            $(function() {
                /*************** load image **********/
                $(document).on('click', '.ViewImg', function() {
                    var imgLink = $(this).attr('imgLink');
                    $("#imgUrl").attr('src', imgLink);
                    $('#ImageModal').modal('show');
                });
            });

            $(function() {
                /*************** load barcode **********/
                $(document).on('click', '.ViewBarcode', function() {
                    var barcodeid = $(this).attr('barcodeid');
                    var barcodeP = 'createBarCode?value=' + barcodeid;
                    $("#imgBarcode1").attr('src', barcodeP);
                    $("#imgBarcode2").attr('src', barcodeP);
                    $('#barcode').modal('show');
                });
            });
            /*************** dataTable **********/
            $(document).ready(function() {
                $('#xTable').DataTable();
            });
            /*************** print Menu**********/
            function PrintTicket() {

                printDivCSS = new String('<link rel="stylesheet" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css"><link href="https://fonts.googleapis.com/css?family=Pinyon+Script" rel="stylesheet"><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"><style>/************************* menu print style ***************************/ .headline { font-family: "Kaushan Script", cursive; background-color: #e74c3c; color: white; text-align: center; padding: 2px 0; margin-top: 10px; position: relative; } .headline::before, .headline::after { content: ""; height: 1px; width: 100%; background-color: #e74c3c; display: block; left: 0; position: absolute; } .headline::before { top: -6px; } .headline::after { bottom: -6px; } .opacity-small { font-size: 30px; opacity: 0.7; filter: Alpha(opacity=70); } .opacity-medium { font-size: 20px; opacity: 0.5; filter: Alpha(opacity=50); } .opacity-large { font-size: 15px; opacity: 0.25; filter: Alpha(opacity=25); } .logo-menu{ margin: 0 auto; padding: 50px 0 0 0; } .grey{ color: #aaa; }@media print { html, body { zoom: 100%; overflow:hidden !important; }}</style>');

                var newWindow = window.open();
                newWindow.document.write(printDivCSS + '<div class="container">' + document.getElementById("printmenusection").innerHTML + '</div>');
                setTimeout(function() {
                    newWindow.print()
                }, 1000);

                //  $('.modal-body').removeAttr('id');
                //
                //  window.print();
                //  $('.modal-body').attr('id', 'modal-body');
            }
            function Printbarcode() {
                $('.modal-body').removeAttr('id');
                window.print();
                $('.modal-body').attr('id', 'modal-body');
            }
        </script>
        <script type="text/javascript">
            /*************** check proName unique **********/
            $(document).ready(function() {
                var x_timer;
                $("#pro_name").keyup(function(e) {
                    clearTimeout(x_timer);
                    var pro_name = $(this).val();
                    x_timer = setTimeout(function() {
                        check_pro_name_ajax(pro_name);
                    }, 1000);
                });

                function check_pro_name_ajax(pro_name) {
                    $("#proName-result").html('<img src="images/ajax-loader.gif" />');
                    $.post('ChkInsertProName', {'pro_name': pro_name}, function(data) {
                        $("#proName-result").html(data);
                    });
                }
            });
            /*************** focus proName error  **********/
            $('#insertPro-form').submit(function(event) {
                var errors = $('#proName-resultError').attr('value');
                if (errors == 'false') {
                    $('#pro_name').focus();
                    event.preventDefault();
                }
            });

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
            $(function() {
                /*************** edit check box **********/
                $(document).on('click', '.checkboxPro', function() {

                    var pro_id = $(this).attr('proid');
                    var pro_name = $(this).attr('proname');
                    swal({title: 'Product display change !',
                        text: 'You have changed display ' + pro_name + ' in POS',
                        type: "warning",
                        showCancelButton: false,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: 'OK !!!',
                        closeOnConfirm: false},
                    function() {
                        // ajax delete data to database
                        $.ajax({
                            url: "http://localhost:8080/POSRest_war/hideProductToOrder?proid=" + pro_id,
                            type: "POST",
                            success: function(data) {

                            },
                            error: function(jqXHR, textStatus, errorThrown) {
                                alert("error");
                            }
                        });
                        swal.close();
                    });
                });
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

