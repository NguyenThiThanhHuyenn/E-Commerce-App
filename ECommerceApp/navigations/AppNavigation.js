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
import { useContext, useReducer } from "react";
import MyUserReducer from "../reducers/MyUserReducer";
import { TouchableOpacity } from "react-native";
import { Icon } from "react-native-elements";
import AppStyles from "../styles/AppStyles";
import SearchScreen from "../components/Search/Search";
import SearchResultScreen from "../components/Search/SearchResults";
import ProductByCategory from "../components/Product/ProductByCategory";
import Store from "../components/Store/Store";
import CreateStoreScreen from "../components/Store/CreateStore";



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
        <Stack.Screen name="CreateStore" component={CreateStoreScreen} options={() => ({title: 'Create Store'})}/>
      </Stack.Navigator>
    );
  }

  

  function CustomDrawerContent(props) {
    const navigation = useNavigation();
    const [user, dispatch] = useContext(MyContext);    
    
    const handleLogout = () => {
      navigation.navigate('HomeE');
      dispatch({ type: 'logout' });
    };
    return (
        <DrawerContentScrollView {...props}>
            <DrawerItem label="Home" onPress={() => navigation.navigate('HomeE')}/>
            <DrawerItem label="Search" onPress={() => navigation.navigate('Search')}/>
            {user===null? <>
              <DrawerItem label="Log in" onPress={() => navigation.navigate('Login')}/>
              <DrawerItem label="Register" onPress={() => navigation.navigate('Register')}/>
            </>:<>
                <DrawerItem label={user.username} onPress={() => navigation.navigate('UserPage')}/>
                <DrawerItem label="Log out" onPress={handleLogout}/>
            </>}
        </DrawerContentScrollView>
    );
}


  export default function AppNavigation() {
    const [user, dispatch] = useReducer(MyUserReducer, null);

    console.log("Current user:", user);
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
            </Drawer.Navigator>   
        </NavigationContainer>
      </MyContext.Provider>
        
    );
  }