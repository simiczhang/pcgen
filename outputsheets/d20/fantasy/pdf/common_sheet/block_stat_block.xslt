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
	TEMPLATE - ABILITY BLOCK
====================================
====================================-->
	<xsl:template match="abilities">
		<!-- BEGIN Ability Block -->
		<fo:table table-layout="fixed" width="100%">
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.22 * (0.29 * $pagePrintableWidth - 9)" />mm</xsl:attribute>
			</fo:table-column>
			<!-- 0.29*$pagePrintableWidth total -->
			<fo:table-column column-width="1mm"/>
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.13 * (0.29 * $pagePrintableWidth - 9)" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-column column-width="1mm"/>
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.13 * (0.29 * $pagePrintableWidth - 9)" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-column column-width="1.5mm"/>
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.13 * (0.29 * $pagePrintableWidth - 9)" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-column column-width="1mm"/>
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.13 * (0.29 * $pagePrintableWidth - 9)" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-column column-width="1.5mm"/>
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.13 * (0.29 * $pagePrintableWidth - 9)" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-column column-width="1mm"/>
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.13 * (0.29 * $pagePrintableWidth - 9)" />mm</xsl:attribute>
			</fo:table-column>


			<fo:table-body>
				<fo:table-row>
											<xsl:message>Test</xsl:message>
					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt"><xsl:value-of select="/character/lang/output_stat_ability_name"/><!--ABILITY NAME--></fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt"><xsl:value-of select="/character/lang/output_stat_base_score"/><!--BASE SCORE--></fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt"><xsl:value-of select="/character/lang/output_stat_base_mod"/><!--BASE MOD--></fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt"><xsl:value-of select="/character/lang/output_stat_ability_score"/><!--ABILITY SCORE--></fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt"><xsl:value-of select="/character/lang/output_stat_ability_mod"/><!--ABILITY MOD--></fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt"><xsl:value-of select="/character/lang/output_stat_temp_score"/><!--TEMP SCORE--></fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt"><xsl:value-of select="/character/lang/output_stat_temp_mod"/><!--TEMP MOD--></fo:block>
					</fo:table-cell>
				</fo:table-row>
				<xsl:for-each select="ability">
					<fo:table-row>
											<xsl:message>Test</xsl:message>
						<fo:table-cell>
							<xsl:call-template name="attrib">
								<xsl:with-param name="attribute" select="'stat.title'"/>
							</xsl:call-template>
							<xsl:variable name="statShortName" select="name/short"/>
							<xsl:variable name="statShowLongName" select="/character/lang/output_stat_show_long_name"/>
							
							<fo:block line-height="10pt" font-weight="bold" font-size="10pt" space-before="1pt">
							    <xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_stat_font_short_name_font_size" /></xsl:attribute>
								<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_stat_font_short_name_padding_top" /></xsl:attribute>
								<xsl:value-of select="/character/lang/*[name() = concat('output_stat_',$statShortName)]"/>
							</fo:block>
							<fo:block line-height="4pt" font-size="4pt">
								
								<xsl:if test="$statShowLongName!='false'"><xsl:value-of select="name/long"/></xsl:if>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell><fo:block/></fo:table-cell>

						<fo:table-cell>
							<xsl:call-template name="attrib">
								<xsl:with-param name="attribute" select="'stat.base.score'"/>
							</xsl:call-template>
							<fo:block space-before.optimum="2pt" font-size="10pt">
								<xsl:attribute name="font-family">Noto Sans</xsl:attribute>
								<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_stat_score_padding_top" /></xsl:attribute>
								<xsl:value-of select="base"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell><fo:block/></fo:table-cell>

						<fo:table-cell>
							<xsl:call-template name="attrib">
								<xsl:with-param name="attribute" select="'stat.base.modifier'"/>
							</xsl:call-template>
							<fo:block space-before.optimum="2pt" font-size="10pt">
								<xsl:attribute name="font-family">Noto Sans</xsl:attribute>
								<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_stat_score_padding_top" /></xsl:attribute>
								<xsl:value-of select="basemod"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell><fo:block/></fo:table-cell>

						<fo:table-cell>
							<xsl:call-template name="attrib">
								<xsl:with-param name="attribute" select="'stat.score'"/>
							</xsl:call-template>
							<fo:block space-before.optimum="2pt" font-size="10pt">
								<xsl:attribute name="font-family">Noto Sans</xsl:attribute>
								<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_stat_score_padding_top" /></xsl:attribute>
								<xsl:value-of select="no_temp_score"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell><fo:block/></fo:table-cell>

						<fo:table-cell>
							<xsl:call-template name="attrib">
								<xsl:with-param name="attribute" select="'stat.modifier'"/>
							</xsl:call-template>
							<fo:block space-before.optimum="2pt" font-size="10pt">
								<xsl:attribute name="font-family">Noto Sans</xsl:attribute>
								<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_stat_score_padding_top" /></xsl:attribute>
								<xsl:value-of select="no_temp_modifier"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell><fo:block/></fo:table-cell>

						<fo:table-cell height="4pt">
							<xsl:call-template name="attrib">
								<xsl:with-param name="attribute" select="'stat.temp.score'"/>
							</xsl:call-template>
							<fo:block space-before.optimum="2pt" font-size="10pt">
								<xsl:attribute name="font-family">Noto Sans</xsl:attribute>
								<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_stat_score_padding_top" /></xsl:attribute>
								<xsl:if test="score != no_temp_score">
									<xsl:value-of select="score"/>
								</xsl:if>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell><fo:block/></fo:table-cell>

						<fo:table-cell height="4pt">	<!-- Temp Score and Mod-->
							<xsl:call-template name="attrib">
								<xsl:with-param name="attribute" select="'stat.temp.modifier'"/>
							</xsl:call-template>
							<fo:block space-before.optimum="2pt" font-size="10pt">
								<xsl:attribute name="font-family">Noto Sans</xsl:attribute>
								<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_stat_score_padding_top" /></xsl:attribute>
								<xsl:if test="score != no_temp_score">
									<xsl:value-of select="modifier"/>
								</xsl:if>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row height="2pt">
											<xsl:message>Test</xsl:message>
						<fo:table-cell><fo:block/></fo:table-cell>

					</fo:table-row>
				</xsl:for-each>
			</fo:table-body>
		</fo:table>
		<!-- END Ability Block -->
	</xsl:template>


</xsl:stylesheet>
