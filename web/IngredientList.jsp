<%-- 
    Document   : UserList
    Created on : Nov 30, 2021, 3:44:27 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Ingredient Lists</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="favicon.ico">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="../DataTables/datatables.css" />
        <script type="text/javascript" src="../DataTables/datatables.js"></script>
        <script defer src="../plugins/fontawesome/js/all.min.js"></script>
        <link id="theme-style" rel="stylesheet" href="../css/portal.css">
        <script src="../DataTables/DataTables-1.11.3/js/dataTables.buttons.min.js" type="text/javascript"></script>
        <%
            Cookie cookie = null;
            Cookie[] cookies = request.getCookies();
            String ROLE = "";
            for (int i = 0; i < cookies.length; i++) {
                cookie = cookies[i];
                if (cookie.getName().equalsIgnoreCase("ROLE")) {
                    ROLE = cookie.getValue().toString();
                }
            }
        %>
    </head>
    <body class="app">
        <header class="app-header fixed-top">
            <div class="app-header-inner">
                <div class="container-fluid py-2">
                    <div class="app-header-content">
                        <div class="row justify-content-between align-items-center">
                            <div class="col-auto">
                                <a id="sidepanel-toggler" class="sidepanel-toggler d-inline-block d-xl-none" href="#">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30" role="img"><title>Menu</title><path stroke="currentColor" stroke-linecap="round" stroke-miterlimit="10" stroke-width="2" d="M4 7h22M4 15h22M4 23h22"></path></svg>
                                </a>
                            </div>
                            <div class="search-mobile-trigger d-sm-none col">
                                <i class="search-mobile-trigger-icon fas fa-search"></i>
                            </div>
                            <div class="app-utilities col-auto">
                                <div class="app-utility-item app-user-dropdown dropdown">
                                    <a class="dropdown-toggle" id="user-dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><img src="../img/avatar.png" alt="user profile"></a>
                                    <ul class="dropdown-menu" aria-labelledby="user-dropdown-toggle">
                                        <%
                                            if (ROLE.equalsIgnoreCase("") || ROLE.equalsIgnoreCase("user") || ROLE.equalsIgnoreCase("staff")) {
                                        %>
                                        <li><a class="dropdown-item" href="account.html">Account</a></li>
                                        <li><a class="dropdown-item" href="settings.html">Settings</a></li>
                                            <%
                                                } else if (ROLE.equalsIgnoreCase("admin")) {
                                                }
                                            %>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/Logout">Log Out</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="app-sidepanel" class="app-sidepanel">
                <div id="sidepanel-drop" class="sidepanel-drop"></div>
                <div class="sidepanel-inner d-flex flex-column">
                    <a href="#" id="sidepanel-close" class="sidepanel-close d-xl-none">&times;</a>
                    <div class="app-branding">
                        <a class="app-logo" href="${pageContext.request.contextPath}"><span class="logo-text">FOODWHALE</span></a>
                    </div>
                    <nav id="app-nav-main" class="app-nav app-nav-main flex-grow-1">
                        <ul class="app-menu list-unstyled accordion" id="menu-accordion">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/Dashboard">
                                    <span class="nav-icon">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-house-door" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M7.646 1.146a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 .146.354v7a.5.5 0 0 1-.5.5H9.5a.5.5 0 0 1-.5-.5v-4H7v4a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .146-.354l6-6zM2.5 7.707V14H6v-4a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v4h3.5V7.707L8 2.207l-5.5 5.5z"/>
                                        <path fill-rule="evenodd" d="M13 2.5V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
                                        </svg>
                                    </span>
                                    <span class="nav-link-text">Dashboard</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/Dashboard/OrderList">
                                    <span class="nav-icon">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-card-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
                                        <path fill-rule="evenodd" d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5z"/>
                                        <circle cx="3.5" cy="5.5" r=".5"/>
                                        <circle cx="3.5" cy="8" r=".5"/>
                                        <circle cx="3.5" cy="10.5" r=".5"/>
                                        </svg>
                                    </span>
                                    <span class="nav-link-text">Orders</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/Dashboard/AccountList">
                                    <span class="nav-icon">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-folder" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M9.828 4a3 3 0 0 1-2.12-.879l-.83-.828A1 1 0 0 0 6.173 2H2.5a1 1 0 0 0-1 .981L1.546 4h-1L.5 3a2 2 0 0 1 2-2h3.672a2 2 0 0 1 1.414.586l.828.828A2 2 0 0 0 9.828 3v1z"/>
                                        <path fill-rule="evenodd" d="M13.81 4H2.19a1 1 0 0 0-.996 1.09l.637 7a1 1 0 0 0 .995.91h10.348a1 1 0 0 0 .995-.91l.637-7A1 1 0 0 0 13.81 4zM2.19 3A2 2 0 0 0 .198 5.181l.637 7A2 2 0 0 0 2.826 14h10.348a2 2 0 0 0 1.991-1.819l.637-7A2 2 0 0 0 13.81 3H2.19z"/>
                                        </svg>
                                    </span>
                                    <%
                                        if (ROLE.equalsIgnoreCase("") || ROLE.equalsIgnoreCase("user") || ROLE.equalsIgnoreCase("staff")) {
                                    %>
                                    <span class="nav-link-text">Customers</span>
                                    <%
                                    } else if (ROLE.equalsIgnoreCase("admin")) {%>
                                    <span class="nav-link-text">Accounts</span>
                                    <%}%>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/Dashboard/RecipeList">
                                    <span class="nav-icon">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-card-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
                                        <path fill-rule="evenodd" d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5z"/>
                                        <circle cx="3.5" cy="5.5" r=".5"/>
                                        <circle cx="3.5" cy="8" r=".5"/>
                                        <circle cx="3.5" cy="10.5" r=".5"/>
                                        </svg>
                                    </span>
                                    <span class="nav-link-text">Recipes</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="${pageContext.request.contextPath}/Dashboard/IngredientList">
                                    <span class="nav-icon">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-files" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M4 2h7a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2zm0 1a1 1 0 0 0-1 1v10a1 1 0 0 0 1 1h7a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1H4z"/>
                                        <path d="M6 0h7a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2v-1a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H6a1 1 0 0 0-1 1H4a2 2 0 0 1 2-2z"/>
                                        </svg>
                                    </span>
                                    <span class="nav-link-text">Ingredients</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/Dashboard/CategoryList">
                                    <span class="nav-icon">
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-columns-gap" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M6 1H1v3h5V1zM1 0a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1H1zm14 12h-5v3h5v-3zm-5-1a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1v-3a1 1 0 0 0-1-1h-5zM6 8H1v7h5V8zM1 7a1 1 0 0 0-1 1v7a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1V8a1 1 0 0 0-1-1H1zm14-6h-5v7h5V1zm-5-1a1 1 0 0 0-1 1v7a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1h-5z"/>
                                        </svg>
                                    </span>
                                    <span class="nav-link-text">Categories</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </header>
        <div class="app-wrapper">
            <div class="app-content pt-3 p-md-3 p-lg-4">
                <div class="container-xl">
                    <div class="row g-3 mb-4 align-items-center justify-content-between">
                        <div class="col-auto">
                            <h1 class="app-page-title mb-0">Ingredient</h1>
                        </div>
                    </div>
                    <div class="tab-content" id="orders-table-tab-content">
                        <div class="tab-pane fade show active" id="orders-all" role="tabpanel" aria-labelledby="orders-all-tab">
                            <div class="app-card app-card-orders-table shadow-sm mb-5">
                                <div class="app-card-body">
                                    <div class="table-responsive">
                                        <table id="myTable" class="table app-table-hover mb-0 text-left">
                                            <thead>
                                                <tr>
                                                    <th class="cell">Order</th>
                                                    <th class="cell">Product</th>
                                                    <th class="cell">Customer</th>
                                                    <th class="cell">Date</th>
                                                    <th class="cell">Status</th>
                                                    <th class="cell">Total</th>
                                                    <th class="cell"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="cell">#15346</td>
                                                    <td class="cell"><span class="truncate">Lorem ipsum dolor sit amet eget volutpat erat</span></td>
                                                    <td class="cell">John Sanders</td>
                                                    <td class="cell"><span>17 Oct</span><span class="note">2:16 PM</span></td>
                                                    <td class="cell"><span class="badge bg-success">Paid</span></td>
                                                    <td class="cell">$259.35</td>
                                                    <td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
                                                </tr>
                                                <tr>
                                                    <td class="cell">#15345</td>
                                                    <td class="cell"><span class="truncate">Consectetur adipiscing elit</span></td>
                                                    <td class="cell">Dylan Ambrose</td>
                                                    <td class="cell"><span class="cell-data">16 Oct</span><span class="note">03:16 AM</span></td>
                                                    <td class="cell"><span class="badge bg-warning">Pending</span></td>
                                                    <td class="cell">$96.20</td>
                                                    <td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
                                                </tr>
                                                <tr>
                                                    <td class="cell">#15344</td>
                                                    <td class="cell"><span class="truncate">Pellentesque diam imperdiet</span></td>
                                                    <td class="cell">Teresa Holland</td>
                                                    <td class="cell"><span class="cell-data">16 Oct</span><span class="note">01:16 AM</span></td>
                                                    <td class="cell"><span class="badge bg-success">Paid</span></td>
                                                    <td class="cell">$123.00</td>
                                                    <td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
                                                </tr>
                                                <tr>
                                                    <td class="cell">#15343</td>
                                                    <td class="cell"><span class="truncate">Vestibulum a accumsan lectus sed mollis ipsum</span></td>
                                                    <td class="cell">Jayden Massey</td>
                                                    <td class="cell"><span class="cell-data">15 Oct</span><span class="note">8:07 PM</span></td>
                                                    <td class="cell"><span class="badge bg-success">Paid</span></td>
                                                    <td class="cell">$199.00</td>
                                                    <td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
                                                </tr>
                                                <tr>
                                                    <td class="cell">#15342</td>
                                                    <td class="cell"><span class="truncate">Justo feugiat neque</span></td>
                                                    <td class="cell">Reina Brooks</td>
                                                    <td class="cell"><span class="cell-data">12 Oct</span><span class="note">04:23 PM</span></td>
                                                    <td class="cell"><span class="badge bg-danger">Cancelled</span></td>
                                                    <td class="cell">$59.00</td>
                                                    <td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
                                                </tr>
                                                <tr>
                                                    <td class="cell">#15341</td>
                                                    <td class="cell"><span class="truncate">Morbi vulputate lacinia neque et sollicitudin</span></td>
                                                    <td class="cell">Raymond Atkins</td>
                                                    <td class="cell"><span class="cell-data">11 Oct</span><span class="note">11:18 AM</span></td>
                                                    <td class="cell"><span class="badge bg-success">Paid</span></td>
                                                    <td class="cell">$678.26</td>
                                                    <td class="cell"><a class="btn-sm app-btn-secondary" href="#">View</a></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>	
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="app-footer">
                <div class="container text-center py-3">
                    <!--/* This template is free as long as you keep the footer attribution link. If you'd like to use the template without the attribution link, you can buy the commercial license via our website: themes.3rdwavemedia.com Thank you for your support. :) */-->
                    <small class="copyright">Designed by <a class="app-link" href="${pageContext.request.contextPath}/Homepage" target="_blank">FoodWhale</a></small>
                </div>
            </footer>
        </div>
        <script>
            $(document).ready(function () {
                $('#myTable').DataTable({
                    "ordering": false,
                    "lengthChange": false,
                    "info": false,
                    "pageLength": 6,
                    "dom": '<"row margin-6"Bf>rtip',
                    "buttons": [
                        {
                            "text": 'Create',
                            "className": 'btn app-btn-secondary',
                            action: function( e, dt, node, config) {
                                window.location.replace("${pageContext.request.contextPath}/Dashboard/AddIngredient");
                            }
                        }
                    ]
                });
            });
        </script>
        <script src="plugins/popper.min.js"></script>
        <script src="plugins/bootstrap/js/bootstrap.min.js"></script>

        <!-- Charts JS -->
        <script src="plugins/chart.js/chart.min.js"></script>
        <script src="js/index-charts.js"></script>

        <!-- Page Specific JS -->
        <script src="js/app.js"></script>
    </body>
</html>
