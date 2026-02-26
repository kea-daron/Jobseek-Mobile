import 'package:flutter/material.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_apply_page.dart';
import 'package:jobseek/shared/themes.dart';

class JobDetailPage extends StatelessWidget {
  final String title;
  final String company;
  final bool isApple;
  final Color logoColor;
  final String logoText;

  const JobDetailPage({
    super.key,
    required this.title,
    required this.company,
    required this.isApple,
    required this.logoColor,
    required this.logoText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Job Description',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            _buildTopSection(),
            const SizedBox(height: 16),
            _buildMeta(),
            const SizedBox(height: 16),
            _buildDates(),
            const SizedBox(height: 20),
            _buildInfoStripe(),
            const SizedBox(height: 20),
            _buildManagedBy(),
            const SizedBox(height: 24),
            _buildMustHaveSkills(),
            const SizedBox(height: 24),
            _buildJobDescription(),
            const SizedBox(height: 24),
            _buildAboutCompany(),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottom(context),
    );
  }

  // ─── Logo + title ─────────────────────────────────────────────────────────
  Widget _buildTopSection() {
    return Center(
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: isApple
                  ? const Color(0xFFF2F2F2)
                  : logoColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: isApple
                ? const Icon(Icons.apple, size: 48, color: Colors.black87)
                : Text(
                    logoText,
                    style: TextStyle(
                      color: logoColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 32,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  // ─── Location / Salary / Position ─────────────────────────────────────────
  Widget _buildMeta() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _metaRow(Icons.location_on_outlined, 'Jakarta, Indonesia - Onsite'),
        const SizedBox(height: 6),
        _metaRow(Icons.attach_money_rounded, '12,000'),
        const SizedBox(height: 6),
        _metaRow(Icons.people_outline, '2 position'),
      ],
    );
  }

  Widget _metaRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.black54),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(fontSize: 13, color: Colors.black87)),
      ],
    );
  }

  // ─── Publish / Closing dates ──────────────────────────────────────────────
  Widget _buildDates() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 13),
            children: [
              TextSpan(
                text: 'Publish Date  ',
                style: TextStyle(
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: 'Aug 05, 2025',
                style: TextStyle(color: Colors.black87),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 13),
            children: [
              const TextSpan(
                text: 'Closing Date  ',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: 'Oct 30, 2025',
                style: TextStyle(
                  color: Colors.red.shade700,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.red.shade700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ─── Experience / Job Type / Level stripe ─────────────────────────────────
  Widget _buildInfoStripe() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          _stripeItem('Experience', '2 - 6 Years'),
          _stripeDivider(),
          _stripeItem('Job Type', 'Full time'),
          _stripeDivider(),
          _stripeItem('Level', 'Entry level'),
        ],
      ),
    );
  }

  Widget _stripeItem(String label, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: Colors.black45),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _stripeDivider() {
    return Container(width: 1, height: 36, color: Colors.black12);
  }

  // ─── Managed by ───────────────────────────────────────────────────────────
  Widget _buildManagedBy() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/meyling.jpg'),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'This job post is managed by',
                style: TextStyle(fontSize: 11, color: Colors.white70),
              ),
              Text(
                'Nabila Nanda',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                'Online 2 days ago',
                style: TextStyle(fontSize: 11, color: Colors.white60),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ─── Must Have Skills ─────────────────────────────────────────────────────
  Widget _buildMustHaveSkills() {
    const skills = [
      'Teamwork',
      'Adaptability',
      'Critical Thinking',
      'Analytical Skills',
      'UX Design',
      'Creative Design',
      'Communication Skills',
      'UI Design',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Must Have Skills',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: skills
              .map(
                (s) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(s, style: const TextStyle(fontSize: 12)),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  // ─── Job Description ──────────────────────────────────────────────────────
  Widget _buildJobDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Job Description',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        const Text(
          'Netflix is seeking a talented UI Designer to join our design team. In this role, you will be responsible for crafting innovative and engaging user interfaces for our streaming platform. You will work closely with UX designers, product managers, and engineers to create a seamless and intuitive user experience.',
          style: TextStyle(fontSize: 13, color: Colors.black87, height: 1.55),
        ),
        const SizedBox(height: 16),
        _sectionHeader('Responsibilities:'),
        const SizedBox(height: 6),
        ..._bullets([
          'Design user interfaces that are visually appealing and easy to use.',
          'Collaborate with cross-functional teams to define and implement innovative solutions for the product direction, visuals, and experience.',
          'Excellent visual design skills with a keen eye for detail.',
          'Create wireframes, storyboards, user flows, process flows, and site maps to communicate interaction and design ideas.',
          'Conduct user research and evaluate user feedback to improve and iterate on design solutions.',
          'Ensure designs are consistent with the Netflix brand and design guidelines.',
          'Stay up to date with the latest UI trends, techniques, and technologies.',
        ]),
        const SizedBox(height: 16),
        _sectionHeader('Requirements:'),
        const SizedBox(height: 6),
        ..._bullets([
          'Proven UI design experience with a strong portfolio.',
          'Proficiency in design and prototyping tools such as Figma, Sketch, Adobe XD, or similar.',
          'Solid experience in creating wireframes, storyboards, user flows, and process flows.',
          'Ability to solve problems creatively and effectively.',
          'Strong communication skills and the ability to articulate design decisions.',
          "Bachelor's degree in Design, Human-Computer Interaction (HCI), or related field is preferred.",
        ]),
        const SizedBox(height: 16),
        _sectionHeader('Benefits:'),
        const SizedBox(height: 6),
        ..._bullets([
          'Competitive salary and benefits package.',
          'Health, dental, and vision insurance.',
          'Unlimited vacation policy.',
          'Remote work flexibility.',
          'Access to Netflix streaming service and content.',
          'Professional development opportunities.',
        ]),
      ],
    );
  }

  Widget _sectionHeader(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
    );
  }

  List<Widget> _bullets(List<String> items) {
    return items
        .map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '• ',
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),
                Expanded(
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();
  }

  // ─── About The Company ────────────────────────────────────────────────────
  Widget _buildAboutCompany() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'About The Company',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        // Company row
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/icons/aba-bank-logo.png',
                height: 40,
                width: 60,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ABA BANK',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      'Streaming Online  30 - 120 employees',
                      style: TextStyle(fontSize: 11, color: Colors.black45),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.black38),
            ],
          ),
        ),
        const SizedBox(height: 10),
        // Office address
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Office Address',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Los Gatos, California, United States',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.location_on_outlined,
                color: AppColors.secondary,
                size: 22,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        // View more jobs
        Row(
          children: const [
            Icon(Icons.email_outlined, color: AppColors.primary, size: 18),
            SizedBox(width: 8),
            Text(
              'View more jobs from this company',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ─── Bottom bar ───────────────────────────────────────────────────────────
  Widget _buildBottom(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.secondary),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.share_outlined, color: AppColors.secondary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SizedBox(
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => JobSeekerApplyPage(
                        title: title,
                        isApple: isApple,
                        logoColor: logoColor,
                        logoText: logoText,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Apply Now',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
