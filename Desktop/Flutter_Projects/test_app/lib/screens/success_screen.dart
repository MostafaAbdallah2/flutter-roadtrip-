import 'package:flutter/material.dart';
import '../constans.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen>
    with TickerProviderStateMixin {
  late AnimationController _cardAnimationController;
  late Animation<Offset> _cardSlideAnimation;
  late Animation<double> _cardFadeAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  void _initAnimations() {
    _cardAnimationController = AnimationController(
      duration: cardDuration,
      vsync: this,
    );

    _cardSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _cardAnimationController,
            curve: Curves.easeOut,
          ),
        );

    _cardFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _cardAnimationController, curve: Curves.easeIn),
    );

    _cardAnimationController.forward();
  }

  @override
  void dispose() {
    _cardAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgLight,
      body: SafeArea(
        child: Center(
          child: SlideTransition(
            position: _cardSlideAnimation,
            child: FadeTransition(
              opacity: _cardFadeAnimation,
              child: _buildSuccessCard(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessCard() {
    return Container(
      height: 500,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: bgCard,
        boxShadow: [
          BoxShadow(
            color: textDark.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSuccessIcon(),
          const SizedBox(height: 30),
          _buildTitle(),
          const SizedBox(height: 15),
          _buildDescription(),
          const SizedBox(height: 40),
          _buildBackHomeButton(),
        ],
      ),
    );
  }

  Widget _buildSuccessIcon() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors: [purpleDark, purpleAccent]),
      ),
      child: const Icon(Icons.done, size: 50, color: Colors.white),
    );
  }

  Widget _buildTitle() {
    return Text(
      "Great Choice!",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
        color: primaryPurple,
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "Your roadtrip passengers are ready!\nLet's start the adventure.",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: textDark.withOpacity(0.6)),
      ),
    );
  }

  Widget _buildBackHomeButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).popUntil((route) => route.isFirst);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedTile,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
      ),
      child: const Text(
        "Back to Home",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
