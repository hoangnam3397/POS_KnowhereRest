<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:import url="set_Locale.jsp"/>
<fmt:setBundle basename="i18n/myLanguage"/>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><img src="images/logo4.png" alt="logo"  style='max-height: 45px; max-width: 200px;margin-top:5px;'></a>
        </div>
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="flat-box"><a href="getStoreServlet"><i class="fa fa-credit-card"></i> <span class="menu-text"><fmt:message key="admin.navbar.pos"/></span></a></li>                                    
                <li class="flat-box"><a href="getProductServlet"><i class="fa fa-archive"></i> <span class="menu-text"><fmt:message key="admin.navbar.product"/></span></a></li>
                <li class="flat-box"><a href="getCategoriesServlet"><i class="fa fa-bookmark"></i> <span class="menu-text"><fmt:message key="admin.navbar.categories"/></span></a></li>
                <li class="flat-box"><a href="viewStoreServlet"><i class="fa fa-hospital-o"></i> <span class="menu-text"><fmt:message key="admin.navbar.store"/></span></a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle flat-box" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-users"></i> 
                        <span class="menu-text"><fmt:message key="admin.navbar.people"/></span> 
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="flat-box"><a href="getEmployeesServlet"><i class="fa fa-user"></i> <span class="menu-text"><fmt:message key="admin.navbar.people.emp"/></span></a></li>
                        <li class="flat-box"><a href="getCustomerServlet"><i class="fa fa-user"></i> <span class="menu-text"><fmt:message key="admin.navbar.people.cus"/></span></a></li>
                    </ul>
                </li>                                           
                <li class="flat-box"><a href="GetTopProductServlet"><i class="fa fa-line-chart"></i> <span class="menu-text"><fmt:message key="admin.navbar.report"/></span></a></li>                                </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown language">
                    <a href="#" class="dropdown-toggle flat-box" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <span class="hidden-xs"><fmt:message key="admin.navbar.language"/></span>
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="flat-box"><a href="setLocalen"><img src="images/en.png" class="flag" alt="language"> English</a></li>
                        <li class="flat-box"><a href="setLocalvi" ><img src="images/vn.png" class="flag" alt="language"> Vietnam</a></li>

                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle flat-box" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <img class="img-circle topbar-userpic hidden-xs" src="<%= session.getAttribute("loginImage") %>" width="30px" height="30px">
                        <span class="menu-text">&nbsp;&nbsp;<%= session.getAttribute("loginUser") %></span> 
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="flat-box"><a href="changPW.jsp"><i class="fa fa-user"></i> <span class="menu-text">Change password</span></a></li>
                    </ul>
                </li>            
                <li class="flat-box"><a href="index.html" title="Logout"><i class="fa fa-sign-out fa-lg"></i></a></li>
            </ul>
        </div>
        <div id="loadingimg"></div>
    </div>
    <!-- /.container -->
</nav>
