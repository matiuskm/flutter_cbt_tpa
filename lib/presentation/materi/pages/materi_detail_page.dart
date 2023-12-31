import 'package:cached_network_image/cached_network_image.dart';
import 'package:cbt_tpa_app/core/extensions/build_context_ext.dart';
import 'package:cbt_tpa_app/data/models/responses/material/materi_response_modal.dart';
import 'package:flutter/material.dart';

import '../../../core/components/custom_scaffold.dart';

class MateriDetailPage extends StatelessWidget {
  final Materi data;
  const MateriDetailPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: const Text('Materi TPA'),
      body: ListView(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(30.0),
            ),
            child: CachedNetworkImage(
              imageUrl: data.imageUrl,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: context.deviceWidth,
              height: 470.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
            child: Column(
              children: [
                Text(
                  data.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 14.0),
                Text(
                  data.content,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          const SizedBox(height: 100.0),
        ],
      ),
    );
  }
}
