<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%
    String id = request.getParameter("id");
    String id_ail = request.getParameter("id_ail");
    String status = request.getParameter("ket");
    String host = "jdbc:mysql://localhost:3306/projek_sistemkeuanganlab";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(host, "root", "");
        if (conn != null) {
            if (id != null) {
                PreparedStatement pst = conn.prepareStatement("update laporan set baca='1' where id='" + id + "'");
                pst.executeUpdate();
            }
        }
    } catch (SQLException ex) {
        out.print("Gagal Koneksi");
    } catch (Exception ex) {
        out.print(ex.getMessage());
    }
    String nama = request.getParameter("fname");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Konfirmasi Pengajuan</title>
        <link href="../Assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <link href="../Assets/css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="icon" type="image/png" href="../Assets/img/file.svg" />
        <link href=" ../Assets/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    </head>
    <body id="page-top">
        <!-- Page Wrapper -->
        <div id="wrapper">
            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="view_laporan.jsp">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">SIKEL</div>
                </a>
                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <hr class="sidebar-divider">
                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="../konfirmasi Pengajuan/view_Konfirmasi.jsp">
                        <i class="fas fa-fw fa-list"></i>
                        <span>List Pengajuan</span></a>
                </li>

                <hr class="sidebar-divider">
                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="../Memvalidasi Laporan/view_laporan.jsp">
                        <i class="fas fa-fw fa-file-pdf"></i>
                        <span>LPJ</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">
                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>
            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">
                <!-- Main Content -->
                <div id="content">
                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-search fa-fw"></i>
                                </a>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">Dwi Listiyanti, S.S.T</span>
                                    <img class="img-profile rounded-circle"
                                         src="../Assets/img/file.svg">
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

                    <div style="margin: 20px 30px 20px 30px" class="">
                        <div style="text-align: right; margin: 30px">
                            <form style="display: initial" action="../validasi" method="POST">
                                <input  type="hidden"name="id" value="<%=id%>">
                                <input type="hidden" name="status" value="Terima">
                                <input  type="hidden"name="id_ail" value="<%=id_ail%>">
                                <button type="submit" class="btn btn-primary">Terima</button>
                            </form>
                            <a  style="margin-left: 10px;color: white" class="btn btn-danger" data-toggle="modal" data-target="#modal">Tolak</a>
                        </div>
                        <div>
                            <embed src="<%=nama%>" type="application/pdf" width="100%" height="1000px">
                        </div>        
                    </div>

                    <form action="../validasi" method="POST" >
                        <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Komentar</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"> 
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <input type="hidden" name="id" value="<%=id%>">
                                        <input type="hidden" name="id_ail" value="<%=id_ail%>">
                                        <input type="hidden" name="status" value="tolak">
                                        <textarea type="text" style="width: 100%; height: 150px" name="komentar"></textarea>
                                    </div>
                                    <div class="modal-footer">
                                        <button value="submit" type="submit" class="btn btn-primary">Tolak</button>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </form>
        <script src=" ../Assets/vendor/jquery/jquery.min.js"></script>
        <script src=" ../Assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src=" ../Assets/vendor/jquery-easing/jquery.easing.min.js"></script>
        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>
        <!-- Page level plugins -->
        <script src=" ../Assets/vendor/datatables/jquery.dataTables.min.js"></script>
        <script src=" ../Assets/vendor/datatables/dataTables.bootstrap4.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="../Assets/js/demo/datatables-demo.js"></script>
</body>
</html>
