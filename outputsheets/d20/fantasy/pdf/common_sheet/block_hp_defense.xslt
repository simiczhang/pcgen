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
	TEMPLATE - HP
====================================
====================================-->
	<xsl:template match="character" mode="hp_table">	
		<fo:table table-layout="fixed" width="100%">
			<xsl:choose>
				<xsl:when test="hit_points/usealternatedamage = 0">
					<fo:table-column column-width="12mm" />
					<!-- TITLE -->
					<fo:table-column column-width="2mm"/>
					<!-- space -->
					<fo:table-column column-width="8mm" />
					<!-- TOTAL HP -->
					<fo:table-column column-width="2mm"/>
					<!-- space -->
					<fo:table-column>
						<xsl:attribute name="column-width"><xsl:value-of select="0.28 * (0.71 * $pagePrintableWidth - 31)" />mm</xsl:attribute>
					</fo:table-column>
					<!-- WOUNDS -->
					<fo:table-column column-width="2mm"/>
					<!-- space-->
					<fo:table-column>
						<xsl:attribute name="column-width"><xsl:value-of select="0.28 * (0.71 * $pagePrintableWidth - 31)" />mm</xsl:attribute>
					</fo:table-column>
					<!-- SUBDUAL -->
					<fo:table-column column-width="2mm"/>
					<!-- space -->
					<fo:table-column>
						<xsl:attribute name="column-width"><xsl:value-of select="0.17 * (0.71 * $pagePrintableWidth - 31)" />mm</xsl:attribute>
					</fo:table-column>
					<!-- DR -->
					<fo:table-column column-width="3mm"/>
					<!-- space -->
					<fo:table-column>
						<xsl:attribute name="column-width"><xsl:value-of select="0.27 * (0.71 * $pagePrintableWidth - 31)" />mm</xsl:attribute>
					</fo:table-column>
					<!-- SPEED -->
					<fo:table-body>
						<fo:table-row>
											<xsl:message>Test</xsl:message>
							<fo:table-cell><fo:block/></fo:table-cell>

							<fo:table-cell><fo:block/></fo:table-cell>

							<fo:table-cell>
								<fo:block/>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell>

							<fo:table-cell display-align="after">
								<fo:block text-align="center">
									<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_hp_wounds_font_size" /></xsl:attribute>
									<xsl:value-of select="/character/lang/output_hp_wounds"/><!--WOUNDS/CURRENT HP-->
								</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell>

							<fo:table-cell display-align="after">
								<fo:block text-align="center">
									<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_hp_subdual_damage_font_size" /></xsl:attribute>
									<xsl:value-of select="/character/lang/output_hp_subdual_damage"/><!--SUBDUAL DAMAGE-->
								</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell>

							<fo:table-cell display-align="after">
								<fo:block text-align="center">
								    <xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_hp_damage_reduction_font_size" /></xsl:attribute>
									<xsl:value-of select="/character/lang/output_hp_damage_reduction"/><!--DAMAGE REDUCTION-->
								</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell>

							<fo:table-cell display-align="after">
								<fo:block text-align="center">
									<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_hp_speed_font_size" /></xsl:attribute>
									<xsl:value-of select="/character/lang/output_hp_speed"/><!--SPEED-->
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
											<xsl:message>Test</xsl:message>
							<fo:table-cell>
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'hp.title'"/>
								</xsl:call-template>
								<fo:block line-height="10pt" font-weight="bold" space-before="1pt">
									<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_hp_font_size" /></xsl:attribute>
									<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_hp_padding_top" /></xsl:attribute>
									<xsl:value-of select="/character/lang/output_hp"/><!--HP-->
								</fo:block>
								<fo:block line-height="4pt" font-size="4pt"><xsl:value-of select="/character/lang/output_hit_points"/><!--hit points--></fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell>

							<fo:table-cell>
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'hp.total'"/>
								</xsl:call-template>
								<fo:block space-before.optimum="2pt" font-size="10pt">
								    <xsl:attribute name="font-family">Noto Sans</xsl:attribute>
									<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_ac_padding_top" /></xsl:attribute>								
									<xsl:value-of select="hit_points/points"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell>

							<fo:table-cell display-align="center">
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'hp.current'"/>
								</xsl:call-template>
								<fo:block font-size="10pt"/>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell>

							<fo:table-cell display-align="center">
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'hp.subdual'"/>
								</xsl:call-template>
								<fo:block font-size="10pt"/>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell>

							<fo:table-cell display-align="center">
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'damage.reduction'"/>
								</xsl:call-template>
								<fo:block font-size="8pt">
									<xsl:value-of select="hit_points/damage_reduction"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell>

							<fo:table-cell display-align="center">
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'speed'"/>
								</xsl:call-template>
								<fo:block font-size="8pt">
									<xsl:value-of select="basics/move/all"/>
									<xsl:value-of select="basics/move/move/maneuverability"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</xsl:when>
				<xsl:otherwise>	
					<fo:table-column column-width="12mm" />
					<!-- TITLE Vitality -->
					<fo:table-column column-width="2mm"/>
					<!-- space -->
					<fo:table-column column-width="8mm" />
					<!-- TOTAL Vitality -->
					<fo:table-column column-width="2mm"/><!-- space -->
					<fo:table-column>
						<xsl:attribute name="column-width"><xsl:value-of select="0.18 * (0.71 * $pagePrintableWidth - 34)" />mm</xsl:attribute>
					</fo:table-column>
					<!-- WOUNDS -->
					<fo:table-column column-width="2mm"/><!-- space-->
					<fo:table-column>
						<xsl:attribute name="column-width"><xsl:value-of select="0.18 * (0.71 * $pagePrintableWidth - 34)" />mm</xsl:attribute>
					</fo:table-column>
					<!-- SUBDUAL -->
					<fo:table-column column-width="2mm"/><!-- space -->
					<fo:table-column>
						<xsl:attribute name="column-width"><xsl:value-of select="0.11 * (0.71 * $pagePrintableWidth - 34)" />mm</xsl:attribute>
					</fo:table-column>
					<!-- TITLE Wound points-->
					<fo:table-column column-width="2mm"/><!-- space -->
					<fo:table-column>
						<xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 34)" />mm</xsl:attribute>
					</fo:table-column>
					<!-- TOTAL Wound points -->
					<fo:table-column column-width="2mm"/><!-- space -->
					<fo:table-column>
						<xsl:attribute name="column-width"><xsl:value-of select="0.18 * (0.71 * $pagePrintableWidth - 34)" />mm</xsl:attribute>
					</fo:table-column>
					<!-- DR -->
					<fo:table-column column-width="2mm"/><!-- space -->
					<fo:table-column>
						<xsl:attribute name="column-width"><xsl:value-of select="0.27 * (0.71 * $pagePrintableWidth - 34)" />mm</xsl:attribute>
					</fo:table-column>
					<!-- SPEED -->
					<fo:table-body>
						<fo:table-row>
											<xsl:message>Test</xsl:message>
							<fo:table-cell><fo:block/></fo:table-cell><!-- TITLE Vitality -->
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell>	<!-- TOTAL Vitality -->
								<fo:block/>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell display-align="after">
								<fo:block text-align="center" font-size="4pt">WOUNDS/CURRENT HP</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell display-align="after">
								<fo:block text-align="center" font-size="4pt">SUBDUAL DAMAGE</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell><fo:block/></fo:table-cell><!-- TITLE Wound points -->
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell>	<!-- TOTAL Wound points -->
								<fo:block/>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell display-align="after">
								<fo:block text-align="center" font-size="4pt">DAMAGE REDUCTION</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell display-align="after">
								<fo:block text-align="center" font-size="6pt">SPEED</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
											<xsl:message>Test</xsl:message>
							<fo:table-cell>
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'hp.title'"/>
								</xsl:call-template>
								<fo:block line-height="10pt" font-weight="bold" font-size="10pt" space-before="1pt">VP</fo:block>
								<fo:block line-height="4pt" font-size="4pt">Vitality</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell>
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'hp.total'"/>
								</xsl:call-template>
								<fo:block space-before.optimum="2pt" font-size="10pt">
									<xsl:value-of select="hit_points/points"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell display-align="center">
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'hp.current'"/>
								</xsl:call-template>
								<fo:block font-size="10pt"/>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell display-align="center">
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'hp.subdual'"/>
								</xsl:call-template>
								<fo:block font-size="10pt"/>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell>
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'hp.title'"/>
								</xsl:call-template>
								<fo:block line-height="10pt" font-weight="bold" font-size="10pt" space-before="1pt">WP</fo:block>
								<fo:block line-height="4pt" font-size="4pt">Wound Points</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell>
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'hp.total'"/>
								</xsl:call-template>
								<fo:block space-before.optimum="2pt" font-size="10pt">
									<xsl:value-of select="hit_points/alternate"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell display-align="center">
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'damage.reduction'"/>
								</xsl:call-template>
								<fo:block font-size="8pt">
									<xsl:value-of select="hit_points/damage_reduction"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell><fo:block/></fo:table-cell><!-- space -->
							<fo:table-cell display-align="center">
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'speed'"/>
								</xsl:call-template>
								<fo:block font-size="8pt">
									<xsl:value-of select="basics/move/all"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</xsl:otherwise>
			</xsl:choose>
		</fo:table>
		<!-- END HP Table -->
	</xsl:template>
	<!--
