import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants.dart';

/// RankBadge displays the player's Hunter Rank (E, D, C, B, A, S)
/// with a glowing Solo Leveling System aesthetic.
class RankBadge extends StatelessWidget {
  final String rank;
  final double size;
  final bool showLabel;

  const RankBadge({
    super.key,
    required this.rank,
    this.size = 54.0,
    this.showLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    final rankUpper = rank.toUpperCase();
    final rankColor = kRankColors[rankUpper] ?? kNeonBlue;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: kCardBg,
            borderRadius: BorderRadius.circular(size * 0.22),
            border: Border.all(
              color: rankColor.withValues(alpha: 0.9),
              width: 2.0,
            ),
            boxShadow: [
              BoxShadow(
                color: rankColor.withValues(alpha: 0.45),
                blurRadius: 14.0,
                spreadRadius: 1.0,
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                rankColor.withValues(alpha: 0.2),
                kCardBg,
              ],
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            rankUpper,
            style: GoogleFonts.orbitron(
              fontSize: size * 0.52,
              fontWeight: FontWeight.w900,
              color: rankColor,
              letterSpacing: 1.0,
              shadows: [
                Shadow(
                  color: rankColor.withValues(alpha: 0.8),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
        ),
        if (showLabel) ...[
          const SizedBox(height: 4),
          Text(
            'RANK $rankUpper',
            style: GoogleFonts.rajdhani(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: rankColor,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ],
    );
  }
}
