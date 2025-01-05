<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Product List</title>
                <style>
                body{
                    background-color:red;
                }
                li{
                    border:1px solid black;
                    list-style:none;
                    padding:20px;
                }
                a{
                    text-decoration:none;
                    color:black;
                }
                </style>
            </head>
            <body>
                <h1>Products</h1>
                <ul>
                    <xsl:for-each select="product">
                        <li>
                        <a href="/products/{@id}">
                            <xsl:value-of select="name"/>
                        <h1>
                        <xsl:value-of select="price"/>
                        </h1>
                        <p>
                        <xsl:value-of select="description"/>
                        </p>
                        </a>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