====================================
====================================
	TEMPLATE - AC TABLE
====================================
====================================-->
	<xsl:template match="armor_class">	
		<fo:table table-layout="fixed" width="100%" space-before="2pt">
			<fo:table-column column-width="12mm"/>	<!--	1	-->
			<!-- TITLE -->
			<fo:table-column column-width="1mm"/>	<!--	2	-->
			<!-- space -->
			<fo:table-column column-width="8mm"/>	<!--	3	-->
			<!-- TOTAL AC -->
			<fo:table-column column-width="1mm"/>	<!--	4	-->
			<!-- : -->
			<fo:table-column column-width="8mm"/>	<!--	5	-->
			<!-- FLAT -->
			<fo:table-column column-width="1mm"/>	<!--	6	-->
			<!-- : -->
			<fo:table-column column-width="8mm"/>	<!--	7	-->
			<!-- TOUCH -->
			<fo:table-column column-width="2mm"/>	<!--	8	-->
			<!-- = -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
			</fo:table-column>	<!--	9	-->
			<!-- BASE -->
			<fo:table-column column-width="2mm"/>	<!--	10	-->
			<!-- + -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>	<!--	11	-->
			</fo:table-column>
			<!-- armour -->
			<fo:table-column column-width="2mm"/>	<!--	12	-->
			<!-- + -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
			</fo:table-column>	<!--	13	-->
			<!-- armour -->
			<fo:table-column column-width="2mm"/>	<!--	14	-->
			<!-- + -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
			</fo:table-column>		<!--	15	-->
			<!-- stat -->
			<fo:table-column column-width="2mm"/>	<!--	16	-->
			<!-- + -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
			</fo:table-column>	<!--	17	-->
			<!--size -->
			<fo:table-column column-width="2mm"/>	<!--	18	-->
			<!-- + -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
			</fo:table-column>	<!--	19	-->
			<!-- natural armour-->
			<fo:table-column column-width="2mm"/>	<!--	20	-->
			<!-- + -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.09 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
			</fo:table-column>	<!--	21	-->
			<!-- deflection -->
			<fo:table-column column-width="2mm"/>	<!--	22	-->
			<!-- + -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.09 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
			</fo:table-column>	<!--	23	-->
			<!-- Dodge -->
			<fo:table-column column-width="2mm"/>	<!--	24	-->
			<!-- + -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
			</fo:table-column>		<!--	25	-->
			<!-- misc-->
			<fo:table-column column-width="2mm"/>	<!--	26	-->
			<!-- space -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
			</fo:table-column>	<!--	27	-->
			<!-- miss chance -->
			<fo:table-column column-width="2mm"/>	<!--	28	-->
			<!-- space -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
			</fo:table-column>	<!--	29	-->
			<!-- arcane spell failure -->
			<fo:table-column column-width="2mm"/>	<!--	30	-->
			<!-- space -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
			</fo:table-column>	<!--	31	-->
			<!-- armour check-->
			<fo:table-column column-width="2mm"/>	<!--	32	-->
			<!-- space -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.08 * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
			</fo:table-column>	<!--	33	-->
			<!-- SR <33 columns> -->
			<fo:table-body>
				<fo:table-row>
											<xsl:message>Test</xsl:message>
					<fo:table-cell>	
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'ac.title'"/>
						</xsl:call-template>
						<fo:block line-height="10pt" font-weight="bold" space-before="1pt">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_ac_font_size" /></xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_ac_padding_top" /></xsl:attribute>								
							<xsl:value-of select="/character/lang/output_ac" /><!--AC-->
						</fo:block>
						<fo:block line-height="4pt" font-size="4pt"><xsl:value-of select="/character/lang/output_armor_class" /><!--armor class--></fo:block>
					</fo:table-cell>	<!--	1	-->
					<fo:table-cell><fo:block/></fo:table-cell>	<!--	2	-->
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'ac.total'"/>
						</xsl:call-template>
						<fo:block font-size="10pt">
						    <xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_ac_padding_top" /></xsl:attribute>								
							<xsl:value-of select="total"/>
						</fo:block>
					</fo:table-cell>	<!--	3	-->
					<fo:table-cell display-align="center">
						<fo:block text-align="center" font-size="6pt">:</fo:block>
					</fo:table-cell>	<!--	4	-->
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'ac.flatfooted'"/>
						</xsl:call-template>
						<fo:block font-size="10pt">
							<xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_ac_padding_top" /></xsl:attribute>								
							<xsl:value-of select="flat"/>
						</fo:block>
					</fo:table-cell>	<!--	5	-->
					<fo:table-cell display-align="center">
						<fo:block text-align="center" font-size="6pt">:</fo:block>
					</fo:table-cell>	<!--	6	-->
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'ac.touch'"/>
						</xsl:call-template>
						<fo:block font-size="10pt">
						    <xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_ac_padding_top" /></xsl:attribute>								
							<xsl:value-of select="touch"/>
						</fo:block>
					</fo:table-cell>	<!--	7	-->
					<fo:table-cell display-align="center">
						<fo:block text-align="center" font-size="6pt">=</fo:block>
					</fo:table-cell>	<!--	8	-->
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'ac'"/>
						</xsl:call-template>
						<fo:block font-size="10pt">
						    <xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_ac_padding_top" /></xsl:attribute>								
							<xsl:value-of select="base"/>
						</fo:block>
					</fo:table-cell>	<!--	9	-->
					<fo:table-cell display-align="center">
						<fo:block text-align="center" font-size="6pt">+</fo:block>
					</fo:table-cell>	<!--	10	-->
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'ac'"/>
						</xsl:call-template>
						<fo:block font-size="10pt">
						    <xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_ac_padding_top" /></xsl:attribute>								
							<xsl:value-of select="armor_bonus"/>
						</fo:block>
					</fo:table-cell>	<!--	11	-->
					<fo:table-cell display-align="center">
						<fo:block text-align="center" font-size="6pt">+</fo:block>
					</fo:table-cell>	<!--	12	-->
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'ac'"/>
						</xsl:call-template>
						<fo:block font-size="10pt">
						    <xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_ac_padding_top" /></xsl:attribute>								
							<xsl:value-of select="shield_bonus"/>
						</fo:block>
					</fo:table-cell>	<!--	13	-->
					<fo:table-cell display-align="center">
						<fo:block text-align="center" font-size="6pt">+</fo:block>
					</fo:table-cell>	<!--	14	-->
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'ac'"/>
						</xsl:call-template>
						<fo:block font-size="10pt">
						    <xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_ac_padding_top" /></xsl:attribute>								
							<xsl:value-of select="stat_mod"/>
						</fo:block>
					</fo:table-cell>	<!--	15	-->
					<fo:table-cell display-align="center">
						<fo:block text-align="center" font-size="6pt">+</fo:block>
					</fo:table-cell>	<!--	16	-->
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'ac'"/>
						</xsl:call-template>
						<fo:block font-size="10pt">
						    <xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_ac_padding_top" /></xsl:attribute>								
							<xsl:value-of select="size_mod"/>
						</fo:block>
					</fo:table-cell>	<!--	17	-->
					<fo:table-cell display-align="center">
						<fo:block text-align="center" font-size="6pt">+</fo:block>
					</fo:table-cell>	<!--	18	-->
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'ac'"/>
						</xsl:call-template>
						<fo:block font-size="10pt">
						    <xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_ac_padding_top" /></xsl:attribute>								
							<xsl:value-of select="natural"/>
						</fo:block>
					</fo:table-cell>	<!--	19	-->
					<fo:table-cell display-align="center">
						<fo:block text-align="center" font-size="6pt">+</fo:block>
					</fo:table-cell>	<!--	20	-->
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'ac'"/>
						</xsl:call-template>
						<fo:block font-size="10pt">
						    <xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_ac_padding_top" /></xsl:attribute>								
							<xsl:value-of select="deflection"/>
						</fo:block>
					</fo:table-cell>	<!--	21	-->
					<fo:table-cell display-align="center">
						<fo:block text-align="center" font-size="6pt">+</fo:block>
					</fo:table-cell>	<!--	22	-->
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'ac'"/>
						</xsl:call-template>
						<fo:block font-size="10pt">
						    <xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_ac_padding_top" /></xsl:attribute>								
							<xsl:value-of select="dodge"/>
						</fo:block>
					</fo:table-cell>	<!--	23	-->
					<fo:table-cell display-align="center">
						<fo:block text-align="center" font-size="6pt">+</fo:block>
					</fo:table-cell>	<!--	24	-->
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'ac'"/>
						</xsl:call-template>
						<fo:block text-align="center" font-size="10pt">
						    <xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_ac_padding_top" /></xsl:attribute>								
							<xsl:value-of select="morale"/>
						</fo:block>
					</fo:table-cell>	<!--	25	-->
					<fo:table-cell display-align="center">
						<fo:block text-align="center" font-size="6pt">+</fo:block>
					</fo:table-cell>	<!--	26	-->
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'ac'"/>
						</xsl:call-template>
						<fo:block text-align="center" font-size="10pt">
						    <xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_ac_padding_top" /></xsl:attribute>								
							<xsl:value-of select="insight"/>
						</fo:block>
					</fo:table-cell>	<!--	27	-->
					<fo:table-cell display-align="center">
						<fo:block text-align="center" font-size="6pt">+</fo:block>
					</fo:table-cell>	<!--	28	-->
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'ac'"/>
						</xsl:call-template>
						<fo:block text-align="center" font-size="10pt">
						    <xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_ac_padding_top" /></xsl:attribute>								
							<xsl:value-of select="sacred"/>
						</fo:block>
					</fo:table-cell>	<!--	29	-->
					<fo:table-cell display-align="center">
						<fo:block text-align="center" font-size="6pt">+</fo:block>
					</fo:table-cell>	<!--	30	-->
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'ac'"/>
						</xsl:call-template>
						<fo:block text-align="center" font-size="10pt">
							<xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_ac_padding_top" /></xsl:attribute>								
							<xsl:value-of select="profane"/>
						</fo:block>
					</fo:table-cell>	<!--	31	-->
					<fo:table-cell display-align="center">
						<fo:block text-align="center" font-size="6pt">+</fo:block>
					</fo:table-cell>	<!--	32	-->
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'ac'"/>
						</xsl:call-template>
						<fo:block text-align="center" font-size="10pt">
							<xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_ac_padding_top" /></xsl:attribute>								
							<xsl:value-of select="misc"/>
						</fo:block>
					</fo:table-cell>	<!--	33	-->
				<!-->	<fo:table-cell><fo:block/></fo:table-cell>
	-->
				</fo:table-row>
				<fo:table-row height="0.5pt">
					<fo:table-cell><fo:block/></fo:table-cell>

				</fo:table-row>
				<fo:table-row>
											<xsl:message>Test</xsl:message>	
					<fo:table-cell><fo:block/></fo:table-cell>	<!--	1	-->				
					<fo:table-cell><fo:block/></fo:table-cell>	<!--	2	-->
					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_ac_total_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_ac_total"/><!--TOTAL-->
						</fo:block>
					</fo:table-cell>	<!--	3	-->
					<fo:table-cell><fo:block/></fo:table-cell>	<!--	4	-->
					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_ac_flat_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_ac_flat" /><!--FLAT-->
						</fo:block>
					</fo:table-cell>	<!--	5	-->
					<fo:table-cell><fo:block/></fo:table-cell>	<!--	6	-->
					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_ac_touch_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_ac_touch" /><!--TOUCH-->
						</fo:block>
					</fo:table-cell>	<!--	7	-->
					<fo:table-cell><fo:block/></fo:table-cell>	<!--	8	-->
					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_ac_base_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_ac_base" /><!--BASE-->
						</fo:block>
					</fo:table-cell>	<!--	9	-->
					<fo:table-cell><fo:block/></fo:table-cell>	<!--	10	-->
					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_ac_armor_bonus_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_ac_armor_bonus" /><!--ARMOR BONUS-->
						</fo:block>
					</fo:table-cell>	<!--	11	-->
					<fo:table-cell><fo:block/></fo:table-cell>	<!--	12	-->
					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_ac_shield_bonus_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_ac_shield_bonus" /><!--SHIELD BONUS-->
						</fo:block>
					</fo:table-cell>	<!--	13	-->
					<fo:table-cell><fo:block/></fo:table-cell>	<!--	14	-->
					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_ac_stat_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_ac_stat" /><!--STAT-->
						</fo:block>
					</fo:table-cell>	<!--	15	-->
					<fo:table-cell><fo:block/></fo:table-cell>	<!--	16	-->
					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_ac_size_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_ac_size" /><!--SIZE-->
						</fo:block>
					</fo:table-cell>	<!--	17	-->
					<fo:table-cell><fo:block/></fo:table-cell>	<!--	18	-->
					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_ac_natural_armor_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_ac_natural_armor" /><!--NATURAL ARMOR-->
						</fo:block>
					</fo:table-cell>	<!--	19	-->
					<fo:table-cell><fo:block/></fo:table-cell>	<!--	20	-->
					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_ac_deflection_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_ac_deflection" /><!--DEFLECTION-->
						</fo:block>
					</fo:table-cell>	<!--	21	-->
					<fo:table-cell><fo:block/></fo:table-cell>	<!--	22	-->
					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_ac_dodge_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_ac_dodge" /><!--DODGE-->
						</fo:block>
					</fo:table-cell>	<!--	23	-->
					<fo:table-cell><fo:block/></fo:table-cell>	<!--	24	-->
					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_ac_morale_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_ac_morale" /><!--Morale-->
						</fo:block>
					</fo:table-cell>	<!--	25	-->
					<fo:table-cell><fo:block/></fo:table-cell>	<!--	26	-->
					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_ac_insight_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_ac_insight" /><!--Insight-->
						</fo:block>
					</fo:table-cell>	<!--	27	-->
					<fo:table-cell><fo:block/></fo:table-cell>	<!--	28	-->
					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_ac_sacred_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_ac_sacred" /><!--Sacred-->
						</fo:block>
					</fo:table-cell>	<!--	29	-->
					<fo:table-cell><fo:block/></fo:table-cell>	<!--	30	-->
					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_ac_profane_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_ac_profane" /><!--Profane-->
						</fo:block>
					</fo:table-cell>	<!--	31	-->
					<fo:table-cell><fo:block/></fo:table-cell>	<!--	32	-->
					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_ac_misc_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_ac_misc" /><!--MISC-->
						</fo:block>
					</fo:table-cell>	<!--	33	-->
		<!-->			<fo:table-cell><fo:block/></fo:table-cell> -->	<!--	34	-->

				</fo:table-row>
			</fo:table-body>
		</fo:table>
		<!-- END AC Table -->
	</xsl:template>
	<!--
