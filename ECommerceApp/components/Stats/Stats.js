import React, { useState, useEffect, useContext } from 'react';
import { View, Text, ActivityIndicator, StyleSheet, ScrollView } from 'react-native';
import API, { endpoints } from '../../configs/API';
import AsyncStorage from "@react-native-async-storage/async-storage";
import MyContext from '../../configs/MyContext';
import { Icon } from 'react-native-elements';

const StatsScreen = ({ userToken }) => {
  const [loading, setLoading] = useState(true);
  const [statistics, setStatistics] = useState(null);
  const [currentUser] = useContext(MyContext);

  useEffect(() => {
    const fetchStatistics = async () => {
      try {
        const accessToken = await AsyncStorage.getItem('token_access');
        if (!accessToken) {
          console.error('Access token not found');
          setLoading(false);
          return;
        }

        const response = await API.get(endpoints['seller-statistics'].replace('{user_id}', currentUser.id), {
          headers: {
            Authorization: `Bearer ${accessToken}`
          },
        });
        setStatistics(response.data);
        setLoading(false);
      } catch (error) {
        console.error('Error fetching statistics:', error);
        setLoading(false);
      }
    };

    fetchStatistics();
  }, []);

  console.log(statistics);

  if (loading) {
    return (
      <View style={styles.container}>
        <ActivityIndicator size="large" color="#0000ff" />
      </View>
    );
  }

  if (!statistics) {
    return (
      <View style={styles.container}>
        <Text style={styles.errorText}>Error fetching statistics</Text>
      </View>
    );
  }

  return (
    <ScrollView style={styles.scrollView} showsVerticalScrollIndicator={false}>
      <View style={styles.container}>
        <Text style={styles.heading}>Monthly Revenue: {statistics.monthly_revenue} VND</Text>
        <View style={styles.statsContainer}>
          <Text style={styles.subheading}>Monthly Product Stats:</Text>
          {statistics.monthly_product_stats.map((item, index) => (
            <View key={index} style={styles.item}>
              <Text style={styles.itemName}>Product Name: {item.product__product_name}</Text>
              <Text>Total Revenue: {item.total_revenue} VND</Text>
              <Text>Total Sales: {item.total_sales}</Text>
            </View>
          ))}
        </View>
        <View style={{ flexDirection: 'row' }}>
          <Icon name='heart' type='ionicon' size={20} color={'red'} />
          <Text style={styles.highestRevenue}>Highest Revenue Product (Month): {statistics.highest_revenue_product_month.product__product_name}: {statistics.highest_revenue_product_month.total_revenue} VND</Text>
        </View>
        <View style={{ flexDirection: 'row' }}>
          <Icon name='warning' type='ionicon' size={20} color={'#967d29'} />
          <Text style={styles.lowestRevenue}>Lowest Revenue Product (Month): {statistics.lowest_revenue_product_month.product__product_name}: {statistics.lowest_revenue_product_month.total_revenue} VND</Text>
        </View>

        <Text style={styles.heading}>Quarterly Revenue: {statistics.quarterly_revenue} VND</Text>
        <View style={styles.statsContainer}>
          <Text style={styles.subheading}>Quarterly Product Stats:</Text>
          {statistics.quarterly_product_stats.map((item, index) => (
            <View key={index} style={styles.item}>
              <Text style={styles.itemName}>Product Name: {item.product__product_name}</Text>
              <Text>Total Revenue: {item.total_revenue} VND</Text>
              <Text>Total Sales: {item.total_sales}</Text>
            </View>
          ))}
        </View>
        <View style={{ flexDirection: 'row' }}>
          <Icon name='heart' type='ionicon' size={20} color={'red'} />
          <Text style={styles.highestRevenue}>Highest Revenue Product (Quarter): {statistics.highest_revenue_product_quarter.product__product_name}: {statistics.highest_revenue_product_month.total_revenue} VND</Text>
        </View>

        <View style={{ flexDirection: 'row' }}>
          <Icon name='warning' type='ionicon' size={20} color={'#967d29'} />
          <Text style={styles.lowestRevenue}>Lowest Revenue Product (Quarter): {statistics.lowest_revenue_product_quarter.product__product_name}: {statistics.lowest_revenue_product_month.total_revenue} VND</Text>
        </View>
        <Text style={styles.heading}>Yearly Revenue: {statistics.yearly_revenue} VND</Text>
        <View style={styles.statsContainer}>
          <Text style={styles.subheading}>Yearly Product Stats:</Text>
          {statistics.yearly_product_stats.map((item, index) => (
            <View key={index} style={styles.item}>
              <Text style={styles.itemName}>Product Name: {item.product__product_name}</Text>
              <Text>Total Revenue: {item.total_revenue} VND</Text>
              <Text>Total Sales: {item.total_sales}</Text>
            </View>
          ))}
        </View>
        <View style={{ flexDirection: 'row' }}>
          <Icon name='heart' type='ionicon' size={20} color={'red'} />
          <Text style={styles.highestRevenue}>Highest Revenue Product (Year): {statistics.highest_revenue_product_year.product__product_name}: {statistics.highest_revenue_product_month.total_revenue} VND</Text>
        </View>
        <View style={{ flexDirection: 'row' }}>
          <Icon name='warning' type='ionicon' size={20} color={'#967d29'} />
          <Text style={styles.lowestRevenue}>Lowest Revenue Product (Year): {statistics.lowest_revenue_product_year.product__product_name}: {statistics.lowest_revenue_product_month.total_revenue} VND</Text>
        </View>

      </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  scrollView: {
    flex: 1,
  },
  container: {
    flex: 1,
    justifyContent: 'center',
    padding: 20,
    backgroundColor: 'white'
  },
  heading: {
    fontSize: 20,
    fontWeight: 'bold',
    marginBottom: 10,
    color: '#e3c256',
  },
  subheading: {
    fontSize: 18,
    fontWeight: 'bold',
    marginBottom: 5,
    color: '#666',
  },
  statsContainer: {
    marginTop: 20,
  },
  item: {
    marginBottom: 10,
    padding: 10,
    backgroundColor: '#f9f9f9',
    borderRadius: 8,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.2,
    shadowRadius: 2,
    elevation: 2,
  },
  itemName: {
    fontWeight: 'bold',
    marginBottom: 5,
  },
  highestRevenue: {
    fontSize: 15,
    marginBottom: 5,
    color: 'gray',
    fontStyle: 'italic'
  },
  lowestRevenue: {
    fontSize: 15,
    marginBottom: 50,
    color: 'gray',
    fontStyle: 'italic'
  },
  errorText: {
    fontSize: 15,
    color: 'red',
    textAlign: 'center',
  },
});
export default StatsScreen;

