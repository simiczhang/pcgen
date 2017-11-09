<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:str="http://xsltsl.sourceforge.net/string.html"
	xmlns:xalan="http://xml.apache.org/xalan"
	>

	<xsl:import href="../../../../xsltsl-1.1/stdlib.xsl"/>
	<xsl:import href="../inc_pagedimensions.xslt"/>


	<!--
	====================================
	====================================
		TEMPLATE - Protection
	====================================
	====================================-->
	<xsl:template match="protection">
		<xsl:if test="count(armor|shield|item) &gt; 0" >
		<!-- BEGIN Armor table -->
		<fo:table table-layout="fixed" width="100%" border-collapse="collapse" space-before="2mm">
			<xsl:call-template name="attrib"><xsl:with-param name="attribute" select="'protection.border'"/></xsl:call-template>
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="$output_armor_table_width * $pagePrintableWidth - 49" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-column column-width="{$output_armor_column_1_width}"/>
			<fo:table-column column-width="{$output_armor_column_2_width}"/>
			<fo:table-column column-width="{$output_armor_column_3_width}"/>
			<fo:table-column column-width="{$output_armor_column_4_width}"/>
			<fo:table-column column-width="{$output_armor_column_5_width}"/>
			<fo:table-header>
				<fo:table-row>
											<xsl:message>Test</xsl:message>
					<xsl:call-template name="attrib"><xsl:with-param name="attribute" select="'protection.title'"/></xsl:call-template>
					<fo:table-cell padding-top="{$output_armor_armor_padding_top}">
						<fo:block font-size="{$output_armor_armor_font_size}">
							<xsl:value-of select="$output_armor_armor"/><!--ARMOR-->
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding-top="{$output_armor_type_padding_top}">
						<fo:block font-size="{$output_armor_type_font_size}">
							<xsl:value-of select="$output_armor_type"/><!--TYPE-->
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding-top="{$output_armor_ac_padding_top}">
						<fo:block font-size="{$output_armor_ac_font_size}">
							<xsl:value-of select="$output_armor_ac"/><!--AC-->
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding-top="{$output_armor_maxdex_padding_top}">
						<fo:block font-size="{$output_armor_maxdex_font_size}">
							<xsl:value-of select="$output_armor_maxdex"/><!--MAXDEX-->
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding-top="{$output_armor_check_padding_top}">
						<fo:block font-size="{$output_armor_check_font_size}">
							<xsl:value-of select="$output_armor_check"/><!--CHECK-->
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding-top="{$output_armor_spell_failure_padding_top}">
						<fo:block font-size="{$output_armor_spell_failure_font_size}">
							<xsl:value-of select="$output_armor_spell_failure"/><!--SPELL FAILURE-->
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-header>
			<fo:table-body>
				<xsl:for-each select="armor|shield|item">
					<xsl:if test="(not(contains(fulltype,'BARDING'))) or (contains(location,'Equipped'))">
					<xsl:variable name="shade">
						<xsl:choose>
							<xsl:when test="position() mod 2 = 0">darkline</xsl:when>
							<xsl:otherwise>lightline</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<fo:table-row>
											<xsl:message>Test</xsl:message>
						<xsl:call-template name="attrib"><xsl:with-param name="attribute" select="concat('protection.', $shade)"/></xsl:call-template>
						<fo:table-cell>
							<fo:block font-size="8pt">
								<xsl:value-of select="name"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center">
							<fo:block font-size="8pt">
								<xsl:variable name="armorType" select="type"/>							
								<xsl:value-of select="/character/lang/*[name() = concat('output_armor_type_',$armorType)]"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center">
							<fo:block font-size="8pt">
								<xsl:value-of select="totalac"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center">
							<fo:block font-size="8pt">
								<xsl:value-of select="maxdex"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center">
							<fo:block font-size="8pt">
								<xsl:value-of select="accheck"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center">
							<fo:block font-size="8pt">
								<xsl:value-of select="spellfail"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
											<xsl:message>Test END</xsl:message>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="concat('protection.', $shade)"/>
						</xsl:call-template>
						<fo:table-cell number-columns-spanned="6" text-align="center">
							<fo:block font-size="6pt">
								<xsl:value-of select="special_properties"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					</xsl:if>
				</xsl:for-each>
			</fo:table-body>
		</fo:table>
		</xsl:if>
	</xsl:template>


</xsl:stylesheet>
