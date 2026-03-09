import 'package:flutter/material.dart';
import 'package:jobseek/shared/themes.dart';

// ── Data Models ───────────────────────────────────────────────────────────────

class _SocialLink {
  final IconData icon;
  final String label;
  final Color color;
  const _SocialLink(this.icon, this.label, this.color);
}

class _JobSeekerPost {
  final String image;
  final String name;
  final String jobTitle;
  final String completedTime;
  final String bio;
  final String role;
  final String salary;
  final String jobType;
  final List<String> skills;
  final List<_SocialLink> socialLinks;

  const _JobSeekerPost({
    required this.image,
    required this.name,
    required this.jobTitle,
    required this.completedTime,
    required this.bio,
    required this.role,
    required this.salary,
    required this.jobType,
    required this.skills,
    required this.socialLinks,
  });
}

// ── Page ─────────────────────────────────────────────────────────────────────

class BusinessOwnerDiscoverPage extends StatefulWidget {
  const BusinessOwnerDiscoverPage({super.key});

  @override
  State<BusinessOwnerDiscoverPage> createState() =>
      _BusinessOwnerDiscoverPageState();
}

class _BusinessOwnerDiscoverPageState extends State<BusinessOwnerDiscoverPage> {
  final _searchCtrl = TextEditingController();

