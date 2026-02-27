import 'package:flutter/material.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_edit_post_page.dart';
import 'package:jobseek/shared/themes.dart';

class JobSeekerPostPage extends StatefulWidget {
  const JobSeekerPostPage({super.key});

  @override
  State<JobSeekerPostPage> createState() => _JobSeekerPostPageState();
}

class _JobSeekerPostPageState extends State<JobSeekerPostPage> {
  final List<_PostData> _posts = [
    const _PostData(
      avatarAsset: 'assets/images/daron.jpg',
      name: 'Kristin Watson',
      role: 'Software Developer',
      time: 'Completed 4:00 PM',
      bio:
          'Motivated Frontend developer\nwith 2+ years of experience in Vue and React',
      position: 'Frontend Developer',
      salary: '\$80,000/month',
      jobType: 'Full-Time',
      skills: ['HTML', 'CSS', 'Javascript', 'UI Design'],
      links: [
        _LinkData(icon: 'github', label: 'Github'),
        _LinkData(icon: 'telegram', label: 'Telegram'),
        _LinkData(icon: 'linkedin', label: 'Linkedin'),
        _LinkData(icon: 'portfolio', label: 'Portfolio'),
      ],
    ),
    const _PostData(
      avatarAsset: 'assets/images/daron.jpg',
      name: 'Kristin Watson',
      role: 'Software Developer',
      time: 'Completed 4:00 PM',
      bio:
          'Motivated Frontend developer\nwith 2+ years of experience in Vue and React',
      position: 'Frontend Developer',
      salary: '\$80,000/month',
      jobType: 'Full-Time',
      skills: ['HTML', 'CSS', 'Javascript', 'UI Design'],
      links: [
        _LinkData(icon: 'github', label: 'Github'),
        _LinkData(icon: 'telegram', label: 'Telegram'),
        _LinkData(icon: 'linkedin', label: 'Linkedin'),
        _LinkData(icon: 'portfolio', label: 'Portfolio'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F8),
      body: Column(
        children: [
          _buildAppBar(),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              itemCount: _posts.length,
              separatorBuilder: (_, __) => const SizedBox(height: 14),
              itemBuilder: (_, i) => _buildCard(_posts[i]),
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
                'Job  Seeker Post',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          // spacer to balance the back button
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  // ─── Post Card ────────────────────────────────────────────────────────────
  Widget _buildCard(_PostData post) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6FA),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Edit button
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => JobSeekerEditPostPage(
                    name: post.name,
                    role: post.role,
                    bio: post.bio,
                    position: post.position,
                    salary: post.salary,
                    jobType: post.jobType,
                    skills: List<String>.from(post.skills),
                    links: {for (final l in post.links) l.icon: l.label},
                  ),
                ),
              ),
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'Edit',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          // Avatar + name/role/time
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage(post.avatarAsset),
              ),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    post.role,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    post.time,
                    style: const TextStyle(fontSize: 12, color: Colors.black45),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Bio
          Text(
            post.bio,
            style: const TextStyle(fontSize: 13, color: Colors.black87),
          ),

          const SizedBox(height: 14),

          // Info rows
          _infoRow(Icons.work_outline_rounded, post.position),
          const SizedBox(height: 8),
          _infoRow(Icons.attach_money_rounded, post.salary),
          const SizedBox(height: 8),
          _infoRow(Icons.location_on_outlined, post.jobType),

          const SizedBox(height: 14),

          // Skills row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Icon(
                  Icons.hub_outlined,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: post.skills
                      .map(
                        (s) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            s,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Links row
          Row(
            children: post.links
                .map(
                  (l) => Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Row(
                      children: [
                        _linkIcon(l.icon),
                        const SizedBox(width: 4),
                        Text(
                          l.label,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
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
        Icon(icon, size: 20, color: Colors.black54),
        const SizedBox(width: 14),
        Text(text, style: const TextStyle(fontSize: 14, color: Colors.black87)),
      ],
    );
  }

  Widget _linkIcon(String type) {
    switch (type) {
      case 'github':
        return const Icon(Icons.code_rounded, size: 18, color: Colors.black87);
      case 'telegram':
        return const Icon(
          Icons.send_rounded,
          size: 18,
          color: Color(0xFF0088CC),
        );
      case 'linkedin':
        return const Icon(
          Icons.link_rounded,
          size: 18,
          color: Color(0xFF0A66C2),
        );
      case 'portfolio':
        return const Icon(
          Icons.grid_view_rounded,
          size: 18,
          color: Color(0xFFE9B31F),
        );
      default:
        return const Icon(Icons.link, size: 18, color: Colors.grey);
    }
  }
}

// ─── Data Models ──────────────────────────────────────────────────────────────
class _PostData {
  final String avatarAsset;
  final String name;
  final String role;
  final String time;
  final String bio;
  final String position;
  final String salary;
  final String jobType;
  final List<String> skills;
  final List<_LinkData> links;

  const _PostData({
    required this.avatarAsset,
    required this.name,
    required this.role,
    required this.time,
    required this.bio,
    required this.position,
    required this.salary,
    required this.jobType,
    required this.skills,
    required this.links,
  });
}

class _LinkData {
  final String icon;
  final String label;
  const _LinkData({required this.icon, required this.label});
}
