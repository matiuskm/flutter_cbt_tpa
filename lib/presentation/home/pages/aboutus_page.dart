import 'package:cbt_tpa_app/core/assets/assets.gen.dart';
import 'package:cbt_tpa_app/core/constants/theme.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.images.logo.path, // Replace with your app logo image path
              height: 150.0,
            ),
            const SizedBox(height: 16.0),
            Text(
              'FIC Batch 10',
              style: ralewayFont32Bold,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Welcome to Our Awesome App! This app is designed to make your life easier and more enjoyable. We strive to provide the best user experience and functionality to meet your needs.',
              textAlign: TextAlign.center,
              style: poppinsFont14w500Dark,
            ),
            const SizedBox(height: 24.0),
            Text(
              'Contributors',
              style: poppinsFont18semiBold,
            ),
            const SizedBox(height: 16.0),
            const ContributorItem(
              name: 'Saiful Bahri',
              role: 'Mentor & Developer',
            ),
            const ContributorItem(
              name: 'LZCDR',
              role: 'Developer',
            ),
            // Add more ContributorItem widgets as needed
          ],
        ),
      ),
    );
  }
}

class ContributorItem extends StatelessWidget {
  final String name;
  final String role;

  const ContributorItem({required this.name, required this.role, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        // You can add profile pictures here if available
        child: Text(name[0], style: poppinsFont16w500),
      ),
      title: Text(name, style: poppinsFont14w500Dark),
      subtitle: Text(role, style: poppinsFont14w500Link),
    );
  }
}
