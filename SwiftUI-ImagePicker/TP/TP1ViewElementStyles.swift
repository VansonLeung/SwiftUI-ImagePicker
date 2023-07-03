//
//  TP1ViewElementStyles.swift
//  hkstp oneapp testing DEV QUICK
//
//  Created by Leung Yu Wing on 13/6/2022.
//

import Foundation
import SwiftUI


class TP1ViewElementStyles : ObservableObject
{
    private static var _shared : TP1ViewElementStyles?
    public static var shared : TP1ViewElementStyles {
        if let _shared = _shared
        {
            return _shared
        }
        _shared = TP1ViewElementStyles()
        return _shared!
    }
    
    
    @Published var activeColorTheme : ColorTheme
    
    init() {
        activeColorTheme = TP1App_ColorThemeMake()
        
        
        let appearanceTabBar = UITabBarAppearance()
        appearanceTabBar.configureWithOpaqueBackground()
        let appearanceNavBar = UINavigationBarAppearance()
        appearanceNavBar.configureWithOpaqueBackground()
        appearanceNavBar.shadowColor = .clear
//        appearanceNavBar.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
//        appearanceNavBar.shadowImage = UIImage(named: "shadow1604")

        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().backgroundColor = activeColorTheme.color_accent_negative.uiColor()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        
        UINavigationBar.appearance().tintColor = TP1App_ColorThemeMake().color_accent.uiColor()
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearanceTabBar
            UINavigationBar.appearance().standardAppearance = appearanceNavBar
            UINavigationBar.appearance().scrollEdgeAppearance = appearanceNavBar
        }
        
    }
    
    
    func getSafeAreaInsetsTopHeight() -> CGFloat {
        return (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 5)
    }
    func getNavigationBarTopHeight() -> CGFloat {
        return (48)
    }
    func getSafeAreaInsetsBottomHeight() -> CGFloat {
        return (UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 13)
    }
    
    func getMainTabBarHeight() -> CGFloat {
        return ( ( min(30, UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0)) + 56)
    }
    
    
    
    func getExtraTopHeight_forHomepageStatusHeader() -> CGFloat {
        if (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0) <= 20
        {
            return (16)
        }
        return 0
    }
    
    func getExtraPadding_forNavigationBarItems() -> CGFloat {
        if (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0) <= 20
        {
            return (10)
        }
        return 0
    }
    
    
    func getExtraBottomHeight_forBottomSheetSelections() -> CGFloat {
        var bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
        if bottom < 20 {
            return 54
        }
        return (60)
    }
    func getExtraBottomHeight_forBottomStickyButtons() -> CGFloat {
        var bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
        if bottom < 20 {
            return 20
        }
        return bottom
    }

    
    func getMaxHeight_forBottomSheetFixedPureSwiftUIWrapperContent(geometry: GeometryProxy) -> CGFloat {
        return geometry.size.height - 129 - 16 - 5
    }
    
    
    
    func getGridWidth() -> CGFloat {
        return ((UIScreen.main.bounds.width - (20 * 2) - (16 * 3)) / 4)
    }

    
    
}

    
    
    
    
