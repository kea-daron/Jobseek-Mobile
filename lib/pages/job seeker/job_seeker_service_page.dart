import 'package:flutter/material.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_dashboard_page.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_saved_page.dart';
import 'package:jobseek/shared/themes.dart';

class JobSeekerServicePage extends StatefulWidget {
  const JobSeekerServicePage({super.key});

  @override
  State<JobSeekerServicePage> createState() => _JobSeekerServicePageState();
}

class _JobSeekerServicePageState extends State<JobSeekerServicePage> {
  int _currentIndex = 1; // Service tab is active

  final List<_ServiceCardData> _services = const [
    _ServiceCardData(
      icon: Icons.assignment_outlined,
      iconColor: Color(0xFFE9B31F),
      label: 'Create CV',
    ),
    _ServiceCardData(
      icon: Icons.menu_book_outlined,
      iconColor: Color(0xFF0A2572),
      label: 'Career Tips',
    ),
    _ServiceCardData(
      icon: Icons.thumb_up_outlined,
      iconColor: Color(0xFFE9B31F),
      label: 'Company Rating',
    ),
    _ServiceCardData(
      icon: Icons.alarm_outlined,
      iconColor: Color(0xFFE05C5C),
      label: 'Status Tracker',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  _buildServicesGrid(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // ─── Header ──────────────────────────────────────────────────────────────
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 48, left: 20, right: 20, bottom: 28),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: avatar + name + notification
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: const AssetImage('assets/images/meyling.jpg'),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      Text(
                        'Welcome ',
                        style: TextStyle(fontSize: 12, color: Colors.white70),
                      ),
                      Text('👋', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Text(
                    'Meyling Chhun',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Stack(
                    children: [
                      const Icon(
                        Icons.notifications_outlined,
                        color: Colors.white,
                        size: 26,
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: AppColors.secondary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'Notification',
                    style: TextStyle(fontSize: 10, color: Colors.white70),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Title
          const Text(
            "Let's Find Your\nJobs Opportunity",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 18),
          // Search bar
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Jobs...',
                hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.black38,
                  size: 22,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Services Grid ────────────────────────────────────────────────────────
  Widget _buildServicesGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Jobseeker Services',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _services.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (context, index) {
              final service = _services[index];
              return _buildServiceCard(service);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(_ServiceCardData service) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to specific service page
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: service.iconColor.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(service.icon, color: service.iconColor, size: 36),
            ),
            const SizedBox(height: 14),
            Text(
              service.label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // ─── Bottom Nav ────────────────────────────────────────────────────────────
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
                  if (i == 0) {
                    Navigator.pop(context);
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

// ─── Data Models ─────────────────────────────────────────────────────────────
class _ServiceCardData {
  final IconData icon;
  final Color iconColor;
  final String label;

  const _ServiceCardData({
    required this.icon,
    required this.iconColor,
    required this.label,
  });
}

class _NavItem {
  final String icon;
  final String label;

  const _NavItem({required this.icon, required this.label});
}
