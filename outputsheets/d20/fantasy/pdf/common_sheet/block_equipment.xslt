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
	TEMPLATE - Equipment
====================================
====================================-->
	<xsl:template match="equipment">
		<fo:block>
			<fo:table table-layout="fixed" width="100%" border-collapse="collapse" space-before="2mm">
				<xsl:call-template name="attrib">
					<xsl:with-param name="attribute" select="'equipment.border'"/>
				</xsl:call-template>
				<fo:table-column>
					<xsl:attribute name="column-width"><xsl:value-of select="0.5 * ($pagePrintableWidth - 2) - $output_equipment_column_1_width" />mm</xsl:attribute>
				</fo:table-column>
				<fo:table-column column-width="{$output_equipment_column_2_width}"/>
				<fo:table-column column-width="{$output_equipment_column_3_width}"/>
				<fo:table-column column-width="{$output_equipment_column_4_width}"/>
				<fo:table-column column-width="{$output_equipment_column_5_width}"/>
				<fo:table-header>
					<fo:table-row>
											<xsl:message>Test</xsl:message>
						<fo:table-cell number-columns-spanned="5">
							<xsl:call-template name="attrib">
								<xsl:with-param name="attribute" select="'equipment.title'"/>
							</xsl:call-template>
							<fo:block font-size="{$output_equipment_equipment_font_size}" padding-top="{$output_equipment_equipment_padding_top}"><xsl:value-of select="$output_equipment_equipment"/><!-- EQUIPMENT--></fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
											<xsl:message>Test</xsl:message>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'equipment.title'"/>
						</xsl:call-template>
						<fo:table-cell>
							<fo:block font-size="{$output_equipment_item_font_size}" padding-top="{$output_equipment_item_padding_top}"><xsl:value-of select="$output_equipment_item"/><!-- ITEM--></fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block font-size="{$output_equipment_location_font_size}" padding-top="{$output_equipment_location_padding_top}"><xsl:value-of select="$output_equipment_location"/><!-- LOCATION--></fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block font-size="{$output_equipment_qty_font_size}" padding-top="{$output_equipment_qty_padding_top}"><xsl:value-of select="$output_equipment_qty"/><!-- QTY--></fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="2">
							<fo:block font-size="{$output_equipment_cost_font_size}" padding-top="{$output_equipment_cost_padding_top}"><xsl:value-of select="$output_equipment_cost"/><!-- WT / COST--></fo:block>
						</fo:table-cell>
<!-->						<fo:table-cell padding-top="1pt">
							<fo:block font-size="7pt"></fo:block>
						</fo:table-cell>	-->
					</fo:table-row>
				</fo:table-header>
				<fo:table-footer>
					<fo:table-row>
											<xsl:message>Test</xsl:message>
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'equipment.title'"/>
						</xsl:call-template>
						<fo:table-cell>
							<fo:block font-size="7pt" padding-top="1pt"><xsl:value-of select="$output_equipment_total"/><!-- TOTAL WEIGHT CARRIED/VALUE --></fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block font-size="7pt" padding-top="1pt">
								<xsl:value-of select="total/weight"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-top="1pt" number-columns-spanned="2">
							<fo:block font-size="7pt">
								<xsl:variable name="TotalValue">
									<xsl:call-template name="Total">
										<xsl:with-param name="Items" select="item[contains(type, 'COIN')=false and contains(type, 'GEM')=false and contains(type, 'TEMPORARY')=false]"/>
										<xsl:with-param name="RunningTotal" select="0"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:value-of select="format-number($TotalValue, '##,##0.#')"/>gp
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-footer>
				<fo:table-body>
					<xsl:for-each select="item[contains(type, 'COIN')=false and contains(type, 'GEM')=false and contains(type, 'TEMPORARY')=false]">
						<xsl:variable name="shade">
							<xsl:choose>
								<xsl:when test="position() mod 2 = 0 ">darkline</xsl:when>
								<xsl:otherwise>lightline</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>

						<fo:table-row>
											<xsl:message>Test</xsl:message>
							<xsl:call-template name="attrib"><xsl:with-param name="attribute" select="concat('equipment.', $shade)"/></xsl:call-template>
							<fo:table-cell>
								<fo:block space-before.optimum="1pt" font-size="6pt" line-height="10pt">
									<xsl:if test="contains(type, 'MAGIC') or contains(type, 'PSIONIC')">
										<xsl:attribute name="font-weight">bold</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="name"/>
								</fo:block>
			<!-->					<fo:block space-before.optimum="1pt" font-size="5pt">
									<xsl:value-of select="contents"/>
								</fo:block>	-->
			<!-->					<fo:block space-before.optimum="1pt" font-size="5pt">
									<xsl:value-of select="special_properties"/>
									<xsl:value-of select="quality"/>
								</fo:block>	-->
								<fo:block space-before.optimum="1pt" font-size="6pt">
									<xsl:value-of select="note"/>
								</fo:block>
								<!-- Display the number of charges left if any -->
								<xsl:if test="charges &gt; 0">
									<fo:block font-size="6pt" font-family="ZapfDingbats">
										<xsl:call-template name="for.loop">
											<xsl:with-param name="count" select="charges"/>
										</xsl:call-template>
									</fo:block>
								</xsl:if>
								<!-- Display the ammunition as a series of checkboxes -->
