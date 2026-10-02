import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants.dart';
import '../widgets/quest_card.dart';

/// QuestScreen: Displays the Daily Quests assigned by The System.
/// In Phase 1, quests and checkboxes are managed via local state.
/// Phase 2 will persist completion and sync XP with SQLite.
class QuestScreen extends StatefulWidget {
  const QuestScreen({super.key});

  @override
  State<QuestScreen> createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
  // Hardcoded Phase 1 quest completion states
  final Map<String, bool> _questStates = {
    'str_quest': false,
    'int_quest': false,
    'will_quest': false,
  };

  int get _completedCount =>
      _questStates.values.where((done) => done).length;

  int get _totalCount => _questStates.length;

  double get _completionRatio =>
      _totalCount == 0 ? 0.0 : _completedCount / _totalCount;

  void _toggleQuest(String id, bool completed) {
    setState(() {
      _questStates[id] = completed;
    });
  }

  void _claimRewards() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: kCardBg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: const BorderSide(color: kNeonBlue, width: 1.5),
        ),
        title: Row(
          children: [
            const Icon(Icons.stars_rounded, color: kNeonCyan, size: 26),
            const SizedBox(width: 8),
            Text(
              'QUEST REWARD',
              style: GoogleFonts.orbitron(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: kNeonBlue,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '[ SYSTEM NOTIFICATION ]',
              style: GoogleFonts.orbitron(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: kNeonPurple,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'You have completed all daily training objectives. Your physical and mental boundaries have expanded.',
              style: GoogleFonts.rajdhani(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: kTextPrimary,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF0F1B2B),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: kNeonCyan.withValues(alpha: 0.4),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'REWARDS ACQUIRED:',
                    style: GoogleFonts.orbitron(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: kNeonCyan,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '• +160 Total XP\n• +2 Strength (STR)\n• +2 Intelligence (INT)\n• +2 Willpower (WILL)\n• Full Fatigue Recovery',
                    style: GoogleFonts.rajdhani(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: kSuccessGreen,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(
              'ACCEPT',
              style: GoogleFonts.orbitron(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: kNeonBlue,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool allComplete = _completedCount == _totalCount;

    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: kNeonCyan,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: kNeonCyan,
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'DAILY QUESTS',
              style: GoogleFonts.orbitron(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: kNeonCyan,
                letterSpacing: 2.0,
                shadows: const [
                  Shadow(
                    color: kNeonBlueGlow,
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Penalty Warning Banner
              _buildPenaltyWarningCard(),

              const SizedBox(height: 16.0),

              // 2. Daily Quest Progress Bar
              _buildProgressCard(),

              const SizedBox(height: 20.0),

              // 3. Section Title
              Text(
                'ACTIVE OBJECTIVES',
                style: GoogleFonts.orbitron(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  color: kTextPrimary,
                  letterSpacing: 1.5,
                ),
              ),

              const SizedBox(height: 8.0),

              // Quest 1: STR (Physical Health)
              QuestCard(
                title: 'Physical Conditioning',
                description:
                    '50 Pushups • 50 Squats • 2km Run or 30-min brisk walk. Forge physical endurance.',
                statCode: 'STR',
                statColor: const Color(0xFFEF4444),
                reward: '+50 XP • +2 STR',
                isCompleted: _questStates['str_quest'] ?? false,
                onToggle: (val) => _toggleQuest('str_quest', val),
              ),

              // Quest 2: INT (Career & Technical Mastery)
              QuestCard(
                title: 'Technical Awakening',
                description:
                    '60 minutes of deep Flutter / DevOps / CI-CD architecture study or hands-on building.',
                statCode: 'INT',
                statColor: const Color(0xFF00BFFF),
                reward: '+60 XP • +2 INT',
                isCompleted: _questStates['int_quest'] ?? false,
                onToggle: (val) => _toggleQuest('int_quest', val),
              ),

              // Quest 3: WILL (Boundaries & Mental Discipline)
              QuestCard(
                title: 'Iron Boundaries',
                description:
                    'Say NO to unplanned office overload. Practice zero impulsive reactions and preserve mental peace.',
                statCode: 'WILL',
                statColor: const Color(0xFF8A2BE2),
                reward: '+50 XP • +2 WILL',
                isCompleted: _questStates['will_quest'] ?? false,
                onToggle: (val) => _toggleQuest('will_quest', val),
              ),

              const SizedBox(height: 20.0),

              // 4. Claim Reward Action Button
              ElevatedButton(
                onPressed: allComplete ? _claimRewards : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: allComplete ? kNeonBlue : const Color(0xFF1E2638),
                  disabledBackgroundColor: const Color(0xFF161F30),
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(
                      color: allComplete
                          ? kNeonCyan
                          : Colors.white.withValues(alpha: 0.1),
                      width: 1.5,
                    ),
                  ),
                  elevation: allComplete ? 8 : 0,
                  shadowColor: kNeonBlueGlow,
                ),
                child: Text(
                  allComplete ? 'CLAIM REWARDS [ COMPLETED ]' : 'COMPLETE ALL TO CLAIM',
                  style: GoogleFonts.orbitron(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w800,
                    color: allComplete ? Colors.black : kTextMuted,
                    letterSpacing: 1.5,
                  ),
                ),
              ),

              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }

  /// System Penalty Warning Card
  Widget _buildPenaltyWarningCard() {
    return Container(
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1215),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: kPenaltyRed.withValues(alpha: 0.7),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: kPenaltyRed.withValues(alpha: 0.2),
            blurRadius: 12.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            color: kPenaltyRed,
            size: 24.0,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '[ PENALTY PROTOCOL ]',
                  style: GoogleFonts.orbitron(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w800,
                    color: kPenaltyRed,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 3.0),
                Text(
                  'Failure to complete all daily quests before 00:00 will trigger the Penalty Zone quest. The System does not tolerate stagnation.',
                  style: GoogleFonts.rajdhani(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                    color: kTextSecondary,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Progress Summary Card with glowing progress bar
  Widget _buildProgressCard() {
    return Container(
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: kCardBg,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: kCardBorder,
          width: 1.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'QUEST COMPLETION',
                style: GoogleFonts.rajdhani(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w700,
                  color: kTextSecondary,
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                '$_completedCount / $_totalCount COMPLETED',
                style: GoogleFonts.orbitron(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700,
                  color: _completedCount == _totalCount
                      ? kSuccessGreen
                      : kNeonCyan,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Stack(
            children: [
              Container(
                height: 8.0,
                decoration: BoxDecoration(
                  color: const Color(0xFF0F172A),
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              FractionallySizedBox(
                widthFactor: _completionRatio,
                child: Container(
                  height: 8.0,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [kNeonPurple, kNeonCyan],
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                    boxShadow: const [
                      BoxShadow(
                        color: kNeonBlueGlow,
                        blurRadius: 8.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
