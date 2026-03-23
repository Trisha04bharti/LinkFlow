//
//  ShareView.swift
//  LinkFlow
//
//  Created by Trisha on 22/03/26.
//

import SwiftUI
import UniformTypeIdentifiers

struct ShareView: View {
    var extensionContext: NSExtensionContext?

    @State private var sharedText: String = "Loading..."

    var body: some View {
        VStack(spacing: 20) {
            Text("Incoming Link")
                .font(.headline)

            Text(sharedText)
                .padding()

            Button("Open in LinkFlow") {
                saveAndOpenApp()
            }

            Button("Cancel") {
                extensionContext?.completeRequest(returningItems: [], completionHandler: nil)
            }
        }
        .padding()
        .onAppear {
            extractData()
        }
    }

    func extractData() {
        guard let item = extensionContext?.inputItems.first as? NSExtensionItem else { return }

        for provider in item.attachments ?? [] {

            // URL
            if provider.hasItemConformingToTypeIdentifier(UTType.url.identifier) {
                provider.loadItem(forTypeIdentifier: UTType.url.identifier, options: nil) { data, _ in
                    DispatchQueue.main.async {
                        if let url = data as? URL {
                            self.sharedText = url.absoluteString
                        }
                    }
                }
            }

            // Text fallback
            if provider.hasItemConformingToTypeIdentifier(UTType.text.identifier) {
                provider.loadItem(forTypeIdentifier: UTType.text.identifier, options: nil) { data, _ in
                    DispatchQueue.main.async {
                        self.sharedText = data as? String ?? "No text"
                    }
                }
            }
        }
    }

    func saveAndOpenApp() {
        let defaults = UserDefaults(suiteName: "group.com.linkflow.shared")
        defaults?.set(sharedText, forKey: "sharedURL")

        extensionContext?.completeRequest(returningItems: [], completionHandler: { _ in
            openMainApp()
        })
    }

    func openMainApp() {
        let url = URL(string: "linkflow://open")!
        var responder = self as UIResponder?

        while responder != nil {
            if let app = responder as? UIApplication {
                app.open(url)
                break
            }
            responder = responder?.next
        }
    }
}
