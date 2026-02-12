# swift-utils

Swift로 작성한 작은 유틸리티 모음

## 유틸리티 목록

### clipfix-br.swift

클립보드의 HTML에서 `</span>` 태그 뒤에 `<br>` 태그를 삽입하여 줄바꿈을 추가한다.

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
