import 'package:flutter/material.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_home_page.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_post_skill_page.dart';
import 'package:jobseek/shared/themes.dart';

class JobSeekerPostJobInfoPage extends StatefulWidget {
  const JobSeekerPostJobInfoPage({super.key});

  @override
  State<JobSeekerPostJobInfoPage> createState() =>
      _JobSeekerPostJobInfoPageState();
}

class _JobSeekerPostJobInfoPageState extends State<JobSeekerPostJobInfoPage> {
  int _currentIndex = 1; // Service tab active

  final _jobTitleController = TextEditingController();
  final _salaryMinController = TextEditingController(text: '300');
  final _salaryMaxController = TextEditingController(text: '500');
  final _locationController = TextEditingController();

  // Category dropdown
  final List<String> _categories = ['IT', 'Design', 'Accounting', 'HR'];
  String _selectedCategory = 'IT';
  bool _dropdownOpen = false;

  // Employment type
  final List<String> _employmentTypes = [
    'Full-time',
    'Part-time',
    'Internship',
  ];
  String? _selectedEmploymentType;

  // Location type
  final List<String> _locationTypes = ['Province/City', 'On-site'];
  String? _selectedLocationType;

  // Availability
  bool _availabilitySelected = true;

  @override
  void dispose() {
    _jobTitleController.dispose();
    _salaryMinController.dispose();
    _salaryMaxController.dispose();
    _locationController.dispose();
    super.dispose();
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
                    _buildSectionHeader('Job Information'),
                    const SizedBox(height: 16),
                    _buildJobTitleField(),
                    const SizedBox(height: 12),
                    _buildCategoryDropdown(),
                    const SizedBox(height: 20),
                    _buildExpectedSalary(),
                    const SizedBox(height: 20),
                    _buildEmploymentType(),
                    const SizedBox(height: 20),
                    _buildPreferredLocation(),
                    const SizedBox(height: 20),
                    _buildAvailability(),
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

  // ─── Job Title ────────────────────────────────────────────────────────────
  Widget _buildJobTitleField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: _jobTitleController,
        decoration: InputDecoration(
          hintText: 'Personal Job Title',
          hintStyle: const TextStyle(color: Colors.black54, fontSize: 14),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
          ),
        ),
      ),
    );
  }

  // ─── Category Dropdown ────────────────────────────────────────────────────
  Widget _buildCategoryDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => setState(() => _dropdownOpen = !_dropdownOpen),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
              child: Row(
                children: [
                  Text(
                    _selectedCategory,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const Spacer(),
                  Icon(
                    _dropdownOpen
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
          if (_dropdownOpen)
            Container(
              margin: const EdgeInsets.only(top: 2),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFE0E0E0)),
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
                children: _categories
                    .map(
                      (cat) => InkWell(
                        onTap: () {
                          setState(() {
                            _selectedCategory = cat;
                            _dropdownOpen = false;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          child: Text(
                            cat,
                            style: TextStyle(
                              fontSize: 14,
                              color: cat == _selectedCategory
                                  ? AppColors.primary
                                  : Colors.black87,
                              fontWeight: cat == _selectedCategory
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }

  // ─── Expected Salary ──────────────────────────────────────────────────────
  Widget _buildExpectedSalary() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Expected Salary',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _buildSalaryField(_salaryMinController)),
              const SizedBox(width: 12),
              Expanded(child: _buildSalaryField(_salaryMaxController)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSalaryField(TextEditingController ctrl) {
    return TextField(
      controller: ctrl,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixText: '\$ ',
        prefixStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w600,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),
    );
  }

  // ─── Employment Type ──────────────────────────────────────────────────────
  Widget _buildEmploymentType() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Employment Type',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE0E0E0)),
            ),
            child: Row(
              children: _employmentTypes.asMap().entries.map((entry) {
                final i = entry.key;
                final type = entry.value;
                final selected = _selectedEmploymentType == type;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedEmploymentType = type),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: selected
                            ? AppColors.primary.withOpacity(0.08)
                            : Colors.transparent,
                        borderRadius: BorderRadius.only(
                          topLeft: i == 0
                              ? const Radius.circular(10)
                              : Radius.zero,
                          bottomLeft: i == 0
                              ? const Radius.circular(10)
                              : Radius.zero,
                          topRight: i == _employmentTypes.length - 1
                              ? const Radius.circular(10)
                              : Radius.zero,
                          bottomRight: i == _employmentTypes.length - 1
                              ? const Radius.circular(10)
                              : Radius.zero,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        type,
                        style: TextStyle(
                          fontSize: 13,
                          color: selected ? AppColors.primary : Colors.black54,
                          fontWeight: selected
                              ? FontWeight.w700
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Preferred Working Location ───────────────────────────────────────────
  Widget _buildPreferredLocation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Preferred Working Location',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE0E0E0)),
            ),
            child: Row(
              children: _locationTypes.asMap().entries.map((entry) {
                final i = entry.key;
                final type = entry.value;
                final selected = _selectedLocationType == type;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedLocationType = type),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: selected
                            ? AppColors.primary.withOpacity(0.08)
                            : Colors.transparent,
                        borderRadius: BorderRadius.only(
                          topLeft: i == 0
                              ? const Radius.circular(10)
                              : Radius.zero,
                          bottomLeft: i == 0
                              ? const Radius.circular(10)
                              : Radius.zero,
                          topRight: i == _locationTypes.length - 1
                              ? const Radius.circular(10)
                              : Radius.zero,
                          bottomRight: i == _locationTypes.length - 1
                              ? const Radius.circular(10)
                              : Radius.zero,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        type,
                        style: TextStyle(
                          fontSize: 13,
                          color: selected ? AppColors.primary : Colors.black54,
                          fontWeight: selected
                              ? FontWeight.w700
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Availability ─────────────────────────────────────────────────────────
  Widget _buildAvailability() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Text(
            'Availability',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () =>
                setState(() => _availabilitySelected = !_availabilitySelected),
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _availabilitySelected
                      ? AppColors.primary
                      : Colors.black38,
                  width: 2,
                ),
                color: _availabilitySelected
                    ? AppColors.primary
                    : Colors.transparent,
              ),
              child: _availabilitySelected
                  ? const Icon(Icons.check, color: Colors.white, size: 14)
                  : null,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            '1 month',
            style: TextStyle(fontSize: 14, color: Colors.black87),
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
                    builder: (_) => const JobSeekerPostSkillPage(),
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
