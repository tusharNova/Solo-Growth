# ⚔️ ShadowSystem — Personal Growth OS

> *"Arise."*  
> A real-life Solo Leveling system to push your physical, mental, career, and emotional limits every single day.  
> Built by Tushar Mankar. For Tushar Mankar.

---

## 🧠 What Is ShadowSystem?

ShadowSystem is a **personal gamification Flutter app** inspired by the Solo Leveling anime/manhwa.  
The idea is simple: every day, The System assigns you quests. You complete them, you level up. You skip them, you face a penalty. No excuses. No mercy.

This is a **100% offline Flutter app** powered by SQLite. No server. No internet required. Your data stays on your device.

This tracks:
- 💪 **Physical growth** (workouts, pushups, runs)
- 💻 **Career & Technical growth** (DevOps, Flutter, backend, CI/CD)
- 🛡️ **Mental health & Willpower** (saying NO, no people-pleasing, boundaries)
- 📖 **Learning & Side Quests** (new tech, books, courses)
- ❤️ **Social & Emotional Intelligence** (communication, self-respect, love life discipline)

---

## 🛠️ Tech Stack (Pure Flutter, No Server)

| Layer | Technology | Purpose |
| :--- | :--- | :--- |
| **Frontend** | Flutter | All UI screens, navigation, state management |
| **Local Database** | SQLite via `sqflite` package | Store quests, XP, level, stats history |
| **State Management** | Provider or Riverpod | Manage app state cleanly |
| **Local Storage** | `shared_preferences` | Store user settings, rank, current level |
| **Charts** | `fl_chart` | Weekly/Monthly stat progress graphs |
| **Notifications** | `flutter_local_notifications` | Daily quest reminder at set time |

---

## 🗺️ App Screens (Phase 1 MVP)

| Screen | What It Shows |
| :--- | :--- |
| 🏠 **Status Screen** | Your Level, Rank (E→S), and 5 Live Stat Bars (STR, INT, WILL, AGI, PER) |
| ⚔️ **Daily Quests Screen** | 3 Daily Quests to complete (Physical, Mental, Career) |
| 🌙 **Night Review Screen** | Quest completion log, XP earned or Penalty triggered |
| 📊 **Progress Screen** | Weekly/Monthly progress graph of all 5 stats |

---

## 📊 The 5 Core Stats

| Stat | Real-Life Domain | Example Daily Quest |
| :--- | :--- | :--- |
| **STR** 🏋️ | Physical Health & Body | 50 Pushups + 2km Run |
| **INT** 💻 | Career, Code & Learning | 1hr Flutter/DevOps study or build |
| **WILL** 🛡️ | Willpower & Boundaries | Say NO once, zero impulsive reactions |
| **AGI** ⚡ | Execution Speed & Discipline | Complete tasks on time, no delays |
| **PER** 👁️ | Perception & Self-Awareness | 2-min nightly journal + reality check |

---

## 🎨 Design Vision

- **Theme:** Dark background `#0A0A0A`, Neon Blue `#00BFFF` and Purple `#8A2BE2` accents
- **Font:** Bold, futuristic — Google Fonts: `Orbitron` or `Rajdhani`
- **Style:** Solo Leveling System UI panels — glowing cards, neon borders, animated stat bars
- **Rank Colors:** E (Gray) → D (Green) → C (Blue) → B (Purple) → A (Gold) → S (Crimson Red)

---

## 🗂️ Flutter Project Folder Structure

```
shadow_system/
├── GEMINI.md                        ← Antigravity reads this first
├── README.md                        ← This file
│
├── lib/
│   ├── main.dart                    ← App entry point + theme setup
│   ├── app.dart                     ← MaterialApp + routes
│   │
│   ├── screens/
│   │   ├── status_screen.dart       ← Level, Rank, Stat bars
│   │   ├── quest_screen.dart        ← Daily quests list
│   │   ├── review_screen.dart       ← Night review + XP summary
│   │   └── progress_screen.dart     ← Charts and history
│   │
│   ├── models/
│   │   ├── quest.dart               ← Quest data model
│   │   ├── stat.dart                ← Stat model (STR, INT, etc.)
│   │   └── user_profile.dart        ← Level, XP, Rank model
│   │
│   ├── database/
│   │   └── db_helper.dart           ← SQLite setup, CRUD operations
│   │
│   ├── providers/
│   │   ├── quest_provider.dart      ← Quest state management
│   │   └── stats_provider.dart      ← Stats and XP state
│   │
│   └── widgets/
│       ├── stat_bar.dart            ← Reusable glowing stat progress bar
│       ├── quest_card.dart          ← Individual quest card with checkbox
│       └── rank_badge.dart          ← E/D/C/B/A/S rank badge widget
│
├── pubspec.yaml                     ← All Flutter dependencies
└── assets/
    └── fonts/                       ← Orbitron/Rajdhani font files
```

---

## 🚀 Phase-by-Phase Build Plan

### Phase 1 (Week 1): Foundation & UI Shell
- [ ] `flutter create shadow_system` — Initialize project
- [ ] Setup dark neon theme (colors, fonts, global styles)
- [ ] Build Status Screen (Level, Rank badge, 5 Stat bars - hardcoded first)
- [ ] Build Daily Quest Screen (3 quests with checkboxes)

### Phase 2 (Week 2): SQLite + XP Engine
- [ ] Add `sqflite` and set up `db_helper.dart`
- [ ] Create Quest and Stats database tables
- [ ] XP calculation logic (complete quest = +XP, miss = penalty points)
- [ ] Level-up and Rank-up thresholds (E→D→C→B→A→S)
- [ ] Save and load quest completion state from SQLite

### Phase 3 (Week 3): Polish & Notifications
- [ ] Daily local push notification reminder for quests
- [ ] Progress screen with `fl_chart` graphs
- [ ] Night review screen with streak tracking
- [ ] App icon and splash screen (Solo Leveling aesthetic)

### Phase 4 (Later): CI/CD + Play Store
- [ ] GitHub Actions workflow to auto-build Flutter APK
- [ ] Fastlane setup for automated Play Store push

---

## 🔗 Related Personal Files
- 📖 [Personal Diary & Life Playbook](file:///F:/code%20xx/README.md)
- 💔 [Love Life & Boundaries](file:///F:/code%20xx/love_life/current_situation.md)
- 💼 [Career Roadmap](file:///F:/code%20xx/career/office_boundaries.md)
- 🧠 [Mental Health & Willpower](file:///F:/code%20xx/mental_health/grounding_and_peace.md)
