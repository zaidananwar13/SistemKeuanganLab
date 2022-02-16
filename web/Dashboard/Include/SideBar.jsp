<%-- 
    Document   : SideBar
    Created on : Feb 9, 2022, 3:43:21 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
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
                <a class="nav-link" href="http://localhost:8080/SIKEL_Ganjil/UploadLaporan/Upload.jsp">
                    <i class="fas fa-fw fa-donate"></i>
                    <span>Upload Laporan</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>
        </ul>
        <!-- End of Sidebar -->
        
        
   

    </body>
</html>
