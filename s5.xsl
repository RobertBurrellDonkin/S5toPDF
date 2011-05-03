<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
<!-- 
Copyright (c) 2009, Contributors To OpenTalkWare http://www.opentalkware.org
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, 
are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright notice, 
      this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice, 
      this list of conditions and the following disclaimer in the documentation 
      and/or other materials provided with the distribution.
    * Neither the name of the OpenTalkWare nor the names of its contributors may
      be used to endorse or promote products derived from this software without
      specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, 
BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, 
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
OF THE POSSIBILITY OF SUCH DAMAGE.
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
  <xsl:template match="xhtml:div[@class='cite']">
        <fo:block 
        	text-align="end" 
        	font-style="italic"
      		text-indent="{$CitationBlockIndent}" 
      		font-family="{$MainFont}" 
      		font-weight="bold"
      		font-size="{$UsualTextSize}" 
      		space-before.minimum="{$CitationBlockSpaceMinimum}"
      		space-before.maximum="{$CitationBlockSpaceMaximum}" 
      		space-before.optimum="{$CitationBlockSpacePreferred}"
      		space-after.minimum="{$CitationBlockSpaceMinimum}" 
      		space-after.maximum="{$CitationBlockSpaceMaximum}"
      		space-after.optimum="{$CitationBlockSpacePreferred}">
      <xsl:apply-templates />
    </fo:block>
  </xsl:template>
  
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
  
  <xsl:template match="xhtml:applet">
    <!-- Ignore content -->
  </xsl:template>

  <xsl:template match="xhtml:area">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="xhtml:b">
    <fo:inline font-weight="bold">
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>  

  <xsl:template match="xhtml:base">
    <!-- Ignore -->
  </xsl:template>

  <xsl:template match="xhtml:basefont">
    <!-- Ignore -->
  </xsl:template>   
    
  <xsl:template match="xhtml:bdo">
    <!-- Ignore -->
  </xsl:template>  
  
  <xsl:template match="xhtml:big">
    <fo:inline font-size="{$BiggerTextSize}">
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>
  
  <xsl:template match='xhtml:blockquote'>
    <fo:block text-align="end" font-style="italic"
      text-indent="{$MainIndent}" font-family="{$MainFont}"
      font-size="{$UsualTextSize}" space-before.minimum="{$ParagraphSpaceMinimum}"
      space-before.maximum="{$ParagraphSpaceMaximum}" space-before.optimum="{$ParagraphSpacePreferred}"
      space-after.minimum="{$ParagraphSpaceMinimum}" space-after.maximum="{$ParagraphSpaceMaximum}"
      space-after.optimum="{$ParagraphSpacePreferred}">
      <xsl:apply-templates />
    </fo:block>
  </xsl:template>
  
  <xsl:template match="xhtml:body">
    <!-- Ignore -->
  </xsl:template>  
  
  <xsl:template match="xhtml:br">
    <fo:block/>
  </xsl:template>  
 
  <xsl:template match="xhtml:button">
    <!-- Ignore -->
  </xsl:template> 
  
  <xsl:template match="xhtml:caption">
    <!-- TODO: Support tables -->
  </xsl:template>
  
  <xsl:template match="xhtml:center">
    <!-- 
    Ignore
    Is there way to do this in XSL-FO?s
     -->
  </xsl:template>
  
  <xsl:template match="xhtml:cite">
    <fo:inline font-style="{$CiteFontStyle}" font-family="{$CiteFontFamily}">
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>
  
  <xsl:template match="xhtml:code">
    <fo:inline font-family="monospace">
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>

  <xsl:template match="xhtml:col">
    <!-- TODO: Support tables -->
  </xsl:template>

  <xsl:template match="xhtml:colgroup">
    <!-- TODO: Support tables -->
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

  <xsl:template match="xhtml:dir">
    <fo:list-block space-before="{$ListSpaceAround}" space-after="{$ListSpaceAround}" font-family="monospace">
      <xsl:apply-templates />
    </fo:list-block>
  </xsl:template>

  <xsl:template match="xhtml:dir/xhtml:li">
    <fo:list-item space-after="{$ListItemSpace}">
      <fo:list-item-label start-indent="{$ListIndent}">
        <fo:block font-size="{$UsualTextSize}" font-family="{$MainFont}">
          &#x2022;
        </fo:block>
      </fo:list-item-label>
      <fo:list-item-body start-indent="{$ListTextIndent}">
        <fo:block font-size="{$UsualTextSize}" font-family="{$MainFont}">
          <xsl:apply-templates />
        </fo:block>
      </fo:list-item-body>
    </fo:list-item>
  </xsl:template>

  <xsl:template match="xhtml:dl">
    <!-- TODO: Support definition lists -->
  </xsl:template>

  <xsl:template match="xhtml:dt">
    <!-- TODO: Support definition lists -->
  </xsl:template>
  
  <xsl:template match="xhtml:dd">
     <!-- TODO: Support definition lists -->
  </xsl:template>
  
  <xsl:template match="xhtml:div">
    <xsl:apply-templates />
  </xsl:template>
  
  <xsl:template match="xhtml:em">
    <fo:inline font-style="italic">
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>
  
  <xsl:template match="xhtml:fieldset">
    <!-- Ignore -->
  </xsl:template> 

  <xsl:template match="xhtml:font">
    <!-- Ignore -->
  </xsl:template> 

  <xsl:template match="xhtml:form">
    <!-- Ignore -->
  </xsl:template> 

  <xsl:template match="xhtml:frame">
    <!-- Ignore -->
  </xsl:template> 

  <xsl:template match="xhtml:frameset">
    <!-- Ignore -->
  </xsl:template> 
    
  <xsl:template match="xhtml:head">
    <!-- Ignore -->
  </xsl:template> 
  
  <xsl:template match='xhtml:h1'>
    <fo:block font-size="{$H1Size}" font-family="{$MainFont}"
      font-weight="bold" space-before="{$HeaderSpace}" space-after="{$HeaderSpace}">
      <xsl:apply-templates />
    </fo:block>
  </xsl:template>

  <xsl:template match="xhtml:h2">
    <fo:block font-size="{$H2Size}" font-family="{$MainFont}"
      font-weight="bold" space-before="{$HeaderSpace}" space-after="{$HeaderSpace}">
      <xsl:apply-templates />
    </fo:block>
  </xsl:template>

  <xsl:template match="xhtml:h3">
    <fo:block font-size="{$H3Size}" font-family="{$MainFont}"
      font-weight="bold" space-before="{$HeaderSpace}" space-after="{$HeaderSpace}">
      <xsl:apply-templates />
    </fo:block>
  </xsl:template>

  <xsl:template match="xhtml:h4">
    <fo:block font-size="{$H4Size}" font-family="{$MainFont}"
      font-weight="bold" space-before="{$HeaderSpace}" space-after="{$HeaderSpace}">
      <xsl:apply-templates />
    </fo:block>
  </xsl:template>
  
  <xsl:template match="xhtml:h5">
    <fo:block font-size="{$H5Size}" font-family="{$MainFont}"
      font-weight="bold" space-before="{$HeaderSpace}" space-after="{$HeaderSpace}">
      <xsl:apply-templates />
    </fo:block>
  </xsl:template>
  
  <xsl:template match="xhtml:h6">
    <fo:block font-size="{$H6Size}" font-family="{$MainFont}"
      font-weight="bold" space-before="{$HeaderSpace}" space-after="{$HeaderSpace}">
      <xsl:apply-templates />
    </fo:block>
  </xsl:template>
  
  <xsl:template match="xhtml:hr">
     <!-- TODO: Support hr -->
  </xsl:template>

  <xsl:template match="xhtml:i">
    <fo:inline font-style="italic">
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>

  <xsl:template match="xhtml:img">
    <fo:block>
      <xsl:element name="external-graphic"
        namespace="http://www.w3.org/1999/XSL/Format">
        <xsl:attribute name='src'>
          url('
          <xsl:value-of select='@src'></xsl:value-of>
          ')
        </xsl:attribute>
      </xsl:element>
    </fo:block>
  </xsl:template>

  <xsl:template match="xhtml:iframe">
    <!-- Ignore -->
  </xsl:template> 

  <xsl:template match="xhtml:input">
    <!-- Ignore -->
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

  <xsl:template match="xhtml:label">
    <!-- Ignore -->
  </xsl:template> 

  <xsl:template match="xhtml:legend">
    <!-- Ignore -->
  </xsl:template> 

  <xsl:template match="xhtml:link">
    <!-- Ignore -->
  </xsl:template> 

  <xsl:template match="xhtml:map">
    <!-- Ignore -->
  </xsl:template> 

  <xsl:template match="xhtml:menu">
    <fo:list-block space-before="{$ListSpaceAround}" space-after="{$ListSpaceAround}">
      <xsl:apply-templates />
    </fo:list-block>
  </xsl:template>

  <xsl:template match="xhtml:menu/xhtml:li">
    <fo:list-item space-after="{$ListItemSpace}">
      <fo:list-item-label start-indent="{$ListIndent}">
        <fo:block font-size="{$UsualTextSize}" font-family="{$MainFont}">
          &#x2022;
        </fo:block>
      </fo:list-item-label>
      <fo:list-item-body start-indent="{$ListTextIndent}">
        <fo:block font-size="{$UsualTextSize}" font-family="{$MainFont}">
          <xsl:apply-templates />
        </fo:block>
      </fo:list-item-body>
    </fo:list-item>
  </xsl:template>

  <xsl:template match="xhtml:meta">
    <!-- Ignore -->
  </xsl:template> 

  <xsl:template match="xhtml:noframes">
    <!-- Ignore -->
  </xsl:template> 
  
  <xsl:template match="xhtml:noscript">
    <!-- Ignore -->
  </xsl:template> 
  
  <xsl:template match="xhtml:object">
    <!-- Ignore -->
  </xsl:template> 
 
  <xsl:template match="xhtml:ol">
    <fo:list-block space-before="{$ListSpaceAround}" space-after="{$ListSpaceAround}">
      <xsl:apply-templates />
    </fo:list-block>
  </xsl:template>
  
  <xsl:template match="xhtml:ol/xhtml:li">
    <fo:list-item space-after="{$ListItemSpace}">
      <fo:list-item-label start-indent="{$ListIndent}">
        <fo:block font-size="{$UsualTextSize}" font-family="{$MainFont}">
          <xsl:number />          .
        </fo:block>
      </fo:list-item-label>
      <fo:list-item-body start-indent="{$ListTextIndent}">
        <fo:block font-size="{$UsualTextSize}" font-family="{$MainFont}">
          <xsl:apply-templates />
        </fo:block>
      </fo:list-item-body>
    </fo:list-item>
  </xsl:template>
  
  <xsl:template match="xhtml:optgroup">
    <!-- Ignore -->
  </xsl:template> 

  <xsl:template match="xhtml:option">
    <!-- Ignore -->
  </xsl:template> 

  <xsl:template match="xhtml:param">
    <!-- Ignore -->
  </xsl:template> 

  <xsl:template match="xhtml:pre">
    <fo:block text-indent="{$MainIndent}" font-family="monospace" 
      font-size="{$UsualTextSize}" space-before.minimum="{$ParagraphSpaceMinimum}"
      space-before.maximum="{$ParagraphSpaceMaximum}" space-before.optimum="{$ParagraphSpacePreferred}"
      space-after.minimum="{$ParagraphSpaceMinimum}" space-after.maximum="{$ParagraphSpaceMaximum}"
      space-after.optimum="{$ParagraphSpacePreferred}">
      <!-- TODO: Improve how source is displayed -->
      <xsl:apply-templates />
    </fo:block>
  </xsl:template> 

  <xsl:template match="xhtml:q">
    <fo:inline font-style="italic">
       &#8220;
      <xsl:apply-templates />
       &#8221;
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
    
  <xsl:template match="xhtml:s">
    <fo:inline text-decoration='line-through'>
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>
  
  <xsl:template match="xhtml:samp">
    <fo:inline font-family="monospace">
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>
  
  <xsl:template match="xhtml:script">
    <!-- Ignore -->
  </xsl:template> 
  
  <xsl:template match="xhtml:select">
    <!-- Ignore -->
  </xsl:template> 

  
  <xsl:template match="xhtml:small">
    <fo:inline font-size="{$SmallerTextSize}">
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>

  <xsl:template match="xhtml:span">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="xhtml:strike">
    <fo:inline text-decoration='line-through'>
      <xsl:apply-templates />
    </fo:inline>
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

  <xsl:template match="xhtml:table">
    <!-- TODO: Support tables -->
  </xsl:template>

  <xsl:template match="xhtml:tbody">
    <!-- TODO: Support tables -->
  </xsl:template>

  <xsl:template match="xhtml:td">
    <!-- TODO: Support tables -->
  </xsl:template>
  
  <xsl:template match="xhtml:textarea">
    <!-- Ignore -->
  </xsl:template>

  <xsl:template match="xhtml:tfoot">
    <!-- TODO: Support tables -->
  </xsl:template>

  <xsl:template match="xhtml:th">
    <!-- TODO: Support tables -->
  </xsl:template>

  <xsl:template match="xhtml:thead">
    <!-- TODO: Support tables -->
  </xsl:template>

  <xsl:template match="xhtml:tr">
    <!-- TODO: Support tables -->
  </xsl:template>

  <xsl:template match="xhtml:tt">
    <!-- TODO: Support tables -->
  </xsl:template>
  
  <xsl:template match="xhtml:u">
    <fo:inline text-decoration='underline'>
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>

  <xsl:template match="xhtml:ul">
    <fo:list-block space-before="{$ListSpaceAround}" space-after="{$ListSpaceAround}">
      <xsl:apply-templates />
    </fo:list-block>
  </xsl:template>

  <xsl:template match="xhtml:ul/xhtml:li">
    <fo:list-item space-after="{$ListItemSpace}">
      <fo:list-item-label start-indent="{$ListIndent}">
        <fo:block font-size="{$UsualTextSize}" font-family="{$MainFont}">
          &#x2022;
        </fo:block>
      </fo:list-item-label>
      <fo:list-item-body start-indent="{$ListTextIndent}">
        <fo:block font-size="{$UsualTextSize}" font-family="{$MainFont}">
          <xsl:apply-templates />
        </fo:block>
      </fo:list-item-body>
    </fo:list-item>
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