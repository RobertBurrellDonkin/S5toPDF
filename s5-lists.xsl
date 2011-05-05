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
   
   Styles list elements
    
  -->

<!-- 



====================================================================================
Menu Lists
--> 
<!-- 
See s5-deprecated.xsl
-->


<!-- 



====================================================================================
Directory Lists
--> 
<!-- 
See s5-deprecated.xsl
-->




<!-- 



====================================================================================
Definition Lists
-->

<!-- TODO: support definition lists 
  <xsl:template match="xhtml:dl"/>
  <xsl:template match="xhtml:dt"/>
  <xsl:template match="xhtml:dd"/>
 -->


<!-- 



====================================================================================
Ordered Lists
-->
  <xsl:template match="xhtml:ol">
    <fo:list-block
      margin="{$ListSpaceAround}"
    >  
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

<!-- 



====================================================================================
Unordered Lists
-->
  <xsl:template match="xhtml:ul">
    <fo:list-block
      margin="{$ListSpaceAround}"
    >  
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

</xsl:stylesheet>