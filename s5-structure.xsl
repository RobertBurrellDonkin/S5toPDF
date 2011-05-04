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
   
   Styles structural elements
    
  -->
  
  <!--  
  
  <xsl:template match="xhtml:frame"/>
  <xsl:template match="xhtml:frameset"/>  
  <xsl:template match="xhtml:head"/>
  <xsl:template match="xhtml:noframes"/>
  <xsl:template match="xhtml:body"/>
  <xsl:template match="xhtml:iframe"/>
  -->
  
    
  <xsl:template match="xhtml:address">
    <xsl:apply-templates />
  </xsl:template>
   
  <!-- 
  <xsl:template match="xhtml:hr">
TODO: Support hr 
  </xsl:template>
   -->

  <xsl:template match="xhtml:span">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="xhtml:style">
    <xsl:apply-templates />
  </xsl:template>
  
  <xsl:template match="xhtml:div">
    <xsl:apply-templates />
  </xsl:template>
  
</xsl:stylesheet>