import 'package:flutter/material.dart';
import 'package:jobseek/pages/business%20owner/business_owner_applicants_page.dart';
import 'package:jobseek/pages/business%20owner/business_owner_shortlist_page.dart';
import 'package:jobseek/shared/themes.dart';

class BusinessOwnerActiveJobPage extends StatelessWidget {
  const BusinessOwnerActiveJobPage({super.key});

  static const _jobs = [
    _ActiveJob(
      logoText: 'ABA',
      logoColor: Color(0xFF1A5276),
      salary: '\$ 500 - \$1000',
      title: 'UI designer',
      location: 'Phnom Penh, Toulkok',
      tags: ['Full Time', 'Junior', '1 pax'],
    ),
    _ActiveJob(
      logoText: 'in',
      logoColor: Color(0xFFE74C3C),
      salary: '\$ 500 - \$1000',
      title: 'Software Engineering',
      location: 'Phnom Penh, Toulkok',
      tags: ['Full Time', 'Junior', '1 pax'],
    ),
    _ActiveJob(
      logoText: '',
      logoColor: Color(0xFF1C1C1C),
      salary: '\$ 500 - \$1000',
      title: 'Flutter Mobile app',
      location: 'Phnom Penh, Toulkok',
      tags: ['Full Time', 'Junior', '1 pax'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Active Job Post',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        itemCount: _jobs.length,
        separatorBuilder: (_, __) => const SizedBox(height: 14),
        itemBuilder: (_, i) => _buildJobCard(context, _jobs[i]),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildJobCard(BuildContext context, _ActiveJob job) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo + arrow icon
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLogo(job),
              const Spacer(),
              const Icon(
                Icons.open_in_new_rounded,
                color: AppColors.primary,
                size: 20,
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Salary + tags row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.salary,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      job.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      job.location,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: job.tags
                    .map(
                      (t) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.primary,
                            width: 1.2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          t,
                          style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Applicants + Shortlist buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          BusinessOwnerApplicantsPage(jobTitle: job.title),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: const Text(
                    'Applicants',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          BusinessOwnerShortlistPage(jobTitle: job.title),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: const Text(
                    'Shortlist',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Active chip + View Details
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFD5F5E3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Active',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF27AE60),
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'View Details',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLogo(_ActiveJob job) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: job.logoColor,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: job.logoText.isNotEmpty
          ? Text(
              job.logoText,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            )
          : const Icon(Icons.circle, color: Colors.white, size: 24),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
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

class _ActiveJob {
  final String logoText;
  final Color logoColor;
  final String salary;
  final String title;
  final String location;
  final List<String> tags;

  const _ActiveJob({
    required this.logoText,
    required this.logoColor,
    required this.salary,
    required this.title,
    required this.location,
    required this.tags,
  });
}