<!--	Redundant Code, Potion is both POTION & CONSUMABLE	
								<xsl:if test="contains(type, 'POTION') and quantity &gt; 1">
									<fo:block font-size="7pt" font-family="ZapfDingbats">
										<xsl:call-template name="for.loop">	
											<xsl:with-param name="count" select="checkbox"/>
										</xsl:call-template>
									</fo:block>
								</xsl:if>	-->
								<!-- Replaced quantity with checkbox, though quatity will net same result with > 0 -->
								<xsl:if test="contains(type, 'AMMUNITION') and checkbox > 0">
									<fo:block font-size="6pt" font-family="ZapfDingbats">
										<xsl:call-template name="for.loop">
											<xsl:with-param name="count" select="checkbox"/>
										</xsl:call-template>
									</fo:block>
								</xsl:if>
								<xsl:if test="contains(type, 'CONSUMABLE') and checkbox > 0">
									<fo:block font-size="6pt" font-family="ZapfDingbats">
										<xsl:call-template name="for.loop">
											<xsl:with-param name="count" select="checkbox"/>
										</xsl:call-template>
									</fo:block>
								</xsl:if>
							</fo:table-cell>
							<fo:table-cell text-align="center">
								<fo:block space-before.optimum="1pt" font-size="6pt">
									<xsl:value-of select="location"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center" space-before.optimum="1pt" font-size="6pt">
									<xsl:value-of select="quantity"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="2">
								<fo:block text-align="center" space-before.optimum="1pt" font-size="6pt">
									<xsl:value-of select="format-number(weight, '##,##0.#')"/>
									<xsl:if test="quantity &gt; 1">
										(<xsl:value-of select="format-number(weight * quantity, '##,##0.#')"/>)
									</xsl:if>
									<xsl:text> / </xsl:text>
									<xsl:value-of select="format-number(cost, '##,##0.#')"/>
									<xsl:if test="quantity &gt; 1">
										(<xsl:value-of select="format-number(cost * quantity, '##,##0.#')"/>)
									</xsl:if>
								</fo:block>
							</fo:table-cell>
<!-->							<fo:table-cell>
								<fo:block text-align="center" space-before.optimum="1pt" font-size="7pt">
									<xsl:value-of select="format-number(cost, '##,##0.#')"/>
									<xsl:if test="quantity &gt; 1">
										(<xsl:value-of select="format-number(cost * quantity, '##,##0.#')"/>)
									</xsl:if>
								</fo:block>
							</fo:table-cell>	-->
						</fo:table-row>
<!-- Special Properties Now Span entire row -->
						<fo:table-row>
											<xsl:message>Test</xsl:message>
							<xsl:call-template name="attrib"><xsl:with-param name="attribute" select="concat('equipment.', $shade)"/></xsl:call-template>
							<fo:table-cell number-columns-spanned="5">
								<fo:block space-before.optimum="1pt" font-size="5pt">
									<xsl:value-of select="special_properties"/>
									<xsl:value-of select="quality"/>
									<xsl:if test="contents_num &gt; 0">
										<xsl:value-of select="contents"/>
									</xsl:if>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>
				</fo:table-body>
			</fo:table>
		</fo:block>
		<!-- END Equipment table -->
	</xsl:template>

	<!--
====================================
====================================
	TEMPLATE - WEIGHT ALLOWANCE SINGLE ENTRY
====================================
====================================-->
	<xsl:template name="weight.entry">
		<xsl:param name="title"/>
		<xsl:param name="value"/>

		<fo:table-cell padding-top="1pt" padding-right="1mm">
			<xsl:call-template name="attrib"><xsl:with-param name="attribute" select="'weight.darkline'"/></xsl:call-template>
			<fo:block font-size="7pt" text-align="end"><xsl:value-of select="$title"/></fo:block>
		</fo:table-cell>
		<fo:table-cell padding-top="1pt" padding-left="1mm">
			<xsl:call-template name="attrib"><xsl:with-param name="attribute" select="'weight.lightline'"/></xsl:call-template>
			<fo:block font-size="7pt"><xsl:value-of select="$value"/></fo:block>
		</fo:table-cell>
	</xsl:template>
	<!--
====================================
====================================
	TEMPLATE - WEIGHT ALLOWANCE
