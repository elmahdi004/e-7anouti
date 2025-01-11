<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:param name="lang"/>
<xsl:param name="authUser"/>
<xsl:param name="authRole"/>

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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
                                <a href="/admin" style="display:flex;column-gap:10px;">
                                    <div class="icon">
                                        <img src="/icons/dashboard/dashboard.png" width="20px"/>
                                    </div>
                                    <h4>Dashboard</h4>
                                </a>
                            </div>
                    </li>
                    <li class="active">
                            <div>
                                <a href="/admin/langs" style="display:flex;column-gap:10px;">
                                    <div class="icon">
                                        <img src="/icons/dashboard/langs.png" width="20px"/>
                                    </div>
                                    <h4>Multilangs</h4>
                                </a>
                            </div>
                    </li>
                    <xsl:for-each select="/Store/roles/role[@id=$authRole]/permission-id">
                    <xsl:if test="@id = 2">
                    <li class="">
                        <div>
                            <a href="/admin/products" style="display:flex;column-gap:10px;">
                                <div class="icon">
                                        <img src="/icons/dashboard/Products.png" width="20px"/>
                                </div>
                                <h4>Products</h4>
                            </a>
                        </div>
                    </li>
                    </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="/Store/roles/role[@id=$authRole]/permission-id">
                    <xsl:if test="@id = 1">
                    <li class="">
                        <div>
                            <a href="/admin/clients" style="display:flex;column-gap:10px;">
                                <div class="icon">
                                        <img src="/icons/dashboard/Users.png" width="20px"/>
                                </div>
                                <h4>Clients</h4>
                            </a>
                        </div>
                    </li>
                    </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="/Store/roles/role[@id=$authRole]/permission-id">
                    <xsl:if test="@id = 3">
                    <li class="">
                        <div>
                            <a href="/admin/m-orders" style="display:flex;column-gap:10px;">
                                <div class="icon">
                                        <img src="/icons/dashboard/Orders.png" width="20px"/>
                                </div>
                                <h4>Orders for admin</h4>
                            </a>
                        </div>
                    </li>
                    </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="/Store/roles/role[@id=$authRole]/permission-id">
                    <xsl:if test="@id = 6">
                    <li class="/admin/orders">
                        <div>
                            <a href="/vehicles" style="display:flex;column-gap:10px;">
                                <div class="icon">
                                        <img src="/icons/dashboard/Orders.png" width="20px"/>
                                </div>
                                <h4>Orders</h4>
                            </a>
                        </div>
                    </li>
                    </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="/Store/roles/role[@id=$authRole]/permission-id">
                    <xsl:if test="@id = 7">
                    <li class="">
                        <div>
                            <a href="/admin/roles" style="display:flex;column-gap:10px;">
                                <div class="icon">
                                        <img src="/icons/dashboard/Roles.png" width="20px"/>
                                </div>
                                <h4>Roles</h4>
                            </a>
                        </div>
                    </li>
                    </xsl:if>
                    </xsl:for-each>
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
                                <p>Hello, <span><xsl:value-of select="/Store/users/user[@id=$authUser]/firstName"/> <span>&nbsp;</span> <xsl:value-of select="/Store/users/user[@id=$authUser]/lastName"/></span></p>
                                <div class="user-image">
                                    <img src="/images/avatar.png" alt="user image" srcset=""/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="body">
                        <h1 class="my-5" >Upload Language File</h1>
                <form action="/admin/langs" method="post" enctype="multipart/form-data">
                    <label for="language " class="text-primary mb-3">Select language:</label>
                    <select class="form-select my-3 w-50" name="language" required>
                        <option value="CN">Chinese</option>
                        <option value="ES">Spanish</option>
                    </select><br/><br/>
                    <input class="form-control w-50" type="file" name="langFile" accept=".xml" required /><br/><br/>
                    <button  type="submit" class="btn btn-primary">Upload</button>
                </form>
                    </div>
            </div>
        </div>
    </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
