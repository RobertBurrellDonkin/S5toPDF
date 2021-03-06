<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  
 <!-- 
   Copyright 2009-2011, Robert Burrell Donkin http://robertburrelldonkin.name

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at 

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
-->  

  <!-- 
  
   Convert S5 XML to XSL-FO
   
   Styles phrase elements   
  -->


  <xsl:template match="xhtml:strong">
    <fo:inline font-weight="bold">
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>
    
  <xsl:template match="xhtml:var">
    <fo:inline font-style="italic">
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>
  
  <xsl:template match="xhtml:samp">
    <fo:inline font-family="monospace">
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>
  
  <xsl:template match="xhtml:kbd">
    <fo:inline font-family="monospace">
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template> 

  <xsl:template match="xhtml:em">
    <fo:inline font-style="italic">
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>

  <xsl:template match="xhtml:code">
    <fo:inline font-family="monospace">
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>

  <xsl:template match="xhtml:dfn">
    <fo:inline font-style="italic">
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>

  <xsl:template match="xhtml:abbr">
    <xsl:apply-templates />
  </xsl:template>  

  <xsl:template match="xhtml:acronym">
    <xsl:apply-templates />
  </xsl:template> 
  
  <xsl:template match="xhtml:sub">
    <fo:inline font-size="{$SmallerTextSize}" baseline-shift="sub">
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>

  <xsl:template match="xhtml:sup">
    <fo:inline font-size="{$SmallerTextSize}" baseline-shift="super">
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>  
  
</xsl:stylesheet>