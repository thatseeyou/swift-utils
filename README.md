# swift-utils

Swift로 작성한 작은 유틸리티 모음

## 유틸리티 목록

### clipfix-br.swift

클립보드의 HTML에서 텍스트 콘텐츠 내의 줄바꿈(`\n`)을 `<br>`로 변환한다.
`white-space: pre-wrap` 등으로 표시되던 줄바꿈이 붙여넣기 시에도 유지되도록 한다.

- plain text는 원본을 유지하고, HTML만 수정
- HTML 타입 우선순위: `public.html` > `Apple HTML pasteboard type`

**사용법:**

```bash
swift clipfix-br.swift
```

또는 컴파일 후 실행:

```bash
swiftc clipfix-br.swift -o clipfix-br
./clipfix-br
```
