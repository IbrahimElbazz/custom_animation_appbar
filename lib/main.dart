import 'package:flutter/material.dart';
import 'src/custom_animation_appbar_builder.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Animation AppBar Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const ExampleSelectionScreen(),
    );
  }
}

class ExampleSelectionScreen extends StatelessWidget {
  const ExampleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أمثلة AppBar المخصص'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'اختر مثال لتجربة الـ AppBar المخصص:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _buildExampleCard(
            context,
            title: 'المثال الأساسي',
            description: 'AppBar بسيط مع صورة وعنوان',
            icon: Icons.person,
            color: Colors.blue,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const BasicExampleScreen()),
            ),
          ),
          _buildExampleCard(
            context,
            title: 'AppBar مخصص بالكامل',
            description: 'تحكم كامل في الويدجت والتصميم',
            icon: Icons.dashboard_customize,
            color: Colors.green,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CustomExampleScreen()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExampleCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}

// المثال الأساسي - للتوافق مع النسخة السابقة
class BasicExampleScreen extends StatelessWidget {
  const BasicExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          customAnimationAppbar(
            context: context,
            image:
                'https://images.unsplash.com/photo-1511485977113-f34c92461ad9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
            title: 'أحمد محمد',
            descripton: 'مطور تطبيقات Flutter',
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade100,
                  child: Text('${index + 1}'),
                ),
                title: Text('عنصر ${index + 1}'),
                subtitle: const Text('وصف العنصر'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

// مثال مخصص بالكامل
class CustomExampleScreen extends StatelessWidget {
  const CustomExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAnimationAppBar.create(
            context: context,
            centerTitle: false,
            expandedHeight: 320,
            backgroundColor: Colors.green.shade50,
            animationDuration: const Duration(milliseconds: 500),
            expandedWidget: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.dashboard_customize,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12), // تقليل المسافة
                  const Text(
                    'AppBar مخصص',
                    style: TextStyle(
                      fontSize: 22, // تقليل حجم الخط
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'تحكم كامل في التصميم والمحتوى',
                    style: TextStyle(
                      fontSize: 15, // تقليل حجم الخط
                      color: Colors.green.shade700,
                    ),
                  ),
                  const SizedBox(height: 16), // مسافة سفلية
                ],
              ),
            ),
            collapsedWidget: const Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.dashboard_customize,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  'AppBar مخصص',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green.shade100,
                    child: Text('${index + 1}'),
                  ),
                  title: Text('عنصر مخصص ${index + 1}'),
                  subtitle: const Text('هذا محتوى تجريبي للمثال المخصص'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              childCount: 15,
            ),
          ),
        ],
      ),
    );
  }
}
