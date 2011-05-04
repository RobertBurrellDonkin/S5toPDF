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
   
   Default values for parameters.
    
  -->
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
  
  

</xsl:stylesheet>