<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:param name="lang"/>
<xsl:param name="catId"/>

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
                <link rel="stylesheet" href="/style/style.css"/>
                <link rel="stylesheet" href="/style/prodsBycat.css"/>

            </head>
            <body>
            <div class="section_one">
    <span></span>
            </div>
    <div class="navbar_section">
        <div class="content">
            <div class="part_one">
                <img src="/icons/menu.svg" alt="menu" srcset=""/>
                <h1>Brand</h1>
                <div class="search">
                    <input type="text" name="search" id="" placeholder="Search your product"/>
                    <img src="/icons/bx_search.svg" alt="search" srcset=""/>
                </div>
                <div class="langue">
                    <img src="/icons/langue.svg" alt="world" srcset=""/>
                    <select name="langue" id="langue">
                        <option>Langue</option>
                        <option value="en">English</option>
                        <option value="fr">French</option>
                        <option value="ar">Arabic</option>
                    </select>
                    <img src="/icons/toggle.svg" alt="world" srcset=""/>
                </div>
            </div>
            <div class="part_two">
                <a href="/myCart" class="profile one">
                    <img src="/icons/bag.svg" alt="bag"/>
                </a>
                <a class="profile two" href="/admin">
                    <img src="/images/avatar.png" alt="bag"/>
                </a>
            </div>
        </div>
    </div>
    
    <div class="container prodByCategory">
    
            <h1>All Products</h1>
    </div>
    <div class="products_section category">
        <div class="container">
            <div class="products">
                <xsl:for-each select="/Store/products/product">
                <a class="product" href="/products/{@id}">
                    <div class="image_section">
                        <img src="/images/products/{image}" alt="product image" srcset=""/>
                    </div>
                    <div class="infos-sections">
                        <div class="rating">
                            <div class="stars">
                                <img src="/icons/star.svg" alt="star" srcset=""/>
                                <img src="/icons/star.svg" alt="star" srcset=""/>
                                <img src="/icons/star.svg" alt="star" srcset=""/>
                                <img src="/icons/star.svg" alt="star" srcset=""/>
                                <img src="/icons/star-wc.svg" alt="star" srcset=""/>
                            </div>
                            <div class="add">
                                <img src="/icons/material-symbols_add.svg" alt="add icon" srcset=""/>
                            </div>
                        </div>
                        <div class="title">
                            <h1><xsl:value-of select="name/lang[@code=$lang]"/></h1>
                        </div>
                        <div class="pricing">
                            <h1>MAD<xsl:value-of select="price"/></h1>
                            <h2>MAD<xsl:value-of select="pre_price"/></h2>
                        </div>
                    </div>
                </div>  
            </a>
            </xsl:for-each>
                
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="container">
        <div class="links_section">
            <div class="company">
                <h1><xsl:value-of select="/Store/languages/lang[@code=$lang]/content[@key='brand']"/></h1>
                <h1><xsl:value-of select="/Store/languages/lang[@code=$lang]/content[@key='about-us']"/></h1>
                <p><xsl:value-of select="/Store/languages/lang[@code=$lang]/content[@key='dummy-text']"/> </p>
            </div>
            <div class="links">
                <div class="link">
                    <h1><xsl:value-of select="/Store/languages/lang[@code=$lang]/content[@key='contact-info']"/></h1>
                    <ul>
                        <li><a href="#">elmahdibellaziz@gmail.com</a></li>
                        <li><a href="#">+212619664459</a></li>
                        <li><a href="#"><xsl:value-of select="/Store/languages/lang[@code=$lang]/content[@key='address']"/></a></li>
                    </ul>
                </div>
                <div class="link">
                    <h1><xsl:value-of select="/Store/languages/lang[@code=$lang]/content[@key='links']"/></h1>
                    <ul>
                        <li><a href="#"><xsl:value-of select="/Store/languages/lang[@code=$lang]/content[@key='products-link']"/></a></li>
                        <li><a href="#"><xsl:value-of select="/Store/languages/lang[@code=$lang]/content[@key='my-cart-link']"/></a></li>
                        <li><a href="#"><xsl:value-of select="/Store/languages/lang[@code=$lang]/content[@key='contact-page-link']"/></a></li>
                    </ul>
                </div>
                <div class="link">
                    <h1><xsl:value-of select="/Store/languages/lang[@code=$lang]/content[@key='links']"/></h1>
                    <ul>
                        <li><a href="#"><xsl:value-of select="/Store/languages/lang[@code=$lang]/content[@key='products-link']"/></a></li>
                        <li><a href="#"><xsl:value-of select="/Store/languages/lang[@code=$lang]/content[@key='my-cart-link']"/></a></li>
                        <li><a href="#"><xsl:value-of select="/Store/languages/lang[@code=$lang]/content[@key='contact-page-link']"/></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="line"><span></span></div>
        <div class="last_section">
            <p><xsl:value-of select="/Store/languages/lang[@code=$lang]/content[@key='copyright']"/></p>
            <div class="social_media">
                <img src="/icons/ic_baseline-facebook.svg" alt="facebook" srcset=""/>
                <img src="/icons/mdi_instagram.svg" alt="facebook" srcset=""/>
                <img src="/icons/pajamas_twitter.svg" alt="facebook" srcset=""/>
                <img src="/icons/line-md_youtube.svg" alt="facebook" srcset=""/>
            </div>
        </div>
    </div>
    </div>
    <script>
    let langue = document.getElementById('langue');
langue.addEventListener('change', function() {
    
    const cookieName = 'lang';
    const expires = new Date();
    expires.setTime(expires.getTime() + (365 * 24 * 60 * 60 * 1000)); // 1 year 
    document.cookie = `${cookieName}=${langue.value};expires=${expires.toUTCString()};path=/`;
    window.location = "/";

});
    </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
