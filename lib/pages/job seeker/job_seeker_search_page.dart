import 'package:flutter/material.dart';
import 'package:jobseek/pages/job%20seeker/job_seeker_job_detail_page.dart';
import 'package:jobseek/shared/themes.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Data model
// ─────────────────────────────────────────────────────────────────────────────
class _Job {
  final String? logo;
  final Color logoColor;
  final String salary;
  final String title;
  final String company;
  final String location;
  final List<String> tags;
  final String postedAgo;
  final String category;

  const _Job({
    required this.logo,
    required this.logoColor,
    required this.salary,
    required this.title,
    required this.company,
    required this.location,
    required this.tags,
    required this.postedAgo,
    required this.category,
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// Page
// ─────────────────────────────────────────────────────────────────────────────
class JobSeekerSearchPage extends StatefulWidget {
  /// Pass an initial query from the home page (optional).
  final String initialQuery;

  const JobSeekerSearchPage({super.key, this.initialQuery = ''});

  @override
  State<JobSeekerSearchPage> createState() => _JobSeekerSearchPageState();
}

class _JobSeekerSearchPageState extends State<JobSeekerSearchPage> {
  // ── mock data ──────────────────────────────────────────────────────────────
  static const _allJobs = [
    _Job(
      logo: 'ABA',
      logoColor: Color(0xFF1A3C5E),
      salary: '\$500 – \$1,000',
      title: 'UI Designer',
      company: 'ABA Bank',
      location: 'Phnom Penh, Toul Kork',
      tags: ['Full Time', 'Junior', '1 pax'],
      postedAgo: '3 days ago',
      category: 'Design',
    ),
    _Job(
      logo: 'DM',
      logoColor: Color(0xFF6D4C41),
      salary: 'Negotiable',
      title: 'Digital Marketing',
      company: 'Camco City Co.',
      location: 'Phnom Penh, Camco City',
      tags: ['Part Time', 'Senior', '5 pax'],
      postedAgo: '3 days ago',
      category: 'Marketing',
    ),
    _Job(
      logo: 'HR',
      logoColor: Color(0xFF2E7D32),
      salary: '\$800 – \$1,500',
      title: 'HR Manager',
      company: 'GreenTech Ltd.',
      location: 'Phnom Penh, BKK1',
      tags: ['Full Time', 'Senior', '2 pax'],
      postedAgo: '1 day ago',
      category: 'HR',
    ),
    _Job(
      logo: 'DEV',
      logoColor: Color(0xFF0A2572),
      salary: '\$900 – \$1,800',
      title: 'Flutter Developer',
      company: 'SkyApp Co.',
      location: 'Phnom Penh, Daun Penh',
      tags: ['Full Time', 'Mid', '3 pax'],
      postedAgo: '2 days ago',
      category: 'Engineering',
    ),
    _Job(
      logo: 'FIN',
      logoColor: Color(0xFFAD1457),
      salary: '\$700 – \$1,200',
      title: 'Finance Officer',
      company: 'Micro Capital',
      location: 'Siem Reap',
      tags: ['Full Time', 'Junior', '1 pax'],
      postedAgo: '5 days ago',
      category: 'Finance',
    ),
    _Job(
      logo: 'CS',
      logoColor: Color(0xFFE65100),
      salary: '\$400 – \$700',
      title: 'Customer Service',
      company: 'StarMart',
      location: 'Phnom Penh, Meanchey',
      tags: ['Part Time', 'Entry', '10 pax'],
      postedAgo: '1 week ago',
      category: 'Service',
    ),
    _Job(
      logo: 'BE',
      logoColor: Color(0xFF283593),
      salary: '\$1,000 – \$2,000',
      title: 'Backend Engineer',
      company: 'CloudBase',
      location: 'Remote',
      tags: ['Remote', 'Senior', '2 pax'],
      postedAgo: '4 days ago',
      category: 'Engineering',
    ),
    _Job(
      logo: 'PM',
      logoColor: Color(0xFF00695C),
      salary: '\$1,200 – \$2,500',
      title: 'Product Manager',
      company: 'Innovate Hub',
      location: 'Phnom Penh, BKK1',
      tags: ['Full Time', 'Senior', '1 pax'],
      postedAgo: '2 days ago',
      category: 'Management',
    ),
  ];

  static const _filterChips = [
    'All',
    'Full Time',
    'Part Time',
    'Remote',
    'Junior',
    'Senior',
    'Engineering',
    'Design',
    'Marketing',
    'Finance',
    'HR',
  ];

  late final TextEditingController _searchCtrl;
  late final FocusNode _focusNode;
  String _selectedFilter = 'All';
  String _sortBy = 'Newest';

  @override
  void initState() {
    super.initState();
    _searchCtrl = TextEditingController(text: widget.initialQuery);
    _focusNode = FocusNode();
    // Auto-focus when arriving from the home page
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _focusNode.requestFocus(),
    );
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  // ── filtering logic ────────────────────────────────────────────────────────
  List<_Job> get _filtered {
    final q = _searchCtrl.text.toLowerCase().trim();
    return _allJobs.where((job) {
      final matchesQuery =
          q.isEmpty ||
          job.title.toLowerCase().contains(q) ||
          job.company.toLowerCase().contains(q) ||
          job.location.toLowerCase().contains(q) ||
          job.category.toLowerCase().contains(q);

      final matchesFilter =
          _selectedFilter == 'All' ||
          job.tags.any(
            (t) => t.toLowerCase() == _selectedFilter.toLowerCase(),
          ) ||
          job.category.toLowerCase() == _selectedFilter.toLowerCase();

      return matchesQuery && matchesFilter;
    }).toList();
  }

  // ── sort ───────────────────────────────────────────────────────────────────
  List<_Job> get _results {
    final list = List<_Job>.from(_filtered);
    if (_sortBy == 'Highest Salary') {
      list.sort((a, b) => b.salary.compareTo(a.salary));
    }
    return list;
  }

  // ── build ──────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBar(),
            _buildFilterRow(),
            _buildResultHeader(),
            Expanded(child: _buildResultList()),
          ],
        ),
      ),
    );
  }

  // ── top bar ────────────────────────────────────────────────────────────────
  Widget _buildTopBar() {
    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Search Job',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          // ── search bar ───────────────────────────────────────────────────
          Container(
            height: 46,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                const SizedBox(width: 14),
                const Icon(Icons.search, color: Colors.black38, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _searchCtrl,
                    focusNode: _focusNode,
                    onChanged: (_) => setState(() {}),
                    style: const TextStyle(fontSize: 13),
                    decoration: const InputDecoration(
                      hintText: 'Search job or company…',
                      hintStyle: TextStyle(color: Colors.black38, fontSize: 13),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
                // clear button
                if (_searchCtrl.text.isNotEmpty)
                  GestureDetector(
                    onTap: () => setState(() => _searchCtrl.clear()),
                    child: const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(Icons.close, color: Colors.black45, size: 18),
                    ),
                  ),
                // filter button
                GestureDetector(
                  onTap: _showFilterSheet,
                  child: Container(
                    width: 38,
                    height: 38,
                    margin: const EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(
                      Icons.tune,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── horizontal filter chips ────────────────────────────────────────────────
  Widget _buildFilterRow() {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: _filterChips.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final chip = _filterChips[i];
          final selected = chip == _selectedFilter;
          return GestureDetector(
            onTap: () => setState(() => _selectedFilter = chip),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: selected ? AppColors.primary : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: selected ? AppColors.primary : Colors.black12,
                ),
              ),
              child: Text(
                chip,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: selected ? Colors.white : Colors.black54,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ── result header ──────────────────────────────────────────────────────────
  Widget _buildResultHeader() {
    final count = _results.length;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$count result${count == 1 ? '' : 's'} found',
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          ),
          GestureDetector(
            onTap: _showSortSheet,
            child: Row(
              children: [
                const Icon(Icons.sort_rounded, size: 18, color: Colors.black54),
                const SizedBox(width: 4),
                Text(
                  _sortBy,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── result list ────────────────────────────────────────────────────────────
  Widget _buildResultList() {
    final jobs = _results;
    if (jobs.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search_off_rounded, size: 64, color: Colors.black12),
            const SizedBox(height: 12),
            const Text(
              'No jobs found',
              style: TextStyle(fontSize: 16, color: Colors.black38),
            ),
            const SizedBox(height: 6),
            const Text(
              'Try a different keyword or filter',
              style: TextStyle(fontSize: 12, color: Colors.black26),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      itemCount: jobs.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, i) => _buildJobCard(jobs[i]),
    );
  }

  // ── job card ───────────────────────────────────────────────────────────────
  Widget _buildJobCard(_Job job) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => JobDetailPage(
            title: job.title,
            company: job.company,
            isApple: false,
            logoColor: job.logoColor,
            logoText: job.logo ?? '',
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // logo
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: job.logoColor,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                job.logo ?? '●',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(width: 12),
            // details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          job.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Text(
                        job.postedAgo,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    job.company,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 12,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 2),
                      Expanded(
                        child: Text(
                          job.location,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      // salary badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.secondary.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          job.salary,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xFFB07D00),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      // first tag
                      if (job.tags.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            job.tags.first,
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      if (job.tags.length > 1) ...[
                        const SizedBox(width: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            job.tags[1],
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // arrow
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }

  // ── filter bottom sheet ────────────────────────────────────────────────────
  void _showFilterSheet() {
    String tempFilter = _selectedFilter;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) {
        return StatefulBuilder(
          builder: (ctx, setSheet) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // drag handle
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Filter Jobs',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _filterChips.map((chip) {
                      final sel = chip == tempFilter;
                      return GestureDetector(
                        onTap: () => setSheet(() => tempFilter = chip),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: sel ? AppColors.primary : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: sel ? AppColors.primary : Colors.black12,
                            ),
                          ),
                          child: Text(
                            chip,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: sel ? Colors.white : Colors.black54,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        setState(() => _selectedFilter = tempFilter);
                        Navigator.pop(ctx);
                      },
                      child: const Text(
                        'Apply Filter',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // ── sort bottom sheet ──────────────────────────────────────────────────────
  void _showSortSheet() {
    const options = ['Newest', 'Highest Salary'];
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetCtx) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Sort By',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              ...options.map(
                (o) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(o, style: const TextStyle(fontSize: 14)),
                  trailing: _sortBy == o
                      ? const Icon(
                          Icons.check_circle_rounded,
                          color: AppColors.primary,
                        )
                      : null,
                  onTap: () {
                    setState(() => _sortBy = o);
                    Navigator.pop(sheetCtx);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
