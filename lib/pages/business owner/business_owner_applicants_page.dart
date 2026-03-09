import 'package:flutter/material.dart';
import 'package:jobseek/pages/business%20owner/business_owner_candidate_profile_page.dart';
import 'package:jobseek/shared/themes.dart';

class BusinessOwnerApplicantsPage extends StatefulWidget {
  final String jobTitle;

  const BusinessOwnerApplicantsPage({super.key, required this.jobTitle});

  @override
  State<BusinessOwnerApplicantsPage> createState() =>
      _BusinessOwnerApplicantsPageState();
}

class _BusinessOwnerApplicantsPageState
    extends State<BusinessOwnerApplicantsPage> {
  late List<_Applicant> _applicants;

  @override
  void initState() {
    super.initState();
    _applicants = [
      _Applicant(
        name: 'Zhao Lusi',
        role: 'Flutter app Team Leader',
        appliedDate: 'Apr 20, 2025',
        image: 'assets/images/kea_chanthorn.JPG',
        rejected: false,
        shortlisted: false,
      ),
      _Applicant(
        name: 'Bai Lu',
        role: 'Flutter app Team Leader',
        appliedDate: 'Apr 20, 2025',
        image: 'assets/images/meyling.jpg',
        rejected: false,
        shortlisted: false,
      ),
      _Applicant(
        name: 'Chen Si',
        role: 'Flutter app Team Leader',
        appliedDate: 'Apr 20, 2025',
        image: 'assets/images/candidate_male.jpg',
        rejected: false,
        shortlisted: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final active = _applicants.where((a) => !a.rejected).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Applicants ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: '${active.length}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
      body: active.isEmpty
          ? const Center(
              child: Text(
                'No applicants',
                style: TextStyle(color: Colors.grey),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemCount: active.length,
              separatorBuilder: (_, __) => const SizedBox(height: 14),
              itemBuilder: (_, i) {
                final idx = _applicants.indexOf(active[i]);
                return _buildCard(_applicants[idx], idx);
              },
            ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildCard(_Applicant applicant, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar + info
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(applicant.image),
                backgroundColor: Colors.grey[200],
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    applicant.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    applicant.role,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Applied . ${applicant.appliedDate}',
                    style: const TextStyle(fontSize: 12, color: Colors.black45),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Portfolio + CV row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Profile Portfolio',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primary,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'CV.pdf',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Action buttons
          Row(
            children: [
              _actionButton(
                label: 'View Profile',
                filled: false,
                color: AppColors.primary,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BusinessOwnerCandidateProfilePage(
                      name: applicant.name,
                      role: applicant.role,
                      image: applicant.image,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              _actionButton(
                label: applicant.shortlisted
                    ? 'Shortlisted ✓'
                    : 'Add to Shortlist',
                filled: true,
                color: AppColors.primary,
                onTap: () {
                  setState(() {
                    _applicants[index] = _Applicant(
                      name: applicant.name,
                      role: applicant.role,
                      appliedDate: applicant.appliedDate,
                      image: applicant.image,
                      rejected: applicant.rejected,
                      shortlisted: !applicant.shortlisted,
                    );
                  });
                },
              ),
              const SizedBox(width: 8),
              _actionButton(
                label: 'Reject',
                filled: false,
                color: const Color(0xFFE74C3C),
                onTap: () {
                  setState(() {
                    _applicants[index] = _Applicant(
                      name: applicant.name,
                      role: applicant.role,
                      appliedDate: applicant.appliedDate,
                      image: applicant.image,
                      rejected: true,
                      shortlisted: applicant.shortlisted,
                    );
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionButton({
    required String label,
    required bool filled,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 9),
          decoration: BoxDecoration(
            color: filled ? color : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: color, width: 1.4),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: filled ? Colors.white : color,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: 3,
        onTap: (index) {
          if (index == 3) return;
          Navigator.pop(context);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.secondary,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        backgroundColor: Colors.white,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            label: 'Service',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Interview',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
          ),
        ],
      ),
    );
  }
}

class _Applicant {
  final String name;
  final String role;
  final String appliedDate;
  final String image;
  final bool rejected;
  final bool shortlisted;

  const _Applicant({
    required this.name,
    required this.role,
    required this.appliedDate,
    required this.image,
    required this.rejected,
    required this.shortlisted,
  });
}
