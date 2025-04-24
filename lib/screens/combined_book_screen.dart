import 'package:flutter/material.dart';
import '../models/book.dart' as local;
import '../services/book_service.dart';
import '../utils/book_data.dart';
import 'epub_reader_screen.dart';

class CombinedBookScreen extends StatefulWidget {
  const CombinedBookScreen({super.key});

  @override
  State<CombinedBookScreen> createState() => _CombinedBookScreenState();
}

class _CombinedBookScreenState extends State<CombinedBookScreen> {
  final BookService _bookService = BookService();
  List<Book> _apiBooks = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadFeaturedBooks();
  }

  Future<void> _loadFeaturedBooks() async {
    try {
      final featuredBooks = await _bookService.getFeaturedBooks();
      setState(() {
        _apiBooks = featuredBooks;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Readify Library'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline, size: 48, color: Colors.red),
                      const SizedBox(height: 16),
                      Text(
                        _error!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _loadFeaturedBooks,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Your Library',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 280,
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          scrollDirection: Axis.horizontal,
                          itemCount: books.length,
                          itemBuilder: (context, index) {
                            final book = books[index];
                            return _buildLocalBookCard(book);
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Recommended Books',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 280,
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          scrollDirection: Axis.horizontal,
                          itemCount: _apiBooks.length,
                          itemBuilder: (context, index) {
                            final book = _apiBooks[index];
                            return _buildApiBookCard(book);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }

  Widget _buildLocalBookCard(local.Book book) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EpubReaderScreen(
                filePath: book.fileName,
                title: book.title,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                book.coverImage,
                height: 200,
                width: 160,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              book.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              book.author,
              style: const TextStyle(color: Colors.grey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApiBookCard(Book apiBook) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: () {
          // Open preview link in browser or show details
          if (apiBook.previewLink.isNotEmpty) {
            // Add functionality to open preview link
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: apiBook.thumbnailUrl.isNotEmpty
                  ? Image.network(
                      apiBook.thumbnailUrl,
                      height: 200,
                      width: 160,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Container(
                            height: 200,
                            width: 160,
                            color: Colors.grey[300],
                            child: const Icon(Icons.book, size: 50),
                          ),
                    )
                  : Container(
                      height: 200,
                      width: 160,
                      color: Colors.grey[300],
                      child: const Icon(Icons.book, size: 50),
                    ),
            ),
            const SizedBox(height: 8),
            Text(
              apiBook.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              apiBook.authors.join(', '),
              style: const TextStyle(color: Colors.grey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