====================================
====================================
	TEMPLATE - Initiative TABLE + Misc
====================================
====================================-->
	<xsl:template match="initiative">
		<!-- BEGIN ini-base table -->
		<xsl:variable name="output_initiative_column_1_width" select="/character/lang/output_initiative_column_1_width"/>
		<xsl:variable name="output_initiative_column_3_width" select="/character/lang/output_initiative_column_3_width"/>
		<xsl:variable name="output_initiative_column_5_width" select="/character/lang/output_initiative_column_5_width"/>
		<xsl:variable name="output_initiative_column_7_width" select="/character/lang/output_initiative_column_7_width"/>
		<xsl:variable name="output_initiative_column_9_width" select="/character/lang/output_initiative_column_9_width"/>
		<xsl:variable name="output_initiative_column_11_width" select="/character/lang/output_initiative_column_11_width"/>
		<xsl:variable name="output_initiative_column_13_width" select="/character/lang/output_initiative_column_13_width"/>
		<xsl:variable name="output_initiative_column_15_width" select="/character/lang/output_initiative_column_15_width"/>
		<xsl:variable name="output_initiative_column_17_width" select="/character/lang/output_initiative_column_17_width"/>
		<xsl:variable name="output_initiative_column_19_width" select="/character/lang/output_initiative_column_19_width"/>
		<xsl:variable name="output_initiative_column_21_width" select="/character/lang/output_initiative_column_21_width"/>
		<xsl:variable name="output_initiative_column_23_width" select="/character/lang/output_initiative_column_23_width"/>	

		<fo:table table-layout="fixed" width="100%">		<!--space-before="2pt"-->
			<!-- 0.26 * $pagePrintableWidth - mm -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="$output_initiative_column_1_width * (0.26 * $pagePrintableWidth - 8)" />mm</xsl:attribute>
			</fo:table-column>		<!--	1	-->
			<fo:table-column column-width="2mm"/>		<!--	2	-->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="$output_initiative_column_3_width * (0.26 * $pagePrintableWidth - 8)" />mm</xsl:attribute>
			</fo:table-column>		<!--	3	-->
			<fo:table-column column-width="2mm"/>		<!--	4	-->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="$output_initiative_column_5_width * (0.26 * $pagePrintableWidth - 8)" />mm</xsl:attribute>
			</fo:table-column>		<!--	5	-->
			<fo:table-column column-width="2mm"/>		<!--	6	-->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="$output_initiative_column_7_width * (0.26 * $pagePrintableWidth - 8)" />mm</xsl:attribute>
			</fo:table-column>		<!--	7	-->
			<fo:table-column column-width="4mm"/>		<!--	8	-->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="$output_initiative_column_9_width * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
			</fo:table-column>		<!--	9	-->
			<!-- miss chance -->
			<fo:table-column column-width="2mm"/>		<!--	10	-->
			<!-- space -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="$output_initiative_column_11_width * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
			</fo:table-column>		<!--	11	-->
			<!-- arcane spell failure -->
			<fo:table-column column-width="2mm"/>		<!--	12	-->
			<!-- space -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="$output_initiative_column_13_width * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
			</fo:table-column>		<!--	13	-->
			<!-- armour check-->
			<fo:table-column column-width="2mm"/>		<!--	14	-->
			<!-- space -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="$output_initiative_column_15_width * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
			</fo:table-column>		<!--	15	-->
			<!-- SR -->
			<fo:table-column column-width="2mm"/>		<!--	16	-->
			<!-- space -->

			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="$output_initiative_column_17_width * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
			</fo:table-column>		<!--	17	-->
			<!-- Acid Resistance -->
						<fo:table-column column-width="2mm"/>		<!--	18	-->
			<!-- space -->

			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="$output_initiative_column_19_width * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
			</fo:table-column>		<!--	19	-->
			<!-- Cold Resistance -->
						<fo:table-column column-width="2mm"/>		<!--	20	-->
			<!-- space -->

			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="$output_initiative_column_21_width * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
			</fo:table-column>		<!--	21	-->
			<!-- Electricity Resistance -->
			<fo:table-column column-width="2mm"/>		<!--	22	-->
			<!-- space -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="$output_initiative_column_23_width * (0.71 * $pagePrintableWidth - 69)" />mm</xsl:attribute>
			</fo:table-column>		<!--	23	-->
			<!-- Fire Resistance -->




			<fo:table-body>
				<fo:table-row height="2pt">
											<xsl:message>Test</xsl:message>
					<fo:table-cell><fo:block/></fo:table-cell>

				</fo:table-row>
				<fo:table-row>
											<xsl:message>Test</xsl:message>
					<fo:table-cell>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'initiative.title'"/>
						</xsl:call-template>
						<fo:block line-height="10pt" font-weight="bold" space-before="1pt">
						    <xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_initiative_font_size" /></xsl:attribute>
						    <xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_initiative_padding_top" /></xsl:attribute>		
						    <xsl:value-of select="/character/lang/output_initiative" /><!--INITIATIVE-->
						</fo:block>
						<fo:block line-height="4pt" font-size="4pt"><xsl:value-of select="/character/lang/output_initiative_modifier" /><!--modifier--></fo:block>
					</fo:table-cell>		<!--	1	-->
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	2	-->
					<fo:table-cell>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'initiative.total'"/>
						</xsl:call-template>
						<fo:block space-before.optimum="2pt" font-size="10pt">
							<xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_initiative_padding_top" /></xsl:attribute>		
							<xsl:value-of select="total"/>
						</fo:block>
					</fo:table-cell>		<!--	3	-->
					<fo:table-cell>
						<fo:block text-align="center" space-before.optimum="5pt" font-size="6pt">
						    <xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_initiative_padding_top_mark" /></xsl:attribute>		
							=
						</fo:block>
					</fo:table-cell>		<!--	4	-->
					<fo:table-cell>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'initiative.general'"/>
						</xsl:call-template>
						<fo:block space-before.optimum="2pt" font-size="10pt">
							<xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_initiative_padding_top" /></xsl:attribute>		
							<xsl:value-of select="dex_mod"/>
						</fo:block>
					</fo:table-cell>		<!--	5	-->
					<fo:table-cell>
						<fo:block text-align="center" space-before.optimum="5pt" font-size="6pt">
						    <xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_initiative_padding_top_mark" /></xsl:attribute>		
							+
						</fo:block>
					</fo:table-cell>		<!--	6	-->
					<fo:table-cell>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'initiative.general'"/>
						</xsl:call-template>
						<fo:block space-before.optimum="2pt" font-size="10pt">
							<xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_initiative_padding_top" /></xsl:attribute>		
							<xsl:value-of select="misc_mod"/>
						</fo:block>
					</fo:table-cell>		<!--	7	-->
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	8	-->
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'miss_chance'"/>
						</xsl:call-template>
						<fo:block font-size="10pt">
							<!-- Miss chance -->
						</fo:block>
					</fo:table-cell>		<!--	9	-->
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	10	-->
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'spell_failure'"/>
						</xsl:call-template>
						<fo:block font-size="10pt">
							<xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_initiative_padding_top" /></xsl:attribute>		
							<xsl:value-of select="spell_failure"/>
						</fo:block>
					</fo:table-cell>		<!--	11	-->
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	12	-->
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'ac_check'"/>
						</xsl:call-template>
						<fo:block font-size="10pt">
							<xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_initiative_padding_top" /></xsl:attribute>		
							<xsl:value-of select="check_penalty"/>
						</fo:block>
					</fo:table-cell>		<!--	13	-->
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	14	-->
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'spell_resistance'"/>
						</xsl:call-template>
						<fo:block font-size="10pt">
							<xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_initiative_padding_top" /></xsl:attribute>		
							<xsl:value-of select="spell_resistance"/>
						</fo:block>
					</fo:table-cell>		<!--	15	-->

					<fo:table-cell><fo:block/></fo:table-cell>		<!--	14	-->

					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'spell_resistance'"/>
						</xsl:call-template>
						<fo:block font-size="10pt">
							<xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_initiative_padding_top" /></xsl:attribute>		
							<xsl:if test="resistances/acid > 0">
							<xsl:value-of select="resistances/acid"/>
							</xsl:if>
						</fo:block>
					</fo:table-cell>		<!--	15	-->
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	14	-->
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'spell_resistance'"/>
						</xsl:call-template>
						<fo:block font-size="10pt">
							<xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_initiative_padding_top" /></xsl:attribute>		
							<xsl:if test="resistances/cold > 0">
							<xsl:value-of select="resistances/cold"/>
							</xsl:if>
						</fo:block>
					</fo:table-cell>		<!--	15	-->
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	14	-->
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'spell_resistance'"/>
						</xsl:call-template>
						<fo:block font-size="10pt">
							<xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_initiative_padding_top" /></xsl:attribute>		
							<xsl:if test="resistances/electricity > 0">
							<xsl:value-of select="resistances/electricity"/>
							</xsl:if>
						</fo:block>
					</fo:table-cell>		<!--	15	-->
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	14	-->
					<fo:table-cell display-align="center">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'spell_resistance'"/>
						</xsl:call-template>
						<fo:block font-size="10pt">
							<xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_initiative_padding_top" /></xsl:attribute>		
							<xsl:if test="resistances/fire > 0">
							<xsl:value-of select="resistances/fire"/>
							</xsl:if>
						</fo:block>
					</fo:table-cell>		<!--	15	-->

				
				
				</fo:table-row>
