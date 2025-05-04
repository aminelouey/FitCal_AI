import 'package:flutter/material.dart';
import '../widgets/recommendation_card.dart';
import '../widgets/meal_suggestion_card.dart';

class RecommendationsScreen extends StatelessWidget {
  const RecommendationsScreen({super.key});

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
                const SizedBox(height: 16),
                _buildMacroLegend(),
                const SizedBox(height: 24),
                _buildRecommendations(),
                const SizedBox(height: 24),
                _buildSuggestedMeals(),
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
        Container(),
        Row(
          children: [
            const Text(
              'FitCal AI',
              style: TextStyle(
                color: Color(0xFF4CAF50),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFF4CAF50),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMacroLegend() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.yellow[50],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLegendItem('دهون', Colors.red[300]!),
          const SizedBox(width: 16),
          _buildLegendItem('كربوهيدرات', Colors.yellow[700]!),
          const SizedBox(width: 16),
          _buildLegendItem('بروتين', Colors.blue),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String text, Color color) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 4),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'توصيات مخصصة',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        RecommendationCard(
          title: 'الكربوهيدرات مرتفعة',
          description: 'حاول تقليل الكربوهيدرات غداً واستبدلها بالخضروات الورقية.',
          icon: Icons.warning_amber_rounded,
          color: Colors.yellow[700]!,
          backgroundColor: Colors.yellow[50]!,
        ),
        const SizedBox(height: 12),
        RecommendationCard(
          title: 'أحسنت! مستوى البروتين جيد',
          description: 'استمر في تناول البروتين بهذا المستوى للحفاظ على كتلة العضلات.',
          icon: Icons.thumb_up,
          color: Colors.green,
          backgroundColor: Colors.green[50]!,
        ),
      ],
    );
  }

  Widget _buildSuggestedMeals() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'المزيد',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                ),
              ),
            ),
            const Text(
              'وجبات مقترحة',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MealSuggestionCard(
              imageUrl: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Capture%20d%27%C3%A9cran%202025-04-11%20143205-h3qKdAjsWnnMny0sVcQYKQaHYYP6q0.png',
              title: 'زبادي يوناني',
              calories: 180,
            ),
            MealSuggestionCard(
              imageUrl: 'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Capture%20d%27%C3%A9cran%202025-04-11%20143205-h3qKdAjsWnnMny0sVcQYKQaHYYP6q0.png',
              title: 'سلطة الدجاج',
              calories: 320,
            ),
          ],
        ),
      ],
    );
  }
}
