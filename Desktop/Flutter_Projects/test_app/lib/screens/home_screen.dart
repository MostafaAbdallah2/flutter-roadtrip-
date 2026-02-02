import 'package:flutter/material.dart';
import '../constans.dart';
import '../widgets/car_container.dart';
import '../widgets/character_checkbox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  // State variables
  bool status = true;
  bool status1 = true;
  bool status2 = true;
  bool status3 = true;

  // Animation controllers
  late AnimationController _cardAnimationController;
  late AnimationController _listAnimationController;
  late AnimationController _carAnimationController;
  late Animation<Offset> _cardSlideAnimation;
  late Animation<double> _cardFadeAnimation;
  late Animation<Offset> _carMoveAnimation;

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

    _listAnimationController = AnimationController(
      duration: listDuration,
      vsync: this,
    );

    _carAnimationController = AnimationController(
      duration: carDuration,
      vsync: this,
    )..repeat(reverse: true);

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

    _carMoveAnimation =
        Tween<Offset>(
          begin: const Offset(-0.3, 0),
          end: const Offset(0.3, 0),
        ).animate(
          CurvedAnimation(
            parent: _carAnimationController,
            curve: Curves.easeInOut,
          ),
        );

    _cardAnimationController.forward();
    Future.delayed(delayDuration, () => _listAnimationController.forward());
  }

  @override
  void dispose() {
    _cardAnimationController.dispose();
    _listAnimationController.dispose();
    _carAnimationController.dispose();
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
              child: _buildMainCard(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainCard() {
    return Container(
      height: 600,
      width: 400,
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
        children: [
          CarContainer(carMoveAnimation: _carMoveAnimation),
          _buildHeader(),
          _buildCharacterList(),
          _buildBackButton(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          "You are Doing a roadtrip.",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: textDark,
          ),
        ),
        Text(
          "Who do you want in your car?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: primaryPurple,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildCharacterList() {
    return Expanded(
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.8, end: 1.0).animate(
          CurvedAnimation(
            parent: _listAnimationController,
            curve: Curves.elasticOut,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CharacterCheckbox(
                name: "Emmm Watson",
                value: status,
                onChanged: (value) => setState(() => status = value),
              ),
              const SizedBox(height: 18),
              CharacterCheckbox(
                name: "Dorth Vader",
                value: status1,
                onChanged: (value) => setState(() => status1 = value),
              ),
              const SizedBox(height: 18),
              CharacterCheckbox(
                name: "McLovin",
                value: status2,
                onChanged: (value) => setState(() => status2 = value),
              ),
              const SizedBox(height: 18),
              CharacterCheckbox(
                name: "Emmm Watson",
                value: status3,
                onChanged: (value) => setState(() => status3 = value),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildBackActionButton(), _buildContinueButton()],
      ),
    );
  }

  Widget _buildBackActionButton() {
    return OutlinedButton.icon(
      onPressed: () => Navigator.of(context).pop(),
      icon: const Icon(Icons.arrow_back),
      label: const Text("Back"),
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryPurple,
        side: BorderSide(color: primaryPurple, width: 2),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget _buildContinueButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/success');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedTile,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
      ),
      child: const Text(
        "Continue",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
