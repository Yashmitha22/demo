import 'package:flutter/material.dart';

// Main entry point for the Flutter application
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MRF Unit',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Inter', // Assuming Inter font is available or fallback to default
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // GlobalKeys for navigating to different sections
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _productsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  // Function to scroll to a specific section
  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsiveness
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isLargeScreen = screenWidth > 900;
    final bool isMediumScreen = screenWidth > 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6), // bg-gray-100
      appBar: AppBar(
        backgroundColor: const Color(0xFF004D40), // from-teal-800
        toolbarHeight: 80, // Increased height for better visual
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // MRF Unit Logo/Title
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF047857), // bg-teal-700
                  borderRadius: BorderRadius.circular(8.0), // rounded-lg
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4.0,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: const Text(
                  'MRF Unit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Navigation Links
              if (isMediumScreen)
                Row(
                  children: [
                    TextButton(
                      onPressed: () => _scrollToSection(_homeKey),
                      child: const Text('Home', style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                    const SizedBox(width: 24),
                    TextButton(
                      onPressed: () => _scrollToSection(_aboutKey),
                      child: const Text('About Us', style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                    const SizedBox(width: 24),
                    TextButton(
                      onPressed: () => _scrollToSection(_productsKey),
                      child: const Text('Products', style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                    const SizedBox(width: 24),
                    TextButton(
                      onPressed: () => _scrollToSection(_contactKey),
                      child: const Text('Contact', style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                  ],
                )
              else
                // Hamburger menu for small screens
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer(); // Open drawer
                  },
                ),
            ],
          ),
        ),
      ),
      // Drawer for small screens
      endDrawer: isMediumScreen
          ? null
          : Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xFF047857),
                    ),
                    child: Text(
                      'Navigation',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Home'),
                    onTap: () {
                      _scrollToSection(_homeKey);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('About Us'),
                    onTap: () {
                      _scrollToSection(_aboutKey);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Products'),
                    onTap: () {
                      _scrollToSection(_productsKey);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Contact'),
                    onTap: () {
                      _scrollToSection(_contactKey);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              key: _homeKey,
              height: MediaQuery.of(context).size.height * 0.9, // 90% of screen height
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://placehold.co/1920x1080/0F766E/FFFFFF?text=MRF+Unit+Facility',
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6), // opacity-60
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(24.0),
                  margin: const EdgeInsets.symmetric(horizontal: 24.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4), // bg-black bg-opacity-40
                    borderRadius: BorderRadius.circular(10.0), // rounded-lg
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 20.0,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  constraints: BoxConstraints(maxWidth: isLargeScreen ? 900 : screenWidth * 0.9),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Innovating for a Sustainable Future',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isLargeScreen ? 56 : (isMediumScreen ? 48 : 36),
                          fontWeight: FontWeight.w900, // font-extrabold
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Leading the way in Material Recovery and Recycling, transforming waste into valuable resources.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isLargeScreen ? 22 : (isMediumScreen ? 20 : 16),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () {
                          // Handle button press
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF10B981), // bg-teal-500
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(99.0), // rounded-full
                          ),
                          elevation: 8, // shadow-lg
                        ),
                        child: const Text(
                          'Explore Our Solutions',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // About Us Section
            Container(
              key: _aboutKey,
              padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 24.0),
              color: Colors.white,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'About Our MRF Unit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isLargeScreen ? 40 : 32,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF115E59), // text-teal-800
                      ),
                    ),
                    const SizedBox(height: 48),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth > 768) {
                          // Desktop layout
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16.0), // rounded-xl
                                  child: Image.network(
                                    'https://placehold.co/600x400/0F766E/FFFFFF?text=Modern+Recycling+Facility',
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) => Image.network(
                                      'https://placehold.co/600x400/0F766E/FFFFFF?text=Image+Not+Found',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 40),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Our Material Recovery Facility (MRF) is at the forefront of sustainable waste management. We specialize in the efficient sorting, processing, and recycling of various materials, contributing significantly to environmental preservation and resource conservation.\n\nEquipped with state-of-the-art technology and a dedicated team, we ensure maximum recovery rates and produce high-quality recycled materials that meet industry standards. Our commitment extends to fostering a circular economy and reducing landfill waste.\n\nWe work closely with communities and businesses to provide comprehensive recycling solutions, driving positive environmental impact and promoting responsible consumption.',
                                  style: TextStyle(
                                    fontSize: isLargeScreen ? 18 : 16,
                                    height: 1.6,
                                    color: const Color(0xFF4B5563), // text-gray-700
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          // Mobile/Tablet layout
                          return Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.0), // rounded-xl
                                child: Image.network(
                                  'https://placehold.co/600x400/0F766E/FFFFFF?text=Modern+Recycling+Facility',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => Image.network(
                                    'https://placehold.co/600x400/0F766E/FFFFFF?text=Image+Not+Found',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40),
                              Text(
                                'Our Material Recovery Facility (MRF) is at the forefront of sustainable waste management. We specialize in the efficient sorting, processing, and recycling of various materials, contributing significantly to environmental preservation and resource conservation.\n\nEquipped with state-of-the-art technology and a dedicated team, we ensure maximum recovery rates and produce high-quality recycled materials that meet industry standards. Our commitment extends to fostering a circular economy and reducing landfill waste.\n\nWe work closely with communities and businesses to provide comprehensive recycling solutions, driving positive environmental impact and promoting responsible consumption.',
                                style: TextStyle(
                                  fontSize: isLargeScreen ? 18 : 16,
                                  height: 1.6,
                                  color: const Color(0xFF4B5563), // text-gray-700
                                ),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Products/Services Section
            Container(
              key: _productsKey,
              padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 24.0),
              color: const Color(0xFFF3F4F6), // bg-gray-100
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Our Products & Services',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isLargeScreen ? 40 : 32,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF115E59), // text-teal-800
                      ),
                    ),
                    const SizedBox(height: 48),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(), // Disable scrolling of grid
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isLargeScreen ? 3 : (isMediumScreen ? 2 : 1),
                        crossAxisSpacing: 32.0,
                        mainAxisSpacing: 32.0,
                        childAspectRatio: 1.0, // Adjust as needed
                      ),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        List<Map<String, dynamic>> services = [
                          {
                            'icon': Icons.settings_input_component, // Material Sorting & Processing
                            'title': 'Material Sorting & Processing',
                            'description': 'Advanced automated and manual sorting techniques to maximize material recovery from mixed waste streams.',
                          },
                          {
                            'icon': Icons.recycling, // Recycled Raw Materials
                            'title': 'Recycled Raw Materials',
                            'description': 'High-quality recycled plastics, metals, paper, and glass ready for re-entry into manufacturing processes.',
                          },
                          {
                            'icon': Icons.lightbulb_outline, // Waste Auditing & Consulting
                            'title': 'Waste Auditing & Consulting',
                            'description': 'Expert analysis and strategic advice to optimize waste reduction and recycling programs for businesses.',
                          },
                        ];

                        return _buildServiceCard(
                          services[index]['icon'] as IconData,
                          services[index]['title'] as String,
                          services[index]['description'] as String,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Call to Action / Contact Section
            Container(
              key: _contactKey,
              padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 24.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF047857), // from-teal-700
                    Color(0xFF10B981), // to-teal-500
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Partner with Us for a Greener Tomorrow',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isLargeScreen ? 40 : 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Ready to make a difference? Contact our team today to learn how our MRF unit can support your sustainability goals.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isLargeScreen ? 20 : 18,
                        color: Colors.white,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        // Implement mailto functionality or navigate to a contact form
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF047857), // text-teal-700
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(99.0), // rounded-full
                        ),
                        elevation: 8, // shadow-lg
                      ),
                      child: const Text(
                        'Get In Touch',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Footer
            Container(
              padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
              color: const Color(0xFF1F2937), // bg-gray-800
              child: Center(
                child: Column(
                  children: [
                    Text(
                      '© ${DateTime.now().year} MRF Unit. All rights reserved.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Designed with sustainability in mind.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for service cards
  Widget _buildServiceCard(IconData icon, String title, String description) {
    return Card(
      elevation: 8, // shadow-lg
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // rounded-xl
        side: const BorderSide(color: Color(0xFFB2F2E4), width: 1.0), // border border-teal-200
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 64, // text-5xl
              color: const Color(0xFF0D9488), // text-teal-600
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22, // text-2xl
                fontWeight: FontWeight.w600, // font-semibold
                color: Color(0xFF0F766E), // text-teal-700
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF4B5563), // text-gray-600
              ),
            ),
          ],
        ),
      ),
    );
  }
}
