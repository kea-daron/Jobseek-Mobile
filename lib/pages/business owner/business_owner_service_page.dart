import 'package:flutter/material.dart';
import 'package:jobseek/pages/business%20owner/business_owner_create_job_page.dart';
import 'package:jobseek/pages/business%20owner/business_owner_discover_page.dart';
import 'package:jobseek/shared/themes.dart';

class BusinessOwnerServicePage extends StatefulWidget {
  const BusinessOwnerServicePage({super.key});

  @override
  State<BusinessOwnerServicePage> createState() =>
      _BusinessOwnerServicePageState();
}

class _BusinessOwnerServicePageState extends State<BusinessOwnerServicePage> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Business Owner',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildServicesGrid(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // ── Header ────────────────────────────────────────────────────────────────

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      color: AppColors.primary,
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // top row: avatar + name + notification
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: const AssetImage(
                      'assets/images/meyling.jpg',
                    ),
                    backgroundColor: Colors.grey[300],
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Welcome ',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                          Text('👋', style: TextStyle(fontSize: 13)),
                        ],
                      ),
                      const Text(
                        'Kea Daron',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
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
                            size: 28,
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Notification',
                        style: TextStyle(color: Colors.white70, fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Banner
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1A3A8F),
                borderRadius: BorderRadius.circular(16),
              ),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.4,
                  ),
                  children: [
                    TextSpan(text: 'Good business starts with\n'),
                    TextSpan(
                      text: 'employee',
                      style: TextStyle(color: AppColors.secondary),
                    ),
                    TextSpan(text: ' wellbeing'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Services Grid ─────────────────────────────────────────────────────────

  Widget _buildServicesGrid() {
    final services = [
      _ServiceItem(
        label: 'Create Job Post',
        icon: _CirclePlusIcon(),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const BusinessOwnerCreateJobPage()),
        ),
      ),
      _ServiceItem(
        label: 'Candidate Review',
        icon: _CandidateReviewIcon(),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const BusinessOwnerDiscoverPage()),
        ),
      ),
      _ServiceItem(label: 'Direct Chat', icon: _DirectChatIcon(), onTap: () {}),
      _ServiceItem(label: 'Brand Page', icon: _BrandPageIcon(), onTap: () {}),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: services.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.1,
      ),
      itemBuilder: (_, i) => _buildServiceCard(services[i]),
    );
  }

  Widget _buildServiceCard(_ServiceItem item) {
    return GestureDetector(
      onTap: item.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE9B31F), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 64, height: 64, child: item.icon),
            const SizedBox(height: 12),
            Text(
              item.label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Bottom Nav ────────────────────────────────────────────────────────────

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
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          } else {
            setState(() => _selectedIndex = index);
          }
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

// ── Data Model ────────────────────────────────────────────────────────────────

class _ServiceItem {
  final String label;
  final Widget icon;
  final VoidCallback onTap;
  const _ServiceItem({
    required this.label,
    required this.icon,
    required this.onTap,
  });
}

// ── Custom Icons ──────────────────────────────────────────────────────────────

class _CirclePlusIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      height: 58,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Color(0xFF29B6F6), Color(0xFF0288D1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Icon(Icons.add, color: Colors.white, size: 34),
    );
  }
}

class _CandidateReviewIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFFFECEC),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Icon(
            Icons.search_rounded,
            color: const Color(0xFFE53935),
            size: 42,
          ),
        ),
      ],
    );
  }
}

class _DirectChatIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 42,
            height: 38,
            decoration: BoxDecoration(
              color: const Color(0xFFFF6F00),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.chat_bubble, color: Colors.white, size: 22),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: 42,
            height: 38,
            decoration: BoxDecoration(
              color: const Color(0xFFFFB300),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.chat_bubble_outline,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }
}

class _BrandPageIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          right: 4,
          child: Container(
            width: 36,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF1565C0),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: 44,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFF1E88E5),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [_window(), const SizedBox(width: 4), _window()],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [_window(), const SizedBox(width: 4), _window()],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _window() => Container(
    width: 10,
    height: 10,
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.9),
      borderRadius: BorderRadius.circular(2),
    ),
  );
}
