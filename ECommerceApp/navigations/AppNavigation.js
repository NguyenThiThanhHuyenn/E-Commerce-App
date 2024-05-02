import { createDrawerNavigator } from "@react-navigation/drawer";
import { createStackNavigator } from "@react-navigation/stack";
import HomeScreen from "../components/Home/Home";
import LoginScreen from "../components/User/Login";
import RegisterScreen from "../components/User/Register";
import UserPage from "../components/User/UserPage";
import ProductDetail from "../components/Product/ProductDetail";
import { NavigationContainer, useNavigation } from "@react-navigation/native";
import { DrawerContentScrollView, DrawerItem } from "@react-navigation/drawer";
import MyContext from "../configs/MyContext";
import { useReducer } from "react";
import MyUserReducer from "../reducers/MyUserReducer";
import { TouchableOpacity } from "react-native";
import { Icon } from "react-native-elements";
import AppStyles from "../styles/AppStyles";
import SearchScreen from "../components/Search/Search";
import SearchResultScreen from "../components/Search/SearchResults";
import ProductByCategory from "../components/Product/ProductByCategory";
import Store from "../components/Store/Store";



const Stack = createStackNavigator();
const Drawer = createDrawerNavigator();




function MainStackNavigator() {
    return (
      <Stack.Navigator>
        <Stack.Screen name="HomeE" component={HomeScreen} options={{ headerShown: false }}/>
        <Stack.Screen name="Login" component={LoginScreen} options={{ headerShown: false }}/>
        <Stack.Screen name="Register" component={RegisterScreen} options={{ headerShown: false }}/>
        <Stack.Screen name="UserPage" component={UserPage} options={{ headerShown: false }}/>
        <Stack.Screen name="ProductDetail" component={ProductDetail} options={{ headerShown: false }}/>
        <Stack.Screen name="Search" component={SearchScreen} options={{ headerShown: false }}/>
        <Stack.Screen name="SearchResults" component={SearchResultScreen} options={() => ({title: ''})}/>
        <Stack.Screen name="ProductByCategory" component={ProductByCategory} options={() => ({title: ''})}/>
        <Stack.Screen name="Store" component={Store} options={() => ({title: ''})}/>
      </Stack.Navigator>
    );
  }

  function CustomDrawerContent(props) {
    const navigation = useNavigation();
    return (
        <DrawerContentScrollView {...props}>
            <DrawerItem label="Home" onPress={() => navigation.navigate('HomeE')}/>
            <DrawerItem label="Search" onPress={() => navigation.navigate('Search')}/>
            <DrawerItem label="Logout" onPress={() => dispatch({type: 'logout'})}/>
            <DrawerItem label="Login" onPress={() => navigation.navigate('Login')}/>
        </DrawerContentScrollView>
    );
}


  export default function AppNavigation() {
    const [user, dispatch] = useReducer(MyUserReducer, null);
    return (
      <MyContext.Provider value={[user, dispatch]}>
        <NavigationContainer>
        <Drawer.Navigator drawerContent={(props) => <CustomDrawerContent {...props} />}>
            <Drawer.Screen name="Home" component={MainStackNavigator} options={{title: 'Ecommerce', 
            headerRight: () => (
              <TouchableOpacity onPress={() => console.log("cart")}>
                <Icon name="cart-outline" type='ionicon' style={AppStyles.cartButton}/> 
              </TouchableOpacity>
            ), }}/>
            <Drawer.Screen name="Search" component={SearchScreen}/>
            {user===null? <>
                <Drawer.Screen name="Login" component={LoginScreen} />
            </>:<>
                <Drawer.Screen name={user.username} component={HomeScreen}/>
            </>}
            
            </Drawer.Navigator>   
        </NavigationContainer>
      </MyContext.Provider>
        
    );
  }