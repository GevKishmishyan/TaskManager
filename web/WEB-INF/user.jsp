<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="java.text.SimpleDateFormat" %>--%>
<%--<%@ page import="model.*" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>

<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--    <link rel="stylesheet" type="text/css" href="../css/style.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--<%--%>
<%--    User user = (User) session.getAttribute("user");--%>
<%--    List<Task> tasks = (List<Task>) request.getAttribute("tasks");--%>
<%--    List<Notification> nots = (List<Notification>) request.getAttribute("allNots");--%>
<%--    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");--%>
<%--%>--%>


<%--<div class="main">--%>
<%--    <h1><%= user.getName() %> <%= user.getSurname() %>--%>
<%--    </h1>--%>

<%--    <div class="top">--%>
<%--        <div class="search">--%>
<%--            <form action="/userSearch" method="post" style="margin-left: 28%">--%>
<%--                <input class="inp" style="width: 39%;  float:left;" type="search" name="search" placeholder="Search"--%>
<%--                       required="required"/>--%>
<%--                <button style="width: 20%; margin-left: 2%; float: left;" type="submit"--%>
<%--                        class="btn btn-primary btn-block btn-large">--%>
<%--                    Search.--%>
<%--                </button>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--        <div class="home">--%>
<%--            <a href="/userHome" style="text-decoration: none">--%>
<%--                <button style="width: 40%; margin: auto;" type="submit" class="btn btn-primary btn-block btn-large">--%>
<%--                    Home page.--%>
<%--                </button>--%>
<%--            </a>--%>
<%--        </div>--%>
<%--        <div class="logout">--%>
<%--            <a href="/logout" style="text-decoration: none">--%>
<%--                <button style="width: 40%; margin: auto;" type="submit" class="btn btn-primary btn-block btn-large">--%>
<%--                    Log out.--%>
<%--                </button>--%>
<%--            </a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="allUsers">--%>
<%--        <h1>Notifications.</h1>--%>
<%--        <% for (Notification not : nots) { %>--%>
<%--        <% if (not.getAuthor().getUserStatus() != UserStatus.USER){ %>--%>
<%--        <p style="color: gainsboro; text-align: center; font-size: 13px">--%>
<%--            <b><%= not.getAuthor().getName() %> <%= not.getAuthor().getSurname() %>--%>
<%--            </b>--%>
<%--            <% if (not.getNotType() == NotType.NEW_TASK) { %>--%>
<%--            added you the new task:--%>
<%--            <% } else if (not.getNotType() == NotType.COMMENT) { %>--%>
<%--            added new comment on task:--%>
<%--            <% } else if (not.getNotType() == NotType.REPLY) { %>--%>
<%--            replyed to comment on task:--%>
<%--            <% } %>--%>
<%--            <b><%= not.getTask().getName() %>--%>
<%--            </b>--%>
<%--            <a href="/seenNot?id=<%= not.getId() %>" style="color: gainsboro; text-align: center; font-size: 13px">seen.</a>--%>
<%--        </p>--%>
<%--        <% } %>--%>
<%--        <% } %>--%>
<%--    </div>--%>
<%--    <div class="allUsers">--%>
<%--        <h1>All my tasks list.</h1>--%>
<%--        <table>--%>
<%--            <thead>--%>

