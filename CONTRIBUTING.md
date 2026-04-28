# Contributing

이 저장소는 Codex/Hermes에서 재사용할 수 있는 Apple HIG skill pack입니다.

## 수정 절차

1. `plugins/apple-hig/skills/apple-human-interface-guidelines/SKILL.md`를 수정합니다.
2. JSON manifest가 깨지지 않았는지 확인합니다.
3. `./install.sh`를 실행해 로컬 Codex/Hermes 설치를 갱신합니다.
4. 새 Codex/Hermes 세션에서 skill을 테스트합니다.

## 주의

- Apple 공식 문서를 그대로 대량 복제하지 말고, 요약/체크리스트/실무 지침 형태로 유지합니다.
- 최신 세부 수치나 정책은 공식 Apple 문서 링크를 참조하도록 안내합니다.
- 여러 기기에서 동작해야 하므로 `install.sh`는 실행 위치 기준 경로를 사용합니다.
