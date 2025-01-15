<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:param name="lang"/>
<xsl:param name="authUser"/>
<xsl:param name="authRole"/>
<xsl:param name="orderId"/>

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
                                <link rel="stylesheet" href="/style/style.css"/>
            </head>
            <body>
    <div class="open-dash" id="open-dash">
        <button>
            <!-- <i class="fa-solid fa-chevron-right"/> -->
        </button>
    </div>
    <div class="logout-section">
            <a href="/logout">Logout</a>
    </div>
    <div class="main row">
        <div class="dashboard" id="dashboard">
            <div class="logo">
                <div>
                <a href="/"><img style="width:100px;" src="/images/logo.png"/></a>
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
                    <li class="active">
                        <div>
                            <a href="/admin/m-orders" style="display:flex;column-gap:10px;">
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
                    <xsl:if test="@id = 6">
                    <li class="/admin/orders">
                        <div>
                            <a href="/admin/orders" style="display:flex;column-gap:10px;">
                                <div class="icon">
                                        <img src="/icons/dashboard/Orders.png" width="20px"/>
                                </div>
                                <h4>My Orders</h4>
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
                                <div class="d-flex text-align-center justify-content-center mt-5">
                        <div>
                            <a href="/logout" style="display:flex;column-gap:10px;">
                                <div class="icon">
                                        <img src="/icons/dashboard/logout.png" width="20px"/>
                                </div>
                                <h4>Logout</h4>
                            </a>
                        </div>
                </div>
            </div>
        </div>
        <div class="content" id="content">
            <div class="container">
                    <div class="navbar">
                        <div class="search">
                            <input type="text" name="" id="" placeholder="search here"/>
                            <!-- <button>
                                <i class="fa-solid fa-magnifying-glass"/>
                            </button> -->
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
                    <div class="add_section">
                        <h5 class="py-4">Order details :</h5>
                    </div>
                     <div class="products_list">
                    <div class="cart_item">
                        <div class="item_1">
                            <p>Product</p>
                        </div>
                        <div class="item_2">
                            <p>Price</p>
                        </div>
                        <div class="item_3">
                            <p>Quantity</p>
                        </div>
                        <div class="item_4">
                            <p>Total Price</p>
                        </div>
                    </div>
                    <xsl:if test="$authUser != 0">
                    <xsl:for-each select="/Store/Orders/Order[@id = $orderId]/orderItems/item">
                    <div class="cart_item" style="margin-top: 20px;">
                        <div class="item_1">
                            <div class="details">
                                <xsl:variable name="product" select="@product"/>
                                <div class="img">
                                    <img src="/images/products/{/Store/products/product[@id = $product]/image}" alt="image" srcset=""/>
                                </div>
                                <div class="content">
                                    <span class="cat"><xsl:value-of select="/Store/categories/category[@id = /Store/products/product[@id = $product]/@category-id]/name/lang[@code=$lang]"/></span>
                                    <span class="title"><xsl:value-of select="/Store/products/product[@id = $product]/name/lang[@code=$lang]"/></span>
                                </div>
                            </div>
                        </div>
                        <div class="item_2">
                            <p><xsl:value-of select="/Store/products/product[@id = $product]/price"/><span> MAD</span></p>
                        </div>
                        <div class="item_3">
                            <div class="qte">
                                <span><xsl:value-of select="quantity"/></span>
                            </div>
                        </div>
                        <div class="item_4">
                            <xsl:variable name="quantity" select="quantity"/>
                            <p><xsl:value-of select="/Store/products/product[@id = $product]/price"/><span> MAD</span></p>
                        </div>
                    </div>
                    <div class="line"><span></span></div>
                    </xsl:for-each>
                    </xsl:if>
                </div>
                    </div>

    <script>
        document.getElementById('dropdown').addEventListener('change', function () {
    const url = this.value;
    if (url !== 'default') {
      window.location.href = url; // Redirect to the selected URL
    }
  });
    </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
