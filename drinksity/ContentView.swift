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
let lightGreyColor = Color(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, opacity: 1.0)

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
            SignUpView()
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
    @State private var isPasswordVisible = false
    var body: some View {
        NavigationView {
            ZStack{
                lightBlueColor.ignoresSafeArea()
                VStack{
                    Image("drinksity")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 260,height:180)
                        .padding([.leading, .bottom], 10).padding(.bottom, 40)
                    ZStack{
                        Rectangle()
                            .frame(maxWidth: 350, maxHeight: 350)
                            .foregroundColor(.white)
                            .cornerRadius(25.0)
                        VStack{
                            TextField("Username", text: $userName)
                                .padding()
                                .background(lightGreyColor)
                                .cornerRadius(15.0)
                                .padding([.leading, .bottom, .trailing], 25).padding(.top, 15)
                            
                            ZStack {
                                if isPasswordVisible {
                                    TextField("Password", text: $passWord)
                                        .padding()
                                        .background(lightGreyColor)
                                        .cornerRadius(15.0)
                                        .padding([.leading, .trailing], 25)
                                } else {
                                    SecureField("Password", text: $passWord)
                                        .padding()
                                        .background(lightGreyColor)
                                        .cornerRadius(15.0)
                                        .padding([.leading, .trailing], 25)
                                }
                                Button(action: {
                                    isPasswordVisible.toggle()
                                }) {
                                    Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                                        .foregroundColor(.gray)
                                }.padding(.leading, 250)
                            }
                            
                            Text("Forgot Username/Password?")
                                .padding(.bottom, 40).padding(.leading, -140)
                                .font(.system(size: 12))
                            
                            NavigationLink(destination: LandingView()){
                                Text("Log In")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(textColor)
                                    .padding()
                                    .frame(width: 175, height: 50)
                                    .background(lightBlueColor)
                                    .cornerRadius(25.0)
                            }
                            HStack{
                                Text("Don't have an account?")
                                    .font(.system(size: 14))
                                NavigationLink(destination: SignUpView()){
                                    Text("Register")
                                        .font(.system(size: 14))
                                        .fontWeight(.bold)
                                        .foregroundColor(lightBlueColor)
                                }
                            }.padding(.top, 30)
                            
                            
                        }.padding()
                    }
                    
                }.padding(.bottom, 100.0)
            }
        }.frame(maxWidth: SBWidth, maxHeight: SBHeight)
            .navigationBarBackButtonHidden(true)
    }
    
}

/*
 This is the view that the phone will land on when signing up for a new account.
 Every other view is available from this view through NavigationLink
 */
 struct SignUpView: View {
     @State var userName: String = "";
     @State var passWord: String = "";
     @State var fullName: String = "";
     @State var phoneNumber: String = "";
     var body: some View {
         NavigationView {
             ZStack{
                 lightBlueColor.ignoresSafeArea()
                 VStack{
                     Image("drinksity")
                         .resizable()
                         .scaledToFit()
                         .frame(width: 260,height:180)
                         .padding([.leading, .bottom], 10).padding(.top, 40)
                     ZStack{
                         Rectangle()
                             .frame(maxWidth: 350, maxHeight: 500)
                             .foregroundColor(.white)
                             .cornerRadius(25.0)
                         VStack{
                             TextField("Full Name", text: $fullName)
                                 .padding()
                                 .background(lightGreyColor)
                                 .cornerRadius(15.0)
                                 .padding([.leading, .bottom, .trailing], 25).padding(.top, 15)
                             TextField("Username / Email", text: $userName)
                                 .padding()
                                 .background(lightGreyColor)
                                 .cornerRadius(15.0)
                                 .padding([.leading, .bottom, .trailing], 25)
                             TextField("Phone Number", text: $phoneNumber)
                                 .padding()
                                 .background(lightGreyColor)
                                 .cornerRadius(15.0)
                                 .padding([.leading, .bottom, .trailing], 25)
                            TextField("Password", text: $passWord)
                                .padding()
                                .background(lightGreyColor)
                                .cornerRadius(15.0)
                                .padding([.leading, .trailing], 25).padding(.bottom, 20)
                             
                             NavigationLink(destination: LandingView()){
                                 Text("Sign Up")
                                     .font(.headline)
                                     .fontWeight(.bold)
                                     .foregroundColor(textColor)
                                     .padding()
                                     .frame(width: 175, height: 50)
                                     .background(lightBlueColor)
                                     .cornerRadius(25.0)
                                     .padding(.bottom, -20)
                             }
                            HStack{
                                Text("Already have an account?")
                                    .font(.system(size: 14))
                                NavigationLink(destination: LoginView()){
                                    Text("Log in")
                                        .font(      .system(size: 14))
                                        .fontWeight(.bold)
                                        .foregroundColor(lightBlueColor)
                                }
                            }.padding(.top, 30)
                             
                         }.padding()
                     }
                     
                 }.padding(.bottom, 100.0)
             }
         }.frame(maxWidth: SBWidth, maxHeight: SBHeight)
             .navigationBarBackButtonHidden(true)
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
        UITabBar.appearance().backgroundColor = UIColor.systemGray5
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
        .background(Color.white)
        .frame(maxHeight: .infinity)
    }
}
