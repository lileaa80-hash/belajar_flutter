import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BerandaInstagram extends StatelessWidget {
  const BerandaInstagram({super.key});

  static const Color background = Color(0xFF0B0D10);
  static const Color white = Colors.white;
  static const String profileAsset = 'assets/Ronova.jpg';

  // SVG ICON
  Widget svgIcon(
    String svg, {
    double size = 27,
    Color color = white,
    double strokeWidth = 1.8,
  }) {
    return SvgPicture.string(
      '''
      <svg xmlns="http://www.w3.org/2000/svg"
        width="24" height="24" viewBox="0 0 24 24"
        fill="none" stroke="#FFFFFF"
        stroke-width="$strokeWidth"
        stroke-linecap="round" stroke-linejoin="round">
        $svg
      </svg>
      ''',
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }

  // DATA STORY (10 ORANG)
  final List<Map<String, String>> stories = const [
    {
      'name': 'ahmd.ardnsyh',
      'image': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=300',
    },
    {
      'name': 'rfpr tmm',
      'image': '',
    },
    {
      'name': 'candra.js',
      'image': 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=300',
    },
    {
      'name': 'Hannan',
      'image': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=300',
    },
    {
      'name': 'rizky_12',
      'image': 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=300',
    },
    {
      'name': 'siti.nur',
      'image': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=300',
    },
    {
      'name': 'dimas_p',
      'image': 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=300',
    },
    {
      'name': 'dewi_art',
      'image': 'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=300',
    },
    {
      'name': 'fajar_dev',
      'image': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300',
    },
    {
      'name': 'nabila_m',
      'image': 'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?w=300',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            _header(),

            // STORIES
            SizedBox(
              height: 126,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10, top: 8),
                children: [
                  _myStory(),
                  ...stories.map(
                    (story) => _story(
                      story['name']!,
                      story['image']!,
                    ),
                  ),
                ],
              ),
            ),

            const Divider(
              height: 1,
              color: Colors.white12,
            ),

            // FEED DENGAN 10 POSTINGAN ALAM
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _post(
                    username: 'smkassalaam',
                    profileImage:
                        'https://images.unsplash.com/photo-1562774053-701939374585?w=200',
                    postImage:
                        'https://images.unsplash.com/photo-1470770841072-f978cf4d019e?w=1000',
                    audio: 'smkassalaam · Audio asli',
                    caption: 'Keindahan alam yang menenangkan 🌿',
                  ),
                  _post(
                    username: 'nature.world',
                    profileImage:
                        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200',
                    postImage:
                        'https://images.unsplash.com/photo-1448375240586-882707db888b?w=1000',
                    audio: 'Nature sounds',
                    caption: 'Menikmati hijaunya hutan 🌲',
                  ),
                  _post(
                    username: 'earth.pictures',
                    profileImage:
                        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=200',
                    postImage:
                        'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=1000',
                    audio: 'Peaceful nature',
                    caption: 'Dunia ini punya banyak tempat indah 🌎',
                  ),
                  _post(
                    username: 'mountain.diary',
                    profileImage:
                        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=200',
                    postImage:
                        'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=1000',
                    audio: 'Mountain ambience',
                    caption: 'Pegunungan dan udara yang sejuk 🏔️',
                  ),
                  _post(
                    username: 'ocean.blue',
                    profileImage:
                        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200',
                    postImage:
                        'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?w=1000',
                    audio: 'Ocean waves',
                    caption: 'Laut biru sejauh mata memandang 🌊',
                  ),
                  _post(
                    username: 'forest.vibes',
                    profileImage:
                        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=200',
                    postImage:
                        'https://images.unsplash.com/photo-1511497584788-876760111969?w=1000',
                    audio: 'Forest ambience',
                    caption: 'Berjalan di antara pepohonan 🌳',
                  ),
                  _post(
                    username: 'sunset.moments',
                    profileImage:
                        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=200',
                    postImage:
                        'https://images.unsplash.com/photo-1472120435266-53107fd0c44a?w=1000',
                    audio: 'Sunset music',
                    caption: 'Senja selalu punya ceritanya sendiri 🌅',
                  ),
                  _post(
                    username: 'river.and.mountain',
                    profileImage:
                        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200',
                    postImage:
                        'https://images.unsplash.com/photo-1433086966358-54859d0ed716?w=1000',
                    audio: 'Waterfall sounds',
                    caption: 'Suara air yang membuat suasana damai 💧',
                  ),
                  _post(
                    username: 'green.world',
                    profileImage:
                        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=200',
                    postImage:
                        'https://images.unsplash.com/photo-1426604966848-d7adac402bff?w=1000',
                    audio: 'Nature ambience',
                    caption: 'Mari jaga keindahan alam kita 🍃',
                  ),
                  _post(
                    username: 'landscape.daily',
                    profileImage:
                        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=200',
                    postImage:
                        'https://images.unsplash.com/photo-1472396961693-142e6e269027?w=1000',
                    audio: 'Relaxing sounds',
                    caption: 'Pemandangan sederhana yang luar biasa ✨',
                  ),
                ],
              ),
            ),

            _bottomNavigation(),
          ],
        ),
      ),
    );
  }

  // HEADER INSTAGRAM
  Widget _header() {
    return SizedBox(
      height: 65,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Row(
          children: [
            svgIcon(
              '<path d="M12 5v14"/><path d="M5 12h14"/>',
              size: 31,
            ),
            const Spacer(),
            const Text(
              'Instagram',
              style: TextStyle(
                color: white,
                fontSize: 30,
                fontWeight: FontWeight.w600,
                letterSpacing: -1.3,
              ),
            ),
            const SizedBox(width: 4),
            svgIcon(
              '<path d="m7 10 5 5 5-5"/>',
              size: 19,
              strokeWidth: 2,
            ),
            const Spacer(),
            svgIcon(
              '<path d="M20.8 4.6a5.5 5.5 0 0 0-7.8 0L12 5.7l-1.1-1.1a5.5 5.5 0 0 0-7.8 7.8l1.1 1.1L12 21l7.8-7.5 1.1-1.1a5.5 5.5 0 0 0-.1-7.8Z"/>',
              size: 31,
              strokeWidth: 1.7,
            ),
          ],
        ),
      ),
    );
  }

  // STORY SENDIRI
  Widget _myStory() {
    return Container(
      width: 94,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 82,
                height: 82,
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white24,
                ),
                child: ClipOval(
                  child: Image.asset(
                    profileAsset,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: -1,
                bottom: 0,
                child: Container(
                  width: 27,
                  height: 27,
                  decoration: const BoxDecoration(
                    color: white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: svgIcon(
                      '<path d="M12 5v14"/><path d="M5 12h14"/>',
                      size: 20,
                      color: Colors.black,
                      strokeWidth: 2.3,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          const Text(
            'Cerita Anda',
            maxLines: 1,
            style: TextStyle(
              color: white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  // STORY PENGGUNA LAIN
  Widget _story(String name, String image) {
    return Container(
      width: 98,
      margin: const EdgeInsets.only(right: 4),
      child: Column(
        children: [
          Container(
            width: 82,
            height: 82,
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFFD600),
                  Color(0xFFFF7A00),
                  Color(0xFFFF0069),
                  Color(0xFFD300C5),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: image.isEmpty
                    ? _placeholder()
                    : Image.network(
                        image,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => _placeholder(),
                      ),
              ),
            ),
          ),
          const SizedBox(height: 7),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  // PLACEHOLDER SVG
  Widget _placeholder() {
    return Container(
      color: const Color(0xFFE1E4EA),
      alignment: Alignment.center,
      child: SvgPicture.string(
        '''
        <svg xmlns="http://www.w3.org/2000/svg"
          viewBox="0 0 24 24" fill="#858B96">
          <circle cx="12" cy="8" r="4"/>
          <path d="M3 21a9 9 0 0 1 18 0Z"/>
        </svg>
        ''',
        width: 56,
        height: 56,
      ),
    );
  }

  // POSTINGAN
  Widget _post({
    required String username,
    required String profileImage,
    required String postImage,
    required String audio,
    required String caption,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // HEADER POSTINGAN
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 9,
          ),
          child: Row(
            children: [
              ClipOval(
                child: profileImage.startsWith('assets/')
                    ? Image.asset(
                        profileImage,
                        width: 38,
                        height: 38,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        profileImage,
                        width: 38,
                        height: 38,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => _placeholder(),
                      ),
              ),
              const SizedBox(width: 9),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        svgIcon(
                          '<path d="M9 18V5l12-2v13"/><circle cx="6" cy="18" r="3"/><circle cx="18" cy="16" r="3"/>',
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            audio,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              svgIcon(
                '<path d="M3 6h18"/><path d="M3 12h18"/><path d="M3 18h18"/>',
                size: 25,
              ),
            ],
          ),
        ),

        // FOTO POSTINGAN DARI INTERNET
        AspectRatio(
          aspectRatio: 0.72,
          child: Image.network(
            postImage,
            fit: BoxFit.cover,
            width: double.infinity,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;

              return Container(
                color: const Color(0xFF181A1F),
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  color: Colors.white54,
                  strokeWidth: 2,
                ),
              );
            },
            errorBuilder: (_, __, ___) {
              return Container(
                color: const Color(0xFF24272D),
                alignment: Alignment.center,
                child: svgIcon(
                  '<rect x="3" y="3" width="18" height="18" rx="2"/><circle cx="8.5" cy="8.5" r="1.5"/><path d="m21 15-5-5L5 21"/>',
                  size: 48,
                  color: Colors.white54,
                ),
              );
            },
          ),
        ),

        // IKON INTERAKSI
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 9, 12, 12),
          child: Row(
            children: [
              // LIKE
              svgIcon(
                '<path d="M20.8 4.6a5.5 5.5 0 0 0-7.8 0L12 5.7l-1.1-1.1a5.5 5.5 0 0 0-7.8 7.8l1.1 1.1L12 21l7.8-7.5 1.1-1.1a5.5 5.5 0 0 0-.1-7.8Z"/>',
                size: 26,
              ),

              const SizedBox(width: 12),

              // KOMENTAR
              svgIcon(
                '<path d="M21 11.5a8.4 8.4 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.4 8.4 0 0 1-3.8-.9L3 21l1.9-5.7a8.4 8.4 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.4 8.4 0 0 1 3.8-.9h.5a8.5 8.5 0 0 1 8 8Z"/>',
                size: 25,
              ),

              const SizedBox(width: 12),

              // SHARE / DIRECT MESSAGE
              svgIcon(
                '<path d="m22 2-7 20-4-9-9-4Z"/><path d="M22 2 11 13"/>',
                size: 25,
              ),

              const Spacer(),

              // SIMPAN (BOOKMARK INSTAGRAM - FIXED)
              svgIcon(
                '<path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z"/>',
                size: 27,
                strokeWidth: 1.8,
              ),
            ],
          ),
        ),

        // CAPTION
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 15),
          child: Text(
            '$username  $caption',
            style: const TextStyle(
              color: white,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }

  // NAVIGASI BAWAH
  Widget _bottomNavigation() {
    return Container(
      height: 57,
      decoration: const BoxDecoration(
        color: background,
        border: Border(
          top: BorderSide(
            color: Colors.white10,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // HOME
          SvgPicture.string(
            '''
            <svg xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 24 24" fill="white">
              <path d="m3 10 9-8 9 8v10a2 2 0 0 1-2 2h-4v-7H9v7H5a2 2 0 0 1-2-2Z"/>
            </svg>
            ''',
            width: 29,
            height: 29,
          ),

          // REELS
          SvgPicture.string(
            '''
            <svg xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 24 24" fill="none"
              stroke="white" stroke-width="1.8"
              stroke-linecap="round" stroke-linejoin="round">
              <rect x="3" y="3" width="18" height="18" rx="5"/>
              <path d="m10 8 6 4-6 4Z"/>
              <path d="m7 3 5 6M15 3l5 6"/>
            </svg>
            ''',
            width: 29,
            height: 29,
          ),

          // DIRECT MESSAGE
          SvgPicture.string(
            '''
            <svg xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 24 24" fill="none"
              stroke="white" stroke-width="1.8"
              stroke-linecap="round" stroke-linejoin="round">
              <path d="m22 2-7 20-4-9-9-4Z"/>
              <path d="M22 2 11 13"/>
            </svg>
            ''',
            width: 29,
            height: 29,
          ),

          // SEARCH
          SvgPicture.string(
            '''
            <svg xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 24 24" fill="none"
              stroke="white" stroke-width="1.8"
              stroke-linecap="round">
              <circle cx="11" cy="11" r="8"/>
              <path d="m21 21-4.35-4.35"/>
            </svg>
            ''',
            width: 30,
            height: 30,
          ),

          // FOTO PROFIL
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipOval(
                child: Image.asset(
                  profileAsset,
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: -2,
                bottom: -1,
                child: Container(
                  width: 9,
                  height: 9,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF3040),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: background,
                      width: 1.3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}