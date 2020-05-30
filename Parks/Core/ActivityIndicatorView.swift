//
//  ActivityIndicatorView.swift
//  Parks
//
//  Created by Austin Louden on 5/29/20.
//  Copyright © 2020 Austin Louden. All rights reserved.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    typealias UIView = UIActivityIndicatorView

    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIActivityIndicatorView {
        let a = UIActivityIndicatorView()
        a.startAnimating()
        return a
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<Self>) {
        //
    }
}
