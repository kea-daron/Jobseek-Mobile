import 'package:flutter/material.dart';
import 'package:jobseek/pages/business%20owner/business_owner_create_job_page.dart';
import 'package:jobseek/pages/business%20owner/business_owner_discover_page.dart';
import 'package:jobseek/pages/business%20owner/business_owner_edit_profile_page.dart';
import 'package:jobseek/pages/business%20owner/business_owner_login.dart';
import 'package:jobseek/shared/themes.dart';

// ── Data Models ──────────────────────────────────────────────────────────────

class _JobCard {
  final String image;
  final String title;
  final String company;
  final bool isNew;
  final String deadline;

  const _JobCard({
    required this.image,
    required this.title,
    required this.company,
    required this.isNew,
    required this.deadline,
  });
}

// ── Page ─────────────────────────────────────────────────────────────────────

class BusinessOwnerProfilePage extends StatefulWidget {
  const BusinessOwnerProfilePage({super.key});

  @override
  State<BusinessOwnerProfilePage> createState() =>
      _BusinessOwnerProfilePageState();
}

class _BusinessOwnerProfilePageState extends State<BusinessOwnerProfilePage> {
  int _selectedIndex = 3;

  final List<_JobCard> _jobs = const [
    _JobCard(
      image: 'assets/images/meyling.jpg',
      title: 'Senior UX/UI Designer',
      company: 'Ecom',
      isNew: true,
      deadline: 'Oct 31 2025',
    ),
    _JobCard(
      image: 'assets/images/meyling.jpg',
      title: 'Senior UX/UI Designer',
      company: 'Ecom',
      isNew: true,
      deadline: 'Oct 31 2025',
    ),
    _JobCard(
      image: 'assets/images/meyling.jpg',
      title: 'Senior UX/UI Designer',
      company: 'Ecom',
      isNew: true,
      deadline: 'Oct 31 2025',
    ),
    _JobCard(
      image: 'assets/images/meyling.jpg',
      title: 'Senior UX/UI Designer',
      company: 'Ecom',
      isNew: true,
      deadline: 'Oct 31 2025',
    ),
  ];

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: Column(
        children: [
          _buildTopHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _companyInfoCard(),
                  const SizedBox(height: 14),
                  _actionButtons(),
                  const SizedBox(height: 4),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Manage All Jobs',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  _jobsPostedCard(),
                  const SizedBox(height: 14),
                  _teamInfoCard(),
                  const SizedBox(height: 90),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNav(),
    );
  }

  // ── Top Header ────────────────────────────────────────────────────────────

  Widget _buildTopHeader() {
    return Container(
      width: double.infinity,
      color: AppColors.primary,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // Logout button top right
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        title: const Text(
                          'Logout',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        content: const Text('Are you sure you want to logout?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BusinessOwnerLogin(),
                                ),
                                (route) => false,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Logout'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.logout_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
              // Company logo + name centered
              Column(
                children: [
                  const SizedBox(height: 4),
                  Container(
                    width: 86,
                    height: 86,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.18),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Container(
                        width: 62,
                        height: 62,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.lightbulb_outline_rounded,
                          color: AppColors.primary,
                          size: 34,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Innovate Corp',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Software & Design Solution',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.75),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Company Info Card ─────────────────────────────────────────────────────

  Widget _companyInfoCard() {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Company Info',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const BusinessOwnerEditProfilePage(),
                  ),
                ),
                icon: const Icon(Icons.edit_outlined, size: 14),
                label: const Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 0,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 15,
                color: Colors.grey,
              ),
              const SizedBox(width: 4),
              Text(
                'Phnom Penh, Cambodia',
                style: TextStyle(fontSize: 13, color: Colors.grey[700]),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Company Description',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'JobSeeker Co. is a modern recruitment platform that connects employers with talented jobseekers. We help businesses find the right people faster through smart matching technology and simple hiring tools.',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.business_outlined, size: 15, color: Colors.grey),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  'Industry: Information Technology, Creative Services',
                  style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Action Buttons ────────────────────────────────────────────────────────

  Widget _actionButtons() {
    return Row(
      children: [
        Expanded(
          child: _iconBtn(
            Icons.work_outline_rounded,
            'Post a New Job',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const BusinessOwnerCreateJobPage(),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _iconBtn(
            Icons.search_rounded,
            'Search Jobseekers',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const BusinessOwnerDiscoverPage(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _iconBtn(IconData icon, String label, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primary, size: 26),
            const SizedBox(height: 6),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Jobs Posted Card ──────────────────────────────────────────────────────

  Widget _jobsPostedCard() {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Jobs Posted by Company',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _jobs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.1,
            ),
            itemBuilder: (context, i) => _jobTile(_jobs[i]),
          ),
        ],
      ),
    );
  }

  Widget _jobTile(_JobCard card) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 17,
                backgroundColor: Colors.grey[300],
                backgroundImage: AssetImage(card.image),
              ),
              const Spacer(),
              if (card.isNew)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF22C55E),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'New',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            card.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            card.company,
            style: TextStyle(fontSize: 11, color: Colors.grey[600]),
          ),
          const Spacer(),
          Row(
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                size: 10,
                color: Colors.grey,
              ),
              const SizedBox(width: 3),
              Expanded(
                child: Text(
                  'Deadline: ${card.deadline}',
                  style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Team Info Card ────────────────────────────────────────────────────────

  Widget _teamInfoCard() {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Team Info',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Manage All Jobs',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'Jobs Posted by Company',
            style: TextStyle(fontSize: 13, color: Colors.black87),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const Text(
                '4.8',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 8),
              _stars(4.8),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'View All Reviews',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Great company culture',
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _stars(double rating) {
    final full = rating.floor();
    final hasHalf = (rating - full) >= 0.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (i) {
        if (i < full) {
          return const Icon(
            Icons.star_rounded,
            color: AppColors.secondary,
            size: 18,
          );
        } else if (i == full && hasHalf) {
          return const Icon(
            Icons.star_half_rounded,
            color: AppColors.secondary,
            size: 18,
          );
        } else {
          return const Icon(
            Icons.star_outline_rounded,
            color: AppColors.secondary,
            size: 18,
          );
        }
      }),
    );
  }

  // ── Bottom Navigation ─────────────────────────────────────────────────────

  Widget _bottomNav() {
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
        backgroundColor: Colors.transparent,
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

  // ── Helper ────────────────────────────────────────────────────────────────

  Widget _card({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
