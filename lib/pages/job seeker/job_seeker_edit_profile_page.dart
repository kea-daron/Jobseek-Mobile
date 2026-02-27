import 'package:flutter/material.dart';
import 'package:jobseek/shared/themes.dart';

class JobSeekerEditProfilePage extends StatefulWidget {
  const JobSeekerEditProfilePage({super.key});

  @override
  State<JobSeekerEditProfilePage> createState() =>
      _JobSeekerEditProfilePageState();
}

class _JobSeekerEditProfilePageState extends State<JobSeekerEditProfilePage> {
  // Controllers
  final _nameCtrl = TextEditingController(text: 'Sokkay Thoeurn');
  final _titleCtrl = TextEditingController(text: 'Full Stack Developer');
  final _phoneCtrl = TextEditingController(text: '+855 971 523 197');
  final _emailCtrl = TextEditingController(text: 'thoeurnsokkay@gmail.com');
  final _locationCtrl = TextEditingController(
    text: 'Sen Sok, Phnom Penh, Cambodia',
  );
  final _bioCtrl = TextEditingController(
    text:
        'I am a passionate Full Stack Developer with a strong focus on building modern, responsive, and scalable web and mobile applications.',
  );
  final _githubCtrl = TextEditingController(text: 'github.com/sokkay');
  final _linkedinCtrl = TextEditingController(text: 'linkedin.com/in/sokkay');
  final _websiteCtrl = TextEditingController(text: 'sokkay.dev');

  String _selectedGender = 'Male';
  String _selectedCategory = 'Information Technology';
  String _selectedExperience = '1 – 3 years';
  String _selectedAvailability = 'Full-time';

  final List<String> _genders = ['Male', 'Female', 'Other'];
  final List<String> _categories = [
    'Information Technology',
    'Design',
    'Accounting',
    'Human Resources',
    'Marketing',
    'Other',
  ];
  final List<String> _experienceLevels = [
    'No experience',
    'Less than 1 year',
    '1 – 3 years',
    '3 – 5 years',
    '5+ years',
  ];
  final List<String> _availabilities = [
    'Full-time',
    'Part-time',
    'Freelance',
    'Internship',
  ];

