import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For Clipboard
import 'package:url_launcher/url_launcher.dart';

class AboutAs extends StatelessWidget {
  const AboutAs({super.key});

  // Function to launch GitHub URL
  void _launchURL(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not launch $url')));
    }
  }

  // Function to copy GitHub URL
  void _copyURL(BuildContext context, String url) {
    Clipboard.setData(ClipboardData(text: url));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Copied URL: $url')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Group Members")),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildProfileCard(
            context,
            name: "Gebre Meskel Molla",
            role: "Project Manager and Flutter Developer",
            githubUrl: "https://github.com/Gebrshmolla",
          ),
          _buildProfileCard(
            context,
            name: "Elias-Nibret",
            role: "flutter Developer",
            githubUrl: "https://github.com/Elias-Nibret",
          ),
          _buildProfileCard(
            context,
            name: "Yosef Tefera",
            role: "flutter Developer",
            githubUrl: "https://github.com/yoseftefera",
          ),
          _buildProfileCard(
            context,
            name: "Betelhem Yalelet",
            role: "flutter Developer",
            githubUrl: "https://github.com/yalbetel",
          ),
          _buildProfileCard(
            context,
            name: "Natnael  Argaw",
            role: "flutter Developer",
            githubUrl: "https://github.com/natnaelargaw",
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard(
    BuildContext context, {
    required String name,
    required String role,
    required String githubUrl,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(child: Icon(Icons.person)),
        title: Text(name),
        subtitle: Text(role),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.copy),
              tooltip: 'Copy GitHub URL',
              onPressed: () => _copyURL(context, githubUrl),
            ),
          ],
        ),
      ),
    );
  }
}