<%--            <tr>--%>
<%--                <th scope="col" width="3%">Id</th>--%>
<%--                <th scope="col" width="7%">Name</th>--%>
<%--                <th scope="col" width="20%">Description</th>--%>
<%--                <th scope="col" width="15%">Assigned User</th>--%>
<%--                <th scope="col" width="12%">Task Status</th>--%>
<%--                <th scope="col" width="19%">Created Date</th>--%>
<%--                <th scope="col" width="19%">Task Deadline</th>--%>
<%--                <th scope="col" width="10%">Update</th>--%>
<%--            </tr>--%>
<%--            </thead>--%>
<%--            <tbody>--%>
<%--            <% for (Task perTask : tasks) { %>--%>
<%--            <tr>--%>
<%--                <td data-label="Id"><%= perTask.getId() %>--%>
<%--                </td>--%>
<%--                <td data-label="Name" class="taskHover">--%>
<%--                    <a href="/getTaskById?id=<%= perTask.getId() %>"--%>
<%--                       style="text-decoration: none; color: black"><%= perTask.getName() %>--%>
<%--                    </a>--%>
<%--                </td>--%>
<%--                <td data-label="Description" style="font-size: 11px"><%= perTask.getDescription() %>--%>
<%--                </td>--%>
<%--                <td data-label="Assigned User"><%= perTask.getAssignedUser().getEmail() %>--%>
<%--                </td>--%>
<%--                <td data-label="Task Status"><%= perTask.getTaskStatus() %>--%>
<%--                </td>--%>
<%--                <td data-label="Created Date"><%= sdf.format(perTask.getCreatedDate()) %>--%>
<%--                </td>--%>
<%--                <td data-label="Deadline"><%= sdf.format(perTask.getDeadline()) %>--%>
<%--                </td>--%>
<%--                <td data-label="Update">--%>
<%--                    <a href="/getTaskStatus?id=<%= perTask.getId() %>" style="text-decoration: none">--%>
<%--                        <button type="submit" class="edit btn btn-primary btn-block btn-large"--%>
<%--                                style="width: 70%; margin: auto">--%>
<%--                            Update.--%>
<%--                        </button>--%>
<%--                    </a>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <% } %>--%>
<%--            </tbody>--%>
<%--        </table>--%>

<%--    </div>--%>
<%--</div>--%>

<%--</body>--%>
<%--</html>--%>


<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="model.*" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <!-- CSS Files -->
    <link href="../assets/css/material-dashboard.css?v=2.1.0" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="../assets/demo/demo.css" rel="stylesheet" />
    <script src="../js/jssor.slider-28.0.0.min.js" type="text/javascript"></script>


</head>
<body>
<%
    User user = (User) session.getAttribute("user");
    List<User> users = (List<User>) request.getAttribute("users");
    List<Task> tasks = (List<Task>) request.getAttribute("tasks");
    List<Notification> nots = (List<Notification>) request.getAttribute("allNots");
    List<Notification> userNots = new ArrayList<>();
    for (Notification not : nots) {
        if (!not.getAuthor().equals(user)){
            userNots.add(not);
        }
    }
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String regex = "([^\\s]+(\\.(?i)(jpe?g|png|gif|bmp))$)";
    Pattern pattern = Pattern.compile(regex);

    String userRegMsg = "";
    String taskCreateMsg = "";
    if (session.getAttribute("userRegMsg") != null) {
        userRegMsg = (String) session.getAttribute("userRegMsg");
    }
    if (session.getAttribute("taskCreateMsg") != null) {
        taskCreateMsg = (String) session.getAttribute("taskCreateMsg");
    }
    session.removeAttribute("userRegMsg");
    session.removeAttribute("taskCreateMsg");

%>

