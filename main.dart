import 'package:flutter/material.dart';

void main() {
  runApp(CookEaseApp());
}

class CookEaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CookEase Pvt. Ltd.',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: LoginPage(),
    );
  }
}

// ---------------- LOGIN PAGE ----------------
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please enter username and password")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu, size: 80, color: Colors.orange),
              SizedBox(height: 20),
              Text(
                "CookEase Pvt. Ltd.",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                ),
                child: Text("Login", style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- HOME PAGE ----------------
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Map<String, String>> savedRecipes = [];

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeTab(),
      AboutTab(),
      ServicesTab(savedRecipes: savedRecipes),
      NotificationsTab(savedRecipes: savedRecipes),
      ContactUsTab(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CookEase Pvt. Ltd."),
        backgroundColor: Colors.orange,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.room_service), label: 'Recipes'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: 'Contact'),
        ],
      ),
    );
  }
}

// ---------------- HOME TAB ----------------
class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "Welcome to CookEase Pvt. Ltd.\n\n"
          "Discover, save, and share your favorite recipes easily with our mobile platform.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, height: 1.5),
        ),
      ),
    );
  }
}

// ---------------- ABOUT TAB ----------------
class AboutTab extends StatelessWidget {
  const AboutTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Our Team',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 20),
            _buildMemberCard(
              name: 'Mamidi Shirisha',
              role: 'Chief Executive Officer (CEO)',
              imagePath: 'assets/images/N9.jpg',
              description: 'Mamidi Shirisha is the visionary CEO of CookEase Pvt. Ltd., leading the company with passion and innovation.',
            ),
            _buildMemberCard(
              name: 'Mamidyala Shruthi',
              role: 'Chief Technology Officer (CTO)',
              imagePath: 'assets/images/P0.jpg',
              description: 'Mamidyala Shruthi heads the technology division, ensuring CookEase stays at the forefront of digital innovation.',
            ),
            _buildMemberCard(
              name: 'Koushik Sai',
              role: 'Chief Operating Officer (COO)',
              imagePath: 'assets/images/P1.jpg',
              description: 'Koushik Sai oversees day-to-day operations, making sure CookEase runs efficiently and smoothly.',
            ),
            _buildMemberCard(
              name: 'Bhavadeep',
              role: 'Chief Operating Officer (COO)',
              imagePath: 'assets/images/P2.jpg',
              description: 'Bhavadeep collaborates with the team to deliver top-quality culinary experiences for our users.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMemberCard({
    required String name,
    required String role,
    required String imagePath,
    required String description,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                height: 180,
                width: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(role, style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 8),
            Text(description, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

// ---------------- SERVICES TAB ----------------
class ServicesTab extends StatefulWidget {
  final List<Map<String, String>> savedRecipes;

  ServicesTab({required this.savedRecipes});

  @override
  _ServicesTabState createState() => _ServicesTabState();
}

class _ServicesTabState extends State<ServicesTab> {
  final List<Map<String, String>> recipes = [
    {
      'title': 'Pasta Alfredo',
      'image': 'https://www.gimmesomeoven.com/wp-content/uploads/2020/02/alfredo-pasta.jpg',
      'description': 'Creamy Alfredo pasta made with butter, cream, and cheese.'
    },
    {
      'title': 'Veg Biryani',
      'image': 'https://www.indianhealthyrecipes.com/wp-content/uploads/2020/06/veg-biryani-recipe-1.jpg',
      'description': 'Aromatic rice cooked with mixed vegetables and spices.'
    },
    {
      'title': 'Chocolate Cake',
      'image': 'https://www.addapinch.com/wp-content/uploads/2019/12/Chocolate-Cake-Recipe-Featured.jpg',
      'description': 'Moist chocolate cake topped with rich chocolate ganache.'
    },
    {
      'title': 'Paneer Butter Masala',
      'image': 'https://www.cookwithmanali.com/wp-content/uploads/2022/08/Paneer-Butter-Masala-Recipe.jpg',
      'description': 'Soft paneer cubes cooked in a creamy tomato-based gravy.'
    },
    {
      'title': 'Chicken Curry',
      'image': 'https://www.allrecipes.com/thmb/6i9f3V2Z3u6qVqgkF6V0Qe5XG0E=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/indian-chicken-curry-ii-46822-hero-01-4x3-1-1-1.jpg',
      'description': 'Spicy and flavorful chicken curry with aromatic spices.'
    },
  ];

  void _openRecipe(Map<String, String> recipe) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeDetailPage(
          recipe: recipe,
          onSave: () {
            if (!widget.savedRecipes.contains(recipe)) {
              setState(() {
                widget.savedRecipes.add(recipe);
              });
            }
          },
        ),
      ),
    );
  }

  void _viewSavedRecipes() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SavedRecipesPage(savedRecipes: widget.savedRecipes),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: recipes.map((recipe) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(recipe['image']!, width: 70, fit: BoxFit.cover),
              title: Text(recipe['title']!),
              subtitle: Text(recipe['description']!),
              onTap: () => _openRecipe(recipe),
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.bookmark),
        onPressed: _viewSavedRecipes,
      ),
    );
  }
}

// ---------------- RECIPE DETAIL PAGE ----------------
class RecipeDetailPage extends StatelessWidget {
  final Map<String, String> recipe;
  final VoidCallback onSave;

  RecipeDetailPage({required this.recipe, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe['title']!), backgroundColor: Colors.orange),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(recipe['image']!, height: 200, fit: BoxFit.cover),
            SizedBox(height: 20),
            Text(recipe['description']!, style: TextStyle(fontSize: 16)),
            Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                onSave();
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Recipe saved!")));
              },
              icon: Icon(Icons.favorite, color: Colors.white),
              label: Text("Save Recipe"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- SAVED RECIPES PAGE ----------------
class SavedRecipesPage extends StatelessWidget {
  final List<Map<String, String>> savedRecipes;

  SavedRecipesPage({required this.savedRecipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Saved Recipes"), backgroundColor: Colors.orange),
      body: savedRecipes.isEmpty
          ? Center(child: Text("No recipes saved yet."))
          : ListView(
              children: savedRecipes.map((recipe) {
                return ListTile(
                  leading: Image.network(recipe['image']!, width: 70, fit: BoxFit.cover),
                  title: Text(recipe['title']!),
                  subtitle: Text(recipe['description']!),
                );
              }).toList(),
            ),
    );
  }
}

// ---------------- NOTIFICATIONS TAB ----------------
class NotificationsTab extends StatelessWidget {
  final List<Map<String, String>> savedRecipes;

  NotificationsTab({required this.savedRecipes});

  @override
  Widget build(BuildContext context) {
    return savedRecipes.isEmpty
        ? Center(child: Text("No saved recipes yet."))
        : ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: savedRecipes.length,
            itemBuilder: (context, index) {
              final recipe = savedRecipes[index];
              return Card(
                child: ListTile(
                  leading: Image.network(recipe['image']!, width: 70, fit: BoxFit.cover),
                  title: Text(recipe['title']!),
                  subtitle: Text(recipe['description']!),
                ),
              );
            },
          );
  }
}

// ---------------- CONTACT US TAB ----------------
class ContactUsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text("Contact Us", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text("📧 support@cookease.com"),
        Text("📍 Hyderabad, India"),
      ],
    );
  }
}
