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

<!-- Setup parameters -->
  <xsl:include href="s5-params.xsl"/>

  <!-- 
  
  Output XML suitable for XSL-FO
  
  This stylesheet has been tested with:
   * Apache Fop (http://xmlgraphics.apache.org/fop/)
   
  -->
  <xsl:output method="xml"/>
  
  <!--
  Match top level document 
  -->
  <xsl:template match="/">
    <fo:root>
    
    
      <!-- 
        Layout
      -->
      <fo:layout-master-set>
        <!-- 
          For a presentation just use a single landscape layout.
        -->
        <fo:simple-page-master master-name="slide"
          page-height="{$SlideHeight}" page-width="{$SlideWidth}" margin="{$SlideMargin}">

          <fo:region-body />

        </fo:simple-page-master>
      </fo:layout-master-set>

    <!-- 
    Main processing loop creates on page for each slide.
     -->
      <xsl:for-each
        select="xhtml:html/xhtml:body/xhtml:div/xhtml:div[@class='slide']">
        <fo:page-sequence master-reference="slide">
          <fo:flow flow-name="xsl-region-body">

            <xsl:apply-templates />

          </fo:flow>
        </fo:page-sequence>
      </xsl:for-each>
    </fo:root>
  </xsl:template>

  <!-- 
    Important
  -->
  <xsl:template match="xhtml:div[@class='notes']">
    <!-- Ignore notes -->
  </xsl:template>

  <!-- 
    Important
  -->
  <xsl:template match="xhtml:div[@class='handout']">
    <!-- Ignore notes -->
  </xsl:template>


  <!-- 
    
  Elements are styled by included sheets.
    
  -->
 
  <xsl:include href="s5-headings.xsl"/>
  <xsl:include href="s5-graphics.xsl"/>
  <xsl:include href="s5-lists.xsl"/>
  <xsl:include href="s5-font-styles.xsl"/>
  <xsl:include href="s5-phrase-styles.xsl"/>
  <xsl:include href="s5-quotes.xsl"/>
  <xsl:include href="s5-lines.xsl"/>
  <xsl:include href="s5-meta.xsl"/>
  <xsl:include href="s5-structure.xsl"/>
<!-- Uncomment to support deprecated elements
  <xsl:include href="s5-deprecated.xsl"/>
 -->

  <xsl:template match='*'>
    <!-- Do Nothing (for now) -->
  </xsl:template>
</xsl:stylesheet>