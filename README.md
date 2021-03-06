# S5toPDF

Converts S5 slides to PDFs.
   
When S5toPDF Works
==================

S5toPDF has been tested with:

* [Apache Fop](http://xmlgraphics.apache.org/fop/ "Apache Fop XSL-FO")

Support for some elements still remains TODO. To add support, just
find and fill in the commented out outlines.

How S5toPDF Works  
=================

The `s5.xsl` stylesheet outputs xml suitable for [XSL-FO]
(http://www.w3.org/TR/xsl/ "Extensible Stylesheet Language, W3C Recommendation"). 
Pass this stylesheet and the S5 presentation document to an `XSL-FO` 
(for example [Apache Fop](http://xmlgraphics.apache.org/fop/ "Apache Fop XSL-FO") 
processor. 

S5toPDF has a modular design, with each group of
related elements managed by an independent stylesheet
imported by `s5.xsl`. See the comments in each stylesheet
for more details.

Easy Customisation
------------------

The stylesheets are arranged in a modular fashion. Many parameter been factored
out into `s5-params`, and described in a comment. This allows many common 
customisations to be performed by 

* passing parameters to the comment line interface of your `XSL-FO` processor, 
* Adding an extra import to `s5.xsl`
* Editing `s5-params.xsl`

See the comments in `s5-params.xsl` for more details.

Some Ways To Use S5toPDF 
=======================

With Apache FOP
----------------

A good way to use `S5toPDF` is to check talks, `XSL-FO` processor and `S5toPDF` out into a root working directory.

* Checkout S5toPDF into `S5toPDF` (say)
* Install [Apache Fop](http://xmlgraphics.apache.org/fop/ "Apache Fop XSL-FO") version 1.0 (say) 
   into `fop-1.0` (say)
* Checkout the [S5](http://meyerweb.com/eric/tools/s5/ "S5: A Simple Standards-Based Slide Show System") 
   presentation, *ThePomodoroTechnique* (say)
 
      fop-1.0/fop -xml ThePomodoroTechnique/index.html -xsl S5toPDF/s5.xsl -pdf talk.pdf 
   
To set a new parameter value on the command line use `-param *name* *value*`

      fop-1.0/fop -xml ThePomodoroTechnique/index.html -xsl S5toPDF/s5.xsl -param MainFont monospace -pdf alt-font-talk.pdf
      
Notes
=====
Since 0.2
---------
0.2
---
 * Improved support for lists. Spacing improved for deep lists and gaps tuned.
 * Factored out unit from list parameters. Existing names preserved but values now calculated.
0.1
---
Initial release, minimal but usable. 