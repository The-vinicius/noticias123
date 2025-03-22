import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:noticias123/src/auth/data/repositories/auth_repository.dart';
import 'package:noticias123/src/auth/domian/models/user/user.dart';

class ProfileScreen extends StatefulWidget {
  final AuthRepository authRepository;

  const ProfileScreen({super.key, required this.authRepository});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    widget.authRepository.getUser();
  }

  @override
  void dispose() {
    super.dispose();
    widget.authRepository.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: StreamBuilder<User>(
          stream: widget.authRepository.observerUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final user = snapshot.data!;
              return Column(
                children: [
                  _buildProfileHeader(user),
                  const SizedBox(height: 24),
                  _buildProfileDetails(user),
                ],
              );
            }
            return const Center(
              child: Text('Sem dados'),
            );
          }),
    );
  }

  Widget _buildProfileHeader(User user) {
    return Column(
      children: [
        CircleAvatar(
          radius: 64,
          backgroundColor: Colors.grey[200],
          backgroundImage: CachedNetworkImageProvider(user.avatarUrl),
          child: user.avatarUrl.isEmpty
              ? const Icon(Icons.person, size: 64)
              : null,
        ),
        const SizedBox(height: 16),
        Text(
          user.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          user.email,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileDetails(User user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sobre',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          user.bio.isNotEmpty ? user.bio : 'Nenhuma biografia informada',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
            height: 1.4,
          ),
        ),
        const SizedBox(height: 24),
        _buildDetailItem(
          icon: Icons.fingerprint,
          title: 'ID do Usuário',
          value: user.uid,
        ),
      ],
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
