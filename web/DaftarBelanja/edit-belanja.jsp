<%@page import="java.util.ArrayList"%>
<%@page import="Config.Database"%>
<%
    String id = request.getParameter("id");
    if(id == null) {
        response.sendRedirect(request.getContextPath() + "/DaftarBelanja");
    }
    
    new Database("tumbal_proyek", "root", "");
    ArrayList<ArrayList<String>> belanja = Database.getData("select * from pembelian where id_pembelian='" + id + "'", Database.connection),
            supplier = Database.getData("select id_supplier, nama_supplier from supplier", Database.connection),
            supplierSelect = Database.getData("select id_supplier, nama_supplier from supplier where id_supplier='" + belanja.get(1).get(1) + "'", Database.connection);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="http://localhost:8080/SIKEL_Ganjil/Assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="http://localhost:8080/SIKEL_Ganjil/Assets/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="../DaftarBelanja/index.jsp">
                <div class="sidebar-brand-icon">
                    <img width="70" style="filter: gray-scale(100%);" src="http://localhost:8080/SIKEL_Ganjil/Assets/img/icon.png" alt="icon"/>
                </div>
                <div class="sidebar-brand-text mx-3">SIKEL PCR </div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="http://localhost:8080/SIKEL_Ganjil/Dashboard/DashAIL.jsp">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

            <!-- Nav Item -->
            
            <li class="nav-item">
                <a class="nav-link" href="http://localhost:8080/SIKEL_Ganjil/Pengajuan">
                    <i class="fas fa-fw fa-clipboard-list"></i>
                    <span>Pengajuan</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="http://localhost:8080/SIKEL_Ganjil/DaftarBelanja">
                    <i class="fas fa-fw fa-shopping-cart"></i>
                    <span>Daftar Belanja</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="http://localhost:8080/SIKEL_Ganjil/LPJ">
                    <i class="fas fa-fw fa-archive"></i>
                    <span>LPJ</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="http://localhost:8080/SIKEL_Ganjil/BuktiPembayaran">
                    <i class="fas fa-fw fa-donate"></i>
                    <span>Upload Bukti Pembayaran</span></a>
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

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

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
                                <span class="badge badge-danger badge-counter">3+</span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>

                        

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Bon Bon</span>
                                <img class="img-profile rounded-circle"
                                    src="http://localhost:8080/SIKEL_Ganjil/Assets/img/undraw_profile.svg">
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

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Daftar Belanja | Edit Belanja # <%= belanja.get(1).get(0) %></h1>
                    </div>

                    <div class="container">
                      <form  action="edit-belanja" method="post">
                        <input type="hidden" name="id_pembelian" value="<%= belanja.get(1).get(0) %>">
                        <input type="hidden" name="AIL" value="<%= belanja.get(1).get(2) %>">
                        <input type="hidden" name="LAB" value="<%= belanja.get(1).get(3) %>">
                        <div class="form-group">
                          <label for="nama_barang">Nama Barang</label>
                          <input value="<%= belanja.get(1).get(4) %>" type="text" class="form-control" name="nama_barang" id="nama_barang" aria-describedby="emailHelp" placeholder="Ex: Mouse Logitechy">
                        </div>
                        
                        <div class="form-group">
                          <label for="jumlah_barang">Jumlah Barang</label>
                          <input value="<%= belanja.get(1).get(5) %>" type="number" class="form-control" name="jumlah_barang" id="jumlah_barang" aria-describedby="emailHelp" placeholder="Ex: 12">
                        </div>
                        
                        <div class="form-group">
                          <label for="harga_per_unit">Harga (Per Unit)</label>
                          <input value="<%= belanja.get(1).get(6) %>" type="text" class="form-control" name="harga_per_unit" id="harga_per_unit" aria-describedby="emailHelp" placeholder="Ex: 80000">
                        </div>
                        
                        <div class="form-group">
                          <label for="supplier">Supplier</label>
                          <select id="supplier" name="supplier" class="form-control">
                            <option value="<%= supplierSelect.get(1).get(0) %>" selected><%= supplierSelect.get(1).get(1) %></option>
                            <option>--------------</option>
                            <% for(int i=1; i < supplier.size(); i++) { %>
                              <option value="<%= supplier.get(i).get(0) %>"><%= supplier.get(i).get(1) %></option>
                            <% } %>
                          </select>
                        </div>
                        
                        <div class="form-group">
                          <label for="date">Tanggal Pembelian</label>
                          <input value="<%= belanja.get(1).get(7) %>" type="date" class="form-control" name="tanggal_pembelian" id="date" aria-describedby="dateHelp" placeholder="Enter Date">
                          <small id="dateHelp" class="form-text text-muted">Data belanja akan disimpan dengan akun yang menginputkan data.</small>
                        </div>
                        
                        <button type="submit" class="btn btn-primary">Submit</button>
                      </form>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="http://localhost:8080/SIKEL_Ganjil/Assets/vendor/jquery/jquery.min.js"></script>
    <script src="http://localhost:8080/SIKEL_Ganjil/Assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="http://localhost:8080/SIKEL_Ganjil/Assets/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="http://localhost:8080/SIKEL_Ganjil/Assets/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="http://localhost:8080/SIKEL_Ganjil/Assets/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="http://localhost:8080/SIKEL_Ganjil/Assets/js/demo/chart-area-demo.js"></script>
    <script src="http://localhost:8080/SIKEL_Ganjil/Assets/js/demo/chart-pie-demo.js"></script>

</body>

</html>