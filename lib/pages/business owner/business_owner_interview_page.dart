import 'package:flutter/material.dart';
import 'package:jobseek/pages/business%20owner/business_owner_interview_detail_page.dart';
import 'package:jobseek/shared/themes.dart';

class BusinessOwnerInterviewPage extends StatefulWidget {
  const BusinessOwnerInterviewPage({super.key});

  @override
  State<BusinessOwnerInterviewPage> createState() =>
      _BusinessOwnerInterviewPageState();
}

class _BusinessOwnerInterviewPageState extends State<BusinessOwnerInterviewPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // ── Sample data ─────────────────────────────────────────────────────────────

  final List<_InterviewItem> _upcoming = List.generate(
    5,
    (_) => const _InterviewItem(
      name: 'Phors Panha',
      role: 'Flutter app Team Leader',
      date: 'Apr 24 2025, 10AM',
      image: 'assets/images/kea_chanthorn.JPG',
    ),
  );

  final List<_PendingItem> _pending = const [
    _PendingItem(
      name: 'Zhao Lusi',
      role: 'Flutter app Team Leader',
      status: 'Waiting Candidate Confirmation',
      image: 'assets/images/kea_chanthorn.JPG',
      secondButton: 'Cancel',
    ),
    _PendingItem(
      name: 'Bai Lu',
      role: 'Flutter app Team Leader',
      status: 'Need Scheduling',
      image: 'assets/images/meyling.jpg',
      secondButton: 'Result',
    ),
    _PendingItem(
      name: 'Chen Si',
      role: 'Flutter app Team Leader',
      status: 'Requested Apr 24 , 10AM',
      image: 'assets/images/candidate_male.jpg',
      secondButton: 'Cancel',
    ),
  ];

  final List<_CompletedItem> _completed = const [
    _CompletedItem(
      name: 'Kristin Watson',
      role: 'Flutter app Team Leader',
      completedTime: 'Completed 4:00 PM',
      image: 'assets/images/candidate_male.jpg',
    ),
    _CompletedItem(
      name: 'Cody Fischer',
      role: 'Customer Service',
      completedTime: 'Completed 4:17 PM',
      image: 'assets/images/daron.jpg',
    ),
    _CompletedItem(
      name: 'Leslia Alexender',
      role: 'Customer Service',
      completedTime: 'Completed 4:17 PM',
      image: 'assets/images/kea_chanthorn.JPG',
    ),
    _CompletedItem(
      name: 'Chen Xuemei',
      role: 'Customer Service',
      completedTime: 'Completed 4:17 PM',
      image: 'assets/images/meyling.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
              child: Text(
                'Interview',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            // Tab bar
            TabBar(
              controller: _tabController,
              labelColor: AppColors.primary,
              unselectedLabelColor: Colors.black54,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              indicatorColor: AppColors.primary,
              indicatorWeight: 2.5,
              indicatorSize: TabBarIndicatorSize.label,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              tabs: const [
                Tab(text: 'Upcoming'),
                Tab(text: 'Pending'),
                Tab(text: 'Completed'),
              ],
            ),

            const Divider(height: 1, thickness: 1, color: Color(0xFFE0E0E0)),

            // Tab content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildList(_upcoming),
                  _buildPendingList(_pending),
                  _buildCompletedList(_completed),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // ── List ───────────────────────────────────────────────────────────────────

  Widget _buildList(List<_InterviewItem> items) {
    if (items.isEmpty) {
      return const Center(
        child: Text('No interviews', style: TextStyle(color: Colors.grey)),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, i) => _buildCard(items[i]),
    );
  }

  Widget _buildPendingList(List<_PendingItem> items) {
    if (items.isEmpty) {
      return const Center(
        child: Text(
          'No pending interviews',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 14),
      itemBuilder: (_, i) => _buildPendingCard(items[i]),
    );
  }

  Widget _buildCompletedList(List<_CompletedItem> items) {
    if (items.isEmpty) {
      return const Center(
        child: Text(
          'No completed interviews',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, i) => _buildCompletedCard(items[i]),
    );
  }

  Widget _buildCompletedCard(_CompletedItem item) {
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
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(item.image),
            backgroundColor: Colors.grey[200],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.role,
                  style: const TextStyle(fontSize: 13, color: Colors.black54),
                ),
                const SizedBox(height: 4),
                Text(
                  item.completedTime,
                  style: const TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ],
            ),
          ),
          const Text(
            'Completed',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPendingCard(_PendingItem item) {
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(item.image),
                backgroundColor: Colors.grey[200],
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.role,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.status,
                    style: const TextStyle(fontSize: 13, color: Colors.black87),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BusinessOwnerInterviewDetailPage(
                          candidateName: item.name,
                          candidateRole: item.role,
                          candidateImage: item.image,
                        ),
                      ),
                    );
                  },
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
                    'View Details',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: const BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: Text(
                    item.secondButton,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
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

  Widget _buildCard(_InterviewItem item) {
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
          // Name + avatar row
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(item.image),
                backgroundColor: Colors.grey[200],
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    item.role,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),
          const Divider(height: 1, thickness: 1, color: Color(0xFFF0F0F0)),
          const SizedBox(height: 10),

          // Date + View Detail row
          Row(
            children: [
              const Icon(
                Icons.calendar_month_rounded,
                color: AppColors.secondary,
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                item.date,
                style: const TextStyle(fontSize: 13, color: Colors.black54),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BusinessOwnerInterviewDetailPage(
                        candidateName: item.name,
                        candidateRole: item.role,
                        candidateImage: item.image,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'View Detail',
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
        currentIndex: 2,
        onTap: (index) {
          if (index == 2) return;
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

// ── Data models ───────────────────────────────────────────────────────────────

class _InterviewItem {
  final String name;
  final String role;
  final String date;
  final String image;
  const _InterviewItem({
    required this.name,
    required this.role,
    required this.date,
    required this.image,
  });
}

class _CompletedItem {
  final String name;
  final String role;
  final String completedTime;
  final String image;
  const _CompletedItem({
    required this.name,
    required this.role,
    required this.completedTime,
    required this.image,
  });
}

class _PendingItem {
  final String name;
  final String role;
  final String status;
  final String image;
  final String secondButton;
  const _PendingItem({
    required this.name,
    required this.role,
    required this.status,
    required this.image,
    required this.secondButton,
  });
}
