<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>
<!-- Copia unicamente campos DC sin personalizar y los ordena de manera "villera" -->
<xsl:template match="/">
  <dublin_core schema="dc">
    <!-- copiar 'creator' -->
    <xsl:for-each select="dublin_core/dcvalue[@element='creator']">
      <dcvalue element="creator" qualifier="none" language="es_AR">
       <xsl:value-of select="." />
     </dcvalue>
    </xsl:for-each>

    <!-- copiar 'contributor' -->
    <xsl:for-each select="dublin_core/dcvalue[@element='contributor']">
      <dcvalue element="contributor" qualifier="none" language="es_AR">
       <xsl:value-of select="." />
     </dcvalue>
    </xsl:for-each>
    
    <!-- copiar 'date' -->
    <xsl:for-each select="dublin_core/dcvalue[@element='date']">
      <dcvalue element="date" qualifier="none" language="es_AR">
       <xsl:value-of select="." />
     </dcvalue>
    </xsl:for-each>

    <!-- copiar 'description' -->
    <xsl:for-each select="dublin_core/dcvalue[@element='description']">
      <dcvalue element="description" qualifier="none" language="es_AR">
       <xsl:value-of select="." />
     </dcvalue>
    </xsl:for-each>

    <!-- copiar 'identifier' -->
    <xsl:for-each select="dublin_core/dcvalue[@element='identifier']">
      <dcvalue element="identifier" qualifier="none" language="es_AR">
       <xsl:value-of select="." />
     </dcvalue>
    </xsl:for-each>

    <!-- copiar 'language' -->
    <xsl:for-each select="dublin_core/dcvalue[@element='language']">
      <dcvalue element="language" qualifier="none" language="es_AR">
       <xsl:value-of select="." />
     </dcvalue>
    </xsl:for-each>

    <!-- copiar 'publisher' -->
    <xsl:for-each select="dublin_core/dcvalue[@element='publisher']">
      <dcvalue element="publisher" qualifier="none" language="es_AR">
       <xsl:value-of select="." />
     </dcvalue>
    </xsl:for-each>

    <!-- copiar 'relation' -->
    <xsl:for-each select="dublin_core/dcvalue[@element='relation']">
      <dcvalue element="relation" qualifier="none" language="es_AR">
       <xsl:value-of select="." />
     </dcvalue>
    </xsl:for-each>

    <!-- copiar 'rights' -->
    <xsl:for-each select="dublin_core/dcvalue[@element='rights']">
      <dcvalue element="rights" qualifier="none" language="es_AR">
       <xsl:value-of select="." />
     </dcvalue>
    </xsl:for-each>

    <!-- copiar 'source' -->
    <xsl:for-each select="dublin_core/dcvalue[@element='source']">
      <dcvalue element="source" qualifier="none" language="es_AR">
       <xsl:value-of select="." />
     </dcvalue>
    </xsl:for-each>

    <!-- copiar 'subject' -->
    <xsl:for-each select="dublin_core/dcvalue[@element='subject']">
      <dcvalue element="subject" qualifier="none" language="es_AR">
       <xsl:value-of select="." />
     </dcvalue>
    </xsl:for-each>

    <!-- copiar 'title' -->
    <xsl:for-each select="dublin_core/dcvalue[@element='title']">
      <dcvalue element="title" qualifier="none" language="es_AR">
       <xsl:value-of select="." />
     </dcvalue>
    </xsl:for-each>

    <!-- copiar 'type' -->
    <xsl:for-each select="dublin_core/dcvalue[@element='type']">
      <dcvalue element="type" qualifier="none" language="es_AR">
       <xsl:value-of select="." />
     </dcvalue>
    </xsl:for-each>

  </dublin_core>
</xsl:template>
</xsl:stylesheet>
