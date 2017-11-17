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
    <xsl:import href="../i18n.xslt"/>
	<!--
====================================
====================================
	TEMPLATE - ATTACK TABLE
====================================
====================================-->
	<!-- Begin Conditional Combat Modifiers -->
	<xsl:template match="attack" mode="conditional">
		<fo:table table-layout="fixed" width="100%" space-before="2mm">
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.55 * $pagePrintableWidth -1" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-body>
				<xsl:call-template name="attrib">
					<xsl:with-param name="attribute" select="'border'"/>
				</xsl:call-template>
						<fo:table-row>
											<xsl:message>Test</xsl:message>

							<fo:table-cell>
								<fo:block>
								<xsl:if test="count(conditional_modifiers/savebonus) &gt; 0">
									<fo:block text-align="center" font-size="8pt" font-weight="bold">Conditional Save Modifiers:</fo:block>	
								</xsl:if>
								<xsl:for-each select="conditional_modifiers/savebonus">
									<fo:block font-size="8pt" space-before.optimum="1pt"><xsl:value-of select="description"/></fo:block>
								</xsl:for-each>
							
								<xsl:if test="count(conditional_modifiers/combatbonus) &gt; 0">
									<fo:block text-align="center" font-size="8pt" font-weight="bold">Conditional Combat Modifiers:</fo:block>	
								</xsl:if>
								<xsl:for-each select="conditional_modifiers/combatbonus">
									<fo:block font-size="8pt" space-before.optimum="1pt"><xsl:value-of select="description"/></fo:block>
								</xsl:for-each>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>
<!-- End Conditional Combat Modifiers -->

	<xsl:template match="attack" mode="ranged_melee">
<!-- BEGIN Attack table -->
		<fo:table table-layout="fixed" width="100%" space-before="2mm">
			<fo:table-column column-width="18mm"/>
			<fo:table-column column-width="2mm"/>
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.55 * $pagePrintableWidth - 84" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-column column-width="3mm"/>
			<fo:table-column column-width="21mm"/>
			<fo:table-column column-width="2mm"/>
			<fo:table-column column-width="6mm"/>
			<fo:table-column column-width="2mm"/>
			<fo:table-column column-width="6mm"/>
			<fo:table-column column-width="2mm"/>
			<fo:table-column column-width="6mm"/>
			<fo:table-column column-width="2mm"/>
			<fo:table-column column-width="5mm"/>
			<fo:table-column column-width="2mm"/>
			<fo:table-column column-width="5mm"/>
			<fo:table-body>
				<xsl:call-template name="to_hit.header" />
				<xsl:apply-templates select="melee" mode="to_hit">
					<xsl:with-param name="title" select="$output_attack_type_melee"/>
				</xsl:apply-templates>
				<fo:table-row height="2.5pt">
											<xsl:message>Test</xsl:message>
					<fo:table-cell><fo:block/></fo:table-cell>

				</fo:table-row>
				<xsl:apply-templates select="ranged" mode="to_hit">
					<xsl:with-param name="title" select="$output_attack_type_ranged"/>
				</xsl:apply-templates>
				<fo:table-row height="2.5pt">
											<xsl:message>Test</xsl:message>
					<fo:table-cell><fo:block/></fo:table-cell>

				</fo:table-row>
				<xsl:apply-templates select="grapple" mode="to_hit">
					<xsl:with-param name="title" select="'GRAPPLE'"/>
				</xsl:apply-templates>
				<xsl:apply-templates select="cmb" mode="to_hit">
					<xsl:with-param name="title" select="$output_attack_type_cmb"/>
				</xsl:apply-templates>
			</fo:table-body>
		</fo:table>
		<xsl:apply-templates select="cmb" mode="moves"/>
