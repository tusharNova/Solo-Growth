import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants.dart';

/// StatBar displays a live stat (STR, INT, WILL, AGI, PER)
/// with a glowing progress bar and Solo Leveling holographic look.
class StatBar extends StatelessWidget {
  final String code;
  final String name;
  final String domain;
  final int value;
  final int maxValue;
  final Color accentColor;
  final IconData icon;

  const StatBar({
    super.key,
    required this.code,
    required this.name,
    required this.domain,
    required this.value,
    this.maxValue = 100,
    required this.accentColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final double percentage = (value / maxValue).clamp(0.0, 1.0);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: kCardBg,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: kCardBorder,
          width: 1.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Icon + Code + Name + Value
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(
                    color: accentColor.withValues(alpha: 0.4),
                    width: 1.0,
                  ),
                ),
                child: Icon(
                  icon,
                  color: accentColor,
                  size: 16.0,
                ),
              ),
              const SizedBox(width: 8.0),
              Text(
                code,
                style: GoogleFonts.orbitron(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  color: accentColor,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(width: 6.0),
              Expanded(
                child: Text(
                  name,
                  style: GoogleFonts.rajdhani(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: kTextSecondary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '$value / $maxValue',
                style: GoogleFonts.orbitron(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w600,
                  color: kTextPrimary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 6.0),

          // Domain subtitle
          Text(
            domain,
            style: GoogleFonts.rajdhani(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              color: kTextMuted,
            ),
          ),

          const SizedBox(height: 8.0),

          // Glowing Progress Bar
          LayoutBuilder(
            builder: (context, constraints) {
              final double barWidth = constraints.maxWidth;
              final double fillWidth = barWidth * percentage;

              return Stack(
                children: [
                  // Track background
                  Container(
                    height: 8.0,
                    width: barWidth,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F172A),
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.05),
                        width: 1.0,
                      ),
                    ),
                  ),

                  // Active Fill with glow
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeOutCubic,
                    height: 8.0,
                    width: fillWidth,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          accentColor.withValues(alpha: 0.7),
                          accentColor,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                      boxShadow: [
                        BoxShadow(
                          color: accentColor.withValues(alpha: 0.6),
                          blurRadius: 8.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
