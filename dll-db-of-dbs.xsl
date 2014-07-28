<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:dc="http://purl.org/dc/terms/"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:teix="http://www.tei-c.org/ns/Examples"
    xmlns:html="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs rdf dc tei teix"
    version="2.0">
    <xsl:output
        indent="no"
        method="html"/>
    <!-- Wrap html and body elements around rest of document -->
    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <title></title>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html> 
    </xsl:template>
    <xsl:template match="rdf:Description">
        <h2><xsl:for-each select="dc:title[1]">
                <xsl:value-of select="."/>
        </xsl:for-each>
        </h2>
        <blockquote>
            <xsl:for-each select="@rdf:about">
                <p><strong>URL:</strong>&#160;<a href="{.}"><xsl:value-of select="."/></a></p>
            </xsl:for-each>
            <xsl:for-each select="dc:description">
                <p><strong>Description:</strong>&#160;<xsl:value-of select="."/></p>
            </xsl:for-each>
            <xsl:for-each select="dc:coverage">
                <p><strong>Coverage:</strong>&#160;<xsl:value-of select="."/></p>
            </xsl:for-each>
            <xsl:for-each select="dc:rights">
                <p><strong>Availability:</strong>&#160;<xsl:value-of select="."/>,&#160;
                    <xsl:value-of select="../dc:accessrights"/>
                </p>
            </xsl:for-each>
            <xsl:for-each select="dcmi:format" xmlns:dcmi="http://www.imtf.com/e-document/dcmi">
                <p><strong>Format:</strong>&#160;<xsl:value-of select="."/>
                </p>
            </xsl:for-each>  
        </blockquote>
    </xsl:template>
</xsl:stylesheet>
