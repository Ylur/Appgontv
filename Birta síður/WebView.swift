//
//  WebView.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.
// Notað til að birta vefsíður inn í appinu og grípa error

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var url: URL
    var errorHandler: ((Error?) -> Void)?

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self, errorHandler: errorHandler)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        var errorHandler: ((Error?) -> Void)?

        init(_ webView: WebView, errorHandler: ((Error?) -> Void)?) {
            self.parent = webView
            self.errorHandler = errorHandler
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            // 
            errorHandler?(error)
        }

        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            // errorrrrr
            errorHandler?(error)
        }
    }
}
