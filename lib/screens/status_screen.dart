import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants.dart';
import '../widgets/rank_badge.dart';
import '../widgets/stat_bar.dart';

/// StatusScreen: The primary Hunter Status Window.
/// Inspired by the Solo Leveling System UI.
class StatusScreen extends StatelessWidget {
  final VoidCallback? onNavigateToQuests;

  const StatusScreen({
    super.key,
    this.onNavigateToQuests,
  });

  @override
  Widget build(BuildContext context) {
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
                color: kNeonBlue,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: kNeonBlue,
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'STATUS WINDOW',
              style: GoogleFonts.orbitron(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: kNeonBlue,
                letterSpacing: 2.0,
                shadows: [
                  const Shadow(
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
              // 1. Hunter Profile Card
              _buildHunterProfileCard(),

              const SizedBox(height: 16),

              // 2. System Alert / Quest Reminder Banner
              _buildSystemAlertBanner(context),

              const SizedBox(height: 20),

              // 3. Core Stats Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'CORE ATTRIBUTES',
                    style: GoogleFonts.orbitron(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: kTextPrimary,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: kCardBg,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: kNeonBlue.withValues(alpha: 0.4),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      'POINTS: 0',
                      style: GoogleFonts.rajdhani(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: kNeonBlue,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // 4. Live 5 Stat Bars (STR, INT, WILL, AGI, PER)
              const StatBar(
                code: 'STR',
                name: 'Strength',
                domain: 'Physical Health & Body',
                value: 12,
                maxValue: 100,
                accentColor: Color(0xFFEF4444),
                icon: Icons.fitness_center_rounded,
              ),
              const StatBar(
                code: 'INT',
                name: 'Intelligence',
                domain: 'Career, Code & Learning',
                value: 15,
                maxValue: 100,
                accentColor: Color(0xFF00BFFF),
                icon: Icons.terminal_rounded,
              ),
              const StatBar(
                code: 'WILL',
                name: 'Willpower',
                domain: 'Boundaries & Mental Discipline',
                value: 10,
                maxValue: 100,
                accentColor: Color(0xFF8A2BE2),
                icon: Icons.shield_rounded,
              ),
              const StatBar(
                code: 'AGI',
                name: 'Agility',
                domain: 'Execution Speed & Momentum',
                value: 14,
                maxValue: 100,
                accentColor: Color(0xFFF59E0B),
                icon: Icons.bolt_rounded,
              ),
              const StatBar(
                code: 'PER',
                name: 'Perception',
                domain: 'Self-Awareness & Daily Review',
                value: 11,
                maxValue: 100,
                accentColor: Color(0xFF10B981),
                icon: Icons.visibility_rounded,
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the Hunter Profile Box (Name, Title, Rank, Level, and XP progress)
  Widget _buildHunterProfileCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: kCardBg,
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(
          color: kNeonBlue.withValues(alpha: 0.5),
          width: 1.5,
        ),
        boxShadow: const [
          BoxShadow(
            color: kNeonBlueGlow,
            blurRadius: 18.0,
            spreadRadius: -2.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Hunter Name, Title, and Rank Badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TUSHAR MANKAR',
                      style: GoogleFonts.orbitron(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: kTextPrimary,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'TITLE: SHADOW MONARCH',
                      style: GoogleFonts.rajdhani(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: kNeonPurple,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          'LEVEL ',
                          style: GoogleFonts.rajdhani(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: kTextSecondary,
                            letterSpacing: 1.0,
                          ),
                        ),
                        Text(
                          '1',
                          style: GoogleFonts.orbitron(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: kNeonBlue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Rank Badge (Initial Rank E)
              const RankBadge(
                rank: 'E',
                size: 58,
                showLabel: true,
              ),
            ],
          ),

          const SizedBox(height: 14),

          // XP Progress Bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'XP PROGRESS',
                style: GoogleFonts.rajdhani(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: kTextSecondary,
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                '350 / 1000 XP (35%)',
                style: GoogleFonts.orbitron(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: kNeonCyan,
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          // Glowing XP Bar
          Stack(
            children: [
              Container(
                height: 10,
                decoration: BoxDecoration(
                  color: const Color(0xFF0A101D),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.35,
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [kNeonPurple, kNeonCyan],
                    ),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: kNeonBlueGlow,
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Fatigue & Status row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.bolt_rounded,
                    color: kSuccessGreen,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'FATIGUE: 0',
                    style: GoogleFonts.rajdhani(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: kSuccessGreen,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.shield_outlined,
                    color: kTextSecondary,
                    size: 15,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'STATUS: ACTIVE',
                    style: GoogleFonts.rajdhani(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: kTextSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Builds the Solo Leveling System Notice Banner
  Widget _buildSystemAlertBanner(BuildContext context) {
    return GestureDetector(
      onTap: onNavigateToQuests,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: const Color(0xFF161B2E),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: kNeonPurple.withValues(alpha: 0.6),
            width: 1.2,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: kNeonPurple.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.notifications_active_rounded,
                color: kNeonPurple,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '[ SYSTEM NOTICE ]',
                        style: GoogleFonts.orbitron(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: kNeonPurple,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Text(
                        'OPEN >',
                        style: GoogleFonts.orbitron(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: kNeonCyan,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'Daily Quests have been assigned. Complete all objectives before midnight to avoid Penalty Quest.',
                    style: GoogleFonts.rajdhani(
                      fontSize: 13,
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
      ),
    );
  }
}
