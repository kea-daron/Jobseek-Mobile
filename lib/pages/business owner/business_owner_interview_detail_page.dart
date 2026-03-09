import 'package:flutter/material.dart';
import 'package:jobseek/shared/themes.dart';

class BusinessOwnerInterviewDetailPage extends StatelessWidget {
  final String candidateName;
  final String candidateRole;
  final String candidateImage;

  const BusinessOwnerInterviewDetailPage({
    super.key,
    required this.candidateName,
    required this.candidateRole,
    required this.candidateImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Interview Detail',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Candidate avatar + name
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 52,
                          backgroundImage: AssetImage(candidateImage),
                          backgroundColor: Colors.grey[200],
                        ),
                        const SizedBox(height: 14),
                        Text(
                          candidateName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          candidateRole,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Interview Detail section
                  const Text(
                    'Interview Detail',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 14),

                  _detailRow(
                    icon: Icons.calendar_month_outlined,
                    iconColor: const Color(0xFF1E6FD9),
                    text: 'Date : Nov 11 2025,',
                  ),
                  const SizedBox(height: 10),
                  _detailRow(
                    icon: Icons.access_time_rounded,
                    iconColor: const Color(0xFF1E6FD9),
                    text: 'Time : 10:00 AM',
                  ),
                  const SizedBox(height: 10),
                  _detailRow(
                    icon: Icons.remove_red_eye_outlined,
                    iconColor: const Color(0xFF1E6FD9),
                    text: 'Type : In-person',
                  ),
                  const SizedBox(height: 10),
                  _detailRow(
                    icon: Icons.location_on_outlined,
                    iconColor: const Color(0xFF1E6FD9),
                    text: 'Location : Office (Room Meeting)',
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Status : ',
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                        TextSpan(
                          text: 'Scheduled',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Interviewer section
                  const Text(
                    'Interviewer',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: const AssetImage(
                          'assets/images/meyling.jpg',
                        ),
                        backgroundColor: Colors.grey[200],
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Chhun Meyling',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'HR Team',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Bottom buttons
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      'Reschedule',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      'Mark as Completed',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailRow({
    required IconData icon,
    required Color iconColor,
    required String text,
  }) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 20),
        const SizedBox(width: 10),
        Text(text, style: const TextStyle(fontSize: 14, color: Colors.black87)),
      ],
    );
  }
}