<!--				<fo:table-row height="0.5pt"/>	-->
<!-- Label Row -->
				<fo:table-row>
											<xsl:message>Test</xsl:message>
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	1	-->
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	2	-->
					<fo:table-cell>
						<fo:block text-align="center" space-before.optimum="1pt" font-size="6pt">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_initiative_total_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_initiative_total" /><!--TOTAL-->
						</fo:block>
					</fo:table-cell>		<!--	3	-->
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	4	-->
					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_initiative_dex_mod_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_initiative_dex_mod" /><!--DEX MODIFIER-->
						</fo:block>
					</fo:table-cell>		<!--	5	-->
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	6	-->
					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_initiative_misc_mod_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_initiative_misc_mod" /><!--MISC MODIFIER-->
						</fo:block>
					</fo:table-cell>		<!--	7	-->
					<!-- New Stuff	-->
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	8	-->
					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_initiative_miss_chance_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_initiative_miss_chance" /><!--MISS CHANCE-->
						</fo:block>
					</fo:table-cell>		<!--	9	-->
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	10	-->
					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_initiative_arcane_spell_failure_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_initiative_arcane_spell_failure" /><!--Arcane Spell Failure-->
						</fo:block>
					</fo:table-cell>		<!--	11	-->
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	12	-->
					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_initiative_armor_check_penalty_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_initiative_armor_check_penalty" /><!--ARMOR CHECK PENALTY-->
						</fo:block>
					</fo:table-cell>		<!--	13	-->
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	14	-->
					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_initiative_spell_resist_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_initiative_spell_resist" /><!--SPELL RESIST-->
						</fo:block>
					</fo:table-cell>		<!--	15	-->
					
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	14	-->
					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_initiative_acid_resist_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_initiative_acid_resist" /><!--ACID RESIST-->
						</fo:block>
					</fo:table-cell>		<!--	15	-->
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	14	-->
					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_initiative_cold_resist_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_initiative_cold_resist" /><!--COLD RESIST-->
						</fo:block>
					</fo:table-cell>		<!--	15	-->
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	14	-->
					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_initiative_elect_resist_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_initiative_elect_resist" /><!--ELECT. RESIST-->
						</fo:block>
					</fo:table-cell>		<!--	15	-->
					<fo:table-cell><fo:block/></fo:table-cell>		<!--	14	-->
					<fo:table-cell>
						<fo:block text-align="center" font-size="4pt">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_initiative_fire_resist_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_initiative_fire_resist" /><!--FIRE RESIST-->
						</fo:block>
					</fo:table-cell>		<!--	15	-->

					
					
					
					
					
					
					
					



				</fo:table-row>
			</fo:table-body>
		</fo:table>
		<!-- END ini-base table -->
	</xsl:template>

	<!--		NOT USED
