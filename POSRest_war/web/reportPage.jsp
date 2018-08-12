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
        <jsp:include page="admin_navbar.jsp"/>
        <!-- Page Content -->


        <!-- Page Content -->
        <div class="container">
            <div class="row" style="margin-top:60px;">
                <div class="col-md-4">
                    <div class="statCart Statcolor01">
                        <i class="fa fa-users" aria-hidden="true"></i>
                        <h1 class="count">${numCus}</h1><br>
                        <span><fmt:message key="admin.reportpage.chart.customer"/></span>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="statCart Statcolor02">
                        <i class="fa fa-archive" aria-hidden="true"></i>
                        <h1 class="count">${numPro}</h1><br>
                        <span><fmt:message key="admin.reportpage.chart.product"/> ${numCat} <fmt:message key="admin.reportpage.chart.cate"/></span>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="statCart Statcolor03">
                        <i class="fa fa-money" aria-hidden="true"></i>
                        <h2 style="display: inline"><span class="count">${totalSale}</span> VND</h2><br>
                        <span><fmt:message key="admin.reportpage.chart.totalsale"/></span>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top:50px;">
                <div class="col-md-8">
                    <!-- chart container  -->
                    <div class="statCart">
                        <h3><fmt:message key="admin.reportpage.chart.monthly"/></h3>
                        <div style="width:100%">
                            <canvas id="canvas" height="330" width="750"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <!-- pie container  -->
                    <div class="statCart">
                        <h3><fmt:message key="admin.reportpage.chart.top5"/></h3>
                        <div id="canvas-holder">
                            <canvas id="chart-area2" width="230" height="230" />            </div>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-top: 50px;">
                <div class="col-md-12">
                    <div class="statCart">
                        <div class="col-md-2"><h4><center><fmt:message key="admin.reportpage.chart.top5"/></center></h4></div>
                        <div class="col-md-2"><h2><center><span class="label label-default" style="background-color: #F3565D;">${product1}</span></center></h2></div>
                        <div class="col-md-2"><h2><center><span class="label label-default" style="background-color: #FC9D9B;">${product2}</span></center></h2></div>
                        <div class="col-md-2"><h2><center><span class="label label-default" style="background-color: #FACDAE;">${product3}</span></center></h2></div>
                        <div class="col-md-2"><h2><center><span class="label label-default" style="background-color: #9FC2C4;">${product4}</span></center></h2></div>
                        <div class="col-md-2"><h2><center><span class="label label-default" style="background-color: #8297A8;">${product5}</span></center></h2></div>
                        <div style="clear:both;"></div>
                    </div>
                </div>
            </div>
            <!-- ************************************************************************************************** -->
            <div class="row rangeStat" style="margin-top:50px;">
                <h3 class="col-sm-12"><fmt:message key="admin.reportpage.report.protitle"/></h3>
                <form action="getProductReport" method="post">
                    <div class="col-md-5">
                        <div class="form-group">
                            <label for="proSelect"><fmt:message key="admin.reportpage.report.selectPro"/></label>
                            <select class="js-select-options form-control" name="productSelect" id="productSelect">                        
                                <c:forEach var="pro" items="${listPro}">
                                    <option value="${pro.proId}">${pro.proName}</option>
                                </c:forEach>                                                        
                            </select>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group">
                            <label><fmt:message key="admin.reportpage.report.selectRange"/></label>
                            <div class="input-group margin-bottom-sm">
                                <span class="input-group-addon RangePicker"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i></span>
                                <input class="form-control" id="ProductRange" type="text" name="daterangeP" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <button class="cancelBtn btn btn-picker" type="submit"><fmt:message key="admin.reportpage.report.submitReport"/></button>
                    </div>
                </form>
            </div>
               <!-- ******************************************Report Customer************************************************* -->      
            <div class="row rangeStat" style="margin-top:50px;">
                <h3 class="col-sm-12"><fmt:message key="admin.reportPage.reportcus.title"/></h3>
                <form action="getCustomerReport" method="post">
                    <div class="col-md-5">
                        <div class="form-group">
                            <label for="customerSelect"><fmt:message key="admin.reportPage.reportcus.select"/></label>
                            <select class="js-select-options form-control" name="cusSelect" id="cusSelect">                        
                                <c:forEach var="cus" items="${listCus}">
                                    <option value="${cus.cusId}">${cus.cusName} / Phone:${cus.phone}</option>
                                </c:forEach>                                                        
                            </select>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group">
                            <label><fmt:message key="admin.reportpage.report.selectRange"/></label>
                            <div class="input-group margin-bottom-sm">
                                <span class="input-group-addon RangePicker"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i></span>
                                <input class="form-control" id="CustomerRange" type="text" name="daterange" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <button class="cancelBtn btn btn-picker" type="submit"><fmt:message key="admin.reportpage.report.submitReport"/></button>
                    </div>
                </form>
            </div>

            <br><br><br>
        </div>




        <!-- ********************************************* warehouses report ***************************************************** -->

        <!-- /.Modal -->


        <!-- Modal close register -->

        <!-- /.Modal -->
        <script>
            /******* Range date picker *******/
            $(function() {
                $('input[name="daterange"]').daterangepicker();
                $('input[name="daterangeP"]').daterangepicker();
                $('input[name="daterangeR"]').daterangepicker();
                var d = new Date().getFullYear();
                $('#ProductRange').val('01/01/' + d + ' - 12/31/' + d);
                $('#CustomerRange').val('01/01/' + d + ' - 12/31/' + d);
                $('#RegisterRange').val('01/01/' + d + ' - 12/31/' + d);

            });
            /************************ Chart Data *************************/
            var randomScalingFactor = function() {
                return Math.round(Math.random() * 100)
            };
            var lineChartData = {
                labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
                datasets: [
                    {
                        label: "Revenue",
                        backgroundColor: "#2AC4C0",
                        borderColor: "#26a5a2",
                        pointBackgroundColor: "#2AC4C0",
                        pointBorderColor: "#fff",
                        pointHoverBackgroundColor: "#fff",
                        pointHoverBorderColor: "#fff",
                        data: ["${value1}", "${value2}", "${value3}", "${value4}", "${value5}", "${value6}", "${value7}", "${value8}", "${value9}", "${value10}", "${value11}", "${value12}"]
                    }
                ]
            }
            window.onload = function() {

                // Chart.defaults.global.gridLines.display = false;

                var ctx = document.getElementById("canvas").getContext("2d");
                window.myLine = new Chart(ctx, {
                    type: 'line',
                    data: lineChartData,
                    options: {
                        scales: {
                            xAxes: [{
                                    gridLines: {
                                        display: false
                                    }
                                }],
                            yAxes: [{
                                    gridLines: {
                                        display: true
                                    }
                                }]
                        },
                        scaleFontSize: 9,
                        tooltipFillColor: "rgba(0, 0, 0, 0.71)",
                        tooltipFontSize: 10,
                        responsive: true
                    }});

                /********************* pie **********************/


                var pieData = {
                    labels: [
                        "${product1}",
                        "${product2}",
                        "${product3}",
                        "${product4}",
                        "${product5}"
                    ],
                    datasets: [
                        {
                            data: ["${Valproduct1}",
                                "${Valproduct2}",
                                "${Valproduct3}",
                                "${Valproduct4}",
                                "${Valproduct5}"],
                            backgroundColor: [
                                "#F3565D",
                                "#FC9D9B",
                                "#FACDAE",
                                "#9FC2C4",
                                "#8297A8"
                            ],
                            hoverBackgroundColor: [
                                "#3e5367",
                                "#95a5a6",
                                "#f5fbfc",
                                "#459eda",
                                "#2dc6a8"
                            ],
                            hoverBorderWidth: [5, 5, 5, 5, 5]
                        }
                    ]
                };

                Chart.defaults.global.legend.display = false;

                var ctx2 = document.getElementById("chart-area2").getContext("2d");
                window.myPie = new Chart(ctx2, {
                    type: 'doughnut',
                    data: pieData});



                $('.count').each(function(index) {
                    var size = $(this).text().split(".")[1] ? $(this).text().split(".")[1].length : 0;
                    $(this).prop('count', 0).animate({
                        Counter: $(this).text()
                    }, {
                        duration: 2000,
                        easing: 'swing',
                        step: function(now) {
                            $(this).text(parseFloat(now).toFixed(size));
                        }
                    });
                });


            }


            /********************************** Get repports functions ************************************/

            function getCustomerReport()
            {
                var client_id = $('#customerSelect').find('option:selected').val();
                var Range = $('#CustomerRange').val();
                var start = Range.slice(6, 10) + '-' + Range.slice(0, 2) + '-' + Range.slice(3, 5);
                var end = Range.slice(19, 23) + '-' + Range.slice(13, 15) + '-' + Range.slice(16, 18);
                // ajax delete data to database
                $.ajax({
                    url: "http://www.dar-elweb.com/demos/zarest/reports/getCustomerReport/",
                    type: "POST",
                    data: {client_id: client_id, start: start, end: end},
                    success: function(data)
                    {
                        $('#statsSection').html(data);
                        $('#stats').modal('show');
                        var table = $('#Table').DataTable({
                            dom: 'T<"clear">lfrtip',
                            tableTools: {
                                'bProcessing': true
                            }
                        });
                    },
                    error: function(jqXHR, textStatus, errorThrown)
                    {
                        alert("error");
                    }
                });

            }

            function getProductReport()
            {
                var product_id = $('#productSelect').find('option:selected').val();
                var Range = $('#ProductRange').val();
                var start = Range.slice(6, 10) + '-' + Range.slice(0, 2) + '-' + Range.slice(3, 5);
                var end = Range.slice(19, 23) + '-' + Range.slice(13, 15) + '-' + Range.slice(16, 18);
                // ajax set data to database
                $.ajax({
                    url: "http://www.dar-elweb.com/demos/zarest/reports/getProductReport/",
                    type: "POST",
                    data: {product_id: product_id, start: start, end: end},
                    success: function(data)
                    {
                        $('#statsSection').html(data);
                        $('#stats').modal('show');
                        var table = $('#Table').DataTable({
                            dom: 'T<"clear">lfrtip',
                            tableTools: {
                                'bProcessing': true
                            }
                        });
                    },
                    error: function(jqXHR, textStatus, errorThrown)
                    {
                        alert("error");
                    }
                });
            }

            function getRegisterReport()
            {
                var store_id = $('#StoresSelect').find('option:selected').val();
                var Range = $('#RegisterRange').val();
                var start = Range.slice(6, 10) + '-' + Range.slice(0, 2) + '-' + Range.slice(3, 5);
                var end = Range.slice(19, 23) + '-' + Range.slice(13, 15) + '-' + Range.slice(16, 18);
                // ajax set data to database
                $.ajax({
                    url: "http://www.dar-elweb.com/demos/zarest/reports/getRegisterReport/",
                    type: "POST",
                    data: {store_id: store_id, start: start, end: end},
                    success: function(data)
                    {
                        $('#statsSection').html(data);
                        $('#stats').modal('show');
                        var table = $('#Table').DataTable({
                            dom: 'T<"clear">lfrtip',
                            tableTools: {
                                'bProcessing': true
                            }
                        });
                    },
                    error: function(jqXHR, textStatus, errorThrown)
                    {
                        alert("error");
                    }
                });
            }

            function getStockReport()
            {
                var stock_id = $('#StockSelect').find('option:selected').val();
                // ajax set data to database
                $.ajax({
                    url: "http://www.dar-elweb.com/demos/zarest/reports/getStockReport/",
                    type: "POST",
                    data: {stock_id: stock_id},
                    success: function(data)
                    {
                        $('#statsSection').html(data);
                        $('#stats').modal('show');
                        var table = $('#Table').DataTable({
                            dom: 'T<"clear">lfrtip',
                            tableTools: {
                                'bProcessing': true
                            }
                        });
                    },
                    error: function(jqXHR, textStatus, errorThrown)
                    {
                        alert("error");
                    }
                });
            }

            function getyearstats(direction) {
                var currentyear = parseInt($('.statYear').text());
                var year = direction === 'next' ? currentyear - 1 : currentyear + 1;

                $.ajax({
                    url: "http://www.dar-elweb.com/demos/zarest/reports/getyearstats/" + year,
                    type: "POST",
                    success: function(data)
                    {
                        $('#statyears').html(data);
                        $('.statYear').text(year);
                        $('[data-toggle="tooltip"]').tooltip();
                    },
                    error: function(jqXHR, textStatus, errorThrown)
                    {
                        alert("error");
                    }
                });
            }

            function RegisterDetails(id) {
                $.ajax({
                    url: "http://www.dar-elweb.com/demos/zarest/reports/RegisterDetails/" + id,
                    type: "POST",
                    success: function(data)
                    {
                        $('#RegisterDetails').html(data);
                        $('#stats').modal('hide');
                        $('#RegisterDetail').modal('show');
                    },
                    error: function(jqXHR, textStatus, errorThrown)
                    {
                        alert("error");
                    }
                });
            }

            function CloseRegisterDetails() {
                $('#RegisterDetail').modal('hide');
                $('#stats').modal('show');
            }

            function delete_register(id) {
                swal({title: 'Are you sure ?',
                    text: 'You will not be able to recover this Data later!',
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: 'Yes, delete it!',
                    closeOnConfirm: false},
                function() {
                    $.ajax({
                        url: "http://www.dar-elweb.com/demos/zarest/reports/delete_register/" + id,
                        type: "POST",
                        error: function(jqXHR, textStatus, errorThrown)
                        {
                            alert("error");
                        }
                    });
                    $('#stats').modal('hide');
                    swal('Deleted!', 'the data has been deleted.', "success");
                });
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

