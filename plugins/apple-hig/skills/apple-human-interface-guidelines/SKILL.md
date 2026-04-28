---
name: apple-human-interface-guidelines
description: Use when designing, reviewing, or implementing apps for Apple platforms (iOS, iPadOS, macOS, watchOS, tvOS, visionOS) and you need Human Interface Guidelines-aligned UX decisions, cross-device adaptation, accessibility, visual hierarchy, or Apple-native interaction patterns.
version: 1.0.0
author: ksanbal + Hermes Agent
license: CC-BY-4.0
metadata:
  priority: 8
  docs:
    - "https://developer.apple.com/kr/design/human-interface-guidelines/"
    - "https://developer.apple.com/design/resources/"
  pathPatterns:
    - "**/*.swift"
    - "**/*.xib"
    - "**/*.storyboard"
    - "**/*.xcassets/**"
    - "**/*.fig"
    - "**/DesignSystem/**"
    - "**/Components/**"
    - "**/Views/**"
    - "**/Screens/**"
    - "**/app/**"
    - "**/src/**"
  importPatterns:
    - "SwiftUI"
    - "UIKit"
    - "AppKit"
    - "WatchKit"
    - "RealityKit"
    - "VisionOS"
  bashPatterns:
    - "\\bxcodebuild\\b"
    - "\\bswift\\s+(build|test|package)\\b"
    - "\\bnpm\\s+(run\\s+)?(ios|macos|build)\\b"
  promptSignals:
    phrases:
      - "Apple HIG"
      - "Human Interface Guidelines"
      - "휴먼 인터페이스 가이드라인"
      - "애플 디자인"
      - "iOS design"
      - "macOS design"
      - "visionOS design"
      - "watchOS design"
      - "Apple스럽게"
      - "네이티브 앱"
      - "Liquid Glass"
      - "SF Symbols"
      - "Dynamic Type"
      - "accessibility"
      - "손쉬운 사용"
      - "dark mode"
      - "다크 모드"
      - "safe area"
      - "layout guide"
      - "tab bar"
      - "navigation bar"
      - "sidebar"
      - "toolbar"
      - "sheet"
      - "popover"
      - "widgets"
      - "Live Activity"
      - "앱 아이콘"
---

# Apple Human Interface Guidelines Skill

## Overview

Use this skill whenever you design, critique, or implement an interface intended to feel native on Apple platforms. It is a compact operating guide derived from Apple’s Human Interface Guidelines (HIG), not a replacement for the official documentation. When precision matters, check the current Apple docs and platform SDK documentation.

Primary source: https://developer.apple.com/kr/design/human-interface-guidelines/

The current HIG entry page emphasizes three top-level principles:

1. **Hierarchy** — establish a clear visual hierarchy so controls and interface elements distinguish and elevate the underlying content.
2. **Harmony** — align interface elements, system experiences, and device characteristics so hardware and software feel cohesive.
3. **Consistency** — use platform structure so designs adapt consistently across window sizes, devices, and display environments.

Apply these principles before choosing any component, animation, color, icon, or layout.

## When to Use

Use this skill for:

- Designing or reviewing Apple-platform apps: iOS, iPadOS, macOS, watchOS, tvOS, visionOS.
- Converting a web/product mockup into a more Apple-native experience.
- Building SwiftUI/UIKit/AppKit interfaces and choosing controls, navigation, sheets, popovers, menus, toolbars, tabs, sidebars, forms, and settings screens.
- Creating app icons, SF Symbols usage, color systems, typography, layout grids, or visual hierarchy.
- Checking accessibility, Dynamic Type, contrast, VoiceOver, reduce motion, and localization readiness.
- Making one design work across phones, tablets, desktop, watch, TV, and spatial computing.

Don’t use this skill as the only source for exact pixel measurements, App Store policy, or API behavior. For those, consult current Apple documentation and SDK references.

## Core Design Heuristics

### 1. Content first

- Let user content lead; chrome, controls, and branding should support the task, not compete with it.
- Prefer system-provided navigation, bars, lists, forms, sheets, menus, and symbols before inventing custom UI.
- Remove decorative elements that do not clarify hierarchy, state, or action.

