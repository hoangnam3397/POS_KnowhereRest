<%-- 
    Document   : changPW
    Created on : Aug 3, 2018, 4:51:45 PM
    Author     : Tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
  
        <form action="changPWServlet" method="post" onsubmit="return checkForm();">

            <div class="box-body">
                <div class="row">
                    <div class="col-xs-12 col-sm-3 col-md-3">
                        <label>Old Password</label>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3">
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-lock"></i>
                            </div>
                            <input class="form-control" id="password"  name="password" value="${password}" placeholder="Enter the Old Password" type="password">
                        </div>
                    </div>
                    <!-- /.input group -->
                </div>
            </div>
            <br/>
            <div class="row">
                <div class="col-xs-12 col-sm-3 col-md-3">
                    <label>New Password</label>
                </div>
                <div class="col-xs-12 col-sm-3 col-md-3">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-lock"></i>
                        </div>
                        <input class="form-control" id="newPassword" name="newpw" value="" placeholder="Enter the New Password" type="password">
                    </div>
                </div>
                <!-- /.input group -->
            </div>
            <br/>
            <div class="row">
                <div class="col-xs-12 col-sm-3 col-md-3">
                    <label>Confirm Password</label>
                </div>
                <div class="col-xs-12 col-sm-3 col-md-3">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-lock"></i>
                        </div>
                        <input class="form-control" id="confirmPassword" name="renewpw" value="" placeholder="Re-enter the New Password" type="password">
                    </div>
                </div>
                <!-- /.input group -->
            </div>
            <div class="box box-primary">
                <div class="box-header">
                    <h2 class="page-header"><i class="fa fa-lock"></i> Change Password</h2>
                    <div class="pull-right">
                        <button type="submit" name="changepw" value="submit" class="btn btn-danger"><i class="livicon" data-n="pen" data-s="16" data-c="#fff" data-hc="0" ></i> Chang Password</button>
                        <button type="reset" name="Reset" value="Reset" class="btn btn-primary"><i class="livicon" data-n="trash" data-s="16" data-c="#fff" data-hc="0"></i>Reset </button>
                    </div>
                </div>
                <!-- /.box-header -->
            </div>
        </form>
    </body>
</html>