<!-- END Attack table -->
	</xsl:template>

	<xsl:template name="to_hit.header">
		<xsl:param name="dalign" select="'after'"/>
		<fo:table-row>
											<xsl:message>Test</xsl:message>
			<fo:table-cell><fo:block/></fo:table-cell>

			<xsl:call-template name="attack.header.entry"><xsl:with-param name="title" select="$output_attack_total"/><xsl:with-param name="font.size" select="'6pt'"/></xsl:call-template>
			<xsl:call-template name="attack.header.entry"><xsl:with-param name="title" select="$output_attack_base_attack_bonus"/></xsl:call-template>
			<xsl:call-template name="attack.header.entry"><xsl:with-param name="title" select="$output_attack_stat"/></xsl:call-template>
			<xsl:call-template name="attack.header.entry"><xsl:with-param name="title" select="$output_attack_size"/></xsl:call-template>
			<xsl:call-template name="attack.header.entry"><xsl:with-param name="title" select="$output_attack_misc"/></xsl:call-template>
			<xsl:call-template name="attack.header.entry"><xsl:with-param name="title" select="$output_attack_epic"/></xsl:call-template>
			<xsl:call-template name="attack.header.entry"><xsl:with-param name="title" select="$output_attack_temp"/></xsl:call-template>
		</fo:table-row>
	</xsl:template>
	<xsl:template name="attack.header.entry">
		<xsl:param name="title"/>
		<xsl:param name="font.size" select="$output_attack_font_size"/>
		<fo:table-cell><fo:block/></fo:table-cell>

		<fo:table-cell display-align="after">
			<fo:block text-align="center" font-size="6pt" padding-top="{$output_attack_padding_top}">
				<xsl:attribute name="font-size"><xsl:value-of select="$font.size"/></xsl:attribute>
				<xsl:value-of select="$title"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>

	<xsl:template match="melee|ranged|grapple|cmb" mode="to_hit">
		<xsl:param name="title"/>
		<fo:table-row>
											<xsl:message>Test</xsl:message>
			<fo:table-cell>
				<xsl:call-template name="attrib">
					<xsl:with-param name="attribute" select="'tohit.title'"/>
				</xsl:call-template>
				<fo:block space-before.optimum="0.5pt" line-height="{$output_attack_title_line_height}" font-weight="bold" font-size="{$output_attack_title_font_size}" padding-top="{$output_attack_padding_top}" space-before="1pt">
					<xsl:value-of select="$title"/>
				</fo:block>
				<xsl:if test="$output_attack_title_show_second_line = 'true'"><fo:block line-height="4pt" font-size="4pt">attack bonus</fo:block></xsl:if>
			</fo:table-cell>
			<fo:table-cell><fo:block/></fo:table-cell>

			<xsl:choose>
				<xsl:when test="contains(title, 'CMB' )">
					<xsl:call-template name="iterative.attack.entry">
						<xsl:with-param name="value" select="total"/>
						<xsl:with-param name="bab" select="bab"/>
						<xsl:with-param name="separator" select="'='"/>
						<xsl:with-param name="fontsize" select="8"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="attack.entry">
						<xsl:with-param name="value" select="total"/>
<!--						<xsl:with-param name="bab" select="bab"/>	-->
						<xsl:with-param name="separator" select="'='"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:call-template name="attack.entry"><xsl:with-param name="value" select="base_attack_bonus"/></xsl:call-template>
			<xsl:call-template name="attack.entry"><xsl:with-param name="value" select="stat_mod"/></xsl:call-template>
			<xsl:call-template name="attack.entry"><xsl:with-param name="value" select="size_mod"/></xsl:call-template>
			<xsl:call-template name="attack.entry"><xsl:with-param name="value" select="misc_mod"/></xsl:call-template>
			<xsl:call-template name="attack.entry"><xsl:with-param name="value" select="epic_mod"/></xsl:call-template>
			<fo:table-cell>
					<xsl:call-template name="attrib">
						<xsl:with-param name="attribute" select="'border.temp'"/>
					</xsl:call-template>
				<fo:block/>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>

