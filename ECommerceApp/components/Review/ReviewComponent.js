import React from 'react';
import { View, Text } from 'react-native';
import ReviewStyles from './ReviewStyles';
import { Icon } from 'react-native-elements';
import { format } from 'date-fns';

export default ReviewComponent = ({ username, rating, comment, created_at }) => {
  const formatDate = (datetimeString) => {
    return format(new Date(datetimeString), 'dd/MM/yyyy HH:mm');
  };

  return (
    <View style={ReviewStyles.container}>
      <Text style={ReviewStyles.userName}>{username}</Text>
      <Text style={ReviewStyles.rating}>Rating: {rating} <Icon name='star' size={20} type='ionicon' color={'#b89d3b'} /></Text>
      <Text style={ReviewStyles.comment}>{comment}</Text>
      <Text style={ReviewStyles.createdAt}>Created at: {formatDate(created_at)}</Text>
    </View>
  );
};
