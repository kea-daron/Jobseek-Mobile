import 'package:flutter/material.dart';
import 'package:jobseek/shared/themes.dart';

class BusinessOwnerCreateJobPage extends StatefulWidget {
  const BusinessOwnerCreateJobPage({super.key});

  @override
  State<BusinessOwnerCreateJobPage> createState() =>
      _BusinessOwnerCreateJobPageState();
}

class _BusinessOwnerCreateJobPageState
    extends State<BusinessOwnerCreateJobPage> {
  final _formKey = GlobalKey<FormState>();

  final _companyNameCtrl = TextEditingController();
  final _jobTitleCtrl = TextEditingController();
  final _locationCtrl = TextEditingController();
  final _advantagesCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  final _salaryMinCtrl = TextEditingController();

  String? _selectedCompanySize;
  String? _selectedSalaryUnit = 'per hour';
  String? _selectedIndustry;

  final Set<String> _selectedJobTypes = {};

  final List<String> _companySizes = [
    '1 – 10',
    '11 – 50',
    '51 – 200',
    '201 – 500',
    '500+',
  ];

  final List<String> _salaryUnits = [
    'per hour',
    'per day',
    'per month',
    'per year',
  ];

  final List<String> _industries = [
    'Information Technology',
    'Design & Creative',
    'Finance & Accounting',
    'Healthcare',
    'Education',
    'Marketing',
    'Engineering',
    'Other',
  ];

  final List<String> _jobTypes = [
    'Full-Time',
    'Part-Time',
    'Remote',
    'Internship',
    'Freelance',
  ];

  @override
  void dispose() {
    _companyNameCtrl.dispose();
    _jobTitleCtrl.dispose();
    _locationCtrl.dispose();
    _advantagesCtrl.dispose();
    _descCtrl.dispose();
    _salaryMinCtrl.dispose();
    super.dispose();
  }

  void _post() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Job posted successfully!'),
          backgroundColor: Color(0xFF22C55E),
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Create Job',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Upload Logo ──────────────────────────────────────────────
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.grey,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Text(
                        'Upload enterprise LOGO',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // ── Company Name ─────────────────────────────────────────────
              _label('Company Name'),
              _textField(
                controller: _companyNameCtrl,
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),

              // ── Job Title ────────────────────────────────────────────────
              _label('Job Title'),
              _textField(
                controller: _jobTitleCtrl,
                hint: 'Add a short description job title',
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),

              // ── Job Location ─────────────────────────────────────────────
              _label('Job Location'),
              const SizedBox(height: 2),
              Text(
                'Adding a specific address helps you reach nearby candidates.',
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
              const SizedBox(height: 8),
              _textField(controller: _locationCtrl, hint: 'Add an address'),
              const SizedBox(height: 16),

              // ── Company Size ─────────────────────────────────────────────
              _label('Select Company size'),
              _dropdown(
                value: _selectedCompanySize,
                items: _companySizes,
                hint: '',
                onChanged: (v) => setState(() => _selectedCompanySize = v),
              ),
              const SizedBox(height: 16),

              // ── Salary Range ─────────────────────────────────────────────
              _label('Salary range'),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _dropdown(
                      value: _selectedSalaryUnit,
                      items: _salaryUnits,
                      hint: '',
                      onChanged: (v) => setState(() => _selectedSalaryUnit = v),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _salaryMinCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'per hour',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 13,
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.primary,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // ── Industry ─────────────────────────────────────────────────
              _label('Select Industry'),
              _dropdown(
                value: _selectedIndustry,
                items: _industries,
                hint: '',
                onChanged: (v) => setState(() => _selectedIndustry = v),
              ),
              const SizedBox(height: 16),

              // ── Job Type ─────────────────────────────────────────────────
              _label('Job Type'),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _jobTypes.map((type) {
                  final selected = _selectedJobTypes.contains(type);
                  return GestureDetector(
                    onTap: () => setState(() {
                      if (selected) {
                        _selectedJobTypes.remove(type);
                      } else {
                        _selectedJobTypes.add(type);
                      }
                    }),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: selected ? AppColors.primary : Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: selected
                              ? AppColors.primary
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Text(
                        type,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: selected ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),

              // ── Business Advantages ──────────────────────────────────────
              _label('Introduce business advantages'),
              _textField(
                controller: _advantagesCtrl,
                hint: 'Add a short description',
              ),
              const SizedBox(height: 16),

              // ── Job Description ──────────────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _label('Job Description'),
                  ValueListenableBuilder(
                    valueListenable: _descCtrl,
                    builder: (_, value, __) => Text(
                      '${value.text.length}/5000',
                      style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _descCtrl,
                maxLines: 6,
                maxLength: 5000,
                buildCounter:
                    (
                      _, {
                      required currentLength,
                      required isFocused,
                      maxLength,
                    }) => const SizedBox.shrink(),
                decoration: InputDecoration(
                  hintText:
                      'Describe the responsibilities and preferred skill for this job',
                  hintStyle: TextStyle(fontSize: 13, color: Colors.grey[400]),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                      width: 1.5,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(12),
                ),
              ),
              const SizedBox(height: 32),

              // ── Post Now Button ──────────────────────────────────────────
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _post,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Post Now',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _textField({
    required TextEditingController controller,
    String? hint,
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[400], fontSize: 13),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
      ),
    );
  }

  Widget _dropdown({
    required String? value,
    required List<String> items,
    required String hint,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 8),
      ),
      hint: hint.isEmpty ? null : Text(hint),
      items: items
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(e, style: const TextStyle(fontSize: 14)),
            ),
          )
          .toList(),
    );
  }
}
