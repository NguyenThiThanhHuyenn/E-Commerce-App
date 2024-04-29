import React, { useState } from 'react';
import { View, Text, TextInput, TouchableOpacity } from 'react-native';
import styles from './UserStyles'; 

const Register = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [avatar, setAvatar] = useState('');
  const [userType, setUserType] = useState('individual');

  const handleRegister = () => {
    // Perform registration logic here
    console.log('Registering user:', { username, password, avatar, userType });
  };

  return (
    <View style={styles.registerFormContainer}>
      <Text style={styles.logoText}>Register</Text>

      <TextInput
        style={styles.registerFormTextInput}
        placeholder="Username"
        onChangeText={text => setUsername(text)}
        value={username}
      />
      <TextInput
        style={styles.registerFormTextInput}
        placeholder="Password"
        secureTextEntry
        onChangeText={text => setPassword(text)}
        value={password}
      />
      <View style={styles.avatarInputContainer}>
        <Text style={styles.avatarInputLabel}>Avatar:</Text>
        <TextInput
          style={styles.avatarInput}
          placeholder="Enter avatar URL"
          onChangeText={text => setAvatar(text)}
          value={avatar}
        />
      </View>

      <View style={styles.userTypeContainer}>
        <Text style={styles.userTypeLabel}>User Type:</Text>
        <TouchableOpacity
          style={[
            styles.userTypeButton,
            userType === 'individual' && { backgroundColor: '#f0b11f' }
          ]}
          onPress={() => setUserType('individual')}
        >
          <Text style={styles.userTypeButtonText}>Individual</Text>
        </TouchableOpacity>
        <TouchableOpacity
          style={[
            styles.userTypeButton,
            userType === 'seller' && { backgroundColor: '#f0b11f' }
          ]}
          onPress={() => setUserType('seller')}
        >
          <Text style={styles.userTypeButtonText}>Seller</Text>
        </TouchableOpacity>
      </View>

      <TouchableOpacity style={styles.registerButton} onPress={handleRegister}>
        <Text style={styles.registerButtonText}>Register</Text>
      </TouchableOpacity>
    </View>
  );
};

export default Register;