====================================
====================================
	TEMPLATE - Base Attack TABLE
====================================
====================================-->
	<xsl:template match="bab" mode="bab">
		<!-- BEGIN ini-base table -->
		<fo:table table-layout="fixed" width="100%">
			<!-- 0.26 * $pagePrintableWidth - 2 mm -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.44 * (0.26 * $pagePrintableWidth - 4)" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-column column-width="2mm"/>
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.56 * (0.26 * $pagePrintableWidth - 4)" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-body>
				<fo:table-row height="2pt">
											<xsl:message>Test</xsl:message>
					<fo:table-cell><fo:block/></fo:table-cell>

				</fo:table-row>
				<fo:table-row>
											<xsl:message>Test</xsl:message>
					<fo:table-cell>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'bab.title'"/>
						</xsl:call-template>
						<fo:block line-height="10pt" font-weight="bold" font-size="7.5pt">BASE ATTACK</fo:block>
						<fo:block line-height="4pt" font-size="4pt">bonus</fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

					<fo:table-cell>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'bab.total'"/>
						</xsl:call-template>
						<fo:block space-before.optimum="2pt" font-size="10pt">
							<xsl:call-template name="process.attack.string">
								<xsl:with-param name="bab" select="."/>
<xsl:with-param name="maxrepeat" select="4"/>
							</xsl:call-template>
