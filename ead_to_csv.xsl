<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ead="urn:isbn:1-931666-22-9" xmlns:xlink="http://www.w3.org/1999/xlink">
	<xsl:strip-space elements="ead:*" />
	<xsl:output method="text" indent="no" encoding="utf-8" standalone="yes"/>

	<xsl:variable name="delimiter" select="','" />
	<xsl:variable name="quote" select="'&quot;'" />
 	<xsl:variable name="eol" select="'&#10;'" />
	<xsl:variable name="startlevel" select="1" />
	<xsl:variable name="collprefix" select="lower-case(substring-before(ead:ead/ead:archdesc/ead:did/ead:unitid, '.'))" />
	<xsl:variable name="collnum" select="substring-after(ead:ead/ead:archdesc/ead:did/ead:unitid, '.')" />


	<xsl:template match="/">
		<!-- Output csv headers -->
		<xsl:value-of select="'LEVEL TYPE'" /><xsl:value-of select="$delimiter" /><!--LEVEL TYPE -->
		<xsl:value-of select="'LEVEL'" /><xsl:value-of select="$delimiter" /><!--LEVEL -->
		<xsl:value-of select="'REFID'" /><xsl:value-of select="$delimiter" /><!--REFID -->
		<xsl:value-of select="'TITLE'" /><xsl:value-of select="$delimiter" /><!--TITLE -->
		<xsl:value-of select="'DATE'" /><xsl:value-of select="$delimiter" /><!--DATE -->
		<xsl:value-of select="'DATE BEGIN'" /><xsl:value-of select="$delimiter" /><!--DATE BEGIN -->
		<xsl:value-of select="'DATE END'" /><xsl:value-of select="$delimiter" /><!--DATE END -->
		<xsl:value-of select="'BULK DATE BEGIN'" /><xsl:value-of select="$delimiter" /><!--BULK DATE BEGIN -->
		<xsl:value-of select="'BULK DATE END'" /><xsl:value-of select="$delimiter" /><!--BULK DATE END -->
		<xsl:value-of select="'BOX'" /><xsl:value-of select="$delimiter" /><!--BOX VAL -->
		<xsl:value-of select="'FOLDER'" /><xsl:value-of select="$delimiter" /><!--FOLDER VAL -->
		<xsl:value-of select="'DF'" /><xsl:value-of select="$delimiter" /><!-- DIGITAL FILE VAL -->
		<xsl:value-of select="'OVSIZE'" /><xsl:value-of select="$delimiter" /><!--OVSIZE VAL -->
		<xsl:value-of select="'INSTANCE TYPE'" /><xsl:value-of select="$delimiter" /><!--INSTANCE TYPE -->
		<xsl:value-of select="'GENERAL NOTE'" /><xsl:value-of select="$delimiter" /><!--GENERAL NOTE -->
		<xsl:value-of select="'RESTRICTIONS'" /><xsl:value-of select="$delimiter" /><!--RESTRICTIONS NOTE -->
		<xsl:value-of select="'EXPECTEDFILENAME'" /><xsl:value-of select="$delimiter" /><!--EXPECTED FILENAME -->
		<xsl:value-of select="$eol" />
    <xsl:apply-templates select="ead:ead/ead:archdesc/ead:dsc"/>
	</xsl:template>

	<xsl:template match="ead:ead">
		<xsl:apply-templates select="ead:archdesc" />
	</xsl:template>

	<xsl:template match="ead:archdesc">
		<xsl:apply-templates select="ead:dsc" />
	</xsl:template>

	<xsl:template match="ead:dsc">
		<xsl:apply-templates select="ead:c">
			<xsl:with-param name="level" select="$startlevel" />
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="ead:c">
		<xsl:param name="level" />
		<xsl:variable name="next_level" select="$level+1" />
		<xsl:variable name="node_position" select="position()" />
		<xsl:variable name="title">
			<xsl:call-template name="escape_values">
				<xsl:with-param name="value" select="ead:did/ead:unittitle"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="date">
			<xsl:call-template name="escape_values">
				<xsl:with-param name="value" select="normalize-space(ead:did/ead:unitdate)" />
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="date_begin">
			<xsl:if test="ead:did/ead:unitdate/@normal">
				<xsl:value-of select="tokenize(ead:did/ead:unitdate/@normal, '/')[1]" />
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="date_end">
			<xsl:if test="ead:did/ead:unitdate/@normal">
				<xsl:value-of select="tokenize(ead:did/ead:unitdate/@normal, '/')[2]" />
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="bulk_date_begin">
			<xsl:if test="ead:did/ead:unitdate/@type eq 'bulk'">

			</xsl:if>
		</xsl:variable>
		<xsl:variable name="bulk_date_end">
			<xsl:if test="ead:did/ead:unitdate/@type eq 'bulk'">

			</xsl:if>
		</xsl:variable>
		<xsl:variable name="box">
			<xsl:value-of select="ead:did/ead:container[@type='Box']" />
		</xsl:variable>
		<xsl:variable name="folder">
			<xsl:value-of select="ead:did/ead:container[@type='Folder']" />
		</xsl:variable>
		<xsl:variable name="digital_file">
			<xsl:value-of select="ead:did/ead:container[@type='Digital_file']" />
		</xsl:variable>
		<xsl:variable name="oversize">
			<xsl:value-of select="ead:did/ead:container[@type='Oversize']" />
		</xsl:variable>
		<xsl:variable name="instance_type">
			<xsl:call-template name="escape_values">
				<xsl:with-param name="value" select="ead:did/ead:container[1]/@label" />
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="general_note">
			<xsl:call-template name="escape_values">
				<xsl:with-param name="value" select="ead:odd/ead:p" />
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="restrict_note">
			<xsl:call-template name="escape_values">
				<xsl:with-param name="value" select="ead:accessrestrict/ead:p" />
			</xsl:call-template>
		</xsl:variable>
		<!--Expected filename can be used to match to existing digital files for automatic DAO processing -->
		<xsl:variable name="expected_filename">
		</xsl:variable>

		<xsl:value-of select="@level" /><xsl:value-of select="$delimiter" /><!--LEVEL TYPE -->
		<xsl:value-of select="$level" /><xsl:value-of select="$delimiter" /><!--LEVEL -->
		<xsl:value-of select="@id" /><xsl:value-of select="$delimiter" /><!--REFID -->
		<xsl:value-of select="$title" /><xsl:value-of select="$delimiter" /><!--TITLE -->
		<xsl:value-of select="$date" /><xsl:value-of select="$delimiter" /><!--DATE -->
		<xsl:value-of select="$date_begin" /><xsl:value-of select="$delimiter" /><!--DATE BEGIN -->
		<xsl:value-of select="$date_end" /><xsl:value-of select="$delimiter" /><!--DATE END -->
		<xsl:value-of select="$bulk_date_begin" /><xsl:value-of select="$delimiter" /><!--BULK DATE BEGIN -->
		<xsl:value-of select="$bulk_date_end" /><xsl:value-of select="$delimiter" /><!--BULK DATE END -->
		<xsl:value-of select="$box" /><xsl:value-of select="$delimiter" /><!--BOX VAL -->
		<xsl:value-of select="$folder" /><xsl:value-of select="$delimiter" /><!--FOLDER VAL -->
		<xsl:value-of select="$digital_file" /><xsl:value-of select="$delimiter" /><!-- DIGITAL FILE VAL -->
		<xsl:value-of select="$oversize" /><xsl:value-of select="$delimiter" /><!--OVSIZE VAL -->
		<xsl:value-of select="$instance_type" /><xsl:value-of select="$delimiter" /><!--INSTANCE TYPE -->
		<xsl:value-of select="normalize-space($general_note)" /><xsl:value-of select="$delimiter" /><!--GENERAL NOTE -->
		<xsl:value-of select="normalize-space($restrict_note)" /><xsl:value-of select="$delimiter" /><!--RESTRICTIONS NOTE -->
		<xsl:value-of select="$expected_filename" /><xsl:value-of select="$delimiter" /><!--EXPECTED FILENAME -->
		<xsl:value-of select="$eol" />
		<xsl:apply-templates select="ead:c">
			<xsl:with-param name="level" select="$next_level" />
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template name="escape_values">
		<xsl:param name="value" />
		<xsl:choose>
			<xsl:when test="contains($value, $quote)">
				<xsl:variable name="escapedquote" select="replace($value, $quote, concat($quote, $quote))" />
				<xsl:value-of select="concat($quote, $escapedquote, $quote)" />
			</xsl:when>
			<xsl:when test="contains($value, $delimiter)">
				<xsl:value-of select="concat($quote, $value, $quote)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$value" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="ead:did/ead:unittitle">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="ead:title">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="ead:odd">
		<xsl:apply-templates select="ead:p" />
	</xsl:template>

	<xsl:template match="ead:p">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="ead:emph">
		<xsl:apply-templates />
	</xsl:template>

</xsl:stylesheet>
