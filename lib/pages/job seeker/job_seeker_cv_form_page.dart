import 'package:flutter/material.dart';
import 'package:jobseek/shared/themes.dart';

class JobSeekerCvFormPage extends StatefulWidget {
  const JobSeekerCvFormPage({super.key});

  @override
  State<JobSeekerCvFormPage> createState() => _JobSeekerCvFormPageState();
}

class _JobSeekerCvFormPageState extends State<JobSeekerCvFormPage> {
  int _currentStep = 0;
  int _navIndex = 1;
  String? _selectedGender;
  int _selectedTemplate = 0;

  final _firstNameController = TextEditingController(text: 'Violet');
  final _lastNameController = TextEditingController(text: 'Morrison');
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();

  // Work Experiences
  final List<Map<String, TextEditingController>> _workEntries = [
    {
      'employer': TextEditingController(),
      'startDate': TextEditingController(),
      'endDate': TextEditingController(),
      'jobTitle': TextEditingController(),
      'location': TextEditingController(),
      'description': TextEditingController(),
    },
  ];

  final List<Map<String, TextEditingController>> _educationEntries = [
    {
      'school': TextEditingController(),
      'startDate': TextEditingController(),
      'endDate': TextEditingController(),
      'subject': TextEditingController(),
      'degree': TextEditingController(),
      'description': TextEditingController(),
    },
  ];

  // Other Information
  final _otherDescriptionController = TextEditingController();
  final _languagesController = TextEditingController();
  final _referencesController = TextEditingController();
  final _skillsController = TextEditingController();
  final List<Map<String, TextEditingController>> _customSections = [];

