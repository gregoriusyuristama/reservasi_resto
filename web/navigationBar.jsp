<%@page import="java.util.Base64"%>
<nav class="navbar navbar-default navbar-fixed">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="homeResto_1.jsp"><font face = "Comic sans MS" size =" 5">Rest-On</font></a>

        </div>
        <%
            byte[] data = resto.getFoto5().getBytes(1, (int) resto.getFoto5().length());
            String encode = Base64.getEncoder().encodeToString(data);
            request.setAttribute("imgBase", encode);
        %>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="nav-item">
                    <a href="./editProfil.jsp" class="nav-link">
                        <img class="rounded mx-auto d-block" src="data:image/jpeg;base64,${imgBase}" width="30" height="30"/>
                       
                    </a>
                </li>
                <li class="nav-item">
                    <a href="./LoginResto.jsp" class="nav-link">
                        Keluar
                    </a>
                </li>
            </ul>
        </div>
    </div>

</nav>