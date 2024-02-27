<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="no"/>
<xsl:preserve-space elements="*" />


<!-- Style for the error and failure in the testcase template -->
<xsl:template name="display-failures">
  <xsl:choose>
    <xsl:when test="not(@message)">N/A</xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="@message"/>
    </xsl:otherwise>
  </xsl:choose>
  <!-- display the stacktrace -->
  <code>
    <p/>
    <xsl:call-template name="br-replace">
      <xsl:with-param name="word" select="."/>
    </xsl:call-template>
  </code>
  <!-- the latter is better but might be problematic for non-21" monitors... -->
  <!--pre><xsl:value-of select="."/></pre-->
</xsl:template>


<xsl:template name="br-replace">
  <xsl:param name="word"/>
  <xsl:choose>
    <xsl:when test="contains($word,'&#xA;')">
      <xsl:value-of select="substring-before($word,'&#xA;')"/>
      <br/>
      <xsl:call-template name="br-replace">
        <xsl:with-param name="word" select="substring-after($word,'&#xA;')"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$word"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<xsl:template match="/testsuite">

<html>
<head>
<style>
body {
    font:normal 68% verdana,arial,helvetica;
    color:#000000;
}

.preformatted {
    /* font-family: monospace; */
    /* white-space: pre; */
    white-space: pre-wrap;
    word-wrap: break-word;
    max-width: 300px;
}


table tr td, table tr th {
    font-size: 68%;
    vertical-align: middle;
}

tbody td{
  padding: 2px;
}

tbody tr:nth-child(odd){
  background-color: light-grey;
}




/*

table.details tr th{
    font-weight: bold;
    text-align:left;
    background:#a6caf0;
}
table.details tr td{
    background:#eeeee0;
}
*/

p {
    line-height:1.5em;
    margin-top:0.5em; margin-bottom:1.0em;
}
h1 {
    margin: 0px 0px 5px; font: 165% verdana,arial,helvetica
}
h2 {
    margin-top: 1em; margin-bottom: 0.5em; font: bold 125% verdana,arial,helvetica
}
h3 {
    margin-bottom: 0.5em; font: bold 115% verdana,arial,helvetica
}
h4 {
    margin-bottom: 0.5em; font: bold 100% verdana,arial,helvetica
}
h5 {
    margin-bottom: 0.5em; font: bold 100% verdana,arial,helvetica
}
h6 {
    margin-bottom: 0.5em; font: bold 100% verdana,arial,helvetica
}
.error {
    font-weight:bold; 
    color: red;
}
.failure {
    font-weight:bold; 
    color:red;
}
.Properties {
  text-align:right;
}
</style>
</head>

<body>

  <div style="max-width: 100%">

  <h1>Summary</h1>
  <table><thead><tr><th>Tests</th><th>Failures</th><th>Errors</th><th>Time</th></tr></thead>
    <tbody><tr style="background-color: #FFEBCD">
    <td><xsl:value-of select="count(testcase)" /></td>
    <td><xsl:value-of select="count(testcase/failure)" /></td>
    <td><xsl:value-of select="count(testcase/error)" /></td>
    <td><xsl:value-of select="format-number(sum(testcase/@time) div 60,'###,###,##0.0')" /> min</td>
    </tr>
    </tbody>
  </table>

  <br></br><br></br>
  <h1>Results</h1>
  <table style="width: 100%">
    <thead>
    <tr>
    <th style="width: 50%">Interface</th>
    <th style="width: 45%">Error Details</th>
    <th style="width: 3%">Result</th>
    <th style="width: 2%">Time</th>
    </tr>
    </thead>
  <tbody>

  <xsl:apply-templates select="testcase" />

  </tbody>
  </table>

  </div>
  </body>
  </html>
</xsl:template>


<xsl:template match="testcase">
    <!--xsl:text>
    Testcase: 
    </xsl:text>
    <xsl:value-of select="@name" />
    <xsl:text> took </xsl:text>
    <xsl:value-of select="@time" /-->
    <!--tr bgcolor="#FFEBCD" valign="top"-->

      <tr style="background-color: #FFEBCD">
      <td><xsl:value-of select="@name" /></td>
        <!--xsl:choose>
          <xsl:when test="failure/@message"><xsl:value-of select="failure/@message"/></xsl:when>
          <xsl:when test="error/@message"><xsl:value-of select="failure/@message"/></xsl:when>
          <xsl:otherwise>N/A</xsl:otherwise>
        </xsl:choose-->

        <xsl:choose>
          <xsl:when test="failure">
            <td class="preformatted"><xsl:value-of select="failure/@message"/></td>
            <!--td class="preformatted"><xsl:apply-templates select="failure"/></td-->
            <td class="error">Failure</td>            
          </xsl:when>
          <xsl:when test="error">
            <td><xsl:apply-templates select="error"/></td>
            <td>Error</td>            
          </xsl:when>
          <xsl:otherwise>
            <td></td>
            <td>Pass</td>            
          </xsl:otherwise>
        </xsl:choose>

        <!--xsl:choose>
          <xsl:when test="@errors[.&gt; 0]">Error</xsl:when>
          <xsl:when test="@failures[.&gt; 0]">Failure</xsl:when>
          <xsl:otherwise>Pass</xsl:otherwise>
        </xsl:choose--> 
      <td style="text-align: right"><xsl:value-of select="format-number(@time,'###,###,##0.0')" /></td>
    </tr>

    <!-- this is just to get newlinws for each row-->
    <xsl:text>
    </xsl:text>

  </xsl:template>





</xsl:stylesheet>