<!-- What is this?-->							<!--xsl:value-of select="../../attack/melee/base_attack_bonus"/-->
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
		<!-- END ini-base table -->
	</xsl:template>

	<!--
====================================
====================================
	TEMPLATE - encumbrance TABLE
====================================
====================================-->
	<xsl:template name="encumbrance">
		<!-- BEGIN encumbrance table -->
<!--	<xsl:if test="/character/equipment/total/load != 'Light'">	-->
		<fo:table table-layout="fixed" width="100%">
			<!-- 0.26 * $pagePrintableWidth - 2 mm -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.50 * (0.26 * $pagePrintableWidth - 4)" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-column column-width="2mm"/>
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.50 * (0.26 * $pagePrintableWidth - 4)" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-body>
				<fo:table-row height="0pt">
											<xsl:message>Test</xsl:message>
					<fo:table-cell><fo:block/></fo:table-cell>

				</fo:table-row>
				<fo:table-row>
											<xsl:message>Test</xsl:message>
					<fo:table-cell>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'initiative.title'"/>
						</xsl:call-template>
					<fo:block line-height="10pt" font-weight="bold" space-before="0pt">
						<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_encumbrance_font_size" /></xsl:attribute>
						<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_encumbrance_padding_top" /></xsl:attribute>
						<xsl:value-of select="/character/lang/output_encumbrance" /><!--Encumbrance-->
					</fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

					<fo:table-cell>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'initiative.total'"/>
						</xsl:call-template>
						<xsl:if test="(/character/equipment/total/load = 'Medium' or /character/equipment/total/load = 'Heavy' or /character/equipment/total/load = 'Overload')">
						<fo:block font-size="10pt" font-weight="bold" color="red">
							<xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:value-of select="/character/equipment/total/load"/>
							<fo:inline font-size="6" font-weight="italics"> (rules applied)</fo:inline>
						</fo:block>
						</xsl:if>
						<xsl:if test="/character/equipment/total/load = 'Light'">
						<fo:block space-before.optimum="2pt" font-size="10pt">
						    <xsl:attribute name="font-family">Noto Sans</xsl:attribute>
							<xsl:value-of select="/character/equipment/total/load"/>
						</fo:block>
						</xsl:if>

					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