  bool _isSaving = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _titleCtrl.dispose();
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
    _locationCtrl.dispose();
    _bioCtrl.dispose();
    _githubCtrl.dispose();
    _linkedinCtrl.dispose();
    _websiteCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    setState(() => _isSaving = true);
    await Future.delayed(const Duration(milliseconds: 900));
    if (mounted) {
      setState(() => _isSaving = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.check_circle_rounded, color: Colors.white),
              SizedBox(width: 10),
              Text('Profile updated successfully!'),
            ],
          ),
          backgroundColor: Colors.green.shade600,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(16),
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F8),
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAvatarSection(),
                  const SizedBox(height: 22),
                  _buildSection(
                    icon: Icons.person_outline_rounded,
                    title: 'Personal Information',
                    children: [
                      _field(
                        'Full Name',
                        _nameCtrl,
                        hint: 'Enter your full name',
                      ),
                      _dropdown(
                        'Gender',
                        _selectedGender,
                        _genders,
                        (v) => setState(() => _selectedGender = v!),
                      ),
                      _field(
                        'Date of Birth',
                        null,
                        hint: 'DD / MM / YYYY',
                        suffixIcon: Icons.calendar_today_outlined,
                        readOnly: true,
                      ),
                      _field(
                        'Phone Number',
                        _phoneCtrl,
                        hint: '+855 xxx xxx xxx',
                        keyboardType: TextInputType.phone,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildSection(
                    icon: Icons.work_outline_rounded,
                    title: 'Professional Information',
                    children: [
                      _field(
                        'Job Title',
                        _titleCtrl,
                        hint: 'e.g. Full Stack Developer',
                      ),
                      _dropdown(
                        'Job Category',
                        _selectedCategory,
                        _categories,
                        (v) => setState(() => _selectedCategory = v!),
                      ),
                      _dropdown(
                        'Experience Level',
                        _selectedExperience,
                        _experienceLevels,
                        (v) => setState(() => _selectedExperience = v!),
                      ),
                      _dropdown(
                        'Availability',
                        _selectedAvailability,
                        _availabilities,
                        (v) => setState(() => _selectedAvailability = v!),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildSection(
                    icon: Icons.sticky_note_2_outlined,
                    title: 'About Me',
                    children: [
                      _field(
                        'Bio',
                        _bioCtrl,
                        hint: 'Write a short bio about yourself…',
                        maxLines: 5,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildSection(
                    icon: Icons.contact_mail_outlined,
                    title: 'Contact',
                    children: [
                      _field(
                        'Email',
                        _emailCtrl,
                        hint: 'your@email.com',
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Icons.email_outlined,
                      ),
                      _field(
                        'Location',
                        _locationCtrl,
                        hint: 'City, Country',
                        prefixIcon: Icons.location_on_outlined,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildSection(
                    icon: Icons.link_rounded,
                    title: 'Links & Portfolio',
                    children: [
                      _field(
                        'GitHub',
                        _githubCtrl,
                        hint: 'github.com/username',
                        prefixIcon: Icons.code_rounded,
                      ),
                      _field(
                        'LinkedIn',
                        _linkedinCtrl,
                        hint: 'linkedin.com/in/username',
                        prefixIcon: Icons.work_outline_rounded,
                      ),
                      _field(
                        'Website / Portfolio',
                        _websiteCtrl,
                        hint: 'yoursite.dev',
                        prefixIcon: Icons.language_rounded,
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  _buildSaveButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Header ──────────────────────────────────────────────────────────────
  Widget _buildHeader(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0A2572), Color(0xFF1A4DB8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.15),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.3,
                  ),
                ),
              ),
              GestureDetector(
                onTap: _isSaving ? null : _save,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.secondary.withOpacity(0.45),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Avatar section ───────────────────────────────────────────────────────
  Widget _buildAvatarSection() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 22),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Outer glow ring
            Container(
              width: 112,
              height: 112,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [AppColors.secondary, const Color(0xFFF5E06B)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.secondary.withOpacity(0.35),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(3),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/meyling.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Camera badge
            Positioned(
              bottom: 2,
              right: 2,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.4),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Section card ─────────────────────────────────────────────────────────
  Widget _buildSection({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: AppColors.primary, size: 18),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  // ── Text field ────────────────────────────────────────────────────────────
  Widget _field(
    String label,
    TextEditingController? controller, {
    String hint = '',
    int maxLines = 1,
    bool readOnly = false,
    TextInputType keyboardType = TextInputType.text,
    IconData? prefixIcon,
    IconData? suffixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            maxLines: maxLines,
            readOnly: readOnly,
            keyboardType: keyboardType,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(fontSize: 13, color: Colors.black26),
              filled: true,
              fillColor: const Color(0xFFF5F6FA),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              prefixIcon: prefixIcon != null
                  ? Icon(prefixIcon, color: AppColors.primary, size: 18)
                  : null,
              suffixIcon: suffixIcon != null
                  ? Icon(suffixIcon, color: Colors.black38, size: 18)
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE8EAED)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Dropdown ──────────────────────────────────────────────────────────────
  Widget _dropdown(
    String label,
    String value,
    List<String> items,
    ValueChanged<String?> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            value: value,
            items: items
                .map(
                  (i) => DropdownMenuItem(
                    value: i,
                    child: Text(
                      i,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: onChanged,
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.primary,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF5F6FA),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE8EAED)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Save button ───────────────────────────────────────────────────────────
  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: _isSaving ? null : _save,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          disabledBackgroundColor: AppColors.primary.withOpacity(0.6),
          elevation: 4,
          shadowColor: AppColors.primary.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: _isSaving
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              )
            : const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Save Changes',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
