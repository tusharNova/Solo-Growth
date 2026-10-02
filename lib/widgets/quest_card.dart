import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants.dart';

/// QuestCard displays a single Daily Quest item with Solo Leveling aesthetic.
/// It includes the quest category, title, description, reward XP, and a custom checkbox.
class QuestCard extends StatelessWidget {
  final String title;
  final String description;
  final String statCode;
  final Color statColor;
  final String reward;
  final bool isCompleted;
  final ValueChanged<bool> onToggle;

  const QuestCard({
    super.key,
    required this.title,
    required this.description,
    required this.statCode,
    required this.statColor,
    required this.reward,
    required this.isCompleted,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onToggle(!isCompleted),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          color: isCompleted ? const Color(0xFF0F1A26) : kCardBg,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: isCompleted
                ? kSuccessGreen.withValues(alpha: 0.8)
                : kCardBorder,
            width: isCompleted ? 1.5 : 1.0,
          ),
          boxShadow: isCompleted
              ? [
                  BoxShadow(
                    color: kSuccessGreen.withValues(alpha: 0.2),
                    blurRadius: 12.0,
                    spreadRadius: 1.0,
                  ),
                ]
              : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom Solo Leveling Glowing Checkbox
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(top: 2.0),
              width: 26.0,
              height: 26.0,
              decoration: BoxDecoration(
                color: isCompleted ? kSuccessGreen : const Color(0xFF0D131F),
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(
                  color: isCompleted
                      ? kSuccessGreen
                      : kNeonBlue.withValues(alpha: 0.6),
                  width: 1.5,
                ),
                boxShadow: isCompleted
                    ? [
                        const BoxShadow(
                          color: Color(0x6610B981),
                          blurRadius: 8.0,
                          spreadRadius: 1.0,
                        ),
                      ]
                    : null,
              ),
              child: isCompleted
                  ? const Icon(
                      Icons.check,
                      size: 18.0,
                      color: Colors.black,
                    )
                  : null,
            ),

          const SizedBox(width: 14.0),

          // Quest Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category Tag + Reward Tag
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7.0,
                        vertical: 2.0,
                      ),
                      decoration: BoxDecoration(
                        color: statColor.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                          color: statColor.withValues(alpha: 0.5),
                          width: 1.0,
                        ),
                      ),
                      child: Text(
                        statCode,
                        style: GoogleFonts.orbitron(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w700,
                          color: statColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7.0,
                        vertical: 2.0,
                      ),
                      decoration: BoxDecoration(
                        color: kNeonCyan.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        reward,
                        style: GoogleFonts.rajdhani(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                          color: kNeonCyan,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8.0),

                // Title
                Text(
                  title,
                  style: GoogleFonts.orbitron(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                    color: isCompleted ? kTextSecondary : kTextPrimary,
                    decoration:
                        isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),

                const SizedBox(height: 4.0),

                // Description
                Text(
                  description,
                  style: GoogleFonts.rajdhani(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w500,
                    color: isCompleted ? kTextMuted : kTextSecondary,
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
