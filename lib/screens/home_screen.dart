import 'dart:io';

import 'package:fitcal_ai/camera/ImageDisplayScreen.dart';
import 'package:fitcal_ai/camera/ImagePickerService.dart';
import 'package:fitcal_ai/screens/analysis_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/macro_progress_bar.dart';
import '../widgets/macro_info_card.dart';
import 'last_scan_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePickerService _imagePickerService = ImagePickerService();
  String? imagePath;

  Future<void> _pickAndShowImage(ImageSource source) async {
    final XFile? image = await _imagePickerService.pickImage(source);

    if (image != null) {
      setState(() {
        imagePath = image.path;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LastScanScreen(imagePath: imagePath!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 16),
                _buildGreeting(),
                const SizedBox(height: 24),
                _buildPhotoButtons(),
                const SizedBox(height: 24),
                _buildDailySummary(),
                const SizedBox(height: 24),
                _buildLatestAnalysis(
                    context, imagePath ?? "assets/images/img1.jpg"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(width: 75),
        const Text(
          'FitCal AI',
          style: TextStyle(
            color: Color(0xFF4CAF50),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 70),
        IconButton(
          icon: CircleAvatar(
            radius: 24,
            backgroundImage: const AssetImage('assets/images/img2.jpg'),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildGreeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'مرحباً أحمد!',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.right,
        ),
        Text(
          'الجمعة، 11 أبريل 2025',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }

  Widget _buildPhotoButtons() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            _pickAndShowImage(ImageSource.camera);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4CAF50),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.camera_alt),
              SizedBox(width: 8),
              Text('التقط صورة للطعام'),
            ],
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: () {
            _pickAndShowImage(ImageSource.gallery);
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF4CAF50),
            side: const BorderSide(color: Color(0xFF4CAF50)),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.image),
              SizedBox(width: 8),
              Text('تحميل صورة من المعرض'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDailySummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'ملخص اليوم',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '1,250',
              style: TextStyle(
                color: Color(0xFF4CAF50),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'السعرات المستهلكة',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '2,000',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const MacroProgressBar(
          percentage: 0.625,
          color: Color(0xFF4CAF50),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MacroInfoCard(
              title: 'بروتين',
              value: '45',
              unit: 'جم',
              color: Colors.blue,
            ),
            MacroInfoCard(
              title: 'كربوهيدرات',
              value: '120',
              unit: 'جم',
              color: Colors.yellow[700]!,
            ),
            MacroInfoCard(
              title: 'دهون',
              value: '35',
              unit: 'جم',
              color: Colors.red[300]!,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLatestAnalysis(BuildContext context, String imagePath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'عرض الكل',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                ),
              ),
            ),
            const Text(
              'آخر تحليل',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        LastScanScreen(imagePath: imagePath)));
          },

          //     if (imagePath != null) {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //           builder: (context) => LastScanScreen(imagePath: imagePath)),
          //     );
          //   }else{
          //      Navigator.of(context).push(
          //     MaterialPageRoute(
          //         builder: (context) => LastScanScreen(imagePath: 'assets/images/img1.jpg'))

          //   );
          // }

          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              height: 300,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: imagePath != 'assets/images/img1.jpg'
                          ? Image.file(
                              File(imagePath),
                              fit: BoxFit.fill,
                            )
                          : Image.asset(
                              'assets/images/img1.jpg',
                              fit: BoxFit.cover,
                            ), // Affiche l'image par défaut
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.topRight,
                    child: const Text(
                      ' سلطة الدجاج المشوي',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      children: [
                        Text(
                          "السعرات المستهلكة",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "1200",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
