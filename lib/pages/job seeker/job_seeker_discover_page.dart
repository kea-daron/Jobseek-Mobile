import 'package:flutter/material.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_apply_page.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_job_detail_page.dart';
import 'package:jobseek/shared/themes.dart';

class JobSeekerDiscoverPage extends StatefulWidget {
  const JobSeekerDiscoverPage({super.key});

  @override
  State<JobSeekerDiscoverPage> createState() => _JobSeekerDiscoverPageState();
}

class _JobSeekerDiscoverPageState extends State<JobSeekerDiscoverPage> {
  int _currentIndex = 0;
  final Set<int> _savedJobs = {};

  static const _suggestedJobs = [
    _DiscoverJobData(
      logoText: '',
      logoAsset: null,
      logoColor: Color(0xFF555555),
      isApple: true,
      title: 'iOS Developer',
      company: 'Apple Inc.',
      tags: ['Fulltime', 'Junior', '1 pax'],
      postedAgo: '1 day ago',
      location: 'California',
    ),
    _DiscoverJobData(
      logoText: 'G',
      logoAsset: null,
      logoColor: Color(0xFF4285F4),
      isApple: false,
      title: 'Software Engineer',
      company: 'Google LLC',
      tags: ['Fulltime', 'Junior', '2 pax'],
      postedAgo: '3 days ago',
      location: 'Seoul',
    ),
    _DiscoverJobData(
      logoText: 'M',
      logoAsset: null,
      logoColor: Color(0xFF0866FF),
      isApple: false,
      title: 'UI Designer',
      company: 'Meta Platforms, Inc.',
      tags: ['Part time', 'Junior', '1 pax'],
      postedAgo: '2 days ago',
      location: 'Singapore',
    ),
    _DiscoverJobData(
      logoText: 'A',
      logoAsset: null,
      logoColor: Color(0xFFFF9900),
      isApple: false,
      title: 'Cloud Architect',
      company: 'Amazon Web Services',
      tags: ['Fulltime', 'Senior', '3 pax'],
      postedAgo: '5 days ago',
      location: 'Remote',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _buildHeroText(),
                  const SizedBox(height: 24),
                  _buildSuggestedJobs(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  // ─── Header ──────────────────────────────────────────────────────────────
  Widget _buildHeader() {
    return Container(
      color: AppColors.primary,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage('assets/images/meyling.jpg'),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Welcome',
                        style: TextStyle(fontSize: 12, color: Colors.white70),
                      ),
                      Text(
                        'CHANMEY!',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    Icons.notifications_none_rounded,
                    color: AppColors.secondary,
                    size: 28,
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Container(
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 14),
                    const Icon(Icons.search, color: Colors.black38, size: 20),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'What position are you looking for?',
                        style: TextStyle(color: Colors.black38, fontSize: 13),
                      ),
                    ),
                    Container(
                      width: 38,
                      height: 38,
                      margin: const EdgeInsets.only(right: 3),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        Icons.tune,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ─── Hero Text ────────────────────────────────────────────────────────────
  Widget _buildHeroText() {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              height: 1.2,
            ),
            children: [
              TextSpan(
                text: 'GET YOUR ',
                style: TextStyle(color: AppColors.primary),
              ),
              TextSpan(
                text: 'DREAM ',
                style: TextStyle(color: AppColors.secondary),
              ),
              TextSpan(text: '🐥 '),
              TextSpan(
                text: 'JOB',
                style: TextStyle(color: AppColors.primary),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Explore thousands of opportunities, and\napply effortlessly!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  // ─── Suggested Jobs ───────────────────────────────────────────────────────
  Widget _buildSuggestedJobs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Suggested Jobs',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 12),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _suggestedJobs.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, i) => _buildJobCard(_suggestedJobs[i], i),
        ),
      ],
    );
  }

  Widget _buildJobCard(_DiscoverJobData job, int index) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo + title + save
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
                      job.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: AppColors.primary,
                      ),
                    ),
                    Text(
                      job.company,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  if (_savedJobs.contains(index)) {
                    _savedJobs.remove(index);
                  } else {
                    _savedJobs.add(index);
                  }
                }),
                child: Image.asset(
                  'assets/icons/save-icon.png',
                  height: 20,
                  width: 20,
                  color: _savedJobs.contains(index)
                      ? Colors.red
                      : Colors.black38,
                  colorBlendMode: BlendMode.srcATop,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Tags
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
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(t, style: const TextStyle(fontSize: 11)),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 10),
          // Date + location + action buttons
          Row(
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                size: 13,
                color: Colors.black45,
              ),
              const SizedBox(width: 4),
              Text(
                job.postedAgo,
                style: const TextStyle(fontSize: 11, color: Colors.black45),
              ),
              const SizedBox(width: 12),
              const Icon(
                Icons.location_on_outlined,
                size: 13,
                color: Colors.black45,
              ),
              const SizedBox(width: 2),
              Text(
                job.location,
                style: const TextStyle(fontSize: 11, color: Colors.black45),
              ),
              const Spacer(),
              _actionButton(
                'Apply Now',
                AppColors.secondary,
                Colors.white,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => JobSeekerApplyPage(
                      title: job.title,
                      isApple: job.isApple,
                      logoColor: job.logoColor,
                      logoText: job.logoText,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              _actionButton(
                'Details',
                AppColors.primary,
                Colors.white,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => JobDetailPage(
                      title: job.title,
                      company: job.company,
                      isApple: job.isApple,
                      logoColor: job.logoColor,
                      logoText: job.logoText,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLogo(_DiscoverJobData job) {
    if (job.isApple) {
      return Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: const Icon(Icons.apple, size: 30, color: Colors.black87),
      );
    }
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: job.logoColor.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text(
        job.logoText,
        style: TextStyle(
          color: job.logoColor,
          fontWeight: FontWeight.w900,
          fontSize: 22,
        ),
      ),
    );
  }

  Widget _actionButton(
    String label,
    Color bg,
    Color fg, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: fg,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // ─── Bottom Nav ───────────────────────────────────────────────────────────
  Widget _buildBottomNav(BuildContext context) {
    final items = [
      _NavItem(icon: 'assets/icons/home-icon.png', label: 'Home'),
      _NavItem(icon: 'assets/icons/service-icon.png', label: 'Service'),
      _NavItem(icon: 'assets/icons/save-icon.png', label: 'Saved'),
      _NavItem(icon: 'assets/icons/dashboard-icon.png', label: 'Dashboard'),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
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
                  if (i == 0) {
                    Navigator.pop(context);
                  } else {
                    setState(() => _currentIndex = i);
                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        _currentIndex == i && i != 0
                            ? AppColors.secondary
                            : i == 0
                            ? AppColors.secondary
                            : Colors.black45,
                        BlendMode.srcIn,
                      ),
                      child: Image.asset(items[i].icon, height: 24, width: 24),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      items[i].label,
                      style: TextStyle(
                        fontSize: 11,
                        color: _currentIndex == i && i != 0
                            ? AppColors.secondary
                            : i == 0
                            ? AppColors.secondary
                            : Colors.black45,
                        fontWeight: FontWeight.normal,
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

// ─── Data Models ──────────────────────────────────────────────────────────────
class _DiscoverJobData {
  final String logoText;
  final String? logoAsset;
  final Color logoColor;
  final bool isApple;
  final String title;
  final String company;
  final List<String> tags;
  final String postedAgo;
  final String location;

  const _DiscoverJobData({
    required this.logoText,
    required this.logoAsset,
    required this.logoColor,
    required this.isApple,
    required this.title,
    required this.company,
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
