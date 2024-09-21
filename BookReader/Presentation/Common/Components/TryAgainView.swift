//
//  TryAgainView.swift
//  BookReader
//
//  Created by Amir Asadpour on 9/21/24.
//

import SwiftUI

struct TryAgainView: View {
    let onButtonTap: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Text("msg_general_error")
            Button("try_again") {
                onButtonTap()
            }
        }
    }
}

#Preview {
    TryAgainView {
        
    }
}
