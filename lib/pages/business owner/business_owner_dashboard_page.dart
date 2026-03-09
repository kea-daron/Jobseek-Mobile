import 'package:flutter/material.dart';
import 'package:jobseek/pages/business%20owner/business_owner_active_job_page.dart';
import 'package:jobseek/pages/business%20owner/business_owner_closed_job_page.dart';
import 'package:jobseek/pages/business%20owner/business_owner_total_job_post_page.dart';
import 'package:jobseek/shared/themes.dart';

class BusinessOwnerDashboardPage extends StatelessWidget {
  const BusinessOwnerDashboardPage({super.key});

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
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Quick Action ────────────────────────────────────────────────
            const Text(
              'Quick Action',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: _buildQuickCard(
                    context: context,
                    emoji: '📋',
                    label: 'Total Job Post',
                    showCheck: false,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const BusinessOwnerTotalJobPostPage(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildQuickCard(
                    context: context,
                    emoji: '💼',
                    label: 'Active Job',
                    showCheck: true,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const BusinessOwnerActiveJobPage(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildQuickCard(
                    context: context,
                    emoji: '📅',
                    label: 'Closed Job',
                    showCheck: false,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const BusinessOwnerClosedJobPage(),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // ── Overview ────────────────────────────────────────────────────
            const Text(
              'Overview',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 14),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 1.3,
              children: [
                _buildOverviewCard(
                  label: 'Applied',
                  count: 50,
                  icon: Icons.check_rounded,
                  iconColor: const Color(0xFF26C6A6),
                  borderColor: const Color(0xFF26C6A6),
                ),
                _buildOverviewCard(
                  label: 'Active Job',
                  count: 50,
                  icon: Icons.calendar_month_outlined,
                  iconColor: const Color(0xFF9B59B6),
                  borderColor: const Color(0xFF9B59B6),
                ),
                _buildOverviewCard(
                  label: 'Shortlist Review',
                  count: 50,
                  icon: Icons.calendar_today_outlined,
                  iconColor: const Color(0xFF2980B9),
                  borderColor: const Color(0xFF2980B9),
                ),
                _buildOverviewCard(
                  label: 'Total Applied',
                  count: 50,
                  icon: Icons.how_to_reg_outlined,
                  iconColor: const Color(0xFF2980B9),
                  borderColor: const Color(0xFF2980B9),
                ),
                _buildOverviewCard(
                  label: 'Hired',
                  count: 50,
                  icon: Icons.person_outline_rounded,
                  iconColor: const Color(0xFF27AE60),
                  borderColor: const Color(0xFF27AE60),
                ),
                _buildOverviewCard(
                  label: 'Rejected',
                  count: 50,
                  icon: Icons.block_rounded,
                  iconColor: const Color(0xFFE74C3C),
                  borderColor: const Color(0xFFE74C3C),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  // ── Quick Action Card ─────────────────────────────────────────────────────

  Widget _buildQuickCard({
    required BuildContext context,
    required String emoji,
    required String label,
    required bool showCheck,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(emoji, style: const TextStyle(fontSize: 32)),
                const SizedBox(height: 8),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            if (showCheck)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2ECC71),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 14),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ── Overview Card ─────────────────────────────────────────────────────────

  Widget _buildOverviewCard({
    required String label,
    required int count,
    required IconData icon,
    required Color iconColor,
    required Color borderColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor, width: 1.4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: iconColor, size: 24),
              Text(
                '$count',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  // ── Bottom Nav ────────────────────────────────────────────────────────────

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
