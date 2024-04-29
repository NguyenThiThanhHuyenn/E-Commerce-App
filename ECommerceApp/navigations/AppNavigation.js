import { createDrawerNavigator } from "@react-navigation/drawer";
import { createStackNavigator } from "@react-navigation/stack";
import HomeScreen from "../components/Home/Home";
import LoginScreen from "../components/User/Login";
import RegisterScreen from "../components/User/Register";
import UserPage from "../components/User/Register";
import ProductDetail from "../components/Product/ProductDetail";
import { NavigationContainer, useNavigation } from "@react-navigation/native";
import { DrawerContentScrollView, DrawerItem } from "@react-navigation/drawer";
import MyContext from "../configs/MyContext";
import { useReducer } from "react";
import MyUserReducer from "../reducers/MyUserReducer";
import { TouchableOpacity } from "react-native";
import { Icon } from "react-native-elements";
import AppStyles from "../styles/AppStyles";



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
      </Stack.Navigator>
    );
  }

  function CustomDrawerContent(props) {
    const navigation = useNavigation();
    return (
        <DrawerContentScrollView {...props}>
            <DrawerItem label="Home" onPress={() => navigation.navigate('HomeE')}/>
            <DrawerItem
                label="Logout" onPress={() => console.log('Logout')}
            />
            <DrawerItem label="Login" onPress={() => navigation.navigate('Login')}/>
        </DrawerContentScrollView>
    );
}

  function DrawerNavigation() {
    const [user, dispatch] = useReducer(MyUserReducer, null);
    return (
        <MyContext.Provider value={[user, dispatch]}>
            <Drawer.Navigator drawerContent={(props) => <CustomDrawerContent {...props} />}>
            <Drawer.Screen name="Home" component={MainStackNavigator} options={{title: 'Ecommerce', 
            headerRight: () => (
              <TouchableOpacity onPress={() => console.log("cart")}>
                <Icon name="cart-outline" type='ionicon' style={AppStyles.cartButton}/> 
              </TouchableOpacity>
            ), }}/>
            {user===null? <>
                <Drawer.Screen name="Login" component={LoginScreen} />
            </>:<>
                <Drawer.Screen name={user.username} component={MainStackNavigator} options={{title: 'Ecommerce'}}/>
            </>}
            {/* <Drawer.Screen name="Search" component={HomeScreen} /> */}
            </Drawer.Navigator>   
        </MyContext.Provider>
    );
  }

  export default function AppNavigation() {
    return (
        <NavigationContainer>
            <DrawerNavigation />
        </NavigationContainer>
    );
  }