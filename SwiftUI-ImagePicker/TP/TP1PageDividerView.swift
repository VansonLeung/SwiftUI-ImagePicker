//
//  TP1PageDividerView.swift
//  hkstp oneapp testing
//
//  Created by van on 27/6/2022.
//

import Foundation
import SwiftUI


struct TP1PageDivider : View {
    
    var h : CGFloat = 4
    
    var body: some View {
        Spacer()
        .frame(height: h)
        .modifier(TP1AppLayoutModifier(viewElementStyles: .shared, fillType: .horizontal_fill))
        .background(
            Rectangle()
                .fill(TP1ViewElementStyles.shared.activeColorTheme.color_page_divider)
        )
    }
}


struct TP1Line : View {
    
    var h : CGFloat = 2
    var color : Color = TP1ViewElementStyles.shared.activeColorTheme.color_page_divider
    
    var body: some View {
        Spacer()
        .frame(height: h)
        .modifier(TP1AppLayoutModifier(viewElementStyles: .shared, fillType: .horizontal_fill))
        .background(
            Rectangle()
                .fill(color)
        )
    }
}

struct TP1PageDividerV : View {
    
    var w : CGFloat = 1
    
    var body: some View {
        Spacer()
        .frame(width: w)
        .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
        .background(
            Rectangle()
                .fill(TP1ViewElementStyles.shared.activeColorTheme.color_page_divider)
        )
    }
}




struct TP1PageSpacer : View {
    
    var h : CGFloat = 16
    
    var body: some View {
        Spacer()
        .frame(height: h)
        .modifier(TP1AppLayoutModifier(viewElementStyles: .shared, fillType: .horizontal_fill))
    }
}


struct TP1PageSpacerW : View {
    
    var w : CGFloat = 16
    
    var body: some View {
        Spacer()
        .frame(minWidth: w, maxWidth: w)
    }
}


struct TP1PageDividerView_Preview : PreviewProvider {
    static var previews: some View {
        TP1PageDivider()
    }
}
