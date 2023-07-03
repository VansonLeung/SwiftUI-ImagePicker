//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import SwiftUI

public extension View {

    /// Helper to create `AnyView` from view
    var anyView: AnyView {
        AnyView(self)
    }

}
