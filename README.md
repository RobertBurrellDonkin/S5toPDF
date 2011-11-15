# S5toPDF

Converts S5 slides to PDFs.

The s5.xsl stylesheet outputs xml suitable for XSL-FO. 
It has been tested with:
   * Apache Fop (http://xmlgraphics.apache.org/fop/)
   
S5toPDF has a modular design, with each group of
related elements managed by an independent stylesheet
imported by s5.xsl.

 