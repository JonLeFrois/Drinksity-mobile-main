/*
 ContentView.swift
 Drinksity

 This is where the content is loaded onto the iOS screen
 
 Created by Bailey Cross on 3/16/22.
 Modified by Bailey Cross and Patrick Baumgardner
 */

//SwiftUI is the main package used. UIKit is the older version of SwiftUI
import SwiftUI

/*
 Our instance variables for the ContentView File
 */

/*
 Bounds for the iphone that the app is being ran on
 */
var SBWidth = UIScreen.main.bounds.width
var SBHeight = UIScreen.main.bounds.height

/*
 Colors for the project
 */
let MAIN_COLOR = Color(red: 32/255, green: 32/255, blue: 114/255)
let SEC_COLOR = Color(red: 255/255, green: 255/255, blue: 0/255)
let lightBlueColor = Color(red: 47.0/255.0, green: 168.0/255.0, blue: 255.0/255.0, opacity: 1.0)
let textColor = Color(red: 0/255, green: 0/255, blue: 0/255)
let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

/*
 Our list of drinks as an array
 */
var DrinksList = createItems()

/*
 This is the main view for the phone. The only reason it is called is because it is called in the main
 of the drinksityApp.swift file
 */
struct ContentView: View {
    var body: some View {
        VStack{
            TwentyOneAlert()
            LoginView()
        }
    }
}

/*
 This is for the preview function to the right of the coding window in XCode
 
 You can call different view in this screen and it will produce different iphones to view them
 Example: LandingView()
 */
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProducersView()
            LandingView()
            LoginView()
        }
    }
}

/*
 This is the Alert for the 21 question that pops up in the beginning of the app
 */
struct TwentyOneAlert: View{
    @State var showsAlert = true
    var body: some View{
        Button(action: {
                    self.showsAlert.toggle()
                }) {
                }
                .accessibilityAddTraits([.isButton])
                .alert(isPresented: self.$showsAlert) {
                    Alert(title: Text("You Must Be 21 or Older to Use this App"),
                          primaryButton: .default(Text("I am 21 or Older")),
                          secondaryButton: .cancel(Text("I am not 21"), action: {
                        exit(1)
                    })
                    )
                }
    }
}

/*
 This is the view that the phone will land on when starting up the app.
 Every other view is available from this view through NavigationLink
 */
struct LoginView: View {
    @State var userName: String = "";
    @State var passWord: String = "";
    var body: some View {
        NavigationView {
                VStack{
                    /*ZStack {
                    Rectangle()
                        .frame(width: 200.0, height: 100.0)
                        .foregroundColor(MAIN_COLOR)
                    Text("Drinksity")
                        .font(.title)
                        .foregroundColor(Color.white)
                    }
                    */
                    Image("drinksity")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300.0,height:200)
                        .padding([.leading, .bottom], 10)
                    VStack{
                        Text("Sign In").padding()
                        Text("To").padding(.vertical, -10.0)
                        Text("Start Drinking").padding()
                    }
                    VStack{
                        TextField("Username", text: $userName)
                            .padding()
                            .background(lightGreyColor)
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                            
                            
                        SecureField("Password", text: $passWord)
                            .padding()
                            .background(lightGreyColor)
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)

                        NavigationLink(destination: LandingView()){
                            Text("Sign In")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 140, height: 45)
                                .background(.gray)
                                .cornerRadius(15.0)
                            }
                        
                    }.padding()
                        
                }.padding(.bottom, 100.0)
        }.frame(maxWidth: SBWidth, maxHeight: SBHeight)
    }
}

/*
 This is the landing view when the user is done logging in
 It has 4 tabs that a user can parse through
 */
struct LandingView: View {
    
    /*
     This changes the tab bar at the bottom to always be white
     */
    init(){
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    var body: some View {

        TabView {
            ProfilePageView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                        .background(lightBlueColor)
                        .foregroundColor(textColor)
                }
            BeveragesView()
                .tabItem {
                    Image(systemName: "21.square")
                    Text("Beverages")
                        .background(lightBlueColor)
                        .foregroundColor(textColor)
                }
            TrailsView()
                .tabItem {
                    Image(systemName: "globe")
                    Text("Trails")
                        .background(lightBlueColor)
                        .foregroundColor(textColor)
                }
            ProducersView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Producers")
                        .background(lightBlueColor)
                        .foregroundColor(textColor)
                    
                }
                
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
    }
}

/*
 This is a view for the producers page from the tab view
 From this view you should call functions/other views to enhance the product
 */
struct ProducersView: View {
    var body: some View {
        ScrollView{
            VStack {
                Image("breweryPage")
            }
        }
    }
}

/*
 This is a view for the beverage trail page from the tab view
 From this view you should call functions/other views to enhance the product
 */
struct TrailsView: View {
    var body: some View {
        ScrollView{
            VStack {
                Image("beverageTrail")
            }
        }
    }
}

/*
This is a view for the profile page from the tab view
This view calls the different moduels as a view and puts the drink items from the top of the file in a view for the user to look at.
*/
struct ProfilePageView: View {
    var body: some View {
        ScrollView {
            Section {
                ZStack {
                    Rectangle()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(MAIN_COLOR)
                    Text("Your Profile")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                }
            }
            VStack {
                Text("John Smith")
                Image("profilePic")
                    .padding(.bottom, 5.0)
                VStack(alignment: .leading){
                    Text("Favorite Drinks")
                        .font(.callout)
                    VStack{
                        UserFavDrinks(Contents: DrinksList)
                            
                    }
                    .padding(.bottom, 5.0)
                    VStack{
                        Text("Favorite Locations")
                            .font(.callout)
                    }
                    .padding(.bottom, 5.0)
                    VStack{
                        Text("Friends")
                            .font(.callout)
                    }
                    .padding(.bottom, 5.0)
                }
                .padding(.bottom, 5.0)
            }
            .padding()
            .frame(maxHeight: .infinity)
        }
        .background(Color.gray)
        .frame(maxHeight: .infinity)
    }
}
