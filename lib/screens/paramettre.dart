import 'package:flutter/material.dart';

class ParamettreScreen extends StatefulWidget {
  const ParamettreScreen({super.key});

  @override
  State<ParamettreScreen> createState() => _ParamettreScreenState();
}

class _ParamettreScreenState extends State<ParamettreScreen> {
  // Variables pour les paramètres
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  String _selectedLanguage = 'العربية';
  double _caloriesGoal = 2000;
  double _waterGoal = 8;
  bool _useMetricSystem = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildHeader(),
                const SizedBox(height: 24),
                _buildAccountSection(),
                const SizedBox(height: 24),
                _buildAppearanceSection(),
                const SizedBox(height: 24),
                _buildNotificationsSection(),
                const SizedBox(height: 24),
                _buildGoalsSection(),
                const SizedBox(height: 24),
                _buildPrivacySection(),
                const SizedBox(height: 24),
                _buildAboutSection(),
                const SizedBox(height: 24),
                _buildLogoutButton(),
                const SizedBox(height: 16),
                _buildVersionInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Row(
          children: [
            const Text(
              'الإعدادات',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 100),
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFF4CAF50),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAccountSection() {
    return _buildSection(
      title: 'الحساب',
      icon: Icons.person,
      children: [
        _buildSettingItem(
          title: 'تعديل الملف الشخصي',
          subtitle: 'تغيير الاسم، الصورة، والبريد الإلكتروني',
          icon: Icons.edit,
          onTap: () {},
        ),
        _buildSettingItem(
          title: 'تغيير كلمة المرور',
          subtitle: 'تحديث كلمة المرور الخاصة بك',
          icon: Icons.lock,
          onTap: () {},
        ),
        _buildSettingItem(
          title: 'المعلومات الشخصية',
          subtitle: 'العمر، الطول، الوزن، والجنس',
          icon: Icons.info,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildAppearanceSection() {
    return _buildSection(
      title: 'المظهر',
      icon: Icons.palette,
      children: [
        _buildSwitchSettingItem(
          title: 'الوضع الداكن',
          subtitle: 'تفعيل المظهر الداكن للتطبيق',
          value: _darkModeEnabled,
          onChanged: (value) {
            setState(() {
              _darkModeEnabled = value;
            });
          },
        ),
        _buildSettingItem(
          title: 'اللغة',
          subtitle: _selectedLanguage,
          icon: Icons.language,
          onTap: _showLanguageDialog,
        ),
        _buildSettingItem(
          title: 'حجم الخط',
          subtitle: 'متوسط',
          icon: Icons.text_fields,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildNotificationsSection() {
    return _buildSection(
      title: 'الإشعارات',
      icon: Icons.notifications,
      children: [
        _buildSwitchSettingItem(
          title: 'تفعيل الإشعارات',
          subtitle: 'استلام تنبيهات وتذكيرات',
          value: _notificationsEnabled,
          onChanged: (value) {
            setState(() {
              _notificationsEnabled = value;
            });
          },
        ),
        _buildSettingItem(
          title: 'تذكير الوجبات',
          subtitle: 'تعيين أوقات التذكير بالوجبات',
          icon: Icons.restaurant,
          onTap: () {},
          enabled: _notificationsEnabled,
        ),
        _buildSettingItem(
          title: 'تذكير شرب الماء',
          subtitle: 'تعيين تكرار تذكير شرب الماء',
          icon: Icons.water_drop,
          onTap: () {},
          enabled: _notificationsEnabled,
        ),
        _buildSettingItem(
          title: 'تقارير أسبوعية',
          subtitle: 'استلام ملخص أسبوعي لتقدمك',
          icon: Icons.bar_chart,
          onTap: () {},
          enabled: _notificationsEnabled,
        ),
      ],
    );
  }

  Widget _buildGoalsSection() {
    return _buildSection(
      title: 'الأهداف',
      icon: Icons.flag,
      children: [
        _buildSliderSettingItem(
          title: 'هدف السعرات اليومي',
          subtitle: '${_caloriesGoal.toInt()} سعرة',
          value: _caloriesGoal,
          min: 1200,
          max: 4000,
          divisions: 28,
          onChanged: (value) {
            setState(() {
              _caloriesGoal = value;
            });
          },
        ),
        _buildSliderSettingItem(
          title: 'هدف شرب الماء',
          subtitle: '${_waterGoal.toInt()} أكواب',
          value: _waterGoal,
          min: 4,
          max: 16,
          divisions: 12,
          onChanged: (value) {
            setState(() {
              _waterGoal = value;
            });
          },
        ),
        _buildSwitchSettingItem(
          title: 'النظام المتري',
          subtitle: 'استخدام كجم/سم بدلاً من رطل/قدم',
          value: _useMetricSystem,
          onChanged: (value) {
            setState(() {
              _useMetricSystem = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildPrivacySection() {
    return _buildSection(
      title: 'الخصوصية والأمان',
      icon: Icons.security,
      children: [
        _buildSettingItem(
          title: 'إعدادات الخصوصية',
          subtitle: 'التحكم في مشاركة البيانات',
          icon: Icons.visibility,
          onTap: () {},
        ),
        _buildSettingItem(
          title: 'حذف البيانات',
          subtitle: 'حذف سجل الوجبات والنشاطات',
          icon: Icons.delete,
          onTap: () {},
        ),
        _buildSettingItem(
          title: 'تصدير البيانات',
          subtitle: 'تحميل نسخة من بياناتك',
          icon: Icons.download,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildAboutSection() {
    return _buildSection(
      title: 'حول التطبيق',
      icon: Icons.info,
      children: [
        _buildSettingItem(
          title: 'شروط الاستخدام',
          subtitle: 'قراءة شروط استخدام التطبيق',
          icon: Icons.description,
          onTap: () {},
        ),
        _buildSettingItem(
          title: 'سياسة الخصوصية',
          subtitle: 'كيفية استخدام بياناتك',
          icon: Icons.policy,
          onTap: () {},
        ),
        _buildSettingItem(
          title: 'تقييم التطبيق',
          subtitle: 'شاركنا رأيك في التطبيق',
          icon: Icons.star,
          onTap: () {},
        ),
        _buildSettingItem(
          title: 'التواصل معنا',
          subtitle: 'الدعم الفني والاقتراحات',
          icon: Icons.support_agent,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildLogoutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.logout, color: Colors.white),
        label: const Text('تسجيل الخروج'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildVersionInfo() {
    return Center(
      child: Text(
        'FitCal AI v1.0.0',
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF4CAF50).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: const Color(0xFF4CAF50),
                size: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingItem({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
    bool enabled = true,
  }) {
    return Opacity(
      opacity: enabled ? 1.0 : 0.5,
      child: ListTile(
        enabled: enabled,
        leading: Icon(
          Icons.chevron_left,
          color: Colors.grey[600],
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.right,
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
          textAlign: TextAlign.right,
        ),
        trailing: Icon(
          icon,
          color: const Color(0xFF4CAF50),
        ),
        onTap: enabled ? onTap : null,
      ),
    );
  }

  Widget _buildSwitchSettingItem({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.right,
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 12,
        ),
        textAlign: TextAlign.right,
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: const Color(0xFF4CAF50),
      ),
    );
  }

  Widget _buildSliderSettingItem({
    required String title,
    required String subtitle,
    required double value,
    required double min,
    required double max,
    required int divisions,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subtitle,
                style: const TextStyle(
                  color: Color(0xFF4CAF50),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: divisions,
          activeColor: const Color(0xFF4CAF50),
          inactiveColor: Colors.grey[300],
          onChanged: onChanged,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                max.toInt().toString(),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                min.toInt().toString(),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showLanguageDialog() {
    final languages = ['العربية', 'English', 'Français', 'Español'];

    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('اختر اللغة'),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final language = languages[index];
                  final isSelected = language == _selectedLanguage;

                  return ListTile(
                    title: Text(language),
                    trailing: isSelected
                        ? const Icon(Icons.check, color: Color(0xFF4CAF50))
                        : null,
                    onTap: () {
                      setState(() {
                        _selectedLanguage = language;
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('إلغاء'),
              ),
            ],
          ),
        );
      },
    );
  }
}
