import 'package:flutter/material.dart';
import 'package:jobseek/shared/themes.dart';

class BusinessOwnerEditProfilePage extends StatefulWidget {
  const BusinessOwnerEditProfilePage({super.key});

  @override
  State<BusinessOwnerEditProfilePage> createState() =>
      _BusinessOwnerEditProfilePageState();
}

class _BusinessOwnerEditProfilePageState
    extends State<BusinessOwnerEditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final _companyNameCtrl = TextEditingController(text: 'Innovate Corp');
  final _taglineCtrl = TextEditingController(
    text: 'Software & Design Solution',
  );
  final _locationCtrl = TextEditingController(text: 'Phnom Penh, Cambodia');
  final _websiteCtrl = TextEditingController(text: 'www.innovatecorp.com');
  final _phoneCtrl = TextEditingController(text: '+855 12 345 678');
  final _emailCtrl = TextEditingController(text: 'contact@innovatecorp.com');
  final _descCtrl = TextEditingController(
    text:
        'JobSeeker Co. is a modern recruitment platform that connects employers with talented jobseekers. We help businesses find the right people faster through smart matching technology and simple hiring tools.',
  );

  String _selectedIndustry = 'Information Technology';
  String _selectedSize = '11 – 50';

  final List<String> _industries = [
    'Information Technology',
    'Design',
    'Finance',
    'Healthcare',
    'Education',
    'Marketing',
    'Other',
  ];

  final List<String> _companySizes = [
    '1 – 10',
    '11 – 50',
    '51 – 200',
    '201 – 500',
    '500+',
  ];

  @override
  void dispose() {
    _companyNameCtrl.dispose();
    _taglineCtrl.dispose();
    _locationCtrl.dispose();
    _websiteCtrl.dispose();
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile updated successfully!'),
          backgroundColor: Color(0xFF22C55E),
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Logo Section ────────────────────────────────────────────
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.lightbulb_outline_rounded,
                          color: AppColors.primary,
                          size: 44,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: const BoxDecoration(
                          color: AppColors.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt_rounded,
                          size: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // ── Company Info ────────────────────────────────────────────
              _sectionTitle('Company Info'),
              const SizedBox(height: 12),
              _inputField(
                controller: _companyNameCtrl,
                label: 'Company Name',
                icon: Icons.business_rounded,
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              _inputField(
                controller: _taglineCtrl,
                label: 'Tagline',
                icon: Icons.short_text_rounded,
              ),
              const SizedBox(height: 12),
              _dropdownField(
                label: 'Industry',
                icon: Icons.category_outlined,
                value: _selectedIndustry,
                items: _industries,
                onChanged: (v) => setState(() => _selectedIndustry = v!),
              ),
              const SizedBox(height: 12),
              _dropdownField(
                label: 'Company Size',
                icon: Icons.people_outline_rounded,
                value: _selectedSize,
                items: _companySizes,
                onChanged: (v) => setState(() => _selectedSize = v!),
              ),
              const SizedBox(height: 24),

              // ── Contact Info ────────────────────────────────────────────
              _sectionTitle('Contact Info'),
              const SizedBox(height: 12),
              _inputField(
                controller: _locationCtrl,
                label: 'Location',
                icon: Icons.location_on_outlined,
              ),
              const SizedBox(height: 12),
              _inputField(
                controller: _phoneCtrl,
                label: 'Phone Number',
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 12),
              _inputField(
                controller: _emailCtrl,
                label: 'Email',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),
              _inputField(
                controller: _websiteCtrl,
                label: 'Website',
                icon: Icons.language_outlined,
                keyboardType: TextInputType.url,
              ),
              const SizedBox(height: 24),

              // ── Description ─────────────────────────────────────────────
              _sectionTitle('Company Description'),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descCtrl,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Describe your company...',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
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
              const SizedBox(height: 32),

              // ── Save Button ──────────────────────────────────────────────
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Save Changes',
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

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppColors.primary, size: 20),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),
    );
  }

  Widget _dropdownField({
    required String label,
    required IconData icon,
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppColors.primary, size: 20),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
    );
  }
}
