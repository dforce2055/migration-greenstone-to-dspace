<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>
<!-- Copia unicamente campos DC personalizados UADE -->
<xsl:template match="/">
  <dublin_core schema="uade">
    <!-- copiar 'uade.carrera' -->
    <xsl:for-each select="dublin_core/dcvalue[@element='uade.carrera']">
     <dcvalue element="carrera" qualifier="none" language="es_AR">
       <xsl:value-of select="." />
     </dcvalue>
    </xsl:for-each>

    <!-- copiar 'uade.date' -->
    <xsl:for-each select="dublin_core/dcvalue[@element='uade.date']">
     <dcvalue element="date" qualifier="none" language="es_AR">
       <xsl:value-of select="." />
     </dcvalue>
    </xsl:for-each>


    <!-- copiar 'uade.departamento' -->
    <xsl:for-each select="dublin_core/dcvalue[@element='uade.departamento']">
      <dcvalue element="departamento" qualifier="none" language="es_AR">
       <xsl:value-of select="." />
     </dcvalue>
    </xsl:for-each>

    <!-- copiar 'uade.disciplina' -->
    <xsl:for-each select="dublin_core/dcvalue[@element='uade.disciplina']">
      <dcvalue element="disciplina" qualifier="none" language="es_AR">
        <xsl:value-of select="." />
      </dcvalue>
    </xsl:for-each>
    
    <!-- copiar 'uade.facultad' -->
    <xsl:for-each select="dublin_core/dcvalue[@element='uade.facultad']">
     <dcvalue element="facultad" qualifier="none" language="es_AR">
       <xsl:value-of select="." />
     </dcvalue>
    </xsl:for-each>

    <!-- copiar 'uade.facultad_departamento' -->
    <xsl:for-each select="dublin_core/dcvalue[@element='uade.facultad_departamento']">
      <dcvalue element="facultad" qualifier="departamento" language="es_AR">
       <xsl:value-of select="." />
     </dcvalue>
    </xsl:for-each>

    <!-- copiar 'uade.nota_tecnica' -->
    <xsl:for-each select="dublin_core/dcvalue[@element='uade.nota_tecnica']">
      <dcvalue element="nota" qualifier="tecnica" language="es_AR">
        <xsl:value-of select="." />
      </dcvalue>
    </xsl:for-each>

    <!-- copiar 'uade.pais_region' -->
    <xsl:for-each select="dublin_core/dcvalue[@element='uade.pais_region']">
      <dcvalue element="pais" qualifier="region" language="es_AR">
       <xsl:value-of select="." />
      </dcvalue>
    </xsl:for-each>

    <!-- congresos -->

    <!-- copiar 'uade.nrocongreso' -->
    <xsl:for-each select="dublin_core/dcvalue[@element='nrocongreso']">
      <dcvalue element="nrocongreso" qualifier="none" language="es_AR">
       <xsl:value-of select="." />
      </dcvalue>
    </xsl:for-each>

  </dublin_core>
</xsl:template>
</xsl:stylesheet>
