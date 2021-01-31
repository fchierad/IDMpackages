<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output omit-xml-declaration="yes"/>
<xsl:variable name="newline" select="'&#xa;'"/>
<xsl:variable name="tab" select="'&#x09;'"/>
<xsl:template match="log">
	<!-- One line starting with timestamp, ; delimited -->
	<xsl:value-of select="@start-time"/><xsl:text>;</xsl:text>
	<xsl:value-of select="@driver"/><xsl:text>;</xsl:text>
	<xsl:value-of select="@correlation-id"/><xsl:text>;</xsl:text>
	<xsl:value-of select="@association"/><xsl:text>;</xsl:text>
	<xsl:value-of select="@event"/><xsl:copy-of select="$newline"/>
	<!-- all other properies printed one per line, preceeded by 1 tab character, format key:value -->
	<xsl:for-each select="@*[not(local-name()='start-time')][not(local-name()='correlation-id')][not(local-name()='driver')][not(local-name()='event')][not(local-name()='association')][not(local-name()='write-time')]">
		<xsl:copy-of select="$tab"/>
		<xsl:value-of select="local-name()"/><xsl:text>:</xsl:text><xsl:value-of select="."/>
		<xsl:copy-of select="$newline"/>
	</xsl:for-each>
	<!-- Time the call to write the log was issued in policy -->
	<xsl:copy-of select="$tab"/>
	<xsl:text>write-time:</xsl:text><xsl:value-of select="@write-time"/>
	<xsl:copy-of select="$newline"/>
</xsl:template>
</xsl:stylesheet>