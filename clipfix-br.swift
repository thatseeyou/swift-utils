// clipfix-br.swift
// 클립보드의 HTML에서 텍스트 콘텐츠 내의 줄바꿈(\n)을 <br>로 변환한다.
// white-space: pre-wrap 등으로 표시되던 줄바꿈이 붙여넣기 시 유지되도록 한다.
// plain text는 원본을 유지하고, HTML만 수정한다.
// 2026-02-12

import AppKit

func insertLineBreaks(in html: String) -> String {
    // HTML 태그 밖의 텍스트 노드에서 \n을 <br>\n으로 변환
    var result = ""
    var inTag = false

    var i = html.startIndex
    while i < html.endIndex {
        let ch = html[i]
        if ch == "<" {
            inTag = true
            result.append(ch)
        } else if ch == ">" {
            inTag = false
            result.append(ch)
        } else if ch == "\n" && !inTag {
            result.append(contentsOf: "<br>\n")
        } else {
            result.append(ch)
        }
        i = html.index(after: i)
    }

    return result
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

