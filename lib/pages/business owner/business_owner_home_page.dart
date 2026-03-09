import 'package:flutter/material.dart';
import 'package:jobseek/pages/business%20owner/business_owner_create_job_page.dart';
import 'package:jobseek/pages/business%20owner/business_owner_dashboard_page.dart';
import 'package:jobseek/pages/business%20owner/business_owner_discover_page.dart';
import 'package:jobseek/pages/business%20owner/business_owner_profile_page.dart';
import 'package:jobseek/pages/business%20owner/business_owner_interview_detail_page.dart';
import 'package:jobseek/pages/business%20owner/business_owner_interview_page.dart';
import 'package:jobseek/pages/business%20owner/business_owner_service_page.dart';
import 'package:jobseek/shared/themes.dart';

class BusinessOwnerHomePage extends StatefulWidget {
  const BusinessOwnerHomePage({super.key});

  @override
  State<BusinessOwnerHomePage> createState() => _BusinessOwnerHomePageState();
}

class _BusinessOwnerHomePageState extends State<BusinessOwnerHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 20),
                _buildBanner(),
                const SizedBox(height: 30),
                _buildCandidatesSection(),
                const SizedBox(height: 30),
                _buildActiveJobPostSection(),
                const SizedBox(height: 30),
                _buildInterviewTodaySection(),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const BusinessOwnerProfilePage()),
          ),
          child: CircleAvatar(
            radius: 26,
            backgroundImage: AssetImage('assets/images/meyling.jpg'),
            backgroundColor: Colors.grey[300],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const BusinessOwnerProfilePage(),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome 👋",
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const Text(
                  "Meyling Chhun",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            children: [
              const Icon(
                Icons.notifications_outlined,
                color: AppColors.secondary,
                size: 28,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBanner() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0A2572), Color(0xFF1E4DB7)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.orange.shade400],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(Icons.campaign, color: Colors.white, size: 40),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Find Your Best Candidate",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "Click Here",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const BusinessOwnerCreateJobPage(),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondary,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.add_circle_outline, size: 18),
                const SizedBox(width: 5),
                const Text(
                  "Post a Job",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCandidatesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Candidates",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF0A2572), Color(0xFF1E4DB7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const BusinessOwnerDiscoverPage(),
                  ),
                ),
                child: _buildCandidateCard("📋", "Discover"),
              ),
              Container(width: 1, height: 60, color: Colors.white30),
              _buildCandidateCard("📝", "Shortlist"),
              Container(width: 1, height: 60, color: Colors.white30),
              _buildCandidateCard("📋✓", "Hired"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCandidateCard(String emoji, String label) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 40)),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildActiveJobPostSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Active Job Post",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildJobCard(
                companyIcon: "💼",
                iconColor: Colors.pink,
                salary: "\$ 500 - \$1000",
                jobTitle: "UI designer",
                location: "Phnom Penh, Toulkok",
                jobType: "Full Time",
                level: "Junior",
                experience: "1 pax",
                postedTime: "3 days ago",
                applicants: "12 Applicants",
              ),
              const SizedBox(width: 15),
              _buildJobCard(
                companyIcon: "🎯",
                iconColor: Colors.black,
                salary: "\$ Negotiable",
                jobTitle: "Digital Marketing",
                location: "Phnom Penh, Camca city",
                jobType: "Part Time",
                level: "Senior",
                experience: "5 pax",
                postedTime: "3 days ago",
                applicants: "View Details",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildJobCard({
    required String companyIcon,
    required Color iconColor,
    required String salary,
    required String jobTitle,
    required String location,
    required String jobType,
    required String level,
    required String experience,
    required String postedTime,
    required String applicants,
  }) {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(companyIcon, style: const TextStyle(fontSize: 24)),
              ),
              const Icon(Icons.arrow_forward, size: 20),
            ],
          ),
          const SizedBox(height: 12),
          Text(salary, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          const SizedBox(height: 4),
          Text(
            jobTitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            location,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildJobTag(jobType),
              const SizedBox(width: 5),
              _buildJobTag(level),
              const SizedBox(width: 5),
              _buildJobTag(experience),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                postedTime,
                style: TextStyle(fontSize: 11, color: Colors.grey[500]),
              ),
              Text(
                applicants,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildJobTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 10, color: Colors.grey[700]),
      ),
    );
  }

  Widget _buildInterviewTodaySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Interview Today",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 15),
        _buildInterviewCard(
          context: context,
          name: "Kea Chanthorn",
          position: "UX UI Designer",
          color: Colors.teal,
          image: 'assets/images/kea_chanthorn.JPG',
        ),
        const SizedBox(height: 12),
        _buildInterviewCard(
          context: context,
          name: "Kea Daron",
          position: "FullStack Web Developmnt",
          color: Colors.blue,
          image: 'assets/images/daron.jpg',
        ),
      ],
    );
  }

  Widget _buildInterviewCard({
    required BuildContext context,
    required String name,
    required String position,
    required Color color,
    String? image,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.secondary, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: image != null ? AssetImage(image) : null,
            backgroundColor: color.withOpacity(0.2),
            child: image == null
                ? Icon(Icons.person, color: color, size: 30)
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  position,
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      Icons.folder_outlined,
                      size: 14,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "View Portfolio",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(50, 20),
                ),
                child: const Text(
                  "View CV",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BusinessOwnerInterviewDetailPage(
                      candidateName: name,
                      candidateRole: position,
                      candidateImage: image ?? '',
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Schedule",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (index == 1) {
            setState(() => _selectedIndex = 1);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const BusinessOwnerServicePage(),
              ),
            ).then((_) => setState(() => _selectedIndex = 0));
          } else if (index == 2) {
            setState(() => _selectedIndex = 2);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const BusinessOwnerInterviewPage(),
              ),
            ).then((_) => setState(() => _selectedIndex = 0));
          } else if (index == 3) {
            setState(() => _selectedIndex = 3);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const BusinessOwnerDashboardPage(),
              ),
            ).then((_) => setState(() => _selectedIndex = 0));
          } else {
            setState(() => _selectedIndex = index);
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.secondary,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            label: 'Service',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Interview',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
          ),
        ],
      ),
    );
  }
}
