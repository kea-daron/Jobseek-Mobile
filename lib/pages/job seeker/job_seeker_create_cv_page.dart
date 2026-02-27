import 'package:flutter/material.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_cv_form_page.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_home_page.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_upload_cv_page.dart';
import 'package:jobseek/shared/themes.dart';

class JobSeekerCreateCvPage extends StatefulWidget {
  const JobSeekerCreateCvPage({super.key});

  @override
  State<JobSeekerCreateCvPage> createState() => _JobSeekerCreateCvPageState();
}

class _JobSeekerCreateCvPageState extends State<JobSeekerCreateCvPage> {
  int _currentIndex = 1; // Service tab active

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildTitle(),
            const Spacer(),
            _buildCvPreview(),
            const Spacer(),
            _buildButtons(context),
            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  // ─── Title ────────────────────────────────────────────────────────────────
  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Create your\nProfessional CV',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: AppColors.primary,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Fill in the steps below and export\nas PDF or image.',
          style: TextStyle(fontSize: 14, color: Colors.black45, height: 1.5),
        ),
      ],
    );
  }

  // ─── CV Preview illustration ──────────────────────────────────────────────
  Widget _buildCvPreview() {
    return Center(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFFDEEAF9),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF5B7DB1), width: 1.5),
          ),
          child: Column(
            children: [
              // Profile row
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Avatar circle
                  Container(
                    width: 64,
                    height: 64,
                    decoration: const BoxDecoration(
                      color: Color(0xFFB8CEEA),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Color(0xFF5B7DB1),
                      size: 40,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Name lines
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _cvLine(width: double.infinity, height: 10),
                        const SizedBox(height: 8),
                        _cvLine(width: 100, height: 8),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Body lines
              _cvLine(width: double.infinity, height: 8),
              const SizedBox(height: 8),
              _cvLine(width: double.infinity, height: 8),
              const SizedBox(height: 8),
              _cvLine(width: double.infinity, height: 8),
              const SizedBox(height: 8),
              _cvLine(width: 180, height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cvLine({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFB8CEEA),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  // ─── Buttons ──────────────────────────────────────────────────────────────
  Widget _buildButtons(BuildContext context) {
    return Column(
      children: [
        _fullButton(
          label: 'Start Create',
          color: AppColors.primary,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const JobSeekerCvFormPage()),
          ),
        ),
        const SizedBox(height: 12),
        _fullButton(
          label: 'Import existing CV',
          color: AppColors.primary,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const JobSeekerUploadCvPage()),
          ),
        ),
      ],
    );
  }

  Widget _fullButton({
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onTap,
        child: Text(
          label,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
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
        color: AppColors.primary,
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
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const JobSeekerHomePage(),
                      ),
                      (route) => false,
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
                        _currentIndex == i ? AppColors.secondary : Colors.white,
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
                            : Colors.white,
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

class _NavItem {
  final String icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}
