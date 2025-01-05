<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:param name="productId"/>
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Product List</title>
                <style>
                body{
                    background-color:red;
                }
                </style>
            </head>
            <body>
                <h1>My Product</h1>
                <ul>
                <xsl:for-each select="product">
                        <xsl:if test="@id=$productId">
                        <li>
                            <h1>
                            <xsl:value-of select="name"/>
                            </h1>
                            <h1>
                            <xsl:value-of select="price"/>
                            </h1>
                            <p>
                            <xsl:value-of select="description"/>
                            </p>
                        </li>
                        </xsl:if>
                </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
