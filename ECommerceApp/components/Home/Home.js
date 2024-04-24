import { View, Text } from "react-native"
import AppStyles from "../../styles/AppStyles"
import Styles from "./Styles"

const Home = () => {
    return (
        <View style={AppStyles.container}>
            <Text style={Styles.subject}>HOME</Text>
        </View>
    )
}

export default Home