<!--	</xsl:if>	-->
		<!-- END encumberance table -->
	</xsl:template>

	<!--
====================================
====================================
	TEMPLATE - Resistance TABLE
====================================
====================================-->
	<xsl:template name="resistances">
		<!-- BEGIN Resistance table -->
		<fo:table table-layout="fixed" width="100%">
			<!-- 0.26 * $pagePrintableWidth - 2 mm -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.50 * (0.26 * $pagePrintableWidth - 4)" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-body>
				<fo:table-row height="2pt">
											<xsl:message>Test</xsl:message>
					<fo:table-cell><fo:block/></fo:table-cell>

				</fo:table-row>
				<fo:table-row>
											<xsl:message>Test</xsl:message>
					<fo:table-cell>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'initiative.title'"/>
						</xsl:call-template>
					<fo:block line-height="10pt" font-weight="bold" font-size="7pt" space-before="1pt">Res</fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

					<fo:table-cell>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'initiative.total'"/>
						</xsl:call-template>
						<fo:block space-before.optimum="2pt" font-size="8pt">
							<xsl:value-of select="resistance"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
<!--	</xsl:if>	-->
		<!-- END Resistance table -->
	</xsl:template>

<!--
====================================
====================================
	TEMPLATE - SAVES TABLE
====================================
====================================-->
	<xsl:template match="saving_throws">
		<!-- BEGIN Saves table -->
		<fo:table table-layout="fixed" width="100%" space-before="2mm">
			<fo:table-column column-width="82mm"/>	<!-- Saves Row -->
			<fo:table-column column-width="2mm"/>	<!-- Spacer -->
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.55 * $pagePrintableWidth - 86" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-body>
				<fo:table-row>
											<xsl:message>Test</xsl:message>
					<fo:table-cell>
						<xsl:apply-templates select="." mode="saves"/>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

