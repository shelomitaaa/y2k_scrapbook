import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class InteractiveScrapbookCard extends StatefulWidget {
  final String imageUrl;
  final String caption;
  final String date;
  final bool isLocal;
  final VoidCallback onDelete;

  const InteractiveScrapbookCard({
    super.key,
    required this.imageUrl,
    required this.caption,
    required this.date,
    required this.onDelete,
    this.isLocal = false,
  });

  @override
  State<InteractiveScrapbookCard> createState() =>
      _InteractiveScrapbookCardState();
}

class _InteractiveScrapbookCardState extends State<InteractiveScrapbookCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6),
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(13.0),
                    ),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: widget.isLocal
                          ? (kIsWeb
                                ? Image.network(
                                    widget.imageUrl,
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    File(widget.imageUrl),
                                    fit: BoxFit.cover,
                                  ))
                          : Image.network(widget.imageUrl, fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withOpacity(0.8),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: widget.onDelete,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.caption,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.date,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
