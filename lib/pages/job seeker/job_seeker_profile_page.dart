import 'package:flutter/material.dart';
import 'package:jobseek/pages/choose_role_page.dart'; // ChooseRole
import 'package:jobseek/pages/job%20seeker/job_seeker_edit_profile_page.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_home_page.dart';
import 'package:jobseek/shared/themes.dart';

class JobSeekerProfilePage extends StatefulWidget {
  const JobSeekerProfilePage({super.key});

  @override
  State<JobSeekerProfilePage> createState() => _JobSeekerProfilePageState();
}

class _JobSeekerProfilePageState extends State<JobSeekerProfilePage>
    with SingleTickerProviderStateMixin {
  int _navIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // ── Data ────────────────────────────────────────────────────────────────
  final List<_Skill> _skills = [
    _Skill('Flutter', 0.9),
    _Skill('Dart', 0.85),
    _Skill('JavaScript', 0.75),
    _Skill('HTML / CSS', 0.88),
    _Skill('Node.js', 0.65),
    _Skill('Firebase', 0.70),
    _Skill('Git', 0.80),
    _Skill('Java', 0.60),
  ];

  final List<_TimelineItem> _experience = [
    _TimelineItem(
      icon: Icons.work_outline_rounded,
      title: 'Junior Full Stack Developer',
      subtitle: 'Innovate Solution Co., Ltd.',
      period: 'Jan 2023 – Present',
      isCurrent: true,
    ),
    _TimelineItem(
      icon: Icons.computer_rounded,
      title: 'Frontend Developer Intern',
      subtitle: 'Digital Agency KH',
      period: 'Jun 2022 – Dec 2022',
      isCurrent: false,
    ),
  ];

  final List<_TimelineItem> _education = [
    _TimelineItem(
      icon: Icons.school_outlined,
      title: 'Bachelor of Computer Science',
      subtitle: 'Royal University of Phnom Penh',
      period: '2019 – 2023',
      isCurrent: false,
    ),
    _TimelineItem(
      icon: Icons.menu_book_outlined,
      title: 'High School Diploma',
      subtitle: 'Hun Sen Toul Kork High School',
      period: '2016 – 2019',
      isCurrent: false,
    ),
  ];

  final List<_AppliedJob> _appliedJobs = [
    _AppliedJob(
      'Lead Full Stack Dev',
      'TeachCrop',
      'Under Review',
      Colors.orange,
    ),
    _AppliedJob(
      'Flutter Developer',
      'AppSoft Ltd.',
      'Shortlisted',
      Colors.green,
    ),
    _AppliedJob('Backend Engineer', 'CloudBase KH', 'Pending', Colors.blue),
    _AppliedJob('UI/UX Developer', 'PixelBridge', 'Rejected', Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F8),
      body: NestedScrollView(
        headerSliverBuilder: (ctx, inner) => [_buildSliverHeader(ctx)],
        body: Column(
          children: [
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildAboutTab(),
                  _buildSkillsTab(),
                  _buildExperienceTab(),
                  _buildPortfolioTab(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // ── Sliver App Bar / Hero ───────────────────────────────────────────────
  Widget _buildSliverHeader(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Gradient background
          Container(
            height: 200,
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back button
                    _circleButton(
                      Icons.arrow_back_ios_new_rounded,
                      Colors.white.withOpacity(0.25),
                      Colors.white,
                      () => Navigator.pop(context),
                    ),
                    const Spacer(),
                    // Edit & logout buttons
                    _circleButton(
                      Icons.edit_outlined,
                      Colors.red.withOpacity(0.25),
                      Colors.red,
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const JobSeekerEditProfilePage(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    _circleButton(
                      Icons.logout_rounded,
                      AppColors.secondary.withOpacity(0.25),
                      AppColors.secondary,
                      () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const ChooseRole()),
                        (route) => false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Decorative circles (IgnorePointer so they don't block button taps)
          IgnorePointer(
            child: Positioned(
              top: -30,
              right: -30,
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.05),
                ),
              ),
            ),
          ),
          IgnorePointer(
            child: Positioned(
              top: 40,
              left: -20,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.06),
                ),
              ),
            ),
          ),
          // Floating profile card
          Positioned(
            left: 16,
            right: 16,
            top: 140,
            child: _buildFloatingCard(),
          ),
          // Extra spacing below card
          SizedBox(height: 140 + 185.0),
        ],
      ),
    );
  }

  Widget _circleButton(
    IconData icon,
    Color bg,
    Color iconColor,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(shape: BoxShape.circle, color: bg),
        child: Icon(icon, color: iconColor, size: 18),
      ),
    );
  }

  Widget _buildFloatingCard() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0A2572).withOpacity(0.15),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // Photo + name row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar
              Stack(
                children: [
                  Container(
                    width: 82,
                    height: 82,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [AppColors.secondary, Color(0xFFF5E06B)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.secondary.withOpacity(0.4),
                          blurRadius: 12,
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
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 11,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              // Name & title
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sokkay Thoeurn',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.black87,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Full Stack Developer',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 13,
                          color: Colors.black45,
                        ),
                        const SizedBox(width: 3),
                        const Text(
                          'Sen Sok, Phnom Penh',
                          style: TextStyle(fontSize: 11, color: Colors.black45),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          // Stats row
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F6FA),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                _statItem('24', 'Applied'),
                _verticalDivider(),
                _statItem('38', 'Saved'),
                _verticalDivider(),
                _statItem('142', 'Views'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _statItem(String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: Colors.black45),
          ),
        ],
      ),
    );
  }

  Widget _verticalDivider() {
    return Container(width: 1, height: 32, color: Colors.black12);
  }

  // ── Tab Bar ─────────────────────────────────────────────────────────────
  Widget _buildTabBar() {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: _tabController,
        isScrollable: false,
        indicatorColor: AppColors.primary,
        indicatorWeight: 3,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: AppColors.primary,
        unselectedLabelColor: Colors.black38,
        labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
        unselectedLabelStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.normal,
        ),
        tabs: const [
          Tab(text: 'About'),
          Tab(text: 'Skills'),
          Tab(text: 'Experience'),
          Tab(text: 'Portfolio'),
        ],
      ),
    );
  }

  // ── About Tab ────────────────────────────────────────────────────────────
  Widget _buildAboutTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Contact info card
          _sectionCard(
            title: 'Contact Information',
            child: Column(
              children: [
                _contactRow(
                  Icons.email_outlined,
                  'Email',
                  'thoeurnsokkay@gmail.com',
                ),
                const Divider(height: 20),
                _contactRow(Icons.phone_outlined, 'Phone', '+855 971 523 197'),
                const Divider(height: 20),
                _contactRow(
                  Icons.location_on_outlined,
                  'Address',
                  'Sen Sok, Phnom Penh, Cambodia',
                ),
                const Divider(height: 20),
                _contactRow(Icons.link_rounded, 'Portfolio', 'sokkay.dev'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Bio card
          _sectionCard(
            title: 'About Me',
            child: const Text(
              'I am a passionate Full Stack Developer with a strong focus on building modern, responsive, and scalable web and mobile applications. I enjoy working on both front-end and back-end technologies, turning ideas into functional and user-friendly digital products.\n\nI am always eager to learn new technologies and collaborate with talented teams to deliver high-quality solutions.',
              style: TextStyle(
                fontSize: 13,
                color: Colors.black54,
                height: 1.65,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Availability badge
          _sectionCard(
            title: 'Availability',
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Available for full-time & freelance',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _contactRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.08),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppColors.primary, size: 18),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 11, color: Colors.black38),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ── Skills Tab ───────────────────────────────────────────────────────────
  Widget _buildSkillsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionCard(
            title: 'Technical Skills',
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add, color: Colors.white, size: 13),
                  SizedBox(width: 4),
                  Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            child: Column(
              children: _skills
                  .map(
                    (s) => Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: _skillBar(s),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 16),
          _sectionCard(
            title: 'Soft Skills',
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  [
                        'Communication',
                        'Teamwork',
                        'Problem Solving',
                        'Adaptability',
                        'Time Management',
                        'Leadership',
                      ]
                      .map(
                        (s) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.primary.withOpacity(0.4),
                            ),
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.primary.withOpacity(0.05),
                          ),
                          child: Text(
                            s,
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _skillBar(_Skill skill) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              skill.name,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            Text(
              '${(skill.level * 100).toInt()}%',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: skill.level,
            minHeight: 8,
            backgroundColor: const Color(0xFFE8EAF6),
            valueColor: AlwaysStoppedAnimation<Color>(
              skill.level >= 0.8 ? AppColors.secondary : AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  // ── Experience Tab ───────────────────────────────────────────────────────
  Widget _buildExperienceTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionCard(
            title: 'Work Experience',
            trailing: _addButton(),
            child: _buildTimeline(_experience),
          ),
          const SizedBox(height: 16),
          _sectionCard(
            title: 'Education',
            trailing: _addButton(),
            child: _buildTimeline(_education),
          ),
          const SizedBox(height: 16),
          _sectionCard(
            title: 'Languages',
            child: Column(
              children: [
                _languageRow('Khmer', 'Native'),
                const Divider(height: 20),
                _languageRow('English', 'Professional'),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _addButton() {
    return GestureDetector(
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primary.withOpacity(0.1),
        ),
        child: const Icon(Icons.add, color: AppColors.primary, size: 18),
      ),
    );
  }

  Widget _buildTimeline(List<_TimelineItem> items) {
    return Column(
      children: List.generate(items.length, (i) {
        final item = items[i];
        final isLast = i == items.length - 1;
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Timeline line
              Column(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: item.isCurrent
                          ? AppColors.secondary.withOpacity(0.15)
                          : AppColors.primary.withOpacity(0.08),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      item.icon,
                      color: item.isCurrent
                          ? AppColors.secondary
                          : AppColors.primary,
                      size: 17,
                    ),
                  ),
                  if (!isLast)
                    Expanded(
                      child: Container(
                        width: 2,
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        color: Colors.black12,
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: isLast ? 0 : 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          if (item.isCurrent)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                'Current',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(
                        item.subtitle,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today_outlined,
                            size: 11,
                            color: Colors.black38,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            item.period,
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _languageRow(String lang, String level) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.08),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.language_rounded,
            color: AppColors.primary,
            size: 18,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            lang,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F2F8),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            level,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  // ── Portfolio / Applied Tab ───────────────────────────────────────────────
  Widget _buildPortfolioTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Upload CV
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary, const Color(0xFF1A4DB8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.upload_file_rounded,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upload Your CV',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'PDF, DOC up to 5MB',
                        style: TextStyle(color: Colors.white60, fontSize: 11),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Upload',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Links
          _sectionCard(
            title: 'Links & Portfolio',
            child: Column(
              children: [
                _linkRow(Icons.code_rounded, 'GitHub', 'github.com/sokkay'),
                const Divider(height: 20),
                _linkRow(
                  Icons.work_outline_rounded,
                  'LinkedIn',
                  'linkedin.com/in/sokkay',
                ),
                const Divider(height: 20),
                _linkRow(Icons.language_rounded, 'Website', 'sokkay.dev'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Applied jobs
          _sectionCard(
            title: 'Applied Jobs',
            child: Column(
              children: List.generate(_appliedJobs.length, (i) {
                final job = _appliedJobs[i];
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: i < _appliedJobs.length - 1 ? 14 : 0,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.business_center_outlined,
                          color: AppColors.primary,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              job.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              job.company,
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: job.statusColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          job.status,
                          style: TextStyle(
                            color: job.statusColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _linkRow(IconData icon, String platform, String handle) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.08),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppColors.primary, size: 18),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              platform,
              style: const TextStyle(fontSize: 11, color: Colors.black38),
            ),
            Text(
              handle,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const Spacer(),
        const Icon(Icons.chevron_right, color: Colors.black26, size: 20),
      ],
    );
  }

  // ── Reusable section card ─────────────────────────────────────────────────
  Widget _sectionCard({
    required String title,
    required Widget child,
    Widget? trailing,
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
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              if (trailing != null) trailing,
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }

  // ── Bottom Nav ─────────────────────────────────────────────────────────
  Widget _buildBottomNav() {
    const items = [
      _NavItem(
        icon: Icons.home_outlined,
        activeIcon: Icons.home_rounded,
        label: 'Home',
      ),
      _NavItem(
        icon: Icons.search_outlined,
        activeIcon: Icons.search_rounded,
        label: 'Search',
      ),
      _NavItem(
        icon: Icons.bookmark_border_rounded,
        activeIcon: Icons.bookmark_rounded,
        label: 'Saved',
      ),
      _NavItem(
        icon: Icons.dashboard_outlined,
        activeIcon: Icons.dashboard_rounded,
        label: 'Dashboard',
      ),
    ];
    return Container(
      height: 68,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: List.generate(items.length, (i) {
          final selected = i == _navIndex;
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
                  setState(() => _navIndex = i);
                }
              },
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    selected ? items[i].activeIcon : items[i].icon,
                    color: selected ? AppColors.primary : Colors.black38,
                    size: 24,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    items[i].label,
                    style: TextStyle(
                      fontSize: 10,
                      color: selected ? AppColors.primary : Colors.black38,
                      fontWeight: selected
                          ? FontWeight.w700
                          : FontWeight.normal,
                    ),
                  ),
                  if (selected)
                    Container(
                      margin: const EdgeInsets.only(top: 3),
                      width: 20,
                      height: 3,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(2),
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

// ── Data models ──────────────────────────────────────────────────────────────
class _Skill {
  final String name;
  final double level;
  const _Skill(this.name, this.level);
}

class _TimelineItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final String period;
  final bool isCurrent;
  const _TimelineItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.period,
    required this.isCurrent,
  });
}

class _AppliedJob {
  final String title;
  final String company;
  final String status;
  final Color statusColor;
  const _AppliedJob(this.title, this.company, this.status, this.statusColor);
}

class _NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}