### 2. Native before novel

- Use platform conventions unless there is a strong product reason to diverge.
- Match platform expectations for navigation depth, gestures, keyboard shortcuts, window behavior, menus, and selection.
- If a custom interaction is needed, make it discoverable, reversible, and consistent with nearby system patterns.

### 3. Progressive disclosure

- Present the primary path first.
- Move infrequent, advanced, or destructive actions into menus, inspectors, contextual controls, or confirmation flows.
- Avoid overwhelming first-run and empty states; give one clear next action.

### 4. Direct manipulation and feedback

- Interactions should feel immediate: highlight selection, animate state changes, provide progress, and preserve context.
- Use animation to explain spatial relationships or state transitions; avoid animation that only decorates.
- Respect Reduce Motion and avoid vestibularly intense transitions.

### 5. Forgiveness and trust

- Prefer undo over confirmation when the action is reversible.
- Require explicit confirmation for destructive, expensive, privacy-sensitive, or irreversible actions.
- Make system permissions contextual: ask when the user understands why access is useful.

## Platform Adaptation Matrix

| Platform | Primary context | Design bias | Common navigation | Key checks |
|---|---|---|---|---|
| iOS | handheld, focused tasks, touch | clarity, immediacy, thumb reach | tab bars, navigation stacks, sheets | safe areas, Dynamic Type, one-handed use, permissions in context |
| iPadOS | touch + keyboard/trackpad, multitasking | adaptable layouts, productivity | split views, sidebars, toolbars, multiwindow | size classes, Stage Manager, drag/drop, keyboard shortcuts |
| macOS | pointer, keyboard, windows | density, precision, menu/toolbar depth | sidebars, split views, inspectors, menus | window resizing, menu bar commands, focus rings, keyboard navigation |
| watchOS | glanceable, wrist-sized | brevity, high signal | lists, pages, complications | short copy, large targets, haptics, background updates |
| tvOS | 10-foot, remote focus | cinematic, focus-driven | top tabs, shelves, focus engine | focus states, remote input, overscan/safe areas, readable distance |
| visionOS | spatial, gaze/hand input | depth, comfort, immersion | windows, volumes, ornaments, spaces | legibility in space, motion comfort, depth hierarchy, immersion control |

## Cross-Device Rules

1. **Design the information model once, then adapt presentation per device.** Do not force one layout everywhere.
2. **Keep semantics consistent.** The same object/action should have the same name, icon, color meaning, and state across platforms.
3. **Use responsive containers.** Prefer system layouts that adapt to compact/regular size classes, dynamic type, split view, and window resizing.
4. **Avoid device-specific dead ends.** Features can be optimized by platform, but core data and user progress should remain continuous.
5. **Respect input differences.** Touch targets, pointer hover, keyboard shortcuts, remote focus, Digital Crown, and spatial gestures are not interchangeable.
6. **Preserve platform affordances.** macOS expects menu bar commands; iPadOS expects multitasking; watchOS expects glanceable interactions; visionOS expects comfortable depth and motion.

## Visual Design Checklist

### Hierarchy

- One primary action per screen or region.
- Title, section headers, body text, metadata, and controls have obvious priority.
- Group related controls and separate unrelated groups with spacing, background, material, or sectioning.
- Avoid overusing accent color; reserve it for interactive affordances and key state.

### Layout

- Respect safe areas, keyboard avoidance, navigation bars, tab bars, toolbars, and platform margins.
- Use grids and alignment to create calm structure; don’t rely on arbitrary positioning.
- Design for localization expansion and Dynamic Type before polishing fixed layouts.
- Test compact, regular, landscape, split-screen, and large-window states.

### Color and materials

- Support Light/Dark and high-contrast appearances.
- Use semantic colors where possible rather than hard-coded RGB values.
- Ensure contrast for text, icons, controls, graphs, and status indicators.
- If using materials/translucency/Liquid Glass-like effects, preserve legibility and avoid visual noise behind controls.

### Typography

