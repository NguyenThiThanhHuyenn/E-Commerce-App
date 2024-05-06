import React, { useState } from 'react';
import { View, Text, TextInput, TouchableOpacity } from 'react-native';
import { Icon } from 'react-native-elements';
import ReviewStyles from './ReviewStyles';

export default CreateReviewComponent = ({ onSubmit }) => {
  const [rating, setRating] = useState(0);
  const [comment, setComment] = useState('');

  const handleRatingChange = (value) => {
    setRating(value);
  };

  const handleCommentChange = (text) => {
    setComment(text);
  };

  const handleSubmit = () => {
    if (rating < 1 || rating > 5) {
      alert('Please select a rating between 1 and 5.');
      return;
    }
    if (comment.trim() === '') {
      alert('Please enter your comment.');
      return;
    }
    onSubmit({ rating, comment });
    setRating(0);
    setComment('');
  };

  return (
    <View style={ReviewStyles.containerCreateReview}>
      <View style={ReviewStyles.ratingContainer}>
        {[1, 2, 3, 4, 5].map((value) => (
          <TouchableOpacity key={value} onPress={() => handleRatingChange(value)}>
            <Icon
              name={rating >= value ? 'star' : 'star-outline'}
              type="ionicon"
              size={30}
              color={rating >= value ? '#ffc107' : '#ccc'}
            />
          </TouchableOpacity>
        ))}
      </View>
      <TextInput
        style={ReviewStyles.commentInput}
        placeholder="Write your comment..."
        multiline
        value={comment}
        onChangeText={handleCommentChange}
      />
      <TouchableOpacity style={ReviewStyles.submitButton} onPress={handleSubmit}>
        <Text style={ReviewStyles.submitButtonText}>Submit Review</Text>
      </TouchableOpacity>
    </View>
  );
};

