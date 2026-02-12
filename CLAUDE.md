# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Swift로 작성한 작은 유틸리티 모음. 각 유틸리티는 독립적인 단일 Swift 파일로 구성된다.

## Build & Run

```bash
# 인터프리터 모드로 실행
swift <filename>.swift

# 컴파일 후 실행
swiftc <filename>.swift -o <output>
./<output>
```

## Code Conventions

- 각 유틸리티 파일 상단에 프로그램 설명 주석과 날짜를 포함한다
- macOS 전용 유틸리티는 `import AppKit` 사용
