//
//  ErrorView.swift
//  BreedsFeature
//
//  Created by MacPro on 12/07/25.
//

import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    let onRetry: () async -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 50))
                .foregroundStyle(.orange)
            
            Text("Oops! Something went wrong.")
                .font(.headline)
                .foregroundStyle(.primary)
            
            Text(errorMessage)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            Button("Try Again") {
                Task {
                    await onRetry()
                }
            }
            .font(.headline)
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ErrorView(errorMessage: "An big error occurred An big error occurred.An big error occurred.An big error occurred.An big error occurred.An big error occurred.An big error occurred.",
    onRetry: {})
}
