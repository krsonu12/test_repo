import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Sample quiz categories - replace with your actual data
  final List<QuizCategory> categories = [
    QuizCategory(
      id: '1',
      name: 'Science',
      icon: Icons.science,
      color: Colors.blue,
      quizCount: 12,
    ),
    QuizCategory(
      id: '2',
      name: 'History',
      icon: Icons.history_edu,
      color: Colors.amber,
      quizCount: 8,
    ),
    QuizCategory(
      id: '3',
      name: 'Mathematics',
      icon: Icons.calculate,
      color: Colors.red,
      quizCount: 10,
    ),
    QuizCategory(
      id: '4',
      name: 'Geography',
      icon: Icons.public,
      color: Colors.green,
      quizCount: 7,
    ),
    QuizCategory(
      id: '5',
      name: 'Literature',
      icon: Icons.book,
      color: Colors.purple,
      quizCount: 9,
    ),
    QuizCategory(
      id: '6',
      name: 'Technology',
      icon: Icons.computer,
      color: Colors.teal,
      quizCount: 15,
    ),
  ];

  // Sample featured quizzes - replace with your actual data
  final List<FeaturedQuiz> featuredQuizzes = [
    FeaturedQuiz(
      id: '1',
      title: 'Space Exploration',
      description: 'Test your knowledge about the universe and space missions',
      imageUrl: 'https://images.unsplash.com/photo-1451187580459-43490279c0fa',
      difficulty: 'Medium',
      duration: '10 mins',
      questionCount: 15,
    ),
    FeaturedQuiz(
      id: '2',
      title: 'World History',
      description: 'Challenge yourself with questions about historical events',
      imageUrl: 'https://images.unsplash.com/photo-1461360228754-6e81c478b882',
      difficulty: 'Hard',
      duration: '15 mins',
      questionCount: 20,
    ),
    FeaturedQuiz(
      id: '3',
      title: 'Tech Giants',
      description: 'How well do you know the tech industry leaders?',
      imageUrl: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085',
      difficulty: 'Easy',
      duration: '8 mins',
      questionCount: 12,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverAppBar(
              floating: true,
              title: Row(
                children: [
                  Icon(
                    Icons.quiz_rounded,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'QuizMaster',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              actions: [
                IconButton(
                  icon: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://randomuser.me/api/portraits/men/1.jpg',
                    ),
                    radius: 14,
                  ),
                  onPressed: () {
                    // Navigate to profile or settings
                  },
                ),
                SizedBox(width: 8),
              ],
            ),

            // Main content
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    // Welcome section
                    _buildWelcomeSection(),

                    // Stats section
                    _buildStatsSection(),

                    // Featured quizzes
                    _buildSectionTitle('Featured Quizzes'),
                    SizedBox(height: 16),
                    _buildFeaturedQuizzes(),

                    // Categories
                    _buildSectionTitle('Categories'),
                    SizedBox(height: 16),
                    _buildCategoriesGrid(),

                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to random quiz or daily challenge
        },
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(Icons.play_arrow_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildWelcomeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello, John!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Let\'s test your knowledge today',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }

  Widget _buildStatsSection() {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.8),
            Theme.of(context).primaryColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('Completed', '24', Icons.check_circle_outline),
          _buildStatItem('Ranking', '#42', Icons.leaderboard_outlined),
          _buildStatItem('Points', '1,280', Icons.stars_outlined),
        ],
      ),
    );
  }

  Widget _buildStatItem(String title, String value, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 28,
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {
            // Navigate to see all
          },
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).primaryColor,
            padding: EdgeInsets.zero,
            minimumSize: Size(50, 30),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text('See All'),
        ),
      ],
    );
  }

  Widget _buildFeaturedQuizzes() {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: featuredQuizzes.length,
        itemBuilder: (context, index) {
          return _buildFeaturedQuizCard(featuredQuizzes[index]);
        },
      ),
    );
  }

  Widget _buildFeaturedQuizCard(FeaturedQuiz quiz) {
    return Container(
      width: 280,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        child: InkWell(
          onTap: () {
            // Navigate to quiz details
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Quiz image
              Container(
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(quiz.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.all(12),
                  child: Text(
                    quiz.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Quiz details
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      quiz.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildQuizInfoChip(
                          Icons.access_time_rounded,
                          quiz.duration,
                        ),
                        _buildQuizInfoChip(
                          Icons.quiz_rounded,
                          '${quiz.questionCount} Q',
                        ),
                        _buildQuizInfoChip(
                          Icons.signal_cellular_alt_rounded,
                          quiz.difficulty,
                        ),
                      ],
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

  Widget _buildQuizInfoChip(IconData icon, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 12,
            color: Colors.grey[700],
          ),
          SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return _buildCategoryCard(categories[index]);
      },
    );
  }

  Widget _buildCategoryCard(QuizCategory category) {
    return Card(
      elevation: 4,
      shadowColor: category.color.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          // Navigate to category quizzes
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.7),
                category.color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                category.icon,
                color: Colors.white,
                size: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${category.quizCount} Quizzes',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      elevation: 8,
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(Icons.home_rounded, 'Home', true),
            _buildNavItem(Icons.explore_outlined, 'Explore', false),
            SizedBox(width: 40), // Space for FAB
            _buildNavItem(
                Icons.format_list_bulleted_rounded, 'My Quizzes', false),
            _buildNavItem(Icons.emoji_events_outlined, 'Leaderboard', false),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected) {
    return InkWell(
      onTap: () {
        // Handle navigation
      },
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : Colors.grey[400],
              size: 24,
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.grey[400],
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Data models
class QuizCategory {
  final String id;
  final String name;
  final IconData icon;
  final Color color;
  final int quizCount;

  QuizCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.quizCount,
  });
}

class FeaturedQuiz {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String difficulty;
  final String duration;
  final int questionCount;

  FeaturedQuiz({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.difficulty,
    required this.duration,
    required this.questionCount,
  });
}
