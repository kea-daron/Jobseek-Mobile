import 'package:flutter/material.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_contact_page.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_create_cv_page.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_create_post_page.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_discover_page.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_job_detail_page.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_profile_page.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_dashboard_page.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_saved_page.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_service_page.dart';
import 'package:jobseek/shared/themes.dart';

class JobSeekerHomePage extends StatefulWidget {
  const JobSeekerHomePage({super.key});

  @override
  State<JobSeekerHomePage> createState() => _JobSeekerHomePageState();
}

class _JobSeekerHomePageState extends State<JobSeekerHomePage>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  late final AnimationController _marqueeController;
  final Set<int> _savedJobs = {};

  @override
  void initState() {
    super.initState();
    _marqueeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _marqueeController.dispose();
    super.dispose();
  }

  static const _recentJobs = [
    _JobData(
      logo: 'ABA',
      logoColor: Color(0xFF1A3C5E),
      salary: '\$ 500 - \$1000',
      title: 'UI designer',
      location: 'Phnom Penh, Toulkok',
      tags: ['Full Time', 'Junior', '1 pax'],
      postedAgo: '3 days ago',
    ),
    _JobData(
      logo: null,
      logoColor: Colors.black,
      salary: '\$ Negotiable',
      title: 'Digital Marketing',
      location: 'Phnom Penh, Camco city',
      tags: ['Part Time', 'Senior', '5 pax'],
      postedAgo: '3 days ago',
    ),
    _JobData(
      logo: 'HR',
      logoColor: Color(0xFF2E7D32),
      salary: '\$ 800 - \$1500',
      title: 'HR Manager',
      location: 'Phnom Penh, BKK1',
      tags: ['Full Time', 'Senior', '2 pax'],
      postedAgo: '1 day ago',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildHeroBanner(),
              const SizedBox(height: 24),
              _buildFeatureCards(),
              const SizedBox(height: 24),
              _buildRecentJobs(),
              const SizedBox(height: 24),
              _buildSeekersVoice(),
              const SizedBox(height: 24),
              _buildPartners(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // ─── Header ──────────────────────────────────────────────────────────────
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const JobSeekerProfilePage()),
            ),
            child: CircleAvatar(
              radius: 24,
              backgroundImage: const AssetImage('assets/images/meyling.jpg'),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const JobSeekerProfilePage()),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Row(
                  children: [
                    Text(
                      'Welcome ',
                      style: TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                    Text('👋', style: TextStyle(fontSize: 13)),
                  ],
                ),
                Text(
                  'Meyling Chhun',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const JobSeekerCreatePostPage(),
              ),
            ),
            child: _buildHeaderAction(
              'assets/icons/note.png',
              'Create New post',
            ),
          ),
          const SizedBox(width: 16),
          _buildHeaderAction(
            '',
            'Notification',
            iconData: Icons.notifications_none_rounded,
            iconColor: AppColors.secondary,
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderAction(
    String icon,
    String label, {
    Color? iconColor,
    IconData? iconData,
  }) {
    Widget iconWidget;
    if (iconData != null) {
      iconWidget = Icon(iconData, size: 26, color: iconColor ?? Colors.black54);
    } else {
      final image = Image.asset(icon, height: 26, width: 26);
      iconWidget = iconColor != null
          ? ColorFiltered(
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              child: image,
            )
          : image;
    }
    return Column(
      children: [
        iconWidget,
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(fontSize: 9, color: Colors.black54)),
      ],
    );
  }

  // ─── Hero Banner ─────────────────────────────────────────────────────────
  Widget _buildHeroBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'We Help find Your\ndream job',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 12),
                      const Icon(Icons.search, color: Colors.black38, size: 20),
                      const SizedBox(width: 6),
                      const Expanded(
                        child: Text(
                          'Search Job or Company',
                          style: TextStyle(color: Colors.black38, fontSize: 12),
                        ),
                      ),
                      Container(
                        width: 36,
                        height: 36,
                        margin: const EdgeInsets.only(right: 2),
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
          const SizedBox(width: 8),
          Image.asset(
            'assets/images/welcome.png',
            height: 110,
            width: 110,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  // ─── Feature Cards ────────────────────────────────────────────────────────
  Widget _buildFeatureCards() {
    final cards = [
      _FeatureCard(
        icon: 'assets/icons/scope.png',
        label: 'Discover job',
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const JobSeekerDiscoverPage()),
        ),
      ),
      _FeatureCard(
        icon: 'assets/icons/cv.png',
        label: 'Create CV',
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const JobSeekerCreateCvPage()),
        ),
      ),
      _FeatureCard(
        icon: 'assets/icons/call.png',
        label: 'Contact Us',
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const JobSeekerContactPage()),
        ),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: cards
            .map(
              (c) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: GestureDetector(
                    onTap: c.onTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        children: [
                          Image.asset(c.icon, height: 40, width: 40),
                          const SizedBox(height: 8),
                          Text(
                            c.label,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  // ─── Recent Jobs ──────────────────────────────────────────────────────────
  Widget _buildRecentJobs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Recent job',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _recentJobs.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, i) => _buildJobCard(_recentJobs[i], i),
          ),
        ),
      ],
    );
  }

  Widget _buildJobCard(_JobData job, int index) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: job.logoColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  job.logo ?? '●',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (_savedJobs.contains(index)) {
                      _savedJobs.remove(index);
                    } else {
                      _savedJobs.add(index);
                    }
                  });
                },
                child: Image.asset(
                  'assets/icons/save-icon.png',
                  height: 20,
                  width: 20,
                  color: _savedJobs.contains(index) ? Colors.red : Colors.grey,
                  colorBlendMode: BlendMode.srcATop,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            job.salary,
            style: const TextStyle(color: Colors.black54, fontSize: 11),
          ),
          Text(
            job.title,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 12,
                color: Colors.grey,
              ),
              const SizedBox(width: 2),
              Expanded(
                child: Text(
                  job.location,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: job.tags
                .map(
                  (t) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(t, style: const TextStyle(fontSize: 10)),
                  ),
                )
                .toList(),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                job.postedAgo,
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => JobDetailPage(
                      title: job.title,
                      company: job.logo ?? job.title,
                      isApple: false,
                      logoColor: job.logoColor,
                      logoText: job.logo ?? '',
                    ),
                  ),
                ),
                child: const Text(
                  'View Details',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ─── Seeker's Voice ───────────────────────────────────────────────────────
  Widget _buildSeekersVoice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Seeker's voice",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: const AssetImage(
                      'assets/images/meyling.jpg',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Meyling Chhun',
                        style: TextStyle(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'UX UI Designer',
                        style: TextStyle(fontSize: 12, color: Colors.white70),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Jobseek provide outstanding support and was genuinely helpful at every stage of the process. The team kept me well-informed, offered valuable advice, and ensured a smooth experience throughout. I\'m thankful for their guidance and the chance to be part of and work with',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  height: 1.5,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'See More',
                  style: TextStyle(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ─── Partners (auto-scroll marquee) ──────────────────────────────────────
  Widget _buildPartners() {
    const logos = [
      'assets/icons/aba-bank-logo.png',
      'assets/icons/wing-logo.png',
      'assets/icons/chip-mong-logo.png',
      'assets/icons/aeon-logo.png',
    ];
    const double logoWidth = 90.0;
    const double spacing = 28.0;
    const double itemWidth = logoWidth + spacing;
    final double totalWidth = logos.length * itemWidth;
    // Duplicate list for seamless loop
    final extendedLogos = [...logos, ...logos];

    return SizedBox(
      height: 54,
      child: ClipRect(
        child: AnimatedBuilder(
          animation: _marqueeController,
          builder: (context, _) {
            final offset = -_marqueeController.value * totalWidth;
            return OverflowBox(
              alignment: Alignment.centerLeft,
              maxWidth: double.infinity,
              child: Transform.translate(
                offset: Offset(offset, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: extendedLogos
                      .map(
                        (logo) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: spacing / 2,
                          ),
                          child: Image.asset(
                            logo,
                            height: 40,
                            width: logoWidth,
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // ─── Bottom Nav ───────────────────────────────────────────────────────────
  Widget _buildBottomNav() {
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
                  if (i == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const JobSeekerServicePage(),
                      ),
                    );
                  } else if (i == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const JobSeekerSavedPage(),
                      ),
                    );
                  } else if (i == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const JobSeekerDashboardPage(),
                      ),
                    );
                  } else {
                    setState(() => _currentIndex = i);
                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        _currentIndex == i
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
                        color: _currentIndex == i
                            ? AppColors.secondary
                            : Colors.black45,
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

// ─── Data Models ──────────────────────────────────────────────────────────────
class _JobData {
  final String? logo;
  final Color logoColor;
  final String salary;
  final String title;
  final String location;
  final List<String> tags;
  final String postedAgo;

  const _JobData({
    required this.logo,
    required this.logoColor,
    required this.salary,
    required this.title,
    required this.location,
    required this.tags,
    required this.postedAgo,
  });
}

class _FeatureCard {
  final String icon;
  final String label;
  final VoidCallback onTap;

  const _FeatureCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });
}

class _NavItem {
  final String icon;
  final String label;

  const _NavItem({required this.icon, required this.label});
}
