import 'package:flutter/material.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_my_cv_page.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_post_page.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_saved_page.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_service_page.dart';
import 'package:jobseek/shared/themes.dart';

class JobSeekerDashboardPage extends StatefulWidget {
  const JobSeekerDashboardPage({super.key});

  @override
  State<JobSeekerDashboardPage> createState() => _JobSeekerDashboardPageState();
}

class _JobSeekerDashboardPageState extends State<JobSeekerDashboardPage> {
  final int _currentIndex = 3;
  String _selectedStatus = 'All Status';
  final TextEditingController _searchController = TextEditingController();

  static const _statusOptions = [
    'All Status',
    'Applied',
    'Shortlist',
    'Interview Process',
    'Interviewed',
    'Accepted',
    'Rejected',
  ];

  final List<_AppEntry> _applications = const [
    _AppEntry(
      no: 1,
      appliedDate: 'November 8, 2025',
      updatedDate: 'December 8, 2025',
      jobTitle: 'Flutter App. Development\nTeam Leader',
      status: 'Applied',
    ),
    _AppEntry(
      no: 2,
      appliedDate: 'November 8, 2025',
      updatedDate: 'December 8, 2025',
      jobTitle: 'Flutter App. Development\nTeam Leader',
      status: 'Interview Process',
    ),
    _AppEntry(
      no: 3,
      appliedDate: 'November 8, 2025',
      updatedDate: 'December 8, 2025',
      jobTitle: 'Flutter App. Development\nTeam Leader',
      status: 'Interviewed',
    ),
    _AppEntry(
      no: 4,
      appliedDate: 'November 8, 2025',
      updatedDate: 'December 8, 2025',
      jobTitle: 'Flutter App. Development\nTeam Leader',
      status: 'Accepted',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<_AppEntry> get _filtered {
    final query = _searchController.text.toLowerCase();
    return _applications.where((e) {
      final matchStatus =
          _selectedStatus == 'All Status' || e.status == _selectedStatus;
      final matchQuery =
          query.isEmpty ||
          e.jobTitle.toLowerCase().contains(query) ||
          e.status.toLowerCase().contains(query);
      return matchStatus && matchQuery;
    }).toList();
  }

  // ─── stat counts derived from data ───────────────────────────────────────
  int _count(String status) =>
      _applications.where((e) => e.status == status).length;

  // ─────────────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF0F8),
      body: Column(
        children: [
          _buildAppBar(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildViewPostButton(),
                  const SizedBox(height: 14),
                  _buildStatsGrid(),
                  const SizedBox(height: 18),
                  _buildSearchRow(),
                  const SizedBox(height: 14),
                  _buildTable(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // ─── App Bar ──────────────────────────────────────────────────────────────
  Widget _buildAppBar() {
    return Container(
      color: AppColors.primary,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 4,
        right: 12,
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
                'Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          OutlinedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const JobSeekerMyCvPage()),
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white54),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'My CV',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }

  // ─── View Post button ─────────────────────────────────────────────────────
  Widget _buildViewPostButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const JobSeekerPostPage()),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
        child: const Text(
          'View Post',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  // ─── Stats Grid ───────────────────────────────────────────────────────────
  Widget _buildStatsGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.check_rounded,
                iconColor: const Color(0xFF00B4CC),
                borderColor: const Color(0xFF00B4CC),
                count: _count('Applied'),
                label: 'Applied',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                icon: Icons.checklist_rounded,
                iconColor: const Color(0xFF1565C0),
                borderColor: const Color(0xFF1565C0),
                count: _count('Shortlist'),
                label: 'Shortlist',
                showPassFail: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.calendar_month_rounded,
                iconColor: const Color(0xFF8E24AA),
                borderColor: const Color(0xFF8E24AA),
                count: _count('Interview Process'),
                label: 'Interview Process',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                icon: Icons.event_available_rounded,
                iconColor: const Color(0xFF5E35B1),
                borderColor: const Color(0xFF5E35B1),
                count: _count('Interviewed'),
                label: 'Interviewed',
                showPassFail: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.how_to_reg_rounded,
                iconColor: const Color(0xFF2E7D32),
                borderColor: const Color(0xFF2E7D32),
                count: _count('Accepted'),
                label: 'Accepted',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                icon: Icons.block_rounded,
                iconColor: const Color(0xFFC62828),
                borderColor: const Color(0xFFC62828),
                count: _count('Rejected'),
                label: 'Rejected',
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _StatCard(
          icon: Icons.done_all_rounded,
          iconColor: const Color(0xFF00B4CC),
          borderColor: const Color(0xFF00B4CC),
          count: _applications.length,
          label: 'Total Applied',
        ),
      ],
    );
  }

  // ─── Search + Filter ──────────────────────────────────────────────────────
  Widget _buildSearchRow() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: TextField(
              controller: _searchController,
              onChanged: (_) => setState(() {}),
              style: const TextStyle(fontSize: 13),
              decoration: const InputDecoration(
                hintText: 'Search by Job Title, Job Code, Status',
                hintStyle: TextStyle(fontSize: 12, color: Colors.black38),
                suffixIcon: Icon(Icons.search, size: 18, color: Colors.black38),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: Container(
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade200),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedStatus,
                isExpanded: true,
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 18,
                  color: Colors.black54,
                ),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                ),
                onChanged: (v) => setState(() => _selectedStatus = v!),
                items: _statusOptions
                    .map(
                      (s) => DropdownMenuItem(
                        value: s,
                        child: Text(s, overflow: TextOverflow.ellipsis),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ─── Table ────────────────────────────────────────────────────────────────
  Widget _buildTable() {
    final rows = _filtered;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Table(
          columnWidths: const {
            0: FixedColumnWidth(30),
            1: FlexColumnWidth(2.2),
            2: FlexColumnWidth(2.2),
            3: FlexColumnWidth(2.6),
            4: FlexColumnWidth(2.4),
          },
          children: [
            // Header
            TableRow(
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
              ),
              children: const [
                _TH('No'),
                _TH('Applied\nDate'),
                _TH('Status\nUpdated Date'),
                _TH('Job Title'),
                _TH('Status'),
              ],
            ),
            // Data rows
            ...rows.asMap().entries.map(
              (e) => TableRow(
                decoration: BoxDecoration(
                  color: e.key.isEven ? Colors.white : Colors.grey.shade50,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade100),
                  ),
                ),
                children: [
                  _TD(e.value.no.toString()),
                  _TD(e.value.appliedDate),
                  _TD(e.value.updatedDate),
                  _TD(e.value.jobTitle),
                  _statusCell(e.value.status),
                ],
              ),
            ),
            if (rows.isEmpty)
              TableRow(
                children: [
                  const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text(
                        'No results',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(),
                  const SizedBox(),
                  const SizedBox(),
                ],
              ),
          ],
        ),
      ),
    );
  }

  TableCell _statusCell(String status) {
    final cfg = _statusConfig(status);
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: cfg.color, width: 1.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 9.5,
                color: cfg.color,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _StatusCfg _statusConfig(String status) {
    switch (status) {
      case 'Applied':
        return _StatusCfg(const Color(0xFF00B4CC));
      case 'Shortlist':
        return _StatusCfg(const Color(0xFF1565C0));
      case 'Interview Process':
        return _StatusCfg(const Color(0xFFE65100));
      case 'Interviewed':
        return _StatusCfg(const Color(0xFF5E35B1));
      case 'Accepted':
        return _StatusCfg(const Color(0xFF2E7D32));
      case 'Rejected':
        return _StatusCfg(const Color(0xFFC62828));
      default:
        return _StatusCfg(Colors.grey);
    }
  }

  // ─── Bottom Nav ────────────────────────────────────────────────────────────
  Widget _buildBottomNav() {
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
            color: Colors.black.withOpacity(0.12),
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
                  if (i == _currentIndex) return;
                  if (i == 0) {
                    // Pop all the way back to Home
                    Navigator.popUntil(
                      context,
                      ModalRoute.withName('/job-seeker-home'),
                    );
                  } else if (i == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const JobSeekerServicePage(),
                      ),
                    );
                  } else if (i == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const JobSeekerSavedPage(),
                      ),
                    );
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        _currentIndex == i
                            ? AppColors.secondary
                            : Colors.white60,
                        BlendMode.srcIn,
                      ),
                      child: Image.asset(items[i].icon, height: 24, width: 24),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      items[i].label,
                      style: TextStyle(
                        fontSize: 11,
                        color: _currentIndex == i
                            ? AppColors.secondary
                            : Colors.white60,
                        fontWeight: _currentIndex == i
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

// ─── Stat Card ────────────────────────────────────────────────────────────────
class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color borderColor;
  final int count;
  final String label;
  final bool showPassFail;

  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.borderColor,
    required this.count,
    required this.label,
    this.showPassFail = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 10, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: iconColor, size: 22),
              const Spacer(),
              if (showPassFail) ...[
                _chip('Pass', const Color(0xFF2E7D32)),
                const SizedBox(width: 4),
                _chip('Fail', const Color(0xFFC62828)),
              ],
            ],
          ),
          const SizedBox(height: 8),
          Text(
            count.toString(),
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black45),
          ),
        ],
      ),
    );
  }

  Widget _chip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }
}

// ─── Table helpers ────────────────────────────────────────────────────────────
class _TH extends StatelessWidget {
  final String text;
  const _TH(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w800,
          color: Colors.black54,
        ),
      ),
    );
  }
}

class _TD extends StatelessWidget {
  final String text;
  const _TD(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 10, color: Colors.black87),
      ),
    );
  }
}

// ─── Data Models ──────────────────────────────────────────────────────────────
class _AppEntry {
  final int no;
  final String appliedDate;
  final String updatedDate;
  final String jobTitle;
  final String status;

  const _AppEntry({
    required this.no,
    required this.appliedDate,
    required this.updatedDate,
    required this.jobTitle,
    required this.status,
  });
}

class _StatusCfg {
  final Color color;
  const _StatusCfg(this.color);
}

class _NavItem {
  final String icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}