<!--	Square Box Conditional Save area that we no longer need	
					<fo:table-cell padding-start="1pt">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'border'"/>
						</xsl:call-template>
						<fo:block font-size="4pt">Resistance</fo:block>
						<xsl:for-each select="resistances">
							<fo:block font-size="4pt" space-before.optimum="1pt"><xsl:value-of select="description"/></fo:block>
						</xsl:for-each>
					</fo:table-cell>		-->
				</fo:table-row>
			</fo:table-body>
		</fo:table>
		<!-- END Saves table -->
	</xsl:template>
	<!--
====================================
====================================
	TEMPLATE - SAVES TABLE
====================================
====================================-->
	<xsl:template match="saving_throws" mode="saves">
		<!-- BEGIN Saves table -->
		<xsl:variable name="output_save_column_width" select="/character/lang/output_save_column_width"/>
		<fo:table table-layout="fixed" width="100%">
			<fo:table-column column-width="$output_save_column_width"/>
			<fo:table-column column-width="2mm"/>
			<fo:table-column column-width="7mm"/>
			<fo:table-column column-width="2mm"/>
			<fo:table-column column-width="7mm"/>
			<fo:table-column column-width="2mm"/>
			<fo:table-column column-width="6mm"/>
			<fo:table-column column-width="2mm"/>
			<fo:table-column column-width="6mm"/>
			<fo:table-column column-width="2mm"/>
			<fo:table-column column-width="6mm"/>
			<fo:table-column column-width="2mm"/>
			<fo:table-column column-width="6mm"/>
			<fo:table-column column-width="2mm"/>
			<fo:table-column column-width="6mm"/>
			<fo:table-body>
				<fo:table-row>
											<xsl:message>Test</xsl:message>
					<fo:table-cell>
						<fo:block text-align="center" space-before.optimum="1pt">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_save_throws_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_save_throws" /><!--SAVING THROWS-->
						</fo:block>
					</fo:table-cell>
					<fo:table-cell number-columns-spanned="3">
						<fo:block text-align="center" space-before.optimum="1pt">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_save_total_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_save_total" /><!--TOTAL-->
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_save_base_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_save_base" /><!--BASE SAVE-->
						</fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_save_ability_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_save_ability" /><!--ABILITY-->
						</fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_save_magic_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_save_magic" /><!--MAGIC-->
						</fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_save_misc_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_save_misc" /><!--MISC-->
						</fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_save_epic_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_save_epic" /><!--EPIC-->
						</fo:block>
					</fo:table-cell>
					<fo:table-cell><fo:block/></fo:table-cell>

					<fo:table-cell>
						<fo:block text-align="center">
							<xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_save_temp_font_size" /></xsl:attribute>
							<xsl:value-of select="/character/lang/output_save_temp" /><!--TEMP-->
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<xsl:variable name="output_saving_show_long_name" select="/character/lang/output_saving_show_long_name"/>
				<xsl:for-each select="saving_throw">
					<fo:table-row space-before="2pt">
											<xsl:message>Test</xsl:message>
						<fo:table-cell>
							<xsl:call-template name="attrib">
								<xsl:with-param name="attribute" select="'saves.title'"/>
							</xsl:call-template>
							<fo:block line-height="10pt" font-weight="bold" space-before="1pt">
	                            <xsl:attribute name="font-size"><xsl:value-of select="/character/lang/output_save_font_size" /></xsl:attribute>
								<xsl:attribute name="padding-top"><xsl:value-of select="/character/lang/output_save_padding_top" /></xsl:attribute>	
								<xsl:value-of select="translate(name/long, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
							</fo:block>
							<xsl:if test="$output_saving_show_long_name = 'true'"><fo:block line-height="4pt" font-size="4pt">(<xsl:value-of select="ability"/>)</fo:block></xsl:if>
						</fo:table-cell>
						<fo:table-cell><fo:block/></fo:table-cell>

						<fo:table-cell>
							<xsl:call-template name="attrib">
								<xsl:with-param name="attribute" select="'saves.total'"/>
							</xsl:call-template>
							<fo:block space-before.optimum="2pt" font-size="10pt">
								<xsl:value-of select="total"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block text-align="center" space-before.optimum="5pt" font-size="6pt" padding-top="3pt">=</fo:block>
						</fo:table-cell>
						<xsl:call-template name="saves.entry"><xsl:with-param name="value" select="base"/></xsl:call-template>
						<xsl:call-template name="saves.entry"><xsl:with-param name="value" select="abil_mod"/></xsl:call-template>
						<xsl:call-template name="saves.entry"><xsl:with-param name="value" select="magic_mod"/></xsl:call-template>
						<xsl:call-template name="saves.entry"><xsl:with-param name="value" select="misc_mod"/></xsl:call-template>
						<xsl:call-template name="saves.entry"><xsl:with-param name="value" select="epic_mod"/></xsl:call-template>
						<fo:table-cell>
								<xsl:call-template name="attrib">
									<xsl:with-param name="attribute" select="'border.temp'"/>
								</xsl:call-template>
							<fo:block/>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row height="2pt">
											<xsl:message>Test END</xsl:message>
						<fo:table-cell>
						<fo:block>
						</fo:block>
						</fo:table-cell>

					</fo:table-row>
				</xsl:for-each>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	<xsl:template name="saves.entry">
		<xsl:param name="value"/>
		<fo:table-cell>
			<xsl:call-template name="attrib">
				<xsl:with-param name="attribute" select="'saves'"/>
			</xsl:call-template>
			<fo:block space-before.optimum="2pt" font-size="10pt">
				<xsl:value-of select="$value"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell>
			<fo:block text-align="center" space-before.optimum="5pt" font-size="6pt" padding-top="3pt">+</fo:block>
		</fo:table-cell>
	</xsl:template>




</xsl:stylesheet>
