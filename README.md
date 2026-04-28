# Apple HIG Skill for Codex, Claude Code, and OpenCode

Apple Human Interface Guidelines(HIG)를 **Codex**, **Claude Code**, **OpenCode**에서 재사용할 수 있도록 만든 portable skill/plugin 패키지입니다.

- 공식 HIG: https://developer.apple.com/kr/design/human-interface-guidelines/
- 대상 플랫폼: iOS, iPadOS, macOS, watchOS, tvOS, visionOS
- 주요 용도: Apple-native UX 리뷰, SwiftUI/UIKit/AppKit 구현 가이드, 접근성 점검, 크로스 디바이스 디자인 적응

> 이 저장소의 skill은 Apple 공식 문서의 핵심 원칙과 실무 체크리스트를 압축한 보조 자료입니다. 정확한 최신 수치, 플랫폼별 세부 정책, SDK 동작은 항상 Apple 공식 문서를 확인하세요.

## 지원 도구

| 도구 | 설치 방식 | 설치 위치 |
|---|---|---|
| Codex | local plugin marketplace 등록 | `~/.codex/config.toml` + 이 repo |
| Claude Code | global skill 복사 | `~/.claude/skills/apple-human-interface-guidelines/SKILL.md` |
| OpenCode | global skill 복사 | `~/.config/opencode/skills/apple-human-interface-guidelines/SKILL.md` |

## 포함된 내용

```text
.
├── README.md
├── LICENSE
├── CONTRIBUTING.md
├── install.sh
├── .agents/plugins/marketplace.json
└── plugins/apple-hig/
    ├── .codex-plugin/plugin.json
    └── skills/apple-human-interface-guidelines/SKILL.md
```

### 핵심 skill

`plugins/apple-hig/skills/apple-human-interface-guidelines/SKILL.md`

이 skill은 다음 내용을 포함합니다.

- Apple HIG의 핵심 원칙: **Hierarchy, Harmony, Consistency**
- 플랫폼별 디자인 적응 매트릭스
- iPhone, iPad, Mac, Watch, TV, Vision 환경별 체크포인트
- 레이아웃, 색상, 머티리얼, 타이포그래피, SF Symbols, 앱 아이콘 가이드
- Navigation, controls, feedback, permission, privacy 패턴
- Dynamic Type, VoiceOver, Reduce Motion, contrast 등 접근성 체크리스트
- SwiftUI/UIKit/AppKit 구현 시 확인할 사항
- Codex/Claude Code/OpenCode에서 바로 사용할 수 있는 prompt 예시

## 빠른 설치

```bash
git clone https://github.com/Ksanbal/apple-hig-codex-skill.git ~/.agents/apple-hig-codex-skill
cd ~/.agents/apple-hig-codex-skill
./install.sh
```

설치 후에는 **새 Codex, Claude Code, OpenCode 세션을 시작**해야 skill이 로드됩니다.

## Codex에서 사용하기

설치 스크립트는 Codex local marketplace를 등록하고 plugin을 활성화합니다.

등록되는 항목:

```toml
[marketplaces.local-apple-design-skills]
source_type = "local"
source = "~/.agents/apple-hig-codex-skill"

[plugins."apple-hig@local-apple-design-skills"]
enabled = true
```

새 Codex 세션에서 다음처럼 요청하세요.

```text
Use the apple-human-interface-guidelines skill. Review this app for iOS/iPadOS HIG alignment.
```

```text
Use the apple-human-interface-guidelines skill. Refactor this SwiftUI screen to use native Apple components, Dynamic Type, semantic colors, VoiceOver labels, and adaptive iPhone/iPad layout.
```

## Claude Code에서 사용하기

`install.sh`는 skill을 Claude Code global skill 폴더에 복사합니다.

```bash
~/.claude/skills/apple-human-interface-guidelines/SKILL.md
```

새 Claude Code 세션에서 다음처럼 요청하세요.

