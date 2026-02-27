import 'package:flutter/material.dart';
import 'package:jobseek/shared/themes.dart';

class JobSeekerEditPostPage extends StatefulWidget {
  final String name;
  final String role;
  final String bio;
  final String position;
  final String salary;
  final String jobType;
  final List<String> skills;
  final Map<String, String> links; // key: type, value: url/label

  const JobSeekerEditPostPage({
    super.key,
    required this.name,
    required this.role,
    required this.bio,
    required this.position,
    required this.salary,
    required this.jobType,
    required this.skills,
    required this.links,
  });

  @override
  State<JobSeekerEditPostPage> createState() => _JobSeekerEditPostPageState();
}

class _JobSeekerEditPostPageState extends State<JobSeekerEditPostPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameCtrl;
  late TextEditingController _roleCtrl;
  late TextEditingController _bioCtrl;
  late TextEditingController _positionCtrl;
  late TextEditingController _salaryCtrl;
  late TextEditingController _githubCtrl;
  late TextEditingController _telegramCtrl;
  late TextEditingController _linkedinCtrl;
  late TextEditingController _portfolioCtrl;

  late List<String> _skills;
  late String _jobType;
  final TextEditingController _skillInputCtrl = TextEditingController();

  static const _jobTypes = [
    'Full-Time',
    'Part-Time',
    'Remote',
    'Internship',
    'Contract',
  ];

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.name);
    _roleCtrl = TextEditingController(text: widget.role);
    _bioCtrl = TextEditingController(text: widget.bio);
    _positionCtrl = TextEditingController(text: widget.position);
    _salaryCtrl = TextEditingController(text: widget.salary);
    _githubCtrl = TextEditingController(text: widget.links['github'] ?? '');
    _telegramCtrl = TextEditingController(text: widget.links['telegram'] ?? '');
    _linkedinCtrl = TextEditingController(text: widget.links['linkedin'] ?? '');
    _portfolioCtrl = TextEditingController(
      text: widget.links['portfolio'] ?? '',
    );
    _skills = List<String>.from(widget.skills);
    _jobType = widget.jobType;
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _roleCtrl.dispose();
    _bioCtrl.dispose();
    _positionCtrl.dispose();
    _salaryCtrl.dispose();
    _githubCtrl.dispose();
    _telegramCtrl.dispose();
    _linkedinCtrl.dispose();
    _portfolioCtrl.dispose();
    _skillInputCtrl.dispose();
    super.dispose();
  }

  void _addSkill() {
    final s = _skillInputCtrl.text.trim();
    if (s.isNotEmpty && !_skills.contains(s)) {
      setState(() => _skills.add(s));
      _skillInputCtrl.clear();
    }
  }

  void _removeSkill(String s) => setState(() => _skills.remove(s));

  void _save() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Post updated successfully!'),
          backgroundColor: Color(0xFF2E7D32),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  // ─────────────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F8),
      body: Column(
        children: [
          _buildAppBar(),
          Expanded(
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
                children: [
                  // ── Avatar section ──────────────────────────────────────
                  _buildAvatarSection(),
                  const SizedBox(height: 24),

                  // ── Personal Info ────────────────────────────────────────
                  _sectionTitle('Personal Info'),
                  const SizedBox(height: 12),
                  _buildField(
                    controller: _nameCtrl,
                    label: 'Full Name',
                    icon: Icons.person_outline_rounded,
                    validator: (v) =>
                        v == null || v.isEmpty ? 'Name is required' : null,
                  ),
                  const SizedBox(height: 12),
                  _buildField(
                    controller: _roleCtrl,
                    label: 'Role / Title',
                    icon: Icons.badge_outlined,
                    validator: (v) =>
                        v == null || v.isEmpty ? 'Role is required' : null,
                  ),
                  const SizedBox(height: 12),
                  _buildField(
                    controller: _bioCtrl,
                    label: 'Bio',
                    icon: Icons.notes_rounded,
                    maxLines: 3,
                  ),

                  const SizedBox(height: 24),

                  // ── Job Details ───────────────────────────────────────────
                  _sectionTitle('Job Details'),
                  const SizedBox(height: 12),
                  _buildField(
                    controller: _positionCtrl,
                    label: 'Position',
                    icon: Icons.work_outline_rounded,
                    validator: (v) =>
                        v == null || v.isEmpty ? 'Position is required' : null,
                  ),
                  const SizedBox(height: 12),
                  _buildField(
                    controller: _salaryCtrl,
                    label: 'Expected Salary',
                    icon: Icons.attach_money_rounded,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 12),
                  _buildJobTypeDropdown(),

                  const SizedBox(height: 24),

                  // ── Skills ────────────────────────────────────────────────
                  _sectionTitle('Skills'),
                  const SizedBox(height: 12),
                  _buildSkillsSection(),

                  const SizedBox(height: 24),

                  // ── Links ─────────────────────────────────────────────────
                  _sectionTitle('Links'),
                  const SizedBox(height: 12),
                  _buildField(
                    controller: _githubCtrl,
                    label: 'GitHub',
                    icon: Icons.code_rounded,
                  ),
                  const SizedBox(height: 12),
                  _buildField(
                    controller: _telegramCtrl,
                    label: 'Telegram',
                    icon: Icons.send_rounded,
                  ),
                  const SizedBox(height: 12),
                  _buildField(
                    controller: _linkedinCtrl,
                    label: 'LinkedIn',
                    icon: Icons.link_rounded,
                  ),
                  const SizedBox(height: 12),
                  _buildField(
                    controller: _portfolioCtrl,
                    label: 'Portfolio',
                    icon: Icons.grid_view_rounded,
                  ),

                  const SizedBox(height: 32),

                  // ── Save Button ───────────────────────────────────────────
                  _buildSaveButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── App Bar ──────────────────────────────────────────────────────────────
  Widget _buildAppBar() {
    return Container(
      color: AppColors.primary,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 4,
        right: 16,
        bottom: 10,
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left, color: Colors.white, size: 30),
            onPressed: () => Navigator.pop(context),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Edit Post',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: _save,
            child: const Text(
              'Save',
              style: TextStyle(
                color: AppColors.secondary,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Avatar Section ───────────────────────────────────────────────────────
  Widget _buildAvatarSection() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: const AssetImage('assets/images/daron.jpg'),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Section Title ────────────────────────────────────────────────────────
  Widget _sectionTitle(String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 18,
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }

  // ─── Input Field ──────────────────────────────────────────────────────────
  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        validator: validator,
        style: const TextStyle(fontSize: 14, color: Colors.black87),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontSize: 13, color: Colors.black45),
          prefixIcon: Icon(icon, size: 20, color: AppColors.primary),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.red, width: 1.2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
      ),
    );
  }

  // ─── Job Type Dropdown ────────────────────────────────────────────────────
  Widget _buildJobTypeDropdown() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      child: Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            size: 20,
            color: AppColors.primary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _jobType,
                isExpanded: true,
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.black45,
                ),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                ),
                onChanged: (v) => setState(() => _jobType = v!),
                items: _jobTypes
                    .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Skills Section ───────────────────────────────────────────────────────
  Widget _buildSkillsSection() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Existing chips
          if (_skills.isNotEmpty)
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _skills.map((s) => _skillChip(s)).toList(),
            ),
          if (_skills.isNotEmpty) const SizedBox(height: 12),
          // Add skill input
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _skillInputCtrl,
                  style: const TextStyle(fontSize: 13),
                  decoration: InputDecoration(
                    hintText: 'Add a skill...',
                    hintStyle: const TextStyle(
                      fontSize: 13,
                      color: Colors.black38,
                    ),
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: AppColors.primary,
                        width: 1.5,
                      ),
                    ),
                  ),
                  onSubmitted: (_) => _addSkill(),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: _addSkill,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _skillChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: () => _removeSkill(label),
            child: const Icon(Icons.close, color: Colors.white70, size: 14),
          ),
        ],
      ),
    );
  }

  // ─── Save Button ──────────────────────────────────────────────────────────
  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _save,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 2,
          shadowColor: AppColors.primary.withOpacity(0.4),
        ),
        child: const Text(
          'Save Changes',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
