import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // Ensure this dependency is included in your pubspec.yaml

class RatingReviewPage extends StatefulWidget {
  @override
  _RatingReviewPageState createState() => _RatingReviewPageState();
}

class _RatingReviewPageState extends State<RatingReviewPage> {
  final _formKey = GlobalKey<FormState>();
  double _serviceRating = 0;
  double _cropQualityRating = 0;
  double _priceFairnessRating = 0;
  double _communicationRating = 0;
  final TextEditingController _reviewController = TextEditingController();

  void _submitReview() {
    if (_formKey.currentState!.validate()) {
      // Submit the review and rating
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Review Submitted!')),
      );
      Navigator.pop(context); // Navigate back to the previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rating & Review'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Rate the Farmer and Their Crops',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              const SizedBox(height: 20),
              // Service Quality Rating
              Text(
                '1. How would you rate the farmer\'s service?',
                style: TextStyle(fontSize: 16, color: Colors.green[700]),
              ),
              const SizedBox(height: 10),
              RatingBar.builder(
                initialRating: _serviceRating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.green,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _serviceRating = rating;
                  });
                },
              ),
              const SizedBox(height: 20),
              // Crop Quality Rating
              Text(
                '2. How would you rate the quality of the crops?',
                style: TextStyle(fontSize: 16, color: Colors.green[700]),
              ),
              const SizedBox(height: 10),
              RatingBar.builder(
                initialRating: _cropQualityRating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.green,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _cropQualityRating = rating;
                  });
                },
              ),
              const SizedBox(height: 20),
              // Price Fairness Rating
              Text(
                '3. How fair was the pricing?',
                style: TextStyle(fontSize: 16, color: Colors.green[700]),
              ),
              const SizedBox(height: 10),
              RatingBar.builder(
                initialRating: _priceFairnessRating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.green,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _priceFairnessRating = rating;
                  });
                },
              ),
              const SizedBox(height: 20),
              // Communication Rating
              Text(
                '4. How would you rate the communication?',
                style: TextStyle(fontSize: 18, color: Colors.green[700]),
              ),
              const SizedBox(height: 10),
              RatingBar.builder(
                initialRating: _communicationRating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.green,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _communicationRating = rating;
                  });
                },
              ),
              const SizedBox(height: 20),
              // Review Text Field
              TextFormField(
                controller: _reviewController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Write your detailed review',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your review';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Submit Button
              ElevatedButton(
                onPressed: _submitReview,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      250, 100, 200, 100), // Set the button color to green
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 24.0),
                  textStyle: const TextStyle(
                      fontSize: 22, color: Colors.white), // White text color
                ),
                child: const Text('Submit Review'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