- Prefer system fonts and text styles so Dynamic Type works naturally.
- Use weight and size sparingly; hierarchy should be clear without many type variants.
- Avoid truncating important labels; write concise labels and allow wrapping where needed.

### Icons and SF Symbols

- Prefer SF Symbols for Apple-native UI.
- Pair icons with labels when meaning may be ambiguous.
- Keep symbol weight, scale, and optical alignment consistent with adjacent text.
- Do not use Apple system symbols for unrelated metaphors or brand marks.

### App icons

- Make the icon simple, distinctive, and recognizable at small sizes.
- Avoid text, screenshots, excessive detail, and UI elements inside the icon.
- Check light/dark/tinted contexts and platform-specific icon shapes.

## Interaction Patterns

### Navigation

- Use tabs for top-level destinations of equal importance, especially on iOS.
- Use navigation stacks for hierarchical drill-down flows.
- Use sidebars when there are many destinations, collections, or persistent navigation needs, especially iPadOS/macOS.
- Use sheets for focused modal tasks; keep them dismissible unless work would be lost.
- Use popovers/context menus for lightweight choices tied to an object.
- Avoid hiding primary navigation behind custom gestures or unclear icons.

### Controls

- Use buttons for actions, toggles for binary persistent states, pickers for choosing one/many options, sliders/steppers for bounded numeric adjustment.
- Make destructive actions visually and semantically distinct; keep them away from frequent safe actions.
- Disable controls only when the reason is obvious or explained; otherwise allow the action and explain what’s missing.

### Feedback and state

- Every tap/click/gesture should produce perceivable feedback.
- Show loading/progress for operations that take noticeable time.
- Prefer skeletons/placeholders only when they preserve layout and reduce perceived wait.
- Empty states should explain what happened and offer a useful next action.
- Error messages should identify the problem, explain recovery, and avoid blame.

### Permissions and privacy

- Ask for permissions when the user initiates a feature that needs them.
- Pre-permission screens should be brief and honest, not coercive.
- Provide graceful fallback when a permission is denied.
- Surface privacy-sensitive data and controls clearly.

## Accessibility Requirements

Treat accessibility as a design constraint, not a final QA pass.

- Support Dynamic Type / scalable text. Avoid fixed-height text containers.
- Provide VoiceOver labels, traits, values, hints, and logical reading order.
- Ensure every interactive element is reachable by keyboard/switch/assistive technologies where platform-appropriate.
- Maintain sufficient contrast in Light, Dark, high contrast, selected, disabled, and error states.
- Do not convey meaning by color alone; pair with text, icon shape, or pattern.
- Respect Reduce Motion, Reduce Transparency, Increase Contrast, Bold Text, and larger text settings.
- Provide captions/transcripts for media and accessible alternatives for visual-only information.
- Keep touch targets comfortably large and separated.

## Apple-Native Implementation Guidance

### SwiftUI

- Prefer semantic containers: `NavigationStack`, `NavigationSplitView`, `TabView`, `List`, `Form`, `ToolbarItem`, `Sheet`, `Popover`, `Menu`, `Commands`.
- Use system text styles and semantic colors instead of fixed sizes/colors where possible.
- Use `@Environment` values for color scheme, size category, horizontal/vertical size class, accessibility settings, locale, layout direction, and scene phase.
- Validate previews for Light/Dark, Dynamic Type, localization, compact/regular layouts, and platform variants.
- Keep view components small and state ownership clear.

### UIKit/AppKit

- Prefer standard controllers and controls before custom drawing.
- Support trait/environment changes, window resizing, keyboard focus, pointer interactions, menus, and accessibility APIs.
- Use Auto Layout or platform layout systems that handle localization and text scaling.

### Web or cross-platform apps targeting Apple feel

- Use Apple conventions carefully without impersonating system UI you cannot faithfully support.
- Match behavior, spacing, hierarchy, typography, and accessibility more than superficial gloss.
- Ensure keyboard, pointer, and screen-reader support is as strong as visual polish.

## Design Review Procedure

When asked to review a design or implementation, respond in this order:

