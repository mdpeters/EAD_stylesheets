<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xsi:schemaLocation="urn:isbn:1-931666-22-9 http://www.loc.gov/ead/ead.xsd" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:ead="urn:isbn:1-931666-22-9" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="ead">
    <!--
		***********************************************************************                                                              			   	
		* VERSION:          1.0                                          			 
		*                                                                 				
		* AUTHOR:           Matthew Peters                               		
		*                   mpeters@ucsd.edu                           		 
		*                                                                 				                                                                				
		* ABOUT:           This file has been created for use with        	
		*                  EAD output from  ArchivesSpace          		
		*                  to create output for the UCSD Special Collections & Archives, for the specific purpose
        *                  of preparing it for ingest into OAC.  It is not designed 	
		*	           		to be generic and satisfies the specific needs and	
		*                  processing policies of UCSD/MSCL.  In essence this stylesheet
        *                  makes an exact copy of the one it's given but making the following
        *                  changes:
        *
        *                  *Unitids translated from AT output of MSS.XXXX to MSCL preferred
        *                    MSS XXXX
        *                  *Removes Mixed materials label in ead:container (note does not remove any
        *                    other labels if they are applied, just 'Mixed materials')
        *                  *Several changes made to dao attributes according ucsd policies
        *                  *Restricted dao entries are removed by referencing an external file
        *                    named restrictedarks.xml and not copying daos with matching hrefs
        *                  *Changes ead:language @scriptcode to Latn for all finding aids to fix
        *                    inconsistencies where it is sometimes input as 'latn'
        *
        *                  *PLEASE NOTE THIS IS AN XSL 2.0 STYLESHEET AND MUST BE USED WITH AN
        *                   XSL 2.0 CAPABLE PARSER*
		*                                                                 				
		* UPDATED          May 10, 2015                               		 
		************************************************************************
    -->

    <xsl:output indent="yes" method="xml"/>
    
    <xsl:variable name="restricteddao" select="document('restrictedarks.xml')"/>
    <xsl:variable name="oacarks" select="document('oacarks.xml')" />
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="ead:abbr">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:abstract">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:accessrestrict">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:accruals">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:acqinfo">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:address">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:addressline">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:altformavail">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:appraisal">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:arc">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:archdesc">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:archdescgrp">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:archref">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:arrangement">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:author">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:bibliography">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:bibref">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:bibseries">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:bioghist">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:blockquote">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:c">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:c01">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:c02">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:c03">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:c04">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:c05">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:c06">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:c07">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:c08">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:c09">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:c10">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:c11">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:c12">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:change">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:chronitem">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:chronlist">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:colspec">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:container">
        <xsl:choose>
            <xsl:when test="@label eq 'Mixed materials'">
                <xsl:copy>
                    <xsl:if test="@altrender">
                        <xsl:copy-of select="@altrender"/>
                    </xsl:if>
                    <xsl:if test="@audience">
                        <xsl:copy-of select="@audience"/>
                    </xsl:if>
                    <xsl:if test="@encodinganalog">
                            <xsl:copy-of select="@encodinganalog"/>
                    </xsl:if>
                    <xsl:if test="@id">
                        <xsl:copy-of select="@id"/>
                    </xsl:if>
                    <xsl:if test="@parent">
                        <xsl:copy-of select="@parent"/>
                    </xsl:if>
                    <xsl:if test="@type">
                        <xsl:copy-of select="@type"/>
                    </xsl:if>
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:call-template name="copyattributes"/>
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="ead:controlaccess">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:corpname">
	<xsl:choose>
	    <xsl:when test="parent::ead:controlaccess">
		<xsl:copy>
		    <xsl:call-template name="copyattributes"/>
		    <xsl:attribute name="role">subject</xsl:attribute>
		    <xsl:apply-templates/>
		</xsl:copy>
	    </xsl:when>
	    <xsl:when test="parent::ead:repository">
		<xsl:copy>
		    <xsl:call-template name="copyattributes"/>
		    <xsl:value-of select="'Special Collections &amp; Archives, UC San Diego'" />
		</xsl:copy>
	    </xsl:when>
	    <xsl:otherwise>
		<xsl:copy>
		    <xsl:call-template name="copyattributes"/>
		    <xsl:apply-templates/>
		</xsl:copy>
	    </xsl:otherwise>
	</xsl:choose>
    </xsl:template>
    
    <xsl:template match="ead:creation">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:custodhist">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:dao">
        <xsl:variable name="daoark" select="@xlink:href" />
        
        <xsl:choose>
            <xsl:when test="some $ark in $restricteddao/restrictedarks/ark satisfies starts-with($daoark, $ark)">
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:attribute name="xlink:role">
                        <xsl:text>http://oac.cdlib.org/arcrole/link/</xsl:text>
                    </xsl:attribute>
                    <xsl:if test="@xlink:show eq 'new'">
                        <xsl:attribute name="xlink:show">
                            <xsl:value-of select="@xlink:show"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@xlink:altrender">
                        <xsl:attribute name="xlink:altrender">
                            <xsl:value-of select="@xlink:altrender"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@xlink:arcrole">
                        <xsl:attribute name="xlink:arcrole">
                            <xsl:value-of select="@xlink:arcrole"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@xlink:audience">
                        <xsl:attribute name="xlink:audience">
                            <xsl:value-of select="@xlink:audience"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@xlink:entityref">
                        <xsl:attribute name="xlink:entityref">
                            <xsl:value-of select="@xlink:entityref"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@xlink:href">
                        <xsl:attribute name="xlink:href">
                            <xsl:value-of select="@xlink:href"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@xlink:id">
                        <xsl:attribute name="xlink:id">
                            <xsl:value-of select="@xlink:id"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@xlink:linktype">
                        <xsl:attribute name="xlink:linktype">
                            <xsl:value-of select="@xlink:linktype"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@xlink:title">
                        <xsl:attribute name="xlink:title">
                            <xsl:value-of select="@xlink:title"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@xlink:xpointer">
                        <xsl:attribute name="xlink:xpointer">
                            <xsl:value-of select="@xlink:xpointer"/>
                        </xsl:attribute>
                    </xsl:if>
		    
                    <xsl:apply-templates/>
                </xsl:copy>  
            </xsl:otherwise>
        </xsl:choose>   
    </xsl:template>
    
    <xsl:template match="ead:daodesc">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:daogrp">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:daoloc">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:date">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:defitem">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:descgrp">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:descrules">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:did">
	<xsl:choose>
	    <xsl:when test="parent::ead:archdesc">
		<xsl:copy>
		    <xsl:call-template name="copyattributes"/>
		    <xsl:element name="head" namespace="urn:isbn:1-931666-22-9">Descriptive Summary</xsl:element>
		    <xsl:apply-templates/>
		</xsl:copy>
	    </xsl:when>
	    <xsl:otherwise>
		<xsl:copy>
		    <xsl:call-template name="copyattributes"/>
		    <xsl:apply-templates/>
		</xsl:copy>
	    </xsl:otherwise>
	</xsl:choose>
        
    </xsl:template>
    
    <xsl:template match="ead:dimensions">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:div">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:dsc">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
	    <xsl:attribute name="type">combined</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:dscgrp">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:ead">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:eadgrp">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:eadheader">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:eadid">
    	<xsl:variable name="eadid" select="." />
        <xsl:copy>
            <xsl:attribute name="countrycode">
                <xsl:value-of select="'US'"/>
            </xsl:attribute>
		    <xsl:attribute name="mainagencycode">
	                <xsl:value-of select="'CU-S'"/>
	        </xsl:attribute>
	        <xsl:for-each select="$oacarks/oacfindingaids/findingaid">
	        	<xsl:if test="@filename eq $eadid">
	        		<xsl:attribute name="identifier">
	        	 		<xsl:value-of select="@ark" />
	        	 	</xsl:attribute>
	        	</xsl:if>
	        </xsl:for-each>
	  	    <xsl:if test="@url">
				<xsl:attribute name="identifier">
				    <xsl:value-of select="@url"/>
				</xsl:attribute>
		    </xsl:if>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:edition">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:editionstmt">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:emph">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:entry">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:event">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:eventgrp">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:expan">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:extent">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:extptr">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="ead:extptrloc">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:extref">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:famname">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:filedesc">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:fileplan">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:frontmatter">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:function">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:genreform">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:geogname">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:head">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:head01">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:head02">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:imprint">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:index">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:indexentry">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:item">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:label">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:langmaterial">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
	    <xsl:attribute name="label">Languages</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:language">
        <xsl:copy>
            <xsl:if test="@altrender">
                <xsl:copy-of select="@altrender"/>
            </xsl:if>
            <xsl:if test="@audience">
                <xsl:copy-of select="@audience"/>
            </xsl:if>
            <xsl:if test="@encodinganalog">
                <xsl:copy-of select="@encodinganalog"/>
            </xsl:if>
            <xsl:if test="@id">
                <xsl:copy-of select="@id"/>
            </xsl:if>
            <xsl:if test="@langcode">
                <xsl:copy-of select="@langcode"/>
            </xsl:if>
            <xsl:if test="@scriptcode">
                <xsl:attribute name="scriptcode">
                    <xsl:value-of select="'Latn'"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:langusage">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:lb">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:legalstatus">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:linkgrp">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:list">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:listhead">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:materialspec">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:name">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:namegrp">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:note">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:notestmt">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:num">
        <xsl:choose>
            <xsl:when test="parent::ead:titleproper"></xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:call-template name="copyattributes"/>
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="ead:occupation">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:odd">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:originalsloc">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:origination">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:otherfindaid">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:p">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:persname">
	<xsl:choose>
	     <xsl:when test="parent::ead:controlaccess">
		<xsl:copy>
		    <xsl:call-template name="copyattributes"/>
		    <xsl:attribute name="role">subject</xsl:attribute>
		    <xsl:apply-templates/>
		</xsl:copy>
	    </xsl:when>
	    <xsl:otherwise>
		<xsl:copy>
		    <xsl:call-template name="copyattributes"/>
		    <xsl:attribute name="role">subject</xsl:attribute>
		    <xsl:apply-templates/>
		</xsl:copy>
	</xsl:otherwise>
	</xsl:choose>
	
    </xsl:template>
    
    <xsl:template match="ead:physdesc">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:physfacet">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:physloc">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:phystech">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:prefercite">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:processinfo">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:profiledesc">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:ptr">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:ptrgrp">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:ptrloc">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:publicationstmt">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:publisher">
	<xsl:choose>
	    <xsl:when test="ancestor::ead:filedesc">
		 <xsl:copy>
		    <xsl:call-template name="copyattributes"/>
		    <xsl:value-of select="'Special Collections &amp; Archives, UC San Diego'" />
		</xsl:copy>
	    </xsl:when>
	    <xsl:otherwise>
		 <xsl:copy>
		    <xsl:call-template name="copyattributes"/>
		    <xsl:apply-templates/>
		</xsl:copy>
	    </xsl:otherwise>
	</xsl:choose>
    </xsl:template>
    
    <xsl:template match="ead:ref">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:refloc">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:relatedmaterial">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:repository">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
	    <xsl:element name="address" namespace="urn:isbn:1-931666-22-9">
		<xsl:element name="addressline" namespace="urn:isbn:1-931666-22-9">
		    <xsl:value-of select="/ead:ead/ead:eadheader/ead:filedesc/ead:publicationstmt/ead:address/ead:addressline[1]"/>
		</xsl:element>
		<xsl:element name="addressline" namespace="urn:isbn:1-931666-22-9">
		    <xsl:value-of select="/ead:ead/ead:eadheader/ead:filedesc/ead:publicationstmt/ead:address/ead:addressline[2]"/>
		</xsl:element>
	    </xsl:element>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:resource">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:revisiondesc">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:row">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:runner">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:scopecontent">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:separatedmaterial">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:seriesstmt">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:sponsor">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:subarea">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:subject">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:subtitle">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:table">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:tbody">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:tgroup">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="ead:thead">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:title">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:titlepage">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:titleproper">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:titlestmt">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:unitdate">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:unitid">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:value-of select="translate(., '.', ' ')"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:unittitle">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="ead:userestrict">
        <xsl:copy>
            <xsl:call-template name="copyattributes"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template name="copyattributes">
        <xsl:for-each select="@*">
	    <xsl:choose>
		<xsl:when test="name(.) eq 'label'">
		    <xsl:choose>
			<xsl:when test=". eq 'creator'">
			    <xsl:attribute name="label">
				<xsl:text>Creator</xsl:text>
			    </xsl:attribute>
			</xsl:when>
			<xsl:otherwise>
			    <xsl:attribute name="label">
				<xsl:value-of select="." />
			    </xsl:attribute>
			</xsl:otherwise>
		    </xsl:choose>
		    
		</xsl:when>
		<xsl:otherwise>
		    <xsl:copy>
			
		    </xsl:copy>
		</xsl:otherwise>
	    </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>
