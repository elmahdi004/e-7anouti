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
                <link rel="stylesheet" href="/style/style.css"/>
                <link rel="stylesheet" href="/style/myCart.css"/>

            </head>
            <body>
            <div class="section_one">
    <span></span>
            </div>
    <div class="navbar_section">
        <div class="content">
            <div class="part_one">
                <img src="./icons/menu.svg" alt="menu" srcset=""/>
                <h1>Brand</h1>
                <div class="search">
                    <input type="text" name="search" id="" placeholder="Search your product"/>
                    <img src="./icons/bx_search.svg" alt="search" srcset=""/>
                </div>
                <div class="langue">
                    <img src="./icons/langue.svg" alt="world" srcset=""/>
                    <select name="langue" id="langue">
                        <option>Langue</option>
                        <option value="en">English</option>
                        <option value="fr">French</option>
                        <option value="ar">Arabic</option>
                    </select>
                    <img src="./icons/toggle.svg" alt="world" srcset=""/>
                </div>
            </div>
            <div class="part_two">
                <a href="/myCart" class="profile one">
                    <img src="./icons/bag.svg" alt="bag"/>
                </a>
                <div class="profile two">
                    <img src="./images/avatar.png" alt="bag"/>
                </div>
            </div>
        </div>
    </div>

    <div class="cart_section">
        <div class="container">
            <h1>Shopping bag</h1>
            <p><span style="font-weight: bold;">3 items</span> in your bag</p>
            <div class="cart">
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
                    <div class="cart_item" style="margin-top: 20px;">
                        <div class="item_1">
                            <div class="details">
                                <div class="img">
                                    <img src="./images/jamila-cup 1.png" alt="image" srcset=""/>
                                </div>
                                <div class="content">
                                    <span class="cat">Category name</span>
                                    <span class="title">RaiBi jamila by danone</span>
                                </div>
                            </div>
                        </div>
                        <div class="item_2">
                            <p>10.99 MAD</p>
                        </div>
                        <div class="item_3">
                            <div class="qte">
                                <button class="add"><img src="./icons/add.svg" alt=""/></button>
                                <span>3</span>
                                <button class="moins"><img src="./icons/moins.svg" alt=""/></button>
                            </div>
                        </div>
                        <div class="item_4">
                            <p>30.99 MAD</p>
                        </div>
                    </div>
                    <div class="line"><span></span></div>
                    <div class="cart_item">
                        <div class="item_1">
                            <div class="details">
                                <div class="img">
                                    <img src="./images/jamila-cup 1.png" alt="image" srcset=""/>
                                </div>
                                <div class="content">
                                    <span class="cat">Category name</span>
                                    <span class="title">RaiBi jamila by danone</span>
                                </div>
                            </div>
                        </div>
                        <div class="item_2">
                            <p>10.99 MAD</p>
                        </div>
                        <div class="item_3">
                            <div class="qte">
                                <button class="add"><img src="./icons/add.svg" alt=""/></button>
                                <span>3</span>
                                <button class="moins"><img src="./icons/moins.svg" alt=""/></button>
                            </div>
                        </div>
                        <div class="item_4">
                            <p>30.99 MAD</p>
                        </div>
                    </div>
                    <div class="line"><span></span></div>
                </div>
            <div class="shopping_address">
                <h2>Shipping Address</h2>
                <form action="#" method="post">
                    <input type="text" placeholder="Full address"/>
                        <input type="text" placeholder="City"/>
                        <input type="text" placeholder="ZIP code"/>
                    <div class="total_price">
                        <h2>Shipping Details</h2>
                        <div class="infos">
                            <div class="info_line">
                                <p>Cart subtotal</p>
                                <p>30.22 MAD</p>
                            </div>
                            <div class="info_line">
                                <p>Shipping </p>
                                <p>Free</p>
                            </div>
                            <div class="info_line">
                                <p class="p_total">Cart total</p>
                                <p class="p_total">30.22 MAD</p>
                            </div>
                        </div>
                        <button class="order">Order now</button>
                    </div>
                </form>
            </div>
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
                <img src="./icons/ic_baseline-facebook.svg" alt="facebook" srcset=""/>
                <img src="./icons/mdi_instagram.svg" alt="facebook" srcset=""/>
                <img src="./icons/pajamas_twitter.svg" alt="facebook" srcset=""/>
                <img src="./icons/line-md_youtube.svg" alt="facebook" srcset=""/>
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
dp = document.getElementById('discover');
dp.onclick = function() {
    window.location = "/products";
}
    </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
