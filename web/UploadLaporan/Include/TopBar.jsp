<%@page import="java.util.ArrayList"%>
<%@page import="Config.Database"%>
<%
    new Database("tumbal_proyek", "root", "");
    String akses = request.getSession().getAttribute("Hak_Akses").toString();
    String user = request.getSession().getAttribute("First Name").toString();
    int newNotifCount = 0;

    ArrayList<ArrayList<String>> notifikasi = null, notifikasi_ail = null;
    if(akses.equals("AIL")) {
        ArrayList<ArrayList<String>> ail = Database.getData("select id_ail from ail where nama_ail='" + user + "'", Database.connection);
         
        if(ail.size() > 1) {
            notifikasi = Database.getData("select * from notifikasi_ail where status='unread' and id_ail='" + ail.get(1).get(0) + "'" , Database.connection);
            newNotifCount = notifikasi.size() - 1;
        }
    }
    
    
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter"><%= newNotifCount %></span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <!-- Dropdown - Alerts -->
                            <% if(newNotifCount > 0) { %>
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <% for(int i=1; i < notifikasi.size(); i++) { %>
                                <% notifikasi_ail = Database.getData("select * from notifikasi where id_notifikasi='" + notifikasi.get(i).get(1) + "'", Database.connection); %>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-<%= (notifikasi_ail.get(1).get(3).equals("terima")) ? "success" : "danger" %>">
                                            <i class="fas fa-<%= (notifikasi_ail.get(1).get(3).equals("terima")) ? "donate" : "exclamation" %> text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500"><%= notifikasi_ail.get(1).get(2) %></div>
                                        <b style="color: <%= (notifikasi_ail.get(1).get(3).equals("terima")) ? "darkgreen" : "crimson" %>;">Status: <%= notifikasi_ail.get(1).get(3) %></b>
                                        <br>
                                        <%= notifikasi_ail.get(1).get(4) %>
                                    </div>
                                </a>
                                <% } %>
                            </div>
                            <% } %>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%= (String)session.getAttribute("First Name") %></span><br>
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%= (String)session.getAttribute("Hak_Akses") %></span>
                                
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->
    </body>
</html>