<div class="wrapper ">
    <div class="sidebar" data-color="purple" data-background-color="black" data-image="../assets/img/sidebar-2.jpg">

        <div class="logo"><a href="/userHome" class="simple-text logo-normal">
            Task Management
        </a></div>
        <div class="sidebar-wrapper">
            <ul class="nav">
                <li class="nav-item active  ">
                    <a class="nav-link" href="/userHome">
                        <i class="material-icons">dashboard</i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="/userProfile">
                        <i class="material-icons">person</i>
                        <p>Profile</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="/managerGetTasksList">
                        <i class="material-icons">library_books</i>
                        <p>Tasks List</p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="/logout">
                        <i class="material-icons">logout</i>
                        <p>Log out</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="main-panel">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top " id="navigation-example">
            <div class="container-fluid">
                <div class="navbar-wrapper">
                    <a class="navbar-brand" href="javascript:void(0)">Dashboard</a>
                </div>
                <div class="collapse navbar-collapse justify-content-end">
                    <form class="navbar-form" action="/search" method="post">
                        <div class="input-group no-border">
                            <input type="text" name="search" value="" class="form-control" placeholder="Search...">
                            <button type="submit" class="btn btn-default btn-round btn-just-icon">
                                <i class="material-icons">search</i>
                                <div class="ripple-container"></div>
                            </button>
                        </div>
                    </form>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="/managerHome">
                                <i class="material-icons">dashboard</i>
                                <p class="d-lg-none d-md-block">
                                    Stats
                                </p>
                            </a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link" href="javscript:void(0)" id="navbarDropdownMenuLink"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">notifications</i>
                                <% if (userNots.size() != 0) { %>
                                <span class="notification"><%= userNots.size() %></span>
                                <% } else { %>
                                <span class="notification"></span>
                                <% } %>
                                <p class="d-lg-none d-md-block">
                                    Some Actions
                                </p>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                <% if (nots.size() != 0) { %>
                                <% for (Notification not : userNots) { %>
                                <% if (!not.getAuthor().equals(user)) { %>
                                <a class="dropdown-item" href="/seenNot?id=<%= not.getId() %>">
                                    <strong><%= not.getAuthor().getName() %>&nbsp;<%= not.getAuthor().getSurname() %></strong>
                                    &nbsp;
                                    <% if (not.getNotType() == NotType.NEW_TASK) { %>
                                    assigned you new task:
                                    <% } else if (not.getNotType() == NotType.COMMENT) { %>
                                    added comment on task:
                                    <% } else if (not.getNotType() == NotType.REPLY) { %>
                                    replied to comment on task:
                                    <% } %>
                                    &nbsp;
                                    <strong><%= not.getTask().getName() %></strong>
                                </a>
                                <% }
                                }
                                }%>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/userProfile">
                                <i class="material-icons">person</i>
                                <p class="d-lg-none d-md-block">
                                    Account
                                </p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- End Navbar -->
        <div class="content">
            <script type="text/javascript">
                window.jssor_1_slider_init = function() {

                    var jssor_1_SlideoTransitions = [
                        [{b:500,d:1000,x:0,e:{x:6}}],
                        [{b:-1,d:1,x:100,p:{x:{d:1,dO:9}}},{b:0,d:2000,x:0,e:{x:6},p:{x:{dl:0.1}}}],
                        [{b:-1,d:1,x:200,p:{x:{d:1,dO:9}}},{b:0,d:2000,x:0,e:{x:6},p:{x:{dl:0.1}}}],
                        [{b:-1,d:1,rX:20,rY:90},{b:0,d:4000,rX:0,e:{rX:1}}],
                        [{b:-1,d:1,rY:-20},{b:0,d:4000,rY:-90,e:{rY:7}}],
                        [{b:-1,d:1,sX:2,sY:2},{b:1000,d:3000,sX:1,sY:1,e:{sX:1,sY:1}}],
                        [{b:-1,d:1,sX:2,sY:2},{b:1000,d:5000,sX:1,sY:1,e:{sX:3,sY:3}}],
                        [{b:-1,d:1,tZ:300},{b:0,d:2000,o:1},{b:3500,d:3500,tZ:0,e:{tZ:1}}],
                        [{b:-1,d:1,x:20,p:{x:{o:33,r:0.5}}},{b:0,d:1000,x:0,o:0.5,e:{x:3,o:1},p:{x:{dl:0.05,o:33},o:{dl:0.02,o:68,rd:2}}},{b:1000,d:1000,o:1,e:{o:1},p:{o:{dl:0.05,o:68,rd:2}}}],
                        [{b:-1,d:1,da:[0,700]},{b:0,d:600,da:[700,700],e:{da:1}}],
                        [{b:600,d:1000,o:0.4}],
                        [{b:-1,d:1,da:[0,400]},{b:200,d:600,da:[400,400],e:{da:1}}],
                        [{b:800,d:1000,o:0.4}],
                        [{b:-1,d:1,sX:1.1,sY:1.1},{b:0,d:1600,o:1},{b:1600,d:5000,sX:0.9,sY:0.9,e:{sX:1,sY:1}}],
                        [{b:0,d:1000,o:1,p:{o:{o:4}}}],
                        [{b:1000,d:1000,o:1,p:{o:{o:4}}}]
                    ];

                    var jssor_1_options = {
                        $AutoPlay: 1,
                        $CaptionSliderOptions: {
                            $Class: $JssorCaptionSlideo$,
                            $Transitions: jssor_1_SlideoTransitions
                        },
                        $ArrowNavigatorOptions: {
                            $Class: $JssorArrowNavigator$
                        },
                        $BulletNavigatorOptions: {
                            $Class: $JssorBulletNavigator$,
                            $SpacingX: 16,
                            $SpacingY: 16
                        }
                    };

                    var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

                    /*#region responsive code begin*/

                    var MAX_WIDTH = 980;

                    function ScaleSlider() {
                        var containerElement = jssor_1_slider.$Elmt.parentNode;
                        var containerWidth = containerElement.clientWidth;

                        if (containerWidth) {

                            var expectedWidth = Math.min(MAX_WIDTH || containerWidth, containerWidth);

                            jssor_1_slider.$ScaleWidth(expectedWidth);
                        }
                        else {
                            window.setTimeout(ScaleSlider, 30);
                        }
                    }

                    ScaleSlider();

                    $Jssor$.$AddEvent(window, "load", ScaleSlider);
                    $Jssor$.$AddEvent(window, "resize", ScaleSlider);
                    $Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
                    /*#endregion responsive code end*/
                };
            </script>
            <link href="//fonts.googleapis.com/css?family=Montserrat:100,100italic,200,200italic,300,300italic,regular,italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic&subset=latin-ext,cyrillic-ext,vietnamese,latin,cyrillic" rel="stylesheet" type="text/css" />
            <link href="//fonts.googleapis.com/css?family=Roboto+Condensed:300,300italic,regular,italic,700,700italic&subset=latin-ext,greek-ext,cyrillic-ext,greek,vietnamese,latin,cyrillic" rel="stylesheet" type="text/css" />
            <style>
                /*jssor slider loading skin double-tail-spin css*/
                .jssorl-004-double-tail-spin img {
                    animation-name: jssorl-004-double-tail-spin;
                    animation-duration: 1.6s;
                    animation-iteration-count: infinite;
                    animation-timing-function: linear;
                }

                @keyframes jssorl-004-double-tail-spin {
                    from { transform: rotate(0deg); }
                    to { transform: rotate(360deg); }
                }

                /*jssor slider bullet skin 031 css*/
                .jssorb031 {position:absolute;}
                .jssorb031 .i {position:absolute;cursor:pointer;}
                .jssorb031 .i .b {fill:#000;fill-opacity:0.6;stroke:#fff;stroke-width:1600;stroke-miterlimit:10;stroke-opacity:0.8;}
                .jssorb031 .i:hover .b {fill:#fff;fill-opacity:1;stroke:#000;stroke-opacity:1;}
                .jssorb031 .iav .b {fill:#fff;stroke:#000;stroke-width:1600;fill-opacity:.6;}
                .jssorb031 .i.idn {opacity:.3;}

                /*jssor slider arrow skin 051 css*/
                .jssora051 {display:block;position:absolute;cursor:pointer;}
                .jssora051 .a {fill:none;stroke:#fff;stroke-width:360;stroke-miterlimit:10;}
                .jssora051:hover {opacity:.8;}
                .jssora051.jssora051dn {opacity:.5;}
                .jssora051.jssora051ds {opacity:.3;pointer-events:none;}
            </style>
            <div id="jssor_1" style="position:relative;margin:0 auto;top:0px;left:0px;width:980px;height:420px;overflow:hidden;visibility:hidden;">
                <!-- Loading Screen -->
                <div data-u="loading" class="jssorl-004-double-tail-spin" style="position:absolute;top:0px;left:0px;width:100%;height:100%;text-align:center;background-color:rgba(0,0,0,0.7);">
                    <img style="margin-top:-19px;position:relative;top:50%;width:38px;height:38px;" src="../img/double-tail-spin.svg" />
                </div>
                <div data-u="slides" style="cursor:default;position:relative;top:0px;left:0px;width:980px;height:420px;overflow:hidden;">
                    <div style="background-color:#000000;">
                        <img data-u="image" style="opacity:0.5;" src="../img/px-action-athlete-athletes-848618-image.jpg" />
                        <div data-ts="flat" data-p="320" style="left:144px;top:80px;width:550px;height:90px;position:absolute;overflow:hidden;">
                            <div data-to="50% 50%" data-ts="preserve-3d" data-t="0" style="left:550px;top:0px;width:550px;height:90px;position:absolute;overflow:hidden;">
                                <div data-to="50% 50%" data-ts="preserve-3d" data-arr="1" style="left:20px;top:18px;width:200px;height:20px;position:absolute;color:#edf1f2;font-size:16px;font-weight:700;line-height:1.2;letter-spacing:0.1em;">Fast and furious</div>
                                <div data-to="50% 50%" data-ts="preserve-3d" data-arr="2" style="left:19px;top:36px;width:600px;height:30px;position:absolute;color:#edf1f2;font-size:24px;line-height:1.2;letter-spacing:0.05em;"><span style="font-weight:900;color:#e04338;">DON'T JUST</span> CHASE YOUR DREAMS...</div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <img data-u="image" src="../img/px-beach-daylight-fun-1430675-image.jpg" />
                        <div data-ts="flat" data-p="2720" data-po="50% 48%" style="left:0px;top:0px;width:980px;height:380px;position:absolute;">
                            <div data-to="50% 50%" data-ts="preserve-3d" data-t="3" style="left:400px;top:-30px;width:500px;height:400px;position:absolute;">
                                <div data-to="50% 50%" data-ts="preserve-3d" data-t="4" style="left:0px;top:0px;width:500px;height:400px;position:absolute;">
                                    <div data-to="50% 50%" data-ts="preserve-3d" data-t="5" style="left:0px;top:0px;width:500px;height:400px;position:absolute;">
                                        <div data-to="50% 50%" data-ts="preserve-3d" data-t="6" style="left:0px;top:0px;width:500px;height:400px;position:absolute;">
                                            <div data-to="50% 50%" data-t="7" style="left:-50px;top:175px;width:600px;height:38px;position:absolute;opacity:0;color:#00a186;font-size:32px;font-weight:700;line-height:1.2;text-align:center;">Create your kind of holiday</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <img data-u="image" src="../img/px-fun-man-person-2361598-image.jpg" />
                        <div data-ts="flat" data-p="2720" data-po="50% 48%" style="left:0px;top:0px;width:980px;height:380px;position:absolute;">
                            <div data-to="50% 50%" data-ts="preserve-3d" data-arr="8" style="left:-2px;top:20px;width:1000px;height:20px;position:absolute;opacity:0;color:#0ff2f2;font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:1.2;letter-spacing:1.3em;text-align:center;">CHAMPIONS ARE MADE WHEN NO ONE IS WATCHING</div>
                        </div>
                    </div>
                    <div style="background-color:#000000;">
                        <img data-u="image" style="opacity:0.5;" src="../img/faded-monaco-scenery-evening-dark-picjumbo-com-image.jpg" />
                        <div data-ts="flat" data-p="1800" data-po="50% -100%" style="left:120px;top:90px;width:600px;height:300px;position:absolute;">
                            <svg viewbox="0 0 200 200" width="200" height="200" data-t="10" style="left:66px;top:21px;display:block;position:absolute;opacity:0.6;overflow:visible;">
                                <path stroke-dasharray="0,700" fill="none" stroke="#ffffff" d="M0,100C0,44.77152 44.77152,0 100,0C155.22848,0 200,44.77152 200,100C200,155.22848 155.22848,200 100,200C44.77152,200 0,155.22848 0,100Z" data-t="9"></path>
                            </svg>
                            <svg viewbox="0 0 80 80" width="80" height="80" data-t="12" style="left:3px;top:124px;display:block;position:absolute;opacity:0.6;overflow:visible;">
                                <path stroke-dasharray="0,400" fill="none" stroke="#ffffff" shape-rendering="crispEdges" d="M80,80L0,80L0,0L80,0Z" data-t="11"></path>
                            </svg>
                            <svg viewbox="0 0 500 200" data-to="50% 50%" width="500" height="200" data-t="13" style="left:50px;top:50px;display:block;position:absolute;opacity:0;overflow:visible;">
                                <g>
                                    <text fill="#ffffff" x="17" y="110" style="position:absolute;font-family:Montserrat,sans-serif;font-size:32px;font-weight:300;overflow:visible;">MODERN
                                    </text>
                                    <text fill="#ffffff" x="188" y="110" style="position:absolute;font-family:Montserrat,sans-serif;font-size:32px;font-weight:500;letter-spacing:0.1em;overflow:visible;">PROMOTION
                                    </text>
                                    <text fill="#ff3700" x="218" y="130" style="position:absolute;font-family:Montserrat,sans-serif;font-size:16px;font-weight:900;letter-spacing:0.1em;overflow:visible;">EYE FOCUS
                                    </text>
                                    <text fill="#ff3700" x="333" y="130" style="position:absolute;opacity:0.8;font-family:Montserrat,sans-serif;font-size:16px;font-weight:700;letter-spacing:0.1em;overflow:visible;">MOTION TITLES
                                    </text>
                                </g>
                            </svg>
                        </div>
                    </div>
                    <div>
                        <img data-u="image" src="../img/px-bloom-blossom-flora-65219-image.jpg" />
                        <div data-ts="flat" data-p="500" style="left:160px;top:-30px;width:800px;height:200px;position:absolute;">
                            <div data-arr="14" style="left:0px;top:36px;width:800px;height:70px;position:absolute;opacity:0;color:#199494;font-family:'Roboto Condensed',sans-serif;font-size:32px;font-weight:400;line-height:1.2;letter-spacing:-0.05em;text-align:center;text-shadow:2px 1px #d9d99a;">ADDING&nbsp;&nbsp;<span style="font-size:2em;">PERFECTION</span>&nbsp; TO&nbsp; YOUR&nbsp;&nbsp;<span style="font-size:1.6em;">LAWN</span></div>
                            <div data-arr="15" style="left:0px;top:106px;width:800px;height:48px;position:absolute;opacity:0;color:#0d4d4d;font-family:'Roboto Condensed',sans-serif;font-size:20px;font-weight:400;line-height:1.2;letter-spacing:0.2em;text-align:center;text-shadow:1px 1px #d9d99a;">CREATING GREEN <span style="font-size:2em;">SPACES</span> FOR LIVING</div>
                        </div>
                    </div>
                </div><a data-scale="0" href="https://www.jssor.com" style="display:none;position:absolute;">slider html</a>
                <!-- Bullet Navigator -->
                <div data-u="navigator" class="jssorb031" style="position:absolute;bottom:16px;right:16px;" data-autocenter="1" data-scale="0.5" data-scale-bottom="0.75">
                    <div data-u="prototype" class="i" style="width:13px;height:13px;">
                        <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                            <circle class="b" cx="8000" cy="8000" r="5800"></circle>
                        </svg>
                    </div>
                </div>
                <!-- Arrow Navigator -->
                <div data-u="arrowleft" class="jssora051" style="width:55px;height:55px;top:0px;left:25px;" data-autocenter="2" data-scale="0.75" data-scale-left="0.75">
                    <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                        <polyline class="a" points="11040,1920 4960,8000 11040,14080 "></polyline>
                    </svg>
                </div>
                <div data-u="arrowright" class="jssora051" style="width:55px;height:55px;top:0px;right:25px;" data-autocenter="2" data-scale="0.75" data-scale-right="0.75">
                    <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                        <polyline class="a" points="4960,1920 11040,8000 4960,14080 "></polyline>
                    </svg>
                </div>
            </div>
            <script type="text/javascript">jssor_1_slider_init();
            </script>
        </div>
        <footer class="footer">
            <div class="container-fluid">
                <div class="copyright float-right" id="date">
                    , made with <i class="material-icons">favorite</i> by
                    <a href="#" target="_self">Gevorg Kishmishyan</a> for a better web.
                </div>
            </div>
        </footer>
        <script>
            const x = new Date().getFullYear();
            let date = document.getElementById('date');
            date.innerHTML = '&copy; ' + x + date.innerHTML;
        </script>
    </div>
</div>

<!--   Core JS Files   -->
<script src="../assets/js/core/jquery.min.js"></script>
<script src="../assets/js/core/popper.min.js"></script>
<script src="../assets/js/core/bootstrap-material-design.min.js"></script>
<script src="https://unpkg.com/default-passive-events"></script>
<script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Chartist JS -->
<script src="../assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="../assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
<script src="../assets/js/material-dashboard.js?v=2.1.0"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="../assets/demo/demo.js"></script>
<script src="../js/manager.js" type="text/javascript"></script>
</body>
</html>

