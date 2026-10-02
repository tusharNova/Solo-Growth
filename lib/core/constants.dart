import 'package:flutter/material.dart';

/// ShadowSystem Global Constants & Theme Configuration
/// Inspired by the Solo Leveling System UI

// --- System Colors ---
const Color kBackground = Color(0xFF0A0A0A); // Deep black void
const Color kCardBg = Color(0xFF111827); // Dark card slate background
const Color kCardSurface = Color(0xFF161F30); // Slightly raised card surface
const Color kCardBorder = Color(0xFF1F2E45); // Subtle border

// Neon Accents
const Color kNeonBlue = Color(0xFF00BFFF); // Neon Deep Sky Blue (Primary System color)
const Color kNeonCyan = Color(0xFF00E5FF); // Electric Cyan highlight
const Color kNeonPurple = Color(0xFF8A2BE2); // Solo Leveling purple accent
const Color kNeonBlueGlow = Color(0x6600BFFF); // Blue glow for box shadows
const Color kNeonPurpleGlow = Color(0x668A2BE2); // Purple glow for shadow effects

// Status Colors
const Color kPenaltyRed = Color(0xFFEF4444); // Crimson red (System Penalty / S-Rank)
const Color kWarningAmber = Color(0xFFF59E0B); // Amber warning / A-Rank
const Color kSuccessGreen = Color(0xFF10B981); // Quest complete green

// Typography Colors
const Color kTextPrimary = Color(0xFFFFFFFF); // High-emphasis white
const Color kTextSecondary = Color(0xFF9CA3AF); // Mid-emphasis gray
const Color kTextMuted = Color(0xFF6B7280); // Low-emphasis disabled text

// --- Rank Colors (Solo Leveling Ranks: E -> S) ---
const Map<String, Color> kRankColors = {
  'E': Color(0xFF9CA3AF), // Gray (Awakened Hunter / Novice)
  'D': Color(0xFF22C55E), // Green
  'C': Color(0xFF3B82F6), // Blue
  'B': Color(0xFF8A2BE2), // Purple
  'A': Color(0xFFEAB308), // Gold
  'S': Color(0xFFEF4444), // Crimson Red (Monarch level)
};

// --- Stat Definitions ---
class StatInfo {
  final String code;
  final String name;
  final String domain;
  final IconData icon;
  final Color accentColor;

  const StatInfo({
    required this.code,
    required this.name,
    required this.domain,
    required this.icon,
    required this.accentColor,
  });
}

const List<StatInfo> kSystemStats = [
  StatInfo(
    code: 'STR',
    name: 'Strength',
    domain: 'Physical Health & Body',
    icon: Icons.fitness_center_rounded,
    accentColor: Color(0xFFEF4444),
  ),
  StatInfo(
    code: 'INT',
    name: 'Intelligence',
    domain: 'Career, Code & Learning',
    icon: Icons.terminal_rounded,
    accentColor: Color(0xFF00BFFF),
  ),
  StatInfo(
    code: 'WILL',
    name: 'Willpower',
    domain: 'Boundaries & Mental Discipline',
    icon: Icons.shield_rounded,
    accentColor: Color(0xFF8A2BE2),
  ),
  StatInfo(
    code: 'AGI',
    name: 'Agility',
    domain: 'Execution Speed & Momentum',
    icon: Icons.bolt_rounded,
    accentColor: Color(0xFFF59E0B),
  ),
  StatInfo(
    code: 'PER',
    name: 'Perception',
    domain: 'Self-Awareness & Daily Review',
    icon: Icons.visibility_rounded,
    accentColor: Color(0xFF10B981),
  ),
];
