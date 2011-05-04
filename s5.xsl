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
  
  Output XML suitable for XSL-FO
  
  This stylesheet has been tested with:
   * Apache Fop (http://xmlgraphics.apache.org/fop/)
   
  -->
  <xsl:output method="xml"/>
  
  <!--
  
  A number of qualities can be easily customised. 
  To do so, alter the parameter values below,
  or pass appropriate parameter values to the renderer.
   
  -->
  <!--
  Slide page size 
  -->
  <!-- The height of each slide page -->
  <xsl:param name='SlideHeight'>21.0cm</xsl:param>
  <!-- The width of each slide page -->
  <xsl:param name='SlideWidth'>29.7cm</xsl:param>
  <!-- The margin surrounding each slide page -->
  <xsl:param name='SlideMargin'>2cm</xsl:param>
  <!-- 
  Styling
  -->
  <!-- Main Font Family -->
  <xsl:param name='MainFont'>sans-serif</xsl:param>
  <!-- Size for normal blocks such as p, ul, ol -->
  <xsl:param name='UsualTextSize'>20pt</xsl:param>
  <!-- A bigger size for normal blocks such as p, ul, ol -->
  <xsl:param name='BiggerTextSize'>24pt</xsl:param>
  <!-- A smaller size for normal blocks such as p, ul, ol -->
  <xsl:param name='SmallerTextSize'>16pt</xsl:param>
  <!-- 
  Lists
  NOTE: space before text and identifier are independent
  -->
  <!-- Space before the list item identifier -->
  <xsl:param name='ListIndent'>2em</xsl:param>
  <!-- Space before the body text of a list item, should be more than ListIndent-->
  <xsl:param name='ListTextIndent'>4em</xsl:param>
  <!-- Space after each item in a list -->
  <xsl:param name='ListItemSpace'>0.5em</xsl:param>
  <!-- Space before and after a list -->
  <xsl:param name='ListSpaceAround'>0.25em</xsl:param>
  <!--
  Headers 
  -->
  <!-- Space to be inserted before and after a header -->
  <xsl:param name='HeaderSpace'>6pt</xsl:param>
  <!-- Size for H1 -->
  <xsl:param name='H1Size'>48pt</xsl:param>
  <!-- Size for H2 -->
  <xsl:param name='H2Size'>36pt</xsl:param>
  <!-- Size for H3 -->
  <xsl:param name='H3Size'>24pt</xsl:param>
  <!-- Size for H4 -->
  <xsl:param name='H4Size'>20pt</xsl:param>
  <!-- Size for H5 -->
  <xsl:param name='H5Size'>18pt</xsl:param>
  <!-- Size for H6 -->
  <xsl:param name='H6Size'>16pt</xsl:param>
  <!-- 
  Paragraph
  -->
  <!-- Maximum space before and after a paragraph -->
  <xsl:param name='ParagraphSpaceMaximum'>6pt</xsl:param>
  <!-- Minimum space before and after a paragraph -->
  <xsl:param name='ParagraphSpaceMinimum'>2pt</xsl:param>
  <!-- Preferred space before and after a paragraph -->
  <xsl:param name='ParagraphSpacePreferred'>4pt</xsl:param>
  <!-- Standard indentation (used for paragraphs) -->
  <xsl:param name='MainIndent'>1em</xsl:param>
  
  <!-- 
  Styles
   -->
  <!-- cite -->
  <xsl:param name='CiteFontStyle'>italic</xsl:param>
  <xsl:param name='CiteFontFamily'>monospace</xsl:param>
  <xsl:param name='CitationBlockIndent'>{$MainIndent}</xsl:param>
  <xsl:param name='CitationBlockSpaceMinimum'>{$ParagraphSpaceMinimum}</xsl:param>
  <xsl:param name='CitationBlockSpaceMaximum'>{$ParagraphSpaceMaximum}</xsl:param>
  <xsl:param name='CitationBlockSpacePreferred'>{$ParagraphSpacePreferred}</xsl:param>
  
  
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
    
    Styles For Elements
    
  -->
 
  <!-- 
    Important
  -->
  
  <xsl:template match="xhtml:a">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="xhtml:abbr">
    <xsl:apply-templates />
  </xsl:template>  

  <xsl:template match="xhtml:acronym">
    <xsl:apply-templates />
  </xsl:template> 
  
  <xsl:template match="xhtml:address">
    <xsl:apply-templates />
  </xsl:template>
    
  <xsl:template match="xhtml:bdo">
    <!-- Ignore -->
  </xsl:template>  
  
  
  <xsl:template match="xhtml:br">
    <fo:block/>
  </xsl:template>  
   
  <xsl:template match="xhtml:code">
    <fo:inline font-family="monospace">
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>

  <xsl:template match="xhtml:del">
    <fo:inline text-decoration='line-through'>
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>

  <xsl:template match="xhtml:dfn">
    <fo:inline font-style="italic">
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>
  
  <xsl:template match="xhtml:div">
    <xsl:apply-templates />
  </xsl:template>
  
  <xsl:template match="xhtml:em">
    <fo:inline font-style="italic">
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>

  <xsl:include href="s5-headings.xsl"/>
  <xsl:include href="s5-graphics.xsl"/>
  <xsl:include href="s5-lists.xsl"/>
  <xsl:include href="s5-font-styles.xsl"/>
  <xsl:include href="s5-quotes.xsl"/>
<!-- Uncomment to support deprecated elements
  <xsl:include href="s5-deprecated.xsl"/>
 -->
  
  <xsl:template match="xhtml:hr">
     <!-- TODO: Support hr -->
  </xsl:template>

  <xsl:template match="xhtml:ins">
    <fo:inline text-decoration='line-through'>
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>

  <xsl:template match="xhtml:kbd">
    <fo:inline font-family="monospace">
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template> 
  
  <xsl:template match="xhtml:p">
    <fo:block text-indent="{$MainIndent}" font-family="{$MainFont}"
      font-size="{$UsualTextSize}" space-before.minimum="{$ParagraphSpaceMinimum}"
      space-before.maximum="{$ParagraphSpaceMaximum}" space-before.optimum="{$ParagraphSpacePreferred}"
      space-after.minimum="{$ParagraphSpaceMinimum}" space-after.maximum="{$ParagraphSpaceMaximum}"
      space-after.optimum="{$ParagraphSpacePreferred}">
      <xsl:apply-templates />
    </fo:block>
  </xsl:template>
    
  
  <xsl:template match="xhtml:samp">
    <fo:inline font-family="monospace">
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>
  

  <xsl:template match="xhtml:span">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="xhtml:style">
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
  

  <xsl:template match='*'>
    <!-- Do Nothing (for now) -->
  </xsl:template>
</xsl:stylesheet>