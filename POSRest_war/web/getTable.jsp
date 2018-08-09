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
    </head>
    <body>
        <!-- Navigation -->
        <jsp:include page="admin_navbar.jsp"/>
        <!-- Page Content -->


        <!-- Page Content -->
        <div class="container  container-small">

            <div class="row" style="margin-top:100px;">
                <div class="row">
                    <h2>Store Zones</h2>
                </div>
                <div class="row">
                    <c:forEach var="s" items="${listZone}">
                        <span class="zone">${s.zoneName}<i id="${s.zoneId}" zone-name="${s.zoneName}" class="fa fa-pencil editzone" aria-hidden="true"></i><i id='${s.zoneId}' class="fa fa-times deletezone"></i></span>
                            </c:forEach>

                    <span data-toggle="modal" data-target="#AddZone" class="zone"><i class="fa fa-plus" style="margin-left:0px;"></i></span>
                </div>
                <div class="row">
                    <h2>Store Tables</h2>
                </div>
                <!-- Button trigger modal -->
                <div class="row">
                    <button type="button" class="btn btn-add btn-lg" data-toggle="modal" data-target="#Addtable" style="margin: 10px 0 !important;">
                        Add table         </button>
                </div>
                <div class="row">
                    <table class="table table-striped table-bordered" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>Table name/number</th>
                                <th>Zone name</th>
                                <th>Action</th>
                            </tr>
                        </thead>                        
                        <tbody>
                            <c:forEach var="s" items="${listZone}">
                                <c:forEach var="t" items="${listTable}">
                                    <c:if test="${s.zoneId==t.zoneId.zoneId}">
                                        <tr>
                                            <td>${t.tabName}</td>
                                            <td>${t.zoneId.zoneName}</td>
                                            <td><div class="btn-group">
                                                    <a class="btn btn-default" href="deleteTableServlet?tab_id=${t.tabId}" data-toggle="tooltip" data-placement="top" title="Delete"><i class="fa fa-times"></i></a>
                                                    <a class="btn btn-default" href="editTableServlet?tab_id=${t.tabId}&action=get" data-toggle="tooltip" data-placement="top" title="Edit"><i class="fa fa-pencil"></i></a>
                                                </div>
                                            </td>
                                        </tr>    
                                     </c:if>
                                 </c:forEach>
                            </c:forEach>
                        </tbody>                       
                    </table>
                </div>
            </div>
        </div>
        <script type="text/javascript">

$(function() {
   /*************** edit zone **********/
$(document).on('click', '.deletezone', function () {

      var zone_id = $(this).attr('id');
         swal({   title: 'Are you sure ?',
         text: 'All the tables related to this zone will be deleted',
         type: "warning",
         showCancelButton: true,
         confirmButtonColor: "#DD6B55",
         confirmButtonText: 'Yes, delete it!',
         closeOnConfirm: false },
         function(){
           // ajax delete data to database
            $.ajax({
                url : "http://localhost:8080/POSRest_war/deleteZoneServlet?zone_id="+zone_id,
                type: "POST",
                success: function(data){
                   location.reload();
                },
                error: function (jqXHR, textStatus, errorThrown){alert("error");}
           });
     swal.close(); });
  });
  /*************** delete zone **********/
  $(document).on('click', '.editzone', function () {
     var id = $(this).attr('id');
     var name = $(this).attr('zone-name');
     $("#zone_id").val(id);
     $("#ZoneName").val(name);
     $('#EditZone').modal('show');
});
});


</script>
       <!-- add table Modal -->
<div class="modal fade" id="Addtable" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add table</h4>
      </div>
      <form action="insertTableServlet?sto_id=${sto_id}" method="post">      
      <div class="modal-body">
            <div class="form-group">
             <label for="TableName">Table name/number *</label>
             <input type="text" name="tab_name" class="form-control" id="TableName" placeholder="Table name/number" required>
           </div>
           <label for="Zones">Choose a zone *</label>
          <select class="form-control" id="Zones" name="zone_id" required>
             <c:forEach var="z" items="${listZone}">
                                <option value="${z.zoneId}" >${z.zoneName}</option>                                
                            </c:forEach>                               
                       </select>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-add">Submit</button>
      </div>
   </form>    </div>
 </div>
</div>
<!-- /.Modal -->

<!-- add Zone Modal -->
<div class="modal fade" id="AddZone" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add zone</h4>
      </div>
      <form action="insertZoneServlet?sto_id=${sto_id}" method="post">      
          <div class="modal-body">
            <div class="form-group">
             <label for="ZonesName">Zone name *</label>
             <input type="text" name="zone_name" placeholder="Zone name" class="form-control" required>
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

<!-- edit Zone Modal -->
<div class="modal fade in" id="EditZone" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
 <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Edit zone</h4>
      </div>
      <form action="editZoneServlet" method="post">      <div class="modal-body">
            <div class="form-group">
             <label for="ZoneName">Zone name *</label>
             <input type="text" name="zone_name" class="form-control" id="ZoneName" placeholder="Zone name" required>
             <input type="hidden" name="zone_id" id="zone_id" >
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