  final List<_JobSeekerPost> _posts = [
    _JobSeekerPost(
      image: 'assets/images/candidate_male.jpg',
      name: 'Kristin Watson',
      jobTitle: 'Software Developer',
      completedTime: 'Completed 4:00 PM',
      bio:
          'Motivated Frontend developer with 2+ years of experience in Vue and React',
      role: 'Frontend Developer',
      salary: '\$80,000/month',
      jobType: 'Full-Time',
      skills: ['HTML', 'CSS', 'Javascript', 'UI Design'],
      socialLinks: [
        _SocialLink(Icons.code, 'Github', Colors.black87),
        _SocialLink(Icons.send_rounded, 'Telegram', Color(0xFF0088CC)),
        _SocialLink(Icons.work_rounded, 'LinkedIn', Color(0xFF0077B5)),
        _SocialLink(Icons.folder_rounded, 'Portfolio', Color(0xFFE9B31F)),
      ],
    ),
    _JobSeekerPost(
      image: 'assets/images/candidate_male.jpg',
      name: 'Kristin Watson',
      jobTitle: 'Software Developer',
      completedTime: 'Completed 4:00 PM',
      bio:
          'Motivated Frontend developer with 2+ years of experience in Vue and React',
      role: 'Frontend Developer',
      salary: '\$80,000/month',
      jobType: 'Full-Time',
      skills: ['HTML', 'CSS', 'Javascript', 'UI Design'],
      socialLinks: [
        _SocialLink(Icons.code, 'Github', Colors.black87),
        _SocialLink(Icons.send_rounded, 'Telegram', Color(0xFF0088CC)),
        _SocialLink(Icons.work_rounded, 'LinkedIn', Color(0xFF0077B5)),
        _SocialLink(Icons.folder_rounded, 'Portfolio', Color(0xFFE9B31F)),
      ],
    ),
    _JobSeekerPost(
      image: 'assets/images/daron.jpg',
      name: 'Kea Daron',
      jobTitle: 'Full Stack Developer',
      completedTime: 'Completed 9:00 AM',
      bio:
          'Passionate Full Stack Developer with expertise in Flutter, Node.js and Firebase',
      role: 'Full Stack Developer',
      salary: '\$70,000/month',
      jobType: 'Full-Time',
      skills: ['Flutter', 'Dart', 'Node.js', 'Firebase'],
      socialLinks: [
        _SocialLink(Icons.code, 'Github', Colors.black87),
        _SocialLink(Icons.send_rounded, 'Telegram', Color(0xFF0088CC)),
        _SocialLink(Icons.work_rounded, 'LinkedIn', Color(0xFF0077B5)),
        _SocialLink(Icons.folder_rounded, 'Portfolio', Color(0xFFE9B31F)),
      ],
    ),
    _JobSeekerPost(
      image: 'assets/images/kea_chanthorn.JPG',
      name: 'Kea Chanthorn',
      jobTitle: 'UX/UI Designer',
      completedTime: 'Completed 10:30 AM',
      bio:
          'Creative UX/UI designer focused on building beautiful and intuitive digital experiences',
      role: 'UI/UX Designer',
      salary: '\$60,000/month',
      jobType: 'Part-Time',
      skills: ['Figma', 'Adobe XD', 'Prototyping', 'UI Design'],
      socialLinks: [
        _SocialLink(Icons.code, 'Github', Colors.black87),
        _SocialLink(Icons.send_rounded, 'Telegram', Color(0xFF0088CC)),
        _SocialLink(Icons.work_rounded, 'LinkedIn', Color(0xFF0077B5)),
        _SocialLink(Icons.folder_rounded, 'Portfolio', Color(0xFFE9B31F)),
      ],
    ),
  ];

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Job  Seeker Post',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          // ── Search bar ─────────────────────────────────────────────────
          Container(
            color: AppColors.primary,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: TextField(
              controller: _searchCtrl,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search job seekers...',
                hintStyle: TextStyle(
                  color: Colors.white.withValues(alpha: 0.6),
                ),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: Colors.white70,
                ),
                filled: true,
                fillColor: Colors.white.withValues(alpha: 0.15),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (_) => setState(() {}),
            ),
          ),

          // ── Post list ──────────────────────────────────────────────────
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _filteredPosts.length,
              separatorBuilder: (_, __) => const SizedBox(height: 14),
              itemBuilder: (_, i) => _buildCard(_filteredPosts[i]),
            ),
          ),
        ],
      ),
    );
  }

  List<_JobSeekerPost> get _filteredPosts {
    final q = _searchCtrl.text.toLowerCase();
    if (q.isEmpty) return _posts;
    return _posts
        .where(
          (p) =>
              p.name.toLowerCase().contains(q) ||
              p.role.toLowerCase().contains(q) ||
              p.skills.any((s) => s.toLowerCase().contains(q)),
        )
        .toList();
  }

  // ── Card ──────────────────────────────────────────────────────────────────

  Widget _buildCard(_JobSeekerPost post) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header ──────────────────────────────────────────────────────
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.grey[300],
                backgroundImage: AssetImage(post.image),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      post.jobTitle,
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    ),
                    Text(
                      post.completedTime,
                      style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark_border_rounded,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // ── Bio ──────────────────────────────────────────────────────────
          Text(
            post.bio,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[700],
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),

          // ── Info rows ────────────────────────────────────────────────────
          _infoRow(Icons.work_outline_rounded, post.role),
          const SizedBox(height: 6),
          _infoRow(Icons.attach_money_rounded, post.salary),
          const SizedBox(height: 6),
          _infoRow(Icons.location_on_outlined, post.jobType),
          const SizedBox(height: 12),

          // ── Skills ───────────────────────────────────────────────────────
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Icon(
                  Icons.notifications_none_rounded,
                  size: 18,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: post.skills
                      .map(
                        (s) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            s,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // ── Divider ──────────────────────────────────────────────────────
          Divider(color: Colors.grey[200], height: 1),
          const SizedBox(height: 10),

          // ── Social Links──────────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: post.socialLinks
                .map(
                  (link) => GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(link.icon, size: 16, color: link.color),
                        const SizedBox(width: 4),
                        Text(
                          link.label,
                          style: TextStyle(
                            fontSize: 12,
                            color: link.color,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[500]),
        const SizedBox(width: 8),
        Text(text, style: TextStyle(fontSize: 13, color: Colors.grey[700])),
      ],
    );
  }
}
