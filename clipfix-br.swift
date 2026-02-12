// clipfix-br.swift
// 클립보드의 HTML에서 </span> 태그 뒤에 <br> 태그를 삽입하여 줄바꿈을 추가한다.
// plain text는 원본을 유지하고, HTML만 수정한다.
// 2026-02-11

import AppKit

func insertLineBreaks(in html: String) -> String {
    let regex = #/<\/span>(?=\s*<span[^>]*>\s*<a[^>]*>)/#
    return html.replacing(regex, with: "</span><br>")
}

func processClipboard() {
    let pb = NSPasteboard.general
    let htmlType = NSPasteboard.PasteboardType.html

    // 원본 plain text 보존
    let originalPlainText = pb.string(forType: .string)

    let originalHtml: String? = {
        // HTML 타입 우선 순위: public.html, Apple HTML pasteboard type
        let htmlTypes: [NSPasteboard.PasteboardType] = [
            .html,
            NSPasteboard.PasteboardType("Apple HTML pasteboard type")
        ]

        for type in htmlTypes {
            if let data = pb.data(forType: type),
               let s = String(data: data, encoding: .utf8) {
                return s
            }
        }

        return nil
    }()

    guard let html = originalHtml, !html.isEmpty else { return }

    let fixed = insertLineBreaks(in: html)

    pb.clearContents()
    pb.setData(fixed.data(using: .utf8), forType: htmlType)
    if let plainText = originalPlainText {
        pb.setString(plainText, forType: .string)
    }
}

processClipboard()