====================================
====================================-->
	<xsl:template match="weight_allowance">
		<!-- BEGIN Weight table -->
		<fo:table table-layout="fixed" width="100%" space-before.optimum="2mm">
			<xsl:call-template name="attrib"><xsl:with-param name="attribute" select="'weight.border'"/></xsl:call-template>
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.65 * 0.5 * ($pagePrintableWidth - 2) div 3" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.35 * 0.5 * ($pagePrintableWidth - 2) div 3" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.65 * 0.5 * ($pagePrintableWidth - 2) div 3" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.35 * 0.5 * ($pagePrintableWidth - 2) div 3" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.65 * 0.5 * ($pagePrintableWidth - 2) div 3" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-column>
				<xsl:attribute name="column-width"><xsl:value-of select="0.35 * 0.5 * ($pagePrintableWidth - 2) div 3" />mm</xsl:attribute>
			</fo:table-column>
			<fo:table-body>
				<fo:table-row keep-with-next.within-column="always">
											<xsl:message>Test</xsl:message>
					<fo:table-cell padding-top="1pt" number-columns-spanned="6">
						<xsl:call-template name="attrib">
							<xsl:with-param name="attribute" select="'weight.title'"/>
						</xsl:call-template>
						<fo:block font-size="7pt"><xsl:value-of select="$output_equipment_weight_allowance"/><!-- WEIGHT ALLOWANCE --></fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row keep-with-next.within-column="always">
											<xsl:message>Test</xsl:message>
					<xsl:call-template name="weight.entry">
						<xsl:with-param name="title" select="$output_equipment_weight_light"/>
						<xsl:with-param name="value" select="light"/>
					</xsl:call-template>
					<xsl:call-template name="weight.entry">
						<xsl:with-param name="title" select="$output_equipment_weight_medium"/>
						<xsl:with-param name="value" select="medium"/>
					</xsl:call-template>
					<xsl:call-template name="weight.entry">
						<xsl:with-param name="title" select="$output_equipment_weight_heavy"/>
						<xsl:with-param name="value" select="heavy"/>
					</xsl:call-template>
				</fo:table-row>
				<fo:table-row keep-with-next.within-column="always">
											<xsl:message>Test</xsl:message>
					<xsl:call-template name="weight.entry">
						<xsl:with-param name="title" select="$output_equipment_weight_lift_over_head"/>
						<xsl:with-param name="value" select="lift_over_head"/>
					</xsl:call-template>
					<xsl:call-template name="weight.entry">
						<xsl:with-param name="title" select="$output_equipment_weight_lift_off_ground"/>
						<xsl:with-param name="value" select="lift_off_ground"/>
					</xsl:call-template>
					<xsl:call-template name="weight.entry">
						<xsl:with-param name="title" select="$output_equipment_weight_push_drag"/>
						<xsl:with-param name="value" select="push_drag"/>
					</xsl:call-template>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	<!--
====================================
====================================
	TEMPLATE - Money
