<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:str="http://xsltsl.sourceforge.net/string.html"
	xmlns:xalan="http://xml.apache.org/xalan"
	>
	<xsl:variable name="output_attack_total" select="/character/lang/output_attack_total"/>
	<xsl:variable name="output_attack_base_attack_bonus" select="/character/lang/output_attack_base_attack_bonus"/>
	<xsl:variable name="output_attack_stat" select="/character/lang/output_attack_stat"/>
	<xsl:variable name="output_attack_size" select="/character/lang/output_attack_size"/>
	<xsl:variable name="output_attack_misc" select="/character/lang/output_attack_misc"/>
	<xsl:variable name="output_attack_epic" select="/character/lang/output_attack_epic"/>
	<xsl:variable name="output_attack_temp" select="/character/lang/output_attack_temp"/>
	<xsl:variable name="output_attack_font_size" select="/character/lang/output_attack_font_size"/>
	<xsl:variable name="output_attack_padding_top" select="/character/lang/output_attack_padding_top"/>
	<xsl:variable name="output_attack_title_line_height" select="/character/lang/output_attack_title_line_height"/>
	<xsl:variable name="output_attack_title_font_size" select="/character/lang/output_attack_title_font_size"/>
	<xsl:variable name="output_attack_title_padding_top" select="/character/lang/output_attack_title_padding_top"/>
	<xsl:variable name="output_attack_title_show_second_line" select="/character/lang/output_attack_title_show_second_line"/>
	<xsl:variable name="output_attack_value_padding_top" select="/character/lang/output_attack_value_padding_top"/>
	<xsl:variable name="output_attack_separate_padding_top" select="/character/lang/output_attack_separate_padding_top"/>
	<xsl:variable name="output_attack_type_melee" select="/character/lang/output_attack_type_melee"/>
	<xsl:variable name="output_attack_type_ranged" select="/character/lang/output_attack_type_ranged"/>
	<xsl:variable name="output_attack_type_cmb" select="/character/lang/output_attack_type_cmb"/>
	
	<xsl:variable name="output_attack_cmb_column_1_width" select="/character/lang/output_attack_cmb_column_1_width"/>
	<xsl:variable name="output_attack_cmb_column_2_width" select="/character/lang/output_attack_cmb_column_2_width"/>
	<xsl:variable name="output_attack_cmb_column_3_width" select="/character/lang/output_attack_cmb_column_3_width"/>
	<xsl:variable name="output_attack_cmb_column_4_width" select="/character/lang/output_attack_cmb_column_4_width"/>
	<xsl:variable name="output_attack_cmb_column_5_width" select="/character/lang/output_attack_cmb_column_5_width"/>
	<xsl:variable name="output_attack_cmb_column_6_width" select="/character/lang/output_attack_cmb_column_6_width"/>
	<xsl:variable name="output_attack_cmb_column_7_width" select="/character/lang/output_attack_cmb_column_7_width"/>
	<xsl:variable name="output_attack_cmb_column_8_width" select="/character/lang/output_attack_cmb_column_8_width"/>
	<xsl:variable name="output_attack_cmb_column_9_width" select="/character/lang/output_attack_cmb_column_9_width"/>
	<xsl:variable name="output_attack_cmb_column_10_width" select="/character/lang/output_attack_cmb_column_10_width"/>
	<xsl:variable name="output_attack_cmb_column_11_width" select="/character/lang/output_attack_cmb_column_11_width"/>
	<xsl:variable name="output_attack_cmb_column_12_width" select="/character/lang/output_attack_cmb_column_12_width"/>
	<xsl:variable name="output_attack_cmb_column_13_width" select="/character/lang/output_attack_cmb_column_13_width"/>
	<xsl:variable name="output_attack_cmb_column_14_width" select="/character/lang/output_attack_cmb_column_14_width"/>
	
	<xsl:variable name="output_attack_cmb_2" select="/character/lang/output_attack_cmb_2"/>
	<xsl:variable name="output_attack_cmb_2_font_size" select="/character/lang/output_attack_cmb_2_font_size"/>
	<xsl:variable name="output_attack_cmd" select="/character/lang/output_attack_cmd"/>
	<xsl:variable name="output_attack_cmd_font_size" select="/character/lang/output_attack_cmd_font_size"/>
	<xsl:variable name="output_attack_cm_grapple" select="/character/lang/output_attack_cm_grapple"/>
	<xsl:variable name="output_attack_cm_trip" select="/character/lang/output_attack_cm_trip"/>
	<xsl:variable name="output_attack_cm_disarm" select="/character/lang/output_attack_cm_disarm"/>
	<xsl:variable name="output_attack_cm_sunder" select="/character/lang/output_attack_cm_sunder"/>
	<xsl:variable name="output_attack_cm_bull_rush" select="/character/lang/output_attack_cm_bull_rush"/>
	<xsl:variable name="output_attack_cm_overrun" select="/character/lang/output_attack_cm_overrun"/>
	
	<xsl:variable name="output_weapon_unarmed" select="/character/lang/output_weapon_unarmed"/>
	<xsl:variable name="output_weapon_total_attack_bonus" select="/character/lang/output_weapon_total_attack_bonus"/>
	<xsl:variable name="output_weapon_damage" select="/character/lang/output_weapon_damage"/>
	<xsl:variable name="output_weapon_critical" select="/character/lang/output_weapon_critical"/>
	<xsl:variable name="output_weapon_reach" select="/character/lang/output_weapon_reach"/>
	<xsl:variable name="output_weapon_sp" select="/character/lang/output_weapon_sp"/>
	<xsl:variable name="output_weapon_font_size" select="/character/lang/output_weapon_font_size"/>
	<xsl:variable name="output_weapon_padding_top" select="/character/lang/output_weapon_padding_top"/>
	<xsl:variable name="output_weapon_hand" select="/character/lang/output_weapon_hand"/>
	<xsl:variable name="output_weapon_type" select="/character/lang/output_weapon_type"/>
	<xsl:variable name="output_weapon_size" select="/character/lang/output_weapon_size"/>
	<xsl:variable name="output_weapon_to_hit" select="/character/lang/output_weapon_to_hit"/>
	<xsl:variable name="output_weapon_dam" select="/character/lang/output_weapon_dam"/>
	<xsl:variable name="output_weapon_weapon_is_equipped" select="/character/lang/output_weapon_weapon_is_equipped"/>
	<xsl:variable name="output_weapon_1hp" select="/character/lang/output_weapon_1hp"/>
	<xsl:variable name="output_weapon_1ho" select="/character/lang/output_weapon_1ho"/>
	<xsl:variable name="output_weapon_2h" select="/character/lang/output_weapon_2h"/>
	<xsl:variable name="output_weapon_2wp_oh" select="/character/lang/output_weapon_2wp_oh"/>
	<xsl:variable name="output_weapon_2wp_ol" select="/character/lang/output_weapon_2wp_ol"/>
	<xsl:variable name="output_weapon_2w_oh" select="/character/lang/output_weapon_2w_oh"/>
	
	<xsl:variable name="output_armor_table_width" select="/character/lang/output_armor_table_width"/>
	<xsl:variable name="output_armor_column_1_width" select="/character/lang/output_armor_column_1_width"/>
	<xsl:variable name="output_armor_column_2_width" select="/character/lang/output_armor_column_2_width"/>
	<xsl:variable name="output_armor_column_3_width" select="/character/lang/output_armor_column_3_width"/>
	<xsl:variable name="output_armor_column_4_width" select="/character/lang/output_armor_column_4_width"/>
	<xsl:variable name="output_armor_column_5_width" select="/character/lang/output_armor_column_5_width"/>
	<xsl:variable name="output_armor_armor" select="/character/lang/output_armor_armor"/>
	<xsl:variable name="output_armor_armor_font_size" select="/character/lang/output_armor_armor_font_size"/>
	<xsl:variable name="output_armor_armor_padding_top" select="/character/lang/output_armor_armor_padding_top"/>
	<xsl:variable name="output_armor_type" select="/character/lang/output_armor_type"/>
	<xsl:variable name="output_armor_type_font_size" select="/character/lang/output_armor_type_font_size"/>
	<xsl:variable name="output_armor_type_padding_top" select="/character/lang/output_armor_type_padding_top"/>
	<xsl:variable name="output_armor_ac" select="/character/lang/output_armor_ac"/>
	<xsl:variable name="output_armor_ac_font_size" select="/character/lang/output_armor_ac_font_size"/>
	<xsl:variable name="output_armor_ac_padding_top" select="/character/lang/output_armor_ac_padding_top"/>
	<xsl:variable name="output_armor_maxdex" select="/character/lang/output_armor_maxdex"/>
	<xsl:variable name="output_armor_maxdex_font_size" select="/character/lang/output_armor_maxdex_font_size"/>
	<xsl:variable name="output_armor_maxdex_padding_top" select="/character/lang/output_armor_maxdex_padding_top"/>
	<xsl:variable name="output_armor_check" select="/character/lang/output_armor_check"/>
	<xsl:variable name="output_armor_check_font_size" select="/character/lang/output_armor_check_font_size"/>
	<xsl:variable name="output_armor_check_padding_top" select="/character/lang/output_armor_check_padding_top"/>
	<xsl:variable name="output_armor_spell_failure" select="/character/lang/output_armor_spell_failure"/>
	<xsl:variable name="output_armor_spell_failure_font_size" select="/character/lang/output_armor_spell_failure_font_size"/>
	<xsl:variable name="output_armor_spell_failure_padding_top" select="/character/lang/output_armor_spell_failure_padding_top"/>
	
	<xsl:variable name="output_template_use_per_day" select="/character/lang/output_template_use_per_day"/>
	
	<xsl:variable name="output_equipment_column_1_width" select="/character/lang/output_equipment_column_1_width"/>
	<xsl:variable name="output_equipment_column_2_width" select="/character/lang/output_equipment_column_2_width"/>
	<xsl:variable name="output_equipment_column_3_width" select="/character/lang/output_equipment_column_3_width"/>
	<xsl:variable name="output_equipment_column_4_width" select="/character/lang/output_equipment_column_4_width"/>
	<xsl:variable name="output_equipment_column_5_width" select="/character/lang/output_equipment_column_5_width"/>
	<xsl:variable name="output_equipment_equipment" select="/character/lang/output_equipment_equipment"/>
	<xsl:variable name="output_equipment_equipment_font_size" select="/character/lang/output_equipment_equipment_font_size"/>
	<xsl:variable name="output_equipment_equipment_padding_top" select="/character/lang/output_equipment_equipment_padding_top"/>
	<xsl:variable name="output_equipment_item" select="/character/lang/output_equipment_item"/>
	<xsl:variable name="output_equipment_item_font_size" select="/character/lang/output_equipment_item_font_size"/>
	<xsl:variable name="output_equipment_item_padding_top" select="/character/lang/output_equipment_item_padding_top"/>
	<xsl:variable name="output_equipment_location" select="/character/lang/output_equipment_location"/>
	<xsl:variable name="output_equipment_location_font_size" select="/character/lang/output_equipment_location_font_size"/>
	<xsl:variable name="output_equipment_location_padding_top" select="/character/lang/output_equipment_location_padding_top"/>
	<xsl:variable name="output_equipment_qty" select="/character/lang/output_equipment_qty"/>
	<xsl:variable name="output_equipment_qty_font_size" select="/character/lang/output_equipment_qty_font_size"/>
	<xsl:variable name="output_equipment_qty_padding_top" select="/character/lang/output_equipment_qty_padding_top"/>
	<xsl:variable name="output_equipment_cost" select="/character/lang/output_equipment_cost"/>
	<xsl:variable name="output_equipment_cost_font_size" select="/character/lang/output_equipment_cost_font_size"/>
	<xsl:variable name="output_equipment_cost_padding_top" select="/character/lang/output_equipment_cost_padding_top"/>
	<xsl:variable name="output_equipment_total" select="/character/lang/output_equipment_total"/>
	
	<xsl:variable name="output_equipment_weight_allowance" select="/character/lang/output_equipment_weight_allowance"/>
	<xsl:variable name="output_equipment_weight_light" select="/character/lang/output_equipment_weight_light"/>
	<xsl:variable name="output_equipment_weight_medium" select="/character/lang/output_equipment_weight_medium"/>
	<xsl:variable name="output_equipment_weight_heavy" select="/character/lang/output_equipment_weight_heavy"/>
	<xsl:variable name="output_equipment_weight_lift_over_head" select="/character/lang/output_equipment_weight_lift_over_head"/>
	<xsl:variable name="output_equipment_weight_lift_off_ground" select="/character/lang/output_equipment_weight_lift_off_ground"/>
	<xsl:variable name="output_equipment_weight_push_drag" select="/character/lang/output_equipment_weight_push_drag"/>
	
	<xsl:variable name="output_money" select="/character/lang/output_money"/>
	<xsl:variable name="output_money_total" select="/character/lang/output_money_total"/>
	<xsl:variable name="output_unspent_funds" select="/character/lang/output_unspent_funds"/>
	
	<xsl:variable name="output_magic" select="/character/lang/output_magic"/>
	<xsl:variable name="output_languages" select="/character/lang/output_languages"/>
	<xsl:variable name="output_other_companions" select="/character/lang/output_other_companions"/>
	<xsl:variable name="output_trait" select="/character/lang/output_trait"/>
	<xsl:variable name="output_feats" select="/character/lang/output_feats"/>
	<xsl:variable name="output_special_qualities" select="/character/lang/output_special_qualities"/>
	<xsl:variable name="output_special_attacks" select="/character/lang/output_special_attacks"/>
	<xsl:variable name="output_proficiencies" select="/character/lang/output_proficiencies"/>
	
	<xsl:variable name="output_spells" select="/character/lang/output_spells"/>
	<xsl:variable name="output_spells_level" select="/character/lang/output_spells_level"/>
	<xsl:variable name="output_spells_concentration" select="/character/lang/output_spells_concentration"/>
	<xsl:variable name="output_spells_per_day" select="/character/lang/output_spells_per_day"/>
	<xsl:variable name="output_spells_caster_level" select="/character/lang/output_spells_caster_level"/>
	<xsl:variable name="output_spells_effect" select="/character/lang/output_spells_effect"/>
	<xsl:variable name="output_spells_dc" select="/character/lang/output_spells_dc"/>
	<xsl:variable name="output_spells_sr" select="/character/lang/output_spells_sr"/>
	<xsl:variable name="output_spells_target" select="/character/lang/output_spells_target"/>
	
	<xsl:variable name="output_spells_name" select="/character/lang/output_spells_name"/>
	<xsl:variable name="output_spells_school" select="/character/lang/output_spells_school"/>
	<xsl:variable name="output_spells_time" select="/character/lang/output_spells_time"/>
	<xsl:variable name="output_spells_duration" select="/character/lang/output_spells_duration"/>
	<xsl:variable name="output_spells_range" select="/character/lang/output_spells_range"/>
	<xsl:variable name="output_spells_source" select="/character/lang/output_spells_source"/>
	<xsl:variable name="output_spells_domain_speciality_spells" select="/character/lang/output_spells_domain_speciality_spells"/>	
	
</xsl:stylesheet>	