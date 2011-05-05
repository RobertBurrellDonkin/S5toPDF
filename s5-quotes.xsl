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
   
   Styles quotation and citation elements
    
  -->
  
   <xsl:template match="xhtml:div[@class='cite']">
    <fo:block 
        text-align="end" 
        font-style="italic"
        font-family="{$MainFont}" 
        font-weight="bold">
      <xsl:apply-templates />
    </fo:block>
  </xsl:template>
  
   <xsl:template match='xhtml:blockquote'>
    <fo:block 
         text-align="end" 
         font-style="italic"
         text-indent="{$MainIndent}" 
         font-family="{$MainFont}"
         font-size="{$UsualTextSize}" 
         space-before.minimum="{$ParagraphSpaceMinimum}"
         space-before.maximum="{$ParagraphSpaceMaximum}" 
         space-before.optimum="{$ParagraphSpacePreferred}"
         space-after.minimum="{$ParagraphSpaceMinimum}" 
         space-after.maximum="{$ParagraphSpaceMaximum}"
         space-after.optimum="{$ParagraphSpacePreferred}">
      <xsl:apply-templates />
    </fo:block>
  </xsl:template>
  
  <xsl:template match="xhtml:cite">
    <fo:inline 
         font-style="{$CiteFontStyle}" 
         font-family="{$CiteFontFamily}">
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>
 
  <xsl:template match="xhtml:q">
    <fo:inline font-style="italic">
       &#8220;
      <xsl:apply-templates />
       &#8221;
    </fo:inline>
  </xsl:template>
 
  <xsl:template match="xhtml:pre">
    <fo:block 
         text-indent="{$MainIndent}" 
         font-family="monospace" 
         font-size="{$UsualTextSize}" 
         space-before.minimum="{$ParagraphSpaceMinimum}"
         space-before.maximum="{$ParagraphSpaceMaximum}" 
         space-before.optimum="{$ParagraphSpacePreferred}"
         space-after.minimum="{$ParagraphSpaceMinimum}" 
         space-after.maximum="{$ParagraphSpaceMaximum}"
         space-after.optimum="{$ParagraphSpacePreferred}">
      <!-- TODO: Improve how source is displayed -->
      <xsl:apply-templates />
    </fo:block>
  </xsl:template> 

  <xsl:template match="xhtml:del">
    <fo:inline text-decoration='line-through'>
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>

  <xsl:template match="xhtml:ins">
    <fo:inline text-decoration='line-through'>
      <xsl:apply-templates />
    </fo:inline>
  </xsl:template>
  
</xsl:stylesheet>