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
        <jsp:include page="admin_navbar.jsp"/>
        <!-- Page Content -->


        <!-- Page Content -->
        <div class="container">
            <div class="row" style="margin-top:100px;">
                <table id="Table" class="table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th><fmt:message key="admin.categories.table.catename"/></th>
                            <th><fmt:message key="admin.categories.table.createat"/></th>
                            <th><fmt:message key="admin.categories.table.action"/></th>
                        </tr>
                    </thead>                   
                    <tbody>
                        <c:forEach var="cat" items="${listCate}">
                            <tr>
                                <td>${cat.catName}</td>
                                <td><fmt:formatDate value="${cat.createday}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                <td><div class="btn-group">
                                        <a class="btn btn-default delCate" cat-id="${cat.catId}" data-toggle="tooltip" data-placement="top" title="Delete"><i class="fa fa-times"></i></a>
                                        <a class="btn btn-default editCate" cat-id="${cat.catId}" cat-name="${cat.catName}" data-toggle="modal" data-target="#EditCate" data-placement="top" title="Edit"><i class="fa fa-pencil"></i></a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>
            </div>
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-add btn-lg" data-toggle="modal" data-target="#AddCate">
                <fmt:message key="admin.categories.button.addcate"/>   </button>
        </div>
        <!-- add cate Modal -->
        <div class="modal fade" id="AddCate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel"><fmt:message key="admin.categories.dialog.titleaddcate"/></h4>
                    </div>
                    <form action="insertCategoryServlet" method="post">      
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="StoreName"><fmt:message key="admin.categories.dialog.catename"/> *</label>
                                <input type="text" name="cate_name" maxlength="50" class="form-control" id="cate_name" placeholder="Category Name" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal"><fmt:message key="admin.categories.dialog.close"/></button>
                            <button type="submit" class="btn btn-add"><fmt:message key="admin.categories.dialog.submit"/></button>
                        </div>
                    </form>    
                </div>
            </div>
        </div>
        <!-- /.Modal -->
        <script>
            $(function() {
                /*************** delete cate **********/
                $(document).on('click', '.delCate', function() {

                    var cat_id = $(this).attr('cat-id');
                    swal({title: 'Are you sure ?',
                        text: 'All the product related to this category will be deleted',
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: 'Yes, delete it!',
                        closeOnConfirm: false},
                    function() {
                        // ajax delete data to database
                        $.ajax({
                            url: "http://localhost:8080/POSRest_war/deleteCategoryServlet?cate_id=" + cat_id,
                            type: "POST",
                            success: function(data) {
                                location.reload();
                            },
                            error: function(jqXHR, textStatus, errorThrown) {
                                alert("error");
                            }
                        });
                        swal.close();
                    });
                });
                /*************** edit cate **********/
                $(document).on('click', '.editCate', function() {
                    var id = $(this).attr('cat-id');
                    var name = $(this).attr('cat-name');
                    $("#cat_id").val(id);
                    $("#cat_Name").val(name);
                    $('#EditCate').modal('show');
                });
            });
        </script>
        <!-- edit cate Modal -->
        <div class="modal fade" id="EditCate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel"><fmt:message key="admin.categories.edialog.titleaddcate"/></h4>
                    </div>
                    <form action="editCategoryServlet" method="post">      
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="StoreName"><fmt:message key="admin.categories.edialog.catename"/> *</label>
                                <input type="text" name="cate_name" class="form-control" id="cat_Name" maxlength="50" placeholder="Category Name" required>
                                <input type="hidden" name="cat_id" id="cat_id" />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal"><fmt:message key="admin.categories.edialog.close"/></button>
                            <button type="submit" class="btn btn-add"><fmt:message key="admin.categories.edialog.submit"/></button>
                        </div>
                    </form>    
                </div>
            </div>
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

