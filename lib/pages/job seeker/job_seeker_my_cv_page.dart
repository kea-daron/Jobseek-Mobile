import 'package:flutter/material.dart';
import 'package:jobseek/shared/themes.dart';

class JobSeekerMyCvPage extends StatefulWidget {
  const JobSeekerMyCvPage({super.key});

  @override
  State<JobSeekerMyCvPage> createState() => _JobSeekerMyCvPageState();
}

class _JobSeekerMyCvPageState extends State<JobSeekerMyCvPage> {
  bool _isEditing = false;

  final List<_CvFile> _cvFiles = [
    _CvFile(name: 'mycv1.pdf', size: '2.4 MB'),
    _CvFile(name: 'mycv2.pdf', size: '2.4 MB'),
    _CvFile(name: 'mycv3.pdf', size: '2.4 MB'),
    _CvFile(name: 'mycv4.pdf', size: '2.4 MB'),
    _CvFile(name: 'mycv5.pdf', size: '2.4 MB'),
    _CvFile(name: 'mycv6.pdf', size: '2.4 MB'),
  ];

  // ─────────────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildAppBar(),
          // Edit toggle row
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 6, bottom: 2),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => setState(() => _isEditing = !_isEditing),
                child: Text(
                  _isEditing ? 'Done' : 'Edit',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: _cvFiles.isEmpty
                ? _buildEmpty()
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                    itemCount: _cvFiles.length,
                    separatorBuilder: (_, __) =>
                        const Divider(height: 1, color: Color(0xFFEEEEEE)),
                    itemBuilder: (_, i) => _buildCvRow(_cvFiles[i], i),
                  ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
      // Upload FAB
      floatingActionButton: _isEditing
          ? null
          : FloatingActionButton(
              onPressed: _showUploadSheet,
              backgroundColor: AppColors.primary,
              child: const Icon(Icons.add, color: Colors.white),
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
                'My CV',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  // ─── CV Row ───────────────────────────────────────────────────────────────
  Widget _buildCvRow(_CvFile cv, int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        leading: _pdfIcon(cv.name),
        title: Text(
          cv.name,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        trailing: _isEditing
            ? GestureDetector(
                onTap: () => _confirmDelete(index),
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red.shade300, width: 1.2),
                  ),
                  child: const Icon(Icons.close, color: Colors.red, size: 16),
                ),
              )
            : Text(
                cv.size,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2E7D32),
                ),
              ),
        onTap: _isEditing ? null : () => _showCvOptions(index),
      ),
    );
  }

  // ─── PDF icon ─────────────────────────────────────────────────────────────
  Widget _pdfIcon(String name) {
    // alternate between filled and outlined icon to mimic the design
    final isPdf = name.endsWith('.pdf');
    return Container(
      width: 40,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(
            Icons.insert_drive_file_outlined,
            color: Colors.black38,
            size: 32,
          ),
          if (isPdf)
            Positioned(
              bottom: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: const Text(
                  'PDF',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 7,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ─── Empty state ──────────────────────────────────────────────────────────
  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.description_outlined,
            size: 72,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          const Text(
            'No CVs uploaded yet',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.black45,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Tap + to upload your first CV',
            style: TextStyle(fontSize: 13, color: Colors.black38),
          ),
        ],
      ),
    );
  }

  // ─── Delete confirmation ──────────────────────────────────────────────────
  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'Delete CV',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
          ),
        ),
        content: Text(
          'Are you sure you want to delete "${_cvFiles[index].name}"?',
          style: const TextStyle(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.black54),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() => _cvFiles.removeAt(index));
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('CV deleted'),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Delete',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }

  // ─── CV options bottom sheet ──────────────────────────────────────────────
  void _showCvOptions(int index) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              _cvFiles[index].name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            _sheetTile(
              icon: Icons.visibility_outlined,
              color: AppColors.primary,
              label: 'View',
              onTap: () => Navigator.pop(context),
            ),
            _sheetTile(
              icon: Icons.drive_file_rename_outline_rounded,
              color: AppColors.secondary,
              label: 'Rename',
              onTap: () {
                Navigator.pop(context);
                _showRenameDialog(index);
              },
            ),
            _sheetTile(
              icon: Icons.delete_outline_rounded,
              color: Colors.red,
              label: 'Delete',
              onTap: () {
                Navigator.pop(context);
                _confirmDelete(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _sheetTile({
    required IconData icon,
    required Color color,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
      onTap: onTap,
    );
  }

  // ─── Rename dialog ────────────────────────────────────────────────────────
  void _showRenameDialog(int index) {
    final ctrl = TextEditingController(text: _cvFiles[index].name);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'Rename CV',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
          ),
        ),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Enter new name',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1.5,
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.black54),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (ctrl.text.trim().isNotEmpty) {
                setState(() => _cvFiles[index].name = ctrl.text.trim());
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Rename',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Upload bottom sheet ──────────────────────────────────────────────────
  void _showUploadSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Upload CV',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 16),
            _sheetTile(
              icon: Icons.folder_open_rounded,
              color: AppColors.primary,
              label: 'Choose from Files',
              onTap: () {
                Navigator.pop(context);
                // TODO: integrate file picker
                setState(
                  () => _cvFiles.add(
                    _CvFile(
                      name: 'mycv${_cvFiles.length + 1}.pdf',
                      size: '2.4 MB',
                    ),
                  ),
                );
              },
            ),
            _sheetTile(
              icon: Icons.cloud_upload_outlined,
              color: AppColors.secondary,
              label: 'Upload from Cloud',
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Bottom Nav ────────────────────────────────────────────────────────────
  Widget _buildBottomNav() {
    const currentIndex = 3;
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
                  if (i == currentIndex) return;
                  if (i == 0) {
                    Navigator.popUntil(
                      context,
                      ModalRoute.withName('/job-seeker-home'),
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
                        currentIndex == i
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
                        color: currentIndex == i
                            ? AppColors.secondary
                            : Colors.white60,
                        fontWeight: currentIndex == i
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

// ─── Data Models ──────────────────────────────────────────────────────────────
class _CvFile {
  String name;
  String size;
  _CvFile({required this.name, required this.size});
}

class _NavItem {
  final String icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}
