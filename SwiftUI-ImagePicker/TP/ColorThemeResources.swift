//
//  ColorThemeResources.swift
//  hkstp oneapp testing DEV QUICK
//
//  Created by Leung Yu Wing on 13/6/2022.
//

import Foundation
import SwiftUI



struct ColorTheme {
    let color_primary : Color
    let color_accent : Color
    let color_accent_secondary : Color
    let color_accent_negative : Color
    let color_content_body : Color
    let color_content_notes_0 : Color
    let color_content_notes : Color
    let color_content_notes_2 : Color
    let color_content_disabled : Color
    let color_content_negative : Color
    let color_content_background : Color
    let color_page_divider : Color
    let color_page_background : Color
    let color_page_handlebar : Color
    let color_special_pill_bg : Color
    let color_special_section_bg : Color
    let color_special_form_warning : Color
    let color_special_form_warning_bg : Color
    let color_special_form_success : Color
    let color_special_form_info : Color
    let color_special_form_cta_primary_2 : Color
    let color_special_form_cta_negative_2 : Color
    let color_special_form_cta_secondary_2 : Color
}



func TP1App_ColorThemeMake() -> ColorTheme
{
    return ColorTheme(
        color_primary: Color(hex: 0xFF5D02),
        color_accent: Color(hex: 0x000000),
        color_accent_secondary: Color(hex: 0x1933FC),
        color_accent_negative: Color(hex: 0xEFEFEF),
        color_content_body: Color(hex: 0x000000),
        color_content_notes_0: Color(hex: 0x4A4A4A),
        color_content_notes: Color(hex: 0x666666),
        color_content_notes_2: Color(hex: 0x888888),
        color_content_disabled: Color(hex: 0xC0C0C0),
        color_content_negative: Color(hex: 0xFFFFFF),
        color_content_background: Color(hex: 0xFFFFFF),
        color_page_divider: Color(hex: 0xEFEFEF),
        color_page_background: Color(hex: 0xEFEFEF),
        color_page_handlebar: Color(hex: 0xD9D9D9),
        color_special_pill_bg: Color(hex: 0xFFEFE5),
        color_special_section_bg: Color(hex: 0xFAFAFA),
        color_special_form_warning: Color(hex: 0xCC0000),
        color_special_form_warning_bg: Color(hex: 0xFFF5EF),
        color_special_form_success: Color(hex: 0x029735),
        color_special_form_info: Color(hex: 0x000000).opacity(0.8),
        color_special_form_cta_primary_2: Color(hex: 0xD44D00),
        color_special_form_cta_negative_2: Color(hex: 0xEFEFEF),
        color_special_form_cta_secondary_2: Color(hex: 0x1223A7)
    )
}