<!-- Begin CMB different moves -->
	<xsl:template match="cmb" mode="moves">
		<!-- BEGIN CMB table -->
		<fo:table table-layout="fixed" width="100%" >
			<fo:table-column column-width="{$output_attack_cmb_column_1_width}"/>
			<fo:table-column column-width="{$output_attack_cmb_column_2_width}"/>
			<fo:table-column column-width="{$output_attack_cmb_column_3_width}"/>
			<fo:table-column column-width="{$output_attack_cmb_column_4_width}"/>
			<fo:table-column column-width="{$output_attack_cmb_column_5_width}"/>
			<fo:table-column column-width="{$output_attack_cmb_column_6_width}"/>
			<fo:table-column column-width="{$output_attack_cmb_column_7_width}"/>
			<fo:table-column column-width="{$output_attack_cmb_column_8_width}"/>
			<fo:table-column column-width="{$output_attack_cmb_column_9_width}"/>
			<fo:table-column column-width="{$output_attack_cmb_column_10_width}"/>
			<fo:table-column column-width="{$output_attack_cmb_column_11_width}"/>
			<fo:table-column column-width="{$output_attack_cmb_column_12_width}"/>
			<fo:table-column column-width="{$output_attack_cmb_column_13_width}"/>
			<fo:table-column column-width="{$output_attack_cmb_column_14_width}"/>

<!--			<fo:table-column column-width="13mm"/>
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="(0.55 * $pagePrintableWidth - 96) * 0.5" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-column column-width="1mm"/>
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="(0.55 * $pagePrintableWidth - 96) * 0.5" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-column column-width="1mm"/>	-->
			<fo:table-body>
				<xsl:call-template name="cmb.moves_header" />
				<fo:table-row>
											<xsl:message>Test</xsl:message>
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'tohit.title'" />
						</xsl:call-template>
						<fo:block space-before.optimum="0.5pt" line-height="8pt" font-weight="bold" font-size="{$output_attack_cmb_2_font_size}" space-before="1pt">
							<xsl:value-of select="$output_attack_cmb_2"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

					<xsl:call-template name="iterative.attack.entry"><xsl:with-param name="value" select="grapple_attack"/><xsl:with-param name="bab" select="bab"/><xsl:with-param name="separator" select="''"/></xsl:call-template>
					<xsl:call-template name="iterative.attack.entry"><xsl:with-param name="value" select="trip_attack"/><xsl:with-param name="bab" select="bab"/><xsl:with-param name="separator" select="''"/></xsl:call-template>
					<xsl:call-template name="iterative.attack.entry"><xsl:with-param name="value" select="disarm_attack"/><xsl:with-param name="bab" select="bab"/><xsl:with-param name="separator" select="''"/></xsl:call-template>
					<xsl:call-template name="iterative.attack.entry"><xsl:with-param name="value" select="sunder_attack"/><xsl:with-param name="bab" select="bab"/><xsl:with-param name="separator" select="''"/></xsl:call-template>
					<xsl:call-template name="attack.entry"><xsl:with-param name="value" select="bullrush_attack"/><xsl:with-param name="separator" select="''"/></xsl:call-template>
					<xsl:call-template name="attack.entry"><xsl:with-param name="value" select="overrun_attack"/><xsl:with-param name="separator" select="''"/></xsl:call-template>
<!--					<xsl:call-template name="iterative.attack.entry"><xsl:with-param name="value" select="total"/><xsl:with-param name="separator" select="''"/></xsl:call-template>	-->
				</fo:table-row>
			
				<fo:table-row height="2.5pt">
											<xsl:message>Test</xsl:message>
					<fo:table-cell><fo:block/></fo:table-cell>

				</fo:table-row>
<!-- Defense entries -->
				<fo:table-row>		
											<xsl:message>Test</xsl:message>
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'tohit.title'" />
						</xsl:call-template>
						<fo:block space-before.optimum="0.5pt" line-height="8pt" font-weight="bold" font-size="{$output_attack_cmd_font_size}" space-before="1pt">
							<xsl:value-of select="$output_attack_cmd"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

					<xsl:call-template name="attack.entry"><xsl:with-param name="value" select="grapple_defense"/><xsl:with-param name="separator" select="''"/></xsl:call-template>
					<xsl:call-template name="attack.entry"><xsl:with-param name="value" select="trip_defense"/><xsl:with-param name="separator" select="''"/></xsl:call-template>
					<xsl:call-template name="attack.entry"><xsl:with-param name="value" select="disarm_defense"/><xsl:with-param name="separator" select="''"/></xsl:call-template>
					<xsl:call-template name="attack.entry"><xsl:with-param name="value" select="sunder_defense"/><xsl:with-param name="separator" select="''"/></xsl:call-template>
					<xsl:call-template name="attack.entry"><xsl:with-param name="value" select="bullrush_defense"/><xsl:with-param name="separator" select="''"/></xsl:call-template>
					<xsl:call-template name="attack.entry"><xsl:with-param name="value" select="overrun_defense"/><xsl:with-param name="separator" select="''"/></xsl:call-template>
<!--					<xsl:call-template name="attack.entry"><xsl:with-param name="value" select="defense"/><xsl:with-param name="separator" select="''"/></xsl:call-template>	-->
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>

	<xsl:template name="cmb.moves_header">
		<fo:table-row>
											<xsl:message>Test END</xsl:message>
			<fo:table-cell><fo:block/></fo:table-cell>

			<xsl:call-template name="attack.header.entry"><xsl:with-param name="title" select="$output_attack_cm_grapple"/></xsl:call-template>
			<xsl:call-template name="attack.header.entry"><xsl:with-param name="title" select="$output_attack_cm_trip"/></xsl:call-template>
			<xsl:call-template name="attack.header.entry"><xsl:with-param name="title" select="$output_attack_cm_disarm"/></xsl:call-template>
			<xsl:call-template name="attack.header.entry"><xsl:with-param name="title" select="$output_attack_cm_sunder"/></xsl:call-template>
			<xsl:call-template name="attack.header.entry"><xsl:with-param name="title" select="$output_attack_cm_bull_rush"/></xsl:call-template>
			<xsl:call-template name="attack.header.entry"><xsl:with-param name="title" select="$output_attack_cm_overrun"/></xsl:call-template>
<!--			<xsl:call-template name="attack.header.entry"><xsl:with-param name="title" select="'BASE'"/><xsl:with-param name="font.size" select="'6pt'"/></xsl:call-template> -->
		</fo:table-row>
	</xsl:template>

	<xsl:template name="attack.entry">
		<xsl:param name="value" />
		<xsl:param name="separator" select="'+'"/>
		<fo:table-cell>
			<xsl:call-template name="attrib">
				<xsl:with-param name="attribute" select="'tohit'"/>
			</xsl:call-template>
			<fo:block space-before.optimum="3pt" font-size="8pt" padding-top="{$output_attack_value_padding_top}">
				<xsl:value-of select="$value"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell border-bottom-width="0pt" border-top-width="0pt">
			<xsl:call-template name="attrib">
				<xsl:with-param name="attribute" select="'tohit'"/>
			</xsl:call-template>
			<fo:block space-before.optimum="5pt" font-size="6pt" padding-top="{$output_attack_separate_padding_top}">
				<xsl:value-of select="$separator"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>

	<xsl:template name="iterative.attack.entry">
		<xsl:param name="value" />
		<xsl:param name="bab" />
		<xsl:param name="separator" select="'+'"/>
		<xsl:param name="fontsize" select="'8pt'"/>
											<xsl:message>Test END</xsl:message>
		<fo:table-cell>
											<xsl:message>Test END</xsl:message>
			<xsl:call-template name="attrib">
				<xsl:with-param name="attribute" select="'tohit'"/>
			</xsl:call-template>
			<fo:block space-before.optimum="3pt" padding-top="1pt">
				<xsl:attribute name="font-size"><xsl:value-of select="$fontsize"/></xsl:attribute>
				<xsl:call-template name="process.attack.string">
					<xsl:with-param name="attack" select="$value"/>
					<xsl:with-param name="bab" select="$bab"/>
					<xsl:with-param name="maxrepeat" select="4"/> 
				</xsl:call-template>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell border-bottom-width="0pt" border-top-width="0pt">
			<xsl:call-template name="attrib">
				<xsl:with-param name="attribute" select="'tohit'"/>
			</xsl:call-template>
			<fo:block space-before.optimum="5pt" font-size="6pt">
				<xsl:value-of select="$separator"/>
			</fo:block>
		</fo:table-cell>

	</xsl:template>


</xsl:stylesheet>