```text
Use the apple-human-interface-guidelines skill. Review this app for Apple HIG alignment and suggest concrete UI fixes.
```

Print mode에서도 사용할 수 있습니다.

```bash
claude -p "Use the apple-human-interface-guidelines skill. Review the current SwiftUI app for HIG alignment." --max-turns 5
```

## OpenCode에서 사용하기

`install.sh`는 skill을 OpenCode global skill 폴더에 복사합니다.

```bash
~/.config/opencode/skills/apple-human-interface-guidelines/SKILL.md
```

새 OpenCode 세션에서 다음처럼 요청하세요.

```text
Use the apple-human-interface-guidelines skill. Review this app for iOS, iPadOS, and macOS design consistency.
```

One-shot 실행 예시:

```bash
opencode run "Use the apple-human-interface-guidelines skill. Review this SwiftUI project for HIG alignment."
```

## 여러 기기에서 사용하기

새 기기마다 아래만 실행하면 됩니다.

```bash
git clone https://github.com/Ksanbal/apple-hig-codex-skill.git ~/.agents/apple-hig-codex-skill
cd ~/.agents/apple-hig-codex-skill
./install.sh
```

이미 clone한 기기에서 업데이트하려면:

```bash
cd ~/.agents/apple-hig-codex-skill
git pull
./install.sh
```

## 수동 설치

### Codex만 수동 등록

```bash
codex plugin marketplace add ~/.agents/apple-hig-codex-skill
```

그 후 `~/.codex/config.toml`에 다음이 없다면 추가하세요.

```toml
[plugins."apple-hig@local-apple-design-skills"]
enabled = true
```

### Claude Code만 수동 설치

```bash
mkdir -p ~/.claude/skills/apple-human-interface-guidelines
cp plugins/apple-hig/skills/apple-human-interface-guidelines/SKILL.md \
  ~/.claude/skills/apple-human-interface-guidelines/SKILL.md
```

### OpenCode만 수동 설치

```bash
mkdir -p ~/.config/opencode/skills/apple-human-interface-guidelines
cp plugins/apple-hig/skills/apple-human-interface-guidelines/SKILL.md \
  ~/.config/opencode/skills/apple-human-interface-guidelines/SKILL.md
```

## 업데이트 방법

이 저장소의 skill 내용을 수정한 뒤:

```bash
git add .
git commit -m "update apple hig skill"
git push
```

다른 기기에서는:

```bash
cd ~/.agents/apple-hig-codex-skill
git pull
./install.sh
```

## 검증 방법

### JSON manifest 검증

```bash
python3 -m json.tool .agents/plugins/marketplace.json >/dev/null
python3 -m json.tool plugins/apple-hig/.codex-plugin/plugin.json >/dev/null
```

### Skill frontmatter 검증

```bash
python3 - <<'PY'
from pathlib import Path
import yaml
p = Path('plugins/apple-hig/skills/apple-human-interface-guidelines/SKILL.md')
text = p.read_text()
assert text.startswith('---\n')
end = text.find('\n---\n', 4)
assert end != -1
fm = yaml.safe_load(text[4:end])
assert fm['name'] == 'apple-human-interface-guidelines'
assert 'description' in fm and len(fm['description']) <= 1024
print('OK')
PY
```

### 설치 위치 확인

```bash
test -f ~/.claude/skills/apple-human-interface-guidelines/SKILL.md && echo "Claude Code skill OK"
test -f ~/.config/opencode/skills/apple-human-interface-guidelines/SKILL.md && echo "OpenCode skill OK"
grep -q 'apple-hig@local-apple-design-skills' ~/.codex/config.toml && echo "Codex plugin OK"
```

## 라이선스

이 저장소의 작성된 skill 텍스트와 설치 스크립트는 CC BY 4.0으로 배포합니다. Apple, Apple Human Interface Guidelines, SF Symbols, iOS, iPadOS, macOS, watchOS, tvOS, visionOS는 Apple Inc.의 상표 또는 자료입니다.
