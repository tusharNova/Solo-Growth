# GEMINI.md — ShadowSystem Project Context & Instructions

## 🎯 Project Identity
- **App Name:** ShadowSystem
- **Flutter Package Name:** shadow_system
- **Owner:** Tushar Gaurishankar Mankar
- **Purpose:** A real-life personal gamification Flutter app inspired by Solo Leveling.
- **Architecture:** 100% Flutter + SQLite. No backend server. No internet required. Fully offline.

---

## 👤 About the Developer (Tushar)
- **Role:** Python Full Stack & DevOps Engineer (transitioning to Full-Time at Zappcode)
- **Tech Stack Known:** Python, FastAPI, Django, PostgreSQL, GitHub Actions, CI/CD, Linux servers
- **Learning NOW:** Flutter (beginner - focus on clean widget architecture, SQLite, state management)
- **Primary Goal:** Learn Flutter deeply by building something personally meaningful and motivating.

---

## 🛠️ Tech Stack (Locked)
- **UI:** Flutter with dark neon Solo Leveling theme
- **Database:** SQLite via `sqflite` Flutter package (all data stored locally on device)
- **State Management:** Provider or Riverpod
- **Charts:** fl_chart
- **Notifications:** flutter_local_notifications
- **NO backend server. NO API calls. NO Firebase. Keep it simple and Flutter-first.**

---

## 🧠 Agent Operating Rules

### 1. Flutter Focus First
- This is a Flutter learning project. Always explain Dart/Flutter concepts clearly when introducing new patterns.
- Prefer simple, readable code over clever abstractions for now.
- Always separate concerns: screens/, models/, database/, providers/, widgets/

### 2. Python/Backend Rules (If Ever Needed)
- Use `uv run ...` for all Python commands. Never bare `python` or `pip`.

### 3. SQLite Rules
- All data goes through `db_helper.dart` only. No direct SQLite calls from screens.
- Tables: `quests`, `stats`, `user_profile`, `quest_log`

### 4. Code Style
- Every screen is a separate file in `lib/screens/`
- Every reusable UI component is in `lib/widgets/`
- No business logic inside Widget build() methods

### 5. File Update Protocol
- After every completed phase item, tick it in README.md checklist
- Keep GEMINI.md updated if scope changes

---

## 📱 Current Build Status

### Done
- [x] Project folder: F:\flutter\shadow_system
- [x] README.md — Full project plan written
- [x] GEMINI.md — Full context written

### Next Step (Start Here)
- [ ] Run `flutter doctor` to verify Flutter setup is healthy
- [ ] Run `flutter create shadow_system` inside F:\flutter\shadow_system
- [ ] Add dependencies to pubspec.yaml (sqflite, provider, fl_chart, flutter_local_notifications, google_fonts)
- [ ] Set up dark neon theme in main.dart
- [ ] Build Status Screen first

---

## 🎨 Design System

### Colors
```dart
const Color kBackground = Color(0xFF0A0A0A);     // Deep black
const Color kNeonBlue = Color(0xFF00BFFF);        // Neon blue (primary)
const Color kNeonPurple = Color(0xFF8A2BE2);      // Purple (secondary)
const Color kCardBg = Color(0xFF111827);          // Dark card background
const Color kTextPrimary = Color(0xFFFFFFFF);     // White text
const Color kTextSecondary = Color(0xFF9CA3AF);   // Gray text
```

### Rank Colors
```dart
const Map<String, Color> kRankColors = {
  'E': Color(0xFF9CA3AF),   // Gray
  'D': Color(0xFF22C55E),   // Green
  'C': Color(0xFF3B82F6),   // Blue
  'B': Color(0xFF8A2BE2),   // Purple
  'A': Color(0xFFEAB308),   // Gold
  'S': Color(0xFFEF4444),   // Crimson Red
};
```

### Font
- Google Fonts: `Orbitron` (headings/stats) and `Rajdhani` (body text)

---

## 📊 The 5 Core Stats
- STR (Strength) - Physical health
- INT (Intelligence) - Career and learning
- WILL (Willpower) - Boundaries and mental discipline
- AGI (Agility) - Execution speed
- PER (Perception) - Self-awareness and daily review

---

## 🔗 Related Personal Context
- Personal Diary: F:\code xx\README.md
- Mental Health: F:\code xx\mental_health\grounding_and_peace.md
- Career: F:\code xx\career\office_boundaries.md
- Love Life: F:\code xx\love_life\current_situation.md