1. **Intent** — identify the user goal and primary task.
2. **Platform fit** — name the target Apple platforms and expected input modes.
3. **HIG alignment** — evaluate hierarchy, harmony, consistency, accessibility, and native patterns.
4. **Top issues** — list the highest-impact problems first, not every nit.
5. **Concrete fixes** — provide component/layout/copy changes and implementation hints.
6. **Cross-device adaptation** — explain how the design should change across iPhone, iPad, Mac, Watch, TV, or Vision if relevant.
7. **Verification checklist** — include test states: Light/Dark, Dynamic Type, localization, VoiceOver, reduced motion, narrow/wide layout.

Use this output template:

```markdown
## Apple HIG Review

### Verdict
<1-3 sentence summary>

### What works
- ...

### Highest-impact fixes
1. ...
2. ...
3. ...

### Platform adaptation
- iPhone: ...
- iPad/Mac: ...
- watchOS/tvOS/visionOS if applicable: ...

### Accessibility checks
- [ ] Dynamic Type
- [ ] VoiceOver labels/order
- [ ] Contrast in Light/Dark/High Contrast
- [ ] Reduce Motion / Reduce Transparency
- [ ] Keyboard/pointer/focus where applicable
```

## Build/Implementation Procedure

When asked to implement UI:

1. Identify target platforms and minimum OS versions from the project.
2. Inspect existing design system/components before adding new ones.
3. Use system components and semantic styles first.
4. Implement responsive states, not just the currently visible screen size.
5. Add accessibility labels, identifiers for UI testing where useful, and previews/snapshots.
6. Verify with platform tooling: Xcode previews, simulator/device, accessibility inspector, unit/UI tests where available.

## Common Pitfalls

1. **Making Apple UI by adding blur only.** Apple-native design is structure, behavior, accessibility, typography, and platform convention — not just glass/translucency.
2. **One layout for all devices.** Cross-device consistency means consistent model and behavior, not identical pixels.
3. **Custom controls without system affordances.** Custom controls often miss focus, VoiceOver, Dynamic Type, keyboard, pointer, and state semantics.
4. **Color-only states.** Always pair color with text, shape, icon, or position.
5. **Ignoring text expansion.** Korean/English/localized strings and larger Dynamic Type can break fixed layouts.
6. **Over-confirming actions.** Use undo for reversible actions; confirm destructive or irreversible actions.
7. **Permissions too early.** Ask at the moment of user intent and provide fallback.
8. **Dense iOS UI copied to watchOS/tvOS/visionOS.** Glanceable, remote, and spatial contexts need different hierarchy and interaction models.

## Verification Checklist

- [ ] The primary task and primary action are obvious within 3 seconds.
- [ ] Standard Apple components are used where appropriate.
- [ ] Layout adapts to compact/regular size classes or relevant window sizes.
- [ ] Light, Dark, increased contrast, and reduced transparency states remain legible.
- [ ] Dynamic Type / large text does not clip or overlap.
- [ ] VoiceOver order and labels make sense.
- [ ] Keyboard/pointer/focus behavior works on iPadOS/macOS/tvOS as relevant.
- [ ] Motion is purposeful and respects Reduce Motion.
- [ ] Empty/loading/error/offline states are designed.
- [ ] Destructive and privacy-sensitive flows are explicit and recoverable.
- [ ] App icon, color, typography, and symbols are checked at small sizes and in context.

## Quick Prompts for Codex

Use these with Codex after installing the plugin/skill:

```text
Use the apple-human-interface-guidelines skill. Review this app's main flow for iOS and iPadOS HIG alignment. Prioritize hierarchy, navigation, accessibility, and cross-device adaptation.
```

```text
Use the apple-human-interface-guidelines skill. Refactor this SwiftUI screen to use native components, Dynamic Type, semantic colors, VoiceOver labels, and adaptive iPhone/iPad layout.
```

```text
Use the apple-human-interface-guidelines skill. Create an Apple HIG checklist for this product before implementation. Include iPhone, iPad, macOS, and visionOS considerations where relevant.
```