====================================
====================================-->
	<xsl:template name="money">


		<xsl:if test="count (misc/funds/fund|equipment/item[contains(type, 'COIN') or contains(type, 'GEM')]) or (misc/gold) &gt; 0">	
			<fo:table table-layout="fixed" width="100%" space-before.optimum="2mm">
				<xsl:call-template name="attrib">
					<xsl:with-param name="attribute" select="'money.border'"/>
				</xsl:call-template>
				<fo:table-column>
					<xsl:attribute name="column-width"><xsl:value-of select="0.5 * ($pagePrintableWidth - 2)" />mm</xsl:attribute>
				</fo:table-column>
				<fo:table-header>
					<fo:table-row keep-with-next.within-column="always">
											<xsl:message>Test</xsl:message>
						<fo:table-cell padding-top="1pt">
							<xsl:call-template name="attrib">
								<xsl:with-param name="attribute" select="'money.title'"/>
							</xsl:call-template>
							<fo:block font-size="9pt"><xsl:value-of select="$output_money"/><!-- MONEY--></fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-footer>
					<fo:table-row>
											<xsl:message>Test</xsl:message>
						<fo:table-cell>
							<xsl:call-template name="attrib">
								<xsl:with-param name="attribute" select="'money.title'"/>
							</xsl:call-template>
							<fo:block font-size="7pt" text-align="end">
								<xsl:variable name="TotalValue">
									<xsl:call-template name="Total">
										<xsl:with-param name="Items" select="equipment/item[contains(type, 'COIN') or contains(type, 'GEM')]"/>
										<xsl:with-param name="RunningTotal" select="0"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:value-of select="$output_money_total"/><!-- Total-->= <xsl:value-of select="format-number($TotalValue, '##,##0.#')"/> gp
								<xsl:if test="misc/gold != 0">
								[<xsl:value-of select="$output_unspent_funds"/><!-- Unspent Funds--> = <xsl:value-of select="misc/gold"/> gp]
								</xsl:if>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-footer>
				<fo:table-body>
					<!-- dump coins -->
					<xsl:for-each select="equipment/item[contains(type, 'COIN')]">
						<xsl:sort order="descending" select="cost" data-type="number"/>
						<xsl:variable name="shade">
							<xsl:choose>
								<xsl:when test="position() mod 2 = 0">darkline</xsl:when>
								<xsl:otherwise>lightline</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<fo:table-row keep-with-next.within-column="always">
											<xsl:message>Test</xsl:message>
							<xsl:call-template name="attrib"><xsl:with-param name="attribute" select="concat('money.', $shade)"/></xsl:call-template>
							<fo:table-cell>
								<fo:block>
									<xsl:value-of select="name"/>: <xsl:value-of select="quantity"/>
									 <fo:inline font-size="6pt">[<xsl:value-of select="location"/>]</fo:inline>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>
					<xsl:variable name="coin_count" select="count( equipment/item[contains(type, 'COIN')] )"/>

					<!-- dump gems -->
					<xsl:for-each select="equipment/item[contains(type, 'GEM')]">
						<xsl:sort order="descending" select="cost" data-type="number"/>
						<xsl:variable name="shade">
							<xsl:choose>
								<xsl:when test="($coin_count + position()) mod 2 = 0">darkline</xsl:when>
								<xsl:otherwise>lightline</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<fo:table-row keep-with-next.within-column="always">
											<xsl:message>Test</xsl:message>
							<xsl:call-template name="attrib"><xsl:with-param name="attribute" select="concat('money.', $shade)"/></xsl:call-template>
							<fo:table-cell>
								<fo:block>
									<xsl:value-of select="quantity"/> x <xsl:value-of select="name"/> (<xsl:value-of select="cost"/>)
									 <fo:inline font-size="6pt">[<xsl:value-of select="location"/>]</fo:inline>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>
					<xsl:variable name="gem_count" select="count( equipment/item[contains(type, 'GEM')] )"/>

					<!-- misc gold -->
					<xsl:for-each select="misc/gold">
						<fo:table-row keep-with-next.within-column="always">
											<xsl:message>Test</xsl:message>
							<fo:table-cell>
								<fo:block font-size="7pt">
									<xsl:call-template name="paragraghlist">
										<xsl:with-param name="tag" select="'gold'"/>
									</xsl:call-template>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>

					<!-- misc funds -->
					<xsl:for-each select="misc/funds">
						<xsl:variable name="shade">
							<xsl:choose>
								<xsl:when test="($coin_count + $gem_count + position()) mod 2 = 0 ">darkline</xsl:when>
								<xsl:otherwise>lightline</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<fo:table-row keep-with-next.within-column="always">
											<xsl:message>Test</xsl:message>
							<xsl:call-template name="attrib"><xsl:with-param name="attribute" select="concat('money.', $shade)"/></xsl:call-template>
							<fo:table-cell>
								<fo:block font-size="7pt">
									<xsl:call-template name="paragraghlist">
										<xsl:with-param name="tag" select="'fund'"/>
									</xsl:call-template>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>
				</fo:table-body>
			</fo:table>
		</xsl:if>	
	</xsl:template>
	<!--
====================================
====================================
	TEMPLATE - Misc Magic
====================================
====================================-->
	<xsl:template match="magics">
		<xsl:if test="count(magic) &gt; 0">
			<fo:table table-layout="fixed" width="100%" space-before.optimum="2mm">
				<xsl:call-template name="attrib">
					<xsl:with-param name="attribute" select="'magic.border'"/>
				</xsl:call-template>
				<fo:table-column>
					<xsl:attribute name="column-width"><xsl:value-of select="0.5 * ($pagePrintableWidth - 2)" />mm</xsl:attribute>
				</fo:table-column>
				<fo:table-header>
					<fo:table-row keep-with-next.within-column="always">
											<xsl:message>Test</xsl:message>
						<fo:table-cell padding-top="1pt">
							<xsl:call-template name="attrib">
								<xsl:with-param name="attribute" select="'magic.title'"/>
							</xsl:call-template>
							<fo:block font-size="9pt"><xsl:value-of select="$output_magic"/><!-- MAGIC--></fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<fo:table-row keep-with-next.within-column="always">
											<xsl:message>Test END</xsl:message>
						<fo:table-cell>
							<xsl:call-template name="attrib">
								<xsl:with-param name="attribute" select="'magic.lightline'"/>
							</xsl:call-template>
							<fo:block font-size="7pt">
								<xsl:call-template name="paragraghlist">
									<xsl:with-param name="tag" select="'magic'"/>
								</xsl:call-template>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</xsl:if>
	</xsl:template>



</xsl:stylesheet>
