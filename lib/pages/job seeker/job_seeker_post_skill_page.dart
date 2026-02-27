import 'package:flutter/material.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_home_page.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_post_experience_page.dart';
import 'package:jobseek/shared/themes.dart';

class JobSeekerPostSkillPage extends StatefulWidget {
  const JobSeekerPostSkillPage({super.key});

  @override
  State<JobSeekerPostSkillPage> createState() => _JobSeekerPostSkillPageState();
}

class _JobSeekerPostSkillPageState extends State<JobSeekerPostSkillPage> {
  int _currentIndex = 1;

  // Hard Skills
  final List<String> _hardSkills = [
    'HTML',
    'CSS',
    'JavaScript',
    'C',
    'C++',
    'Java',
    'C#',
    'Microsoft Office',
    'Graphic Design',
  ];
  final TextEditingController _hardSkillController = TextEditingController();

  // Soft Skills
  final List<String> _softSkills = ['Communication', 'Teamwork'];
  final TextEditingController _softSkillController = TextEditingController();

  // Skill Level: 0=Beginner … 8=Expert (9 boxes)
  int _skillLevel = 3;
  static const _levelLabels = ['Beginner', 'Intermediate', 'Advanced'];
  static const _levelBoxes = 9;

  String get _levelLabel {
    if (_skillLevel <= 2) return 'Beginner';
    if (_skillLevel <= 5) return 'Intermediate';
    return 'Expert';
  }

  @override
  void dispose() {
    _hardSkillController.dispose();
    _softSkillController.dispose();
    super.dispose();
  }

  void _addHardSkill() {
    final v = _hardSkillController.text.trim();
    if (v.isNotEmpty) {
      setState(() {
        _hardSkills.add(v);
        _hardSkillController.clear();
      });
    }
  }

  void _addSoftSkill() {
    final v = _softSkillController.text.trim();
    if (v.isNotEmpty) {
      setState(() {
        _softSkills.add(v);
        _softSkillController.clear();
      });
    }
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
                    _buildSectionHeader('Skill'),
                    const SizedBox(height: 16),
                    _buildSkillGroup(
                      label: 'Hard Skills',
                      skills: _hardSkills,
                      controller: _hardSkillController,
                      onAdd: _addHardSkill,
                      onRemove: (i) => setState(() => _hardSkills.removeAt(i)),
                    ),
                    const SizedBox(height: 16),
                    _buildSkillGroup(
                      label: 'Soft Skills',
                      skills: _softSkills,
                      controller: _softSkillController,
                      onAdd: _addSoftSkill,
                      onRemove: (i) => setState(() => _softSkills.removeAt(i)),
                    ),
                    const SizedBox(height: 24),
                    _buildSkillLevel(),
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

  // ─── Section Header ───────────────────────────────────────────────────────
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

  // ─── Skill Group ──────────────────────────────────────────────────────────
  Widget _buildSkillGroup({
    required String label,
    required List<String> skills,
    required TextEditingController controller,
    required VoidCallback onAdd,
    required void Function(int) onRemove,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label row + Add Skill button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE0E0E0)),
            ),
            child: Row(
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () =>
                      _showAddSkillDialog(context, label, controller, onAdd),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.add, color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Text(
                          'Add Skill',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills.map((skill) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  skill,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 8),
          // Remove button (last skill)
          if (skills.isNotEmpty)
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => onRemove(skills.length - 1),
                child: const Icon(Icons.cancel, color: Colors.red, size: 28),
              ),
            ),
        ],
      ),
    );
  }

  void _showAddSkillDialog(
    BuildContext context,
    String label,
    TextEditingController controller,
    VoidCallback onAdd,
  ) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Add $label'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Enter skill name'),
          onSubmitted: (_) {
            onAdd();
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            onPressed: () {
              onAdd();
              Navigator.pop(context);
            },
            child: const Text('Add', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  // ─── Skill Level ──────────────────────────────────────────────────────────
  Widget _buildSkillLevel() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Skill Level',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              ...List.generate(_levelBoxes, (i) {
                final active = i == _skillLevel;
                final filled = i <= _skillLevel;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _skillLevel = i),
                    child: Container(
                      height: 36,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: active
                            ? AppColors.primary
                            : filled
                            ? const Color(0xFFD0D8E8)
                            : const Color(0xFFE8E8E8),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _levelLabel,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _levelLabels
                .map(
                  (l) => Text(
                    l,
                    style: const TextStyle(fontSize: 12, color: Colors.black45),
                  ),
                )
                .toList(),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Divider(color: Colors.black12),
          ),
        ],
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
                    builder: (_) => const JobSeekerPostExperiencePage(),
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
