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
                    <li class="active">
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
                    <div class="add_section"style="display:flex;align-items:center;justify-content:space-between;">
                        <h5 class="py-4">Products list :</h5>
                        <a href="/admin/products/add" class="btn  btn-sm btn-primary">Add Product</a>
                    </div>
                    <div class="table_section">
<table class="table">
  <thead>
    <tr>
      <th >#</th>
      <th >Image</th>
      <th >title</th>
      <th>category</th>
      <th >price</th>
      <th >stock</th>
      <th >Actions</th>
    </tr>
  </thead>
  <tbody>
  <xsl:for-each select="/Store/products/product">
    <tr>
     <xsl:variable name="category-id" select="@category-id"/>
      <td><xsl:value-of select="$category-id"/></td>
    <td><img style="width:40px;" src="/images/products/{image}"/></td>
    <td><xsl:value-of select="name/lang[@code=$lang]"/></td>
      <td><xsl:value-of select="/Store/categories/category[@id=$category-id]/name/lang[@code=$lang]"/></td>
      <td><xsl:value-of select="price"/></td>
      <td><xsl:value-of select="stock"/><span> MAD</span></td>
      <td>
        <select style="width:40px;" id="dropdown" class="form-select form-select-sm" aria-label="Default select example">
  <option  selected></option>
  <option value="/admin/products/{@id}/update">Update</option>
  <option value="/admin/products/{@id}/delete">Delete</option>
  <!-- <option value="/admin/orders/{@id}/details">Details</option> -->
</select>
      </td>
    </tr>
    </xsl:for-each>
  </tbody>
</table>
</div>
                    </div>
            </div>
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