  final _steps = const [
    'Contact\nInformation',
    'Work\nExperiences',
    'Education\nDetails',
    'Other\nInformation',
    'Save/\nDownload',
  ];

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    for (final entry in _workEntries) {
      entry.values.forEach((c) => c.dispose());
    }
    for (final entry in _educationEntries) {
      entry.values.forEach((c) => c.dispose());
    }
    _otherDescriptionController.dispose();
    _languagesController.dispose();
    _referencesController.dispose();
    _skillsController.dispose();
    for (final s in _customSections) {
      s.values.forEach((c) => c.dispose());
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            if (_currentStep > 0) {
              setState(() => _currentStep--);
            } else {
              Navigator.pop(context);
            }
          },
        ),
        centerTitle: false,
        title: const Text(
          'Create CV',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          _buildStepper(),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildStepContent(),
            ),
          ),
          _buildNextButton(),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  // ─── Step indicator ───────────────────────────────────────────────────────
  Widget _buildStepper() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(_steps.length * 2 - 1, (index) {
          if (index.isOdd) {
            // Arrow
            return const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Icon(Icons.arrow_forward, size: 14, color: Colors.black38),
            );
          }
          final stepIndex = index ~/ 2;
          final isActive = stepIndex == _currentStep;
          return Expanded(
            child: Column(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.primary : Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _steps[stepIndex],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 9,
                    color: isActive ? AppColors.primary : Colors.black38,
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.normal,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  // ─── Step content switcher ─────────────────────────────────────────────────
  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0:
        return _buildContactForm();
      case 1:
        return _buildWorkExperiencesForm();
      case 2:
        return _buildEducationDetailsForm();
      case 3:
        return _buildOtherInformationForm();
      case 4:
        return _buildSaveDownloadForm();
      default:
        return const SizedBox.shrink();
    }
  }

  // ─── Contact form ─────────────────────────────────────────────────────────
  Widget _buildContactForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Photo + First/Last name row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPhotoPicker(),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _fieldLabel('First Name', required: true),
                  const SizedBox(height: 6),
                  _textField(controller: _firstNameController, hint: 'Violet'),
                  const SizedBox(height: 12),
                  _fieldLabel('Last Name', required: true),
                  const SizedBox(height: 6),
                  _textField(controller: _lastNameController, hint: 'Morrison'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        _fieldLabel('Email Address'),
        const SizedBox(height: 6),
        _textField(
          controller: _emailController,
          hint: 'name@gmail.com',
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20),
        _fieldLabel('Gender'),
        const SizedBox(height: 6),
        _genderDropdown(),
        const SizedBox(height: 20),
        _fieldLabel('Phone Number'),
        const SizedBox(height: 6),
        _textField(
          controller: _phoneController,
          hint: '+855 123456789',
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 20),
        _fieldLabel('Home Address'),
        const SizedBox(height: 6),
        _textField(controller: _addressController, hint: '+855 123456789'),
        const SizedBox(height: 20),
        _fieldLabel('City'),
        const SizedBox(height: 6),
        _textField(controller: _cityController, hint: 'Your city'),
        const SizedBox(height: 24),
      ],
    );
  }

  // ─── Work Experiences form ────────────────────────────────────────────────
  Widget _buildWorkExperiencesForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        Center(
          child: Text(
            'Work Experiences',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
        ),
        const SizedBox(height: 24),
        ...List.generate(_workEntries.length, (i) => _buildWorkEntry(i)),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              _workEntries.add({
                'employer': TextEditingController(),
                'startDate': TextEditingController(),
                'endDate': TextEditingController(),
                'jobTitle': TextEditingController(),
                'location': TextEditingController(),
                'description': TextEditingController(),
              });
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add, color: Colors.white, size: 18),
                SizedBox(width: 6),
                Text(
                  'add new',
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
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildWorkEntry(int index) {
    final entry = _workEntries[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (index > 0) ...[
          const Divider(height: 32),
          const SizedBox(height: 4),
        ],
        _fieldLabel('Employer'),
        const SizedBox(height: 6),
        _textField(controller: entry['employer']!, hint: 'ABA'),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _fieldLabel('Start Date'),
                  const SizedBox(height: 6),
                  _dateField(entry['startDate']!, 'July-13-2024'),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _fieldLabel('End Date'),
                  const SizedBox(height: 6),
                  _dateField(entry['endDate']!, 'Aug-1-2025'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _fieldLabel('Job Title'),
        const SizedBox(height: 6),
        _textField(controller: entry['jobTitle']!, hint: 'Sales Manager'),
        const SizedBox(height: 16),
        _fieldLabel('Location'),
        const SizedBox(height: 6),
        _textField(controller: entry['location']!, hint: 'Tulkok, Cambodia'),
        const SizedBox(height: 16),
        _fieldLabel('Description'),
        const SizedBox(height: 6),
        _multilineField(
          controller: entry['description']!,
          hint:
              'Describe your tasks, responsibilities and any competencies related to this work experience',
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _dateField(TextEditingController controller, String hint) {
    return GestureDetector(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (picked != null) {
          controller.text =
              '${_monthName(picked.month)}-${picked.day}-${picked.year}';
        }
      },
      child: AbsorbPointer(
        child: TextField(
          controller: controller,
          style: const TextStyle(fontSize: 13, color: Colors.black87),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 12, color: Colors.black38),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 12,
            ),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: const Icon(
              Icons.calendar_month_outlined,
              size: 18,
              color: Colors.black54,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.black26),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
          ),
        ),
      ),
    );
  }

  Widget _multilineField({
    required TextEditingController controller,
    required String hint,
  }) {
    return TextField(
      controller: controller,
      maxLines: 5,
      style: const TextStyle(fontSize: 13, color: Colors.black87),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 12, color: Colors.black38),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black26),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }

  // ─── Education Details form ──────────────────────────────────────────────
  Widget _buildEducationDetailsForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        Center(
          child: Text(
            'Education Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
        ),
        const SizedBox(height: 24),
        ...List.generate(
          _educationEntries.length,
          (i) => _buildEducationEntry(i),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              _educationEntries.add({
                'school': TextEditingController(),
                'startDate': TextEditingController(),
                'endDate': TextEditingController(),
                'subject': TextEditingController(),
                'degree': TextEditingController(),
                'description': TextEditingController(),
              });
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add, color: Colors.white, size: 18),
                SizedBox(width: 6),
                Text(
                  'other details',
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
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildEducationEntry(int index) {
    final entry = _educationEntries[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (index > 0) ...[
          const Divider(height: 32),
          const SizedBox(height: 4),
        ],
        _fieldLabel('School'),
        const SizedBox(height: 6),
        _textField(controller: entry['school']!, hint: 'RUPP'),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _fieldLabel('Start Date'),
                  const SizedBox(height: 6),
                  _dateField(entry['startDate']!, 'July-13-2024'),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _fieldLabel('End Date'),
                  const SizedBox(height: 6),
                  _dateField(entry['endDate']!, 'Aug-1-2025'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _fieldLabel('Subject'),
        const SizedBox(height: 6),
        _textField(controller: entry['subject']!, hint: 'Sales Manager'),
        const SizedBox(height: 16),
        _fieldLabel('Degree'),
        const SizedBox(height: 6),
        _textField(controller: entry['degree']!, hint: 'BSc'),
        const SizedBox(height: 16),
        _fieldLabel('Description'),
        const SizedBox(height: 6),
        _multilineField(
          controller: entry['description']!,
          hint:
              'Add a description for your course to explain exactly what it entailed to potential employers.',
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  String _monthName(int month) {
    const names = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return names[month - 1];
  }

  // ─── Other Information form ─────────────────────────────────────────────
  Widget _buildOtherInformationForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        Center(
          child: Text(
            'Other Information',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
        ),
        const SizedBox(height: 24),
        _fieldLabel('Description'),
        const SizedBox(height: 6),
        _multilineField(
          controller: _otherDescriptionController,
          hint:
              'Add a description for your course to explain exactly what it entailed to potential employers.',
        ),
        const SizedBox(height: 20),
        _fieldLabel('Languages'),
        const SizedBox(height: 6),
        _textField(controller: _languagesController, hint: 'your language'),
        const SizedBox(height: 20),
        _fieldLabel('References'),
        const SizedBox(height: 6),
        _textField(controller: _referencesController, hint: 'references'),
        const SizedBox(height: 20),
        _fieldLabel('Skills'),
        const SizedBox(height: 6),
        _textField(controller: _skillsController, hint: 'skills'),
        const SizedBox(height: 20),
        ...List.generate(_customSections.length, (i) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _fieldLabel('Custom Section'),
                const SizedBox(height: 6),
                _textField(
                  controller: _customSections[i]['title']!,
                  hint: 'Section title',
                ),
                const SizedBox(height: 10),
                _multilineField(
                  controller: _customSections[i]['content']!,
                  hint: 'Section content',
                ),
              ],
            ),
          );
        }),
        GestureDetector(
          onTap: () {
            setState(() {
              _customSections.add({
                'title': TextEditingController(),
                'content': TextEditingController(),
              });
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add, color: Colors.white, size: 18),
                SizedBox(width: 6),
                Text(
                  'add custom section',
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
        const SizedBox(height: 24),
      ],
    );
  }

  // ─── Save / Download form ────────────────────────────────────────────────
  Widget _buildSaveDownloadForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        Center(
          child: Text(
            'Choose a template',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
        ),
        const SizedBox(height: 24),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (context, i) => GestureDetector(
            onTap: () => setState(() => _selectedTemplate = i),
            child: _buildTemplateCard(i),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildTemplateCard(int index) {
    final isSelected = _selectedTemplate == index;
    // Four distinct template layout styles
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF0F1F5),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? AppColors.primary : Colors.transparent,
              width: 2,
            ),
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: index.isEven
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              // Avatar placeholder
              if (index == 0 || index == 2)
                Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: Color(0xFFD0D3E0),
                    shape: BoxShape.circle,
                  ),
                )
              else
                Center(
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: index == 1
                          ? AppColors.primary.withOpacity(0.18)
                          : const Color(0xFFD0D3E0),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              const SizedBox(height: 8),
              // Name line
              Container(
                height: 7,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFBFC3D2),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                height: 5,
                width: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFD0D3E0),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 10),
              // Divider-like line
              Container(height: 1, color: const Color(0xFFBFC3D2)),
              const SizedBox(height: 8),
              // Content lines
              ...List.generate(
                5,
                (j) => Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Container(
                    height: 5,
                    width: j.isEven ? double.infinity : 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD0D3E0),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Container(height: 1, color: const Color(0xFFBFC3D2)),
              const SizedBox(height: 8),
              ...List.generate(
                4,
                (j) => Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Container(
                    height: 5,
                    width: j == 0 ? 60 : double.infinity,
                    decoration: BoxDecoration(
                      color: index < 2
                          ? const Color(0xFFD0D3E0)
                          : AppColors.primary.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Yellow star badge
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            width: 22,
            height: 22,
            decoration: const BoxDecoration(
              color: Color(0xFFE9B31F),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.star, color: Colors.white, size: 13),
          ),
        ),
        // Selected checkmark
        if (isSelected)
          Positioned(
            bottom: 12,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 17),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildPhotoPicker() {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary, width: 1.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.camera_alt_outlined, color: Colors.black38, size: 32),
          SizedBox(height: 8),
          Text(
            'add photo\n(optional)',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11, color: Colors.black45, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _fieldLabel(String label, {bool required = false}) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        if (required)
          const Text(' *', style: TextStyle(color: Colors.red, fontSize: 13)),
      ],
    );
  }

  Widget _textField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(fontSize: 13, color: Colors.black87),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 13, color: Colors.black38),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black26),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }

  Widget _genderDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black26),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedGender,
          hint: const Text(
            'Gender',
            style: TextStyle(fontSize: 13, color: Colors.black38),
          ),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
          style: const TextStyle(fontSize: 13, color: Colors.black87),
          items: const [
            DropdownMenuItem(value: 'Male', child: Text('Male')),
            DropdownMenuItem(value: 'Female', child: Text('Female')),
            DropdownMenuItem(value: 'Other', child: Text('Other')),
          ],
          onChanged: (val) => setState(() => _selectedGender = val),
        ),
      ),
    );
  }

  // ─── Next button ──────────────────────────────────────────────────────────
  Widget _buildNextButton() {
    final isLastStep = _currentStep == _steps.length - 1;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
      child: SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onPressed: () {
            if (!isLastStep) {
              setState(() => _currentStep++);
            } else {
              // TODO: save / download CV
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('CV saved!')));
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLastStep) ...[
                const Icon(Icons.download_rounded, size: 20),
                const SizedBox(width: 8),
                const Text(
                  'Save / Download',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ] else ...[
                const Text(
                  'Next step',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.chevron_right, size: 22),
              ],
            ],
          ),
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
                    Navigator.popUntil(context, (r) => r.isFirst);
                  } else {
                    setState(() => _navIndex = i);
                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        _navIndex == i ? AppColors.secondary : Colors.white,
                        BlendMode.srcIn,
                      ),
                      child: Image.asset(items[i].icon, height: 24, width: 24),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      items[i].label,
                      style: TextStyle(
                        fontSize: 11,
                        color: _navIndex == i
                            ? AppColors.secondary
                            : Colors.white,
                        fontWeight: _navIndex == i
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
