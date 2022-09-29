
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

            <a class="navbar-brand" href="homeResto.jsp"><%=resto.getNamaR()%></a>
        </div>
       
        <input type="image" src="data:image/jpeg;base64,${imgBase}" width="80" height="100"/>
        <div class="collapse navbar-collapse">


            <ul class="nav navbar-nav navbar-right">

                <li>
                    <a href="./LoginResto.jsp">
                        <p>Keluar</p>

                    </a>
                </li>
                <li class="separator hidden-lg"></li>
            </ul>
        </div>
    </div>
</nav>