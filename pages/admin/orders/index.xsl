<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:param name="lang"/>
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
            <xsl:attribute name="dir">
                <xsl:choose>
                    <xsl:when test="$lang = 'ar'">rtl</xsl:when>
                        <xsl:otherwise>ltr</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <head>
                <title>Product List</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
        <!-- Optional Bootstrap JavaScript Bundle (with Popper.js) -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>                <link rel="stylesheet" href="/style/style.css"/> -->
                <link rel="stylesheet" href="/style/admin.css"/>

            </head>
            <body>
    <div class="open-dash" id="open-dash">
        <button>
            <i class="fa-solid fa-chevron-right"/>
        </button>
    </div>
    <div class="logout-section">
            <a href="">Logout</a>
    </div>
    <div class="main row">
        <div class="dashboard" id="dashboard">
            <div class="logo">
                <div>
                    LOGO
                </div>

            </div>
            <div class="select">
                <ul>
                    <li class="">
                            <div>
                                <a href="" style="display:flex;column-gap:10px;">
                                    <div class="icon">
                                        <img src="/icons/dashboard/dashboard.png" width="20px"/>
                                    </div>
                                    <h4>Dashboard</h4>
                                </a>
                            </div>
                    </li>
                    <li class="">
                        <div>
                            <a href="/vehicles" style="display:flex;column-gap:10px;">
                                <div class="icon">
                                        <img src="/icons/dashboard/Products.png" width="20px"/>
                                </div>
                                <h4>Products</h4>
                            </a>
                        </div>
                    </li>
                    <li class="">
                        <div>
                            <a href="/vehicles" style="display:flex;column-gap:10px;">
                                <div class="icon">
                                        <img src="/icons/dashboard/Users.png" width="20px"/>
                                </div>
                                <h4>Clients</h4>
                            </a>
                        </div>
                    </li>
                    <li class="active">
                        <div>
                            <a href="/vehicles" style="display:flex;column-gap:10px;">
                                <div class="icon">
                                        <img src="/icons/dashboard/Orders.png" width="20px"/>
                                </div>
                                <h4>Orders</h4>
                            </a>
                        </div>
                    </li>
                    <li class="">
                        <div>
                            <a href="/vehicles" style="display:flex;column-gap:10px;">
                                <div class="icon">
                                        <img src="/icons/dashboard/Roles.png" width="20px"/>
                                </div>
                                <h4>Roles</h4>
                            </a>
                        </div>
                    </li>
                    
                </ul>
            </div>
        </div>
        <div class="content" id="content">
            <div class="container">
                    <div class="navbar">
                        <div class="search">
                            <input type="text" name="" id="" placeholder="search here"/>
                            <button>
                                <i class="fa-solid fa-magnifying-glass"/>
                            </button>
                        </div>
                        <div class="actions">
                            <div class="navbar-actions">
                                <!-- <div class="item">
                                    <a href="#">
                                        <i class="fa-regular fa-bell"/>
                                        <div>
                                            <span></span>
                                        </div>
                                    </a>
                                </div>
                                <div class="item-2">
                                    <a href="#">
                                        <i class="fa-solid fa-gear"/>
                                        </a>
                                </div> -->
                                <span></span>
                            </div>
                            <div class="separator">
                                <span></span>
                            </div>
                            <div class="user">
                                <p>Hello, <span>El Mahdi bellaziz</span></p>
                                <div class="user-image">
                                    <img src="/images/avatar.png" alt="user image" srcset=""/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="body">
                    <h1 style="font-size:20px;">Orders list</h1>
                        <table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Handle</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1</td>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
          <td>1</td>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
          <td>1</td>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
  </tbody>
</table>
                    </div>
            </div>
        </div>
    </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
