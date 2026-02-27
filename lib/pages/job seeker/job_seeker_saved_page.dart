import 'package:flutter/material.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_apply_page.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_dashboard_page.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_job_detail_page.dart';
import 'package:jobseek/shared/themes.dart';

class JobSeekerSavedPage extends StatefulWidget {
  const JobSeekerSavedPage({super.key});

  @override
  State<JobSeekerSavedPage> createState() => _JobSeekerSavedPageState();
}

class _JobSeekerSavedPageState extends State<JobSeekerSavedPage> {
  int _currentIndex = 2;
  bool _isEditing = false;

  final List<_SavedJobData> _savedJobs = [
    _SavedJobData(
      logoIcon: Icons.apple,
      logoIconColor: Colors.black87,
      logoColor: Colors.black87,
      logoText: 'AP',
      isApple: true,
      companyName: 'Apple Inc.',
      jobTitle: 'iOS Developer',
      salary: r'$1200  $2000',
      tags: ['Fulltime', 'Junior', '1 pax'],
      postedAgo: '1 day ago',
      location: 'California',
    ),
    _SavedJobData(
      logoIcon: Icons.g_mobiledata_rounded,
      logoIconColor: Colors.blue,
      logoColor: Colors.blue,
      logoText: 'GG',
      isApple: false,
      companyName: 'Google LLC',
      jobTitle: 'Software Engineer',
      salary: r'$2000  $3500',
      tags: ['Fulltime', 'Junior', '2 pax'],
      postedAgo: '3 days ago',
      location: 'Seoul',
    ),
    _SavedJobData(
      logoIcon: Icons.all_inclusive_rounded,
      logoIconColor: Color(0xFF0064E0),
      logoColor: Color(0xFF0064E0),
      logoText: 'MT',
      isApple: false,
      companyName: 'Meta Platforms, Inc.',
      jobTitle: 'UI Designer',
      salary: r'$900  $1500',
      tags: ['Part time', 'Junior', '1 pax'],
      postedAgo: '2 days ago',
      location: 'Singapore',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          Expanded(
            child: _savedJobs.isEmpty
                ? _buildEmpty()
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                    itemCount: _savedJobs.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 14),
                    itemBuilder: (context, index) =>
                        _buildJobCard(_savedJobs[index], index),
                  ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  //  Header
  Widget _buildHeader() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8,
        left: 4,
        right: 8,
        bottom: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.chevron_left,
                  size: 30,
                  color: Colors.black87,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                onPressed: () => setState(() => _isEditing = !_isEditing),
                child: Text(
                  _isEditing ? 'Done' : 'Edit',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: _isEditing ? Colors.red : AppColors.primary,
              ),
              child: Text(_isEditing ? 'Edit Saved Jobs' : 'Saved Jobs'),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              _isEditing
                  ? 'Tap  to remove a saved job'
                  : '${_savedJobs.length} job${_savedJobs.length == 1 ? "" : "s"} saved',
              style: TextStyle(
                fontSize: 13,
                color: _isEditing
                    ? Colors.red.withOpacity(0.7)
                    : Colors.black45,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //  Empty State
  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.bookmark_border_rounded,
            size: 72,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          const Text(
            'No saved jobs yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black45,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Save jobs you like and come back later',
            style: TextStyle(fontSize: 13, color: Colors.black38),
          ),
        ],
      ),
    );
  }

  //  Job Card
  Widget _buildJobCard(_SavedJobData job, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  Top row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLogo(job),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.jobTitle,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        job.companyName,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black45,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.attach_money_rounded,
                            size: 14,
                            color: AppColors.secondary,
                          ),
                          Text(
                            job.salary,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppColors.secondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (_isEditing)
                  GestureDetector(
                    onTap: () => setState(() => _savedJobs.removeAt(index)),
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.red.shade200,
                          width: 1.2,
                        ),
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.red,
                        size: 16,
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 12),

            //  Tags
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: job.tags
                  .map(
                    (tag) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),

            const SizedBox(height: 12),
            const Divider(height: 1, color: Color(0xFFEEEEEE)),
            const SizedBox(height: 12),

            //  Date + Location
            Row(
              children: [
                const Icon(
                  Icons.access_time_rounded,
                  size: 13,
                  color: Colors.black38,
                ),
                const SizedBox(width: 3),
                Text(
                  job.postedAgo,
                  style: const TextStyle(fontSize: 11, color: Colors.black45),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.location_on_outlined,
                  size: 13,
                  color: Colors.black38,
                ),
                const SizedBox(width: 2),
                Expanded(
                  child: Text(
                    job.location,
                    style: const TextStyle(fontSize: 11, color: Colors.black45),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            //  Action Buttons
            Row(
              children: [
                // Apply Now
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => JobSeekerApplyPage(
                          title: job.jobTitle,
                          isApple: job.isApple,
                          logoColor: job.logoColor,
                          logoText: job.logoText,
                        ),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 11),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.secondary.withOpacity(0.35),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Apply Now',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // View Details
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => JobDetailPage(
                          title: job.jobTitle,
                          company: job.companyName,
                          isApple: job.isApple,
                          logoColor: job.logoColor,
                          logoText: job.logoText,
                        ),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 11),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.primary,
                          width: 1.5,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'View Details',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //  Logo
  Widget _buildLogo(_SavedJobData job) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: job.logoIconColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: job.logoIconColor.withOpacity(0.2)),
      ),
      child: Icon(job.logoIcon, color: job.logoIconColor, size: 30),
    );
  }

  //  Bottom Nav
  Widget _buildBottomNav() {
    final items = [
      _NavItem(icon: 'assets/icons/home-icon.png', label: 'Home'),
      _NavItem(icon: 'assets/icons/service-icon.png', label: 'Service'),
      _NavItem(icon: 'assets/icons/save-icon.png', label: 'Saved'),
      _NavItem(icon: 'assets/icons/dashboard-icon.png', label: 'Dashboard'),
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              items.length,
              (i) => GestureDetector(
                onTap: () {
                  if (i == _currentIndex) return;
                  if (i == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const JobSeekerDashboardPage(),
                      ),
                    );
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        _currentIndex == i
                            ? AppColors.secondary
                            : Colors.white60,
                        BlendMode.srcIn,
                      ),
                      child: Image.asset(items[i].icon, height: 24, width: 24),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      items[i].label,
                      style: TextStyle(
                        fontSize: 11,
                        color: _currentIndex == i
                            ? AppColors.secondary
                            : Colors.white60,
                        fontWeight: _currentIndex == i
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//  Data Models
class _SavedJobData {
  final IconData logoIcon;
  final Color logoIconColor;
  final Color logoColor;
  final String logoText;
  final bool isApple;
  final String companyName;
  final String jobTitle;
  final String salary;
  final List<String> tags;
  final String postedAgo;
  final String location;

  const _SavedJobData({
    required this.logoIcon,
    required this.logoIconColor,
    required this.logoColor,
    required this.logoText,
    required this.isApple,
    required this.companyName,
    required this.jobTitle,
    required this.salary,
    required this.tags,
    required this.postedAgo,
    required this.location,
  });
}

class _NavItem {
  final String icon;
  final String label;

  const _NavItem({required this.icon, required this.label});
}
