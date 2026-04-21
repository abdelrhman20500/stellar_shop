import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          height: height * 0.32,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFFF6B00), Color(0xFFFF8C00)],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        ),

        SafeArea(
          child: Column(
            children: [
              // ── AppBar row ──
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "My Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CircleButton(
                      icon: Icons.edit_outlined,
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // ── Avatar ──
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      backgroundColor: Color(0xFFFFE0C2),
                      child: Icon(Icons.person,
                          size: 55, color: Color(0xFFFF6B00)),
                    ),
                  ),
                  Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF6B00),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.camera_alt,
                        size: 15, color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // ── Name & Email ──
              const Text(
                "John Doe",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "johndoe@email.com",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.85),
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 24),

              // ── Stats row ──
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _StatItem(label: "Orders", value: "12"),
                      _VerticalDivider(),
                      _StatItem(label: "Wishlist", value: "5"),
                      _VerticalDivider(),
                      _StatItem(label: "Reviews", value: "8"),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // ── Menu items ──
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    const _SectionLabel(label: "Account"),
                    const SizedBox(height: 8),
                    _MenuItem(
                      icon: Icons.person_outline,
                      title: "Personal Information",
                      onTap: () {},
                    ),
                    _MenuItem(
                      icon: Icons.location_on_outlined,
                      title: "My Addresses",
                      onTap: () {},
                    ),
                    _MenuItem(
                      icon: Icons.payment_outlined,
                      title: "Payment Methods",
                      onTap: () {},
                    ),
                    const SizedBox(height: 16),
                    const _SectionLabel(label: "Orders"),
                    const SizedBox(height: 8),
                    _MenuItem(
                      icon: Icons.shopping_bag_outlined,
                      title: "My Orders",
                      onTap: () {},
                    ),
                    _MenuItem(
                      icon: Icons.favorite_outline,
                      title: "Wishlist",
                      onTap: () {},
                    ),
                    _MenuItem(
                      icon: Icons.star_outline,
                      title: "My Reviews",
                      onTap: () {},
                    ),
                    const SizedBox(height: 16),
                    const _SectionLabel(label: "Settings"),
                    const SizedBox(height: 8),
                    _MenuItem(
                      icon: Icons.notifications_outlined,
                      title: "Notifications",
                      onTap: () {},
                    ),
                    _MenuItem(
                      icon: Icons.lock_outline,
                      title: "Change Password",
                      onTap: () {},
                    ),
                    const SizedBox(height: 8),
                    _MenuItem(
                      icon: Icons.logout,
                      title: "Logout",
                      iconColor: Colors.red,
                      titleColor: Colors.red,
                      showArrow: false,
                      onTap: () {},
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Reusable Widgets ──────────────────────────────────────────────────────────

class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const CircleButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.25),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.5)),
        ),
        child: Icon(icon, color: Colors.white, size: 22),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFF6B00),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Colors.grey),
        ),
      ],
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 36,
      color: Colors.grey.shade200,
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;

  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
        letterSpacing: 1.2,
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color iconColor;
  final Color titleColor;
  final bool showArrow;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor = const Color(0xFFFF6B00),
    this.titleColor = Colors.black87,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: titleColor,
                ),
              ),
            ),
            if (showArrow)
              const Icon(Icons.arrow_forward_ios,
                  size: 14, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}