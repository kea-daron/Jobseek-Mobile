import 'package:flutter/material.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_home_page.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_post_contact_page.dart';
import 'package:jobseek/shared/themes.dart';

class JobSeekerPostExperiencePage extends StatefulWidget {
  const JobSeekerPostExperiencePage({super.key});

  @override
  State<JobSeekerPostExperiencePage> createState() =>
      _JobSeekerPostExperiencePageState();
}

class _JobSeekerPostExperiencePageState
    extends State<JobSeekerPostExperiencePage> {
  int _currentIndex = 1;

  // Work Experience options
  bool _isFreshGraduate = false;
  bool _noExperience = false;

  // Work experience entries (added via Add Experience)
  final List<Map<String, TextEditingController>> _workEntries = [];

  // Education entries
  final List<Map<String, TextEditingController>> _educationEntries = [
    {
      'degree': TextEditingController(),
      'major': TextEditingController(),
      'school': TextEditingController(),
    },
  ];

  @override
  void dispose() {
    for (final e in _workEntries) {
      e.values.forEach((c) => c.dispose());
    }
    for (final e in _educationEntries) {
      e.values.forEach((c) => c.dispose());
    }
    super.dispose();
  }

  void _addWorkEntry() {
    setState(() {
      _workEntries.add({
        'jobTitle': TextEditingController(),
        'company': TextEditingController(),
        'startDate': TextEditingController(),
        'endDate': TextEditingController(),
        'description': TextEditingController(),
      });
    });
  }

  void _addEducationEntry() {
    setState(() {
      _educationEntries.add({
        'degree': TextEditingController(),
        'major': TextEditingController(),
        'school': TextEditingController(),
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBanner(),
                    const SizedBox(height: 20),
                    _buildSectionHeader('Work Experience'),
                    const SizedBox(height: 16),
                    _buildWorkExperienceSection(),
                    const SizedBox(height: 16),
                    _buildSectionLabel('Education Background'),
                    const SizedBox(height: 16),
                    _buildEducationSection(),
                    const SizedBox(height: 32),
                    _buildActionButtons(context),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // ─── Header ───────────────────────────────────────────────────────────────
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/images/meyling.jpg'),
          ),
          const SizedBox(width: 10),
          Column(
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
                'Thoeurn Sokkay',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: const [
              Icon(
                Icons.notifications_none_rounded,
                size: 26,
                color: AppColors.secondary,
              ),
              SizedBox(height: 2),
              Text(
                'Notification',
                style: TextStyle(fontSize: 9, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ─── Banner ───────────────────────────────────────────────────────────────
  Widget _buildBanner() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: const Text(
            'Find You Dream Job',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ─── Section Header (dark blue bar) ──────────────────────────────────────
  Widget _buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  // ─── Section Label (white card row) ──────────────────────────────────────
  Widget _buildSectionLabel(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFE0E0E0)),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ),
    );
  }

  // ─── Work Experience ──────────────────────────────────────────────────────
  Widget _buildWorkExperienceSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFE0E0E0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add Experience button
            Center(
              child: GestureDetector(
                onTap: _addWorkEntry,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.add, color: Colors.white, size: 18),
                      SizedBox(width: 6),
                      Text(
                        'Add Experience',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Checkboxes
            _buildCheckRow(
              label: 'I am a fresh graduate',
              value: _isFreshGraduate,
              onChanged: (v) => setState(() => _isFreshGraduate = v ?? false),
            ),
            const SizedBox(height: 8),
            _buildCheckRow(
              label: 'No experience but willing to learn',
              value: _noExperience,
              onChanged: (v) => setState(() => _noExperience = v ?? false),
            ),
            // Dynamic work entries
            ..._workEntries.asMap().entries.map((entry) {
              final i = entry.key;
              final e = entry.value;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        'Experience ${i + 1}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: AppColors.primary,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          e.values.forEach((c) => c.dispose());
                          setState(() => _workEntries.removeAt(i));
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _buildSimpleField(e['jobTitle']!, 'Job Title'),
                  const SizedBox(height: 8),
                  _buildSimpleField(e['company']!, 'Company'),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: _buildSimpleField(e['startDate']!, 'Start Date'),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildSimpleField(e['endDate']!, 'End Date'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _buildSimpleField(
                    e['description']!,
                    'Description',
                    maxLines: 3,
                  ),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckRow({
    required String label,
    required bool value,
    required void Function(bool?) onChanged,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Colors.black87),
        ),
      ],
    );
  }

  // ─── Education ────────────────────────────────────────────────────────────
  Widget _buildEducationSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFE0E0E0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._educationEntries.asMap().entries.map((entry) {
              final i = entry.key;
              final e = entry.value;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (i > 0)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Text(
                            'Education ${i + 1}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: AppColors.primary,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              e.values.forEach((c) => c.dispose());
                              setState(() => _educationEntries.removeAt(i));
                            },
                            child: const Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (i == 0)
                    const Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Text(
                        'Education Entry',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  _buildSimpleField(e['degree']!, 'Degree (e.g Bachelor)'),
                  const SizedBox(height: 8),
                  _buildSimpleField(e['major']!, 'Major'),
                  const SizedBox(height: 8),
                  _buildSimpleField(e['school']!, 'School / University'),
                  if (i < _educationEntries.length - 1)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Divider(),
                    ),
                  if (i == _educationEntries.length - 1)
                    const SizedBox(height: 8),
                ],
              );
            }).toList(),
            // Add another education entry
            GestureDetector(
              onTap: _addEducationEntry,
              child: Row(
                children: const [
                  Icon(
                    Icons.add_circle_outline,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Add Education',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSimpleField(
    TextEditingController ctrl,
    String hint, {
    int maxLines = 1,
  }) {
    return TextField(
      controller: ctrl,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black38, fontSize: 13),
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),
    );
  }

  // ─── Back / Next Buttons ──────────────────────────────────────────────────
  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, size: 18),
              label: const Text(
                'Back',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black87,
                side: const BorderSide(color: Color(0xFFE0E0E0)),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const JobSeekerPostContactPage(),
                  ),
                );
              },
              icon: const SizedBox.shrink(),
              label: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Bottom Nav ───────────────────────────────────────────────────────────
  Widget _buildBottomNav() {
    final items = [
      _NavItem(icon: Icons.home_outlined, label: 'Home'),
      _NavItem(icon: Icons.miscellaneous_services_outlined, label: 'Service'),
      _NavItem(icon: Icons.bookmark_border_rounded, label: 'Saved'),
      _NavItem(icon: Icons.dashboard_outlined, label: 'Dashboard'),
    ];
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: List.generate(items.length, (i) {
          final selected = i == _currentIndex;
          return Expanded(
            child: GestureDetector(
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    items[i].icon,
                    color: selected ? AppColors.secondary : Colors.white,
                    size: 26,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    items[i].label,
                    style: TextStyle(
                      fontSize: 10,
                      color: selected ? AppColors.secondary : Colors.white,
                      fontWeight: selected
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}
