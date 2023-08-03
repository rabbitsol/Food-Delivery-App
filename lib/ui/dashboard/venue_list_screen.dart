import 'package:flutter/material.dart';

class VenueListScreen extends StatefulWidget {
  const VenueListScreen({super.key});

  @override
  State<VenueListScreen> createState() => _VenueListScreenState();
}

class _VenueListScreenState extends State<VenueListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Venue List Screen'),
      ),
    );
  }
}
