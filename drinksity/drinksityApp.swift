/*
 drinksityApp.swift
 Drinksity

 Created by Bailey Cross on 4/21/22.
 Modified by Bailey Cross and Patrick Baumgardner
 Modified by Jon LeFrois & Mohammad Shaikh
 
*/

import SwiftUI

/*
 This is the main method. There is a directive given in order for the program to know that this is the main method
 We call ContentView, which is a file in the project
 */

@main
struct drinksityApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
/*
 These are our data strucures for the views
 */

struct Drink {
    var drinkName: String
    var drinkImage: String
    var rating: String
    var description: String
    var drinkBigImage: String
    //var comments = Array<Comment()>
    //var health = NutritionalInfo()
}

struct NutritionalInfo {
    var calories: String
    var alcohol: String
}

struct Comment {
    var userName: String
    var userPhoto: String
    var rating: String
    var comment: String
}
func createItems() -> Array<Drink>{
    var DrinksList: [Drink] = []
    DrinksList.append(
        Drink(drinkName:"Whiskey", drinkImage: "whiskey", rating: "4.5", description: "This is really good whiskey.", drinkBigImage: "bigWhiskey")
    )
    DrinksList.append(
        Drink(drinkName:"Wine", drinkImage: "wine", rating: "4", description: "This is some tasty wine.", drinkBigImage: "bigWine")
    )
    DrinksList.append(
        Drink(drinkName:"Beer", drinkImage: "beer", rating: "4.1", description: "yummy beer.", drinkBigImage: "bigBeer")
    )
    DrinksList.append(
        Drink(drinkName:"Red Wine", drinkImage: "redWine", rating: "3", description: "This is some tasty wine.", drinkBigImage: "bigRedWine")
    )
    return DrinksList
}



/*
 This is the view for the drinks in the beverage tab
 */
struct LocationsView: View {
    //blue header up top
    var body: some View {
        ZStack {
            Color(UIColor(backGroundColor))
            ScrollView {
                Section {
                    ZStack {
                        Rectangle()
                            .frame(width: .infinity, height: 150)
                            .foregroundColor(MAIN_COLOR)
                            .edgesIgnoringSafeArea(.top)
                            .padding(.top, -100)
                        HStack{
                            VStack{
                                Text("Locations")
                                    .font(.title2)
                                    .foregroundColor(Color.white)
                                    .padding(.top, 10)
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width / 2, height: 7)
                                    .foregroundColor(SEC_COLOR)
                            }
                            VStack{
                                Text("Beverages")
                                    .font(.title2)
                                    .foregroundColor(Color.white)
                                    .padding(.top, 10)
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width / 2, height: 7)
                                    .foregroundColor(MAIN_COLOR)
                            }
                        }.padding(.top, -20)
                    }
                }
                ZStack{
                    Rectangle()
                        .frame(width: .infinity, height: 100)
                        .foregroundColor(Color.white)
                        .padding(.top, -15)
                    HStack{
                        //These all need to be turned into buttons that navigate to their specific pages
                        VStack{
                            Image("Breweries")
                                .padding(.top, -20)
                            Text("Breweries")
                                .font(.footnote)
                                .padding(.top, -10)
                        }
                        VStack{
                            Image("Wineries")
                                .padding(.top, -20)
                            Text("Wineries")
                                .font(.footnote)
                                .padding(.top, -5)
                        }
                        VStack{
                            Image("Distilleries")
                                .padding(.top, -25)
                            Text("Distilleries")
                                .font(.footnote)
                                .padding(.top, -10)
                        }
                        VStack{
                            Image("Cideries")
                                .padding(.top, -15)
                                .padding(.leading, -10)
                            Text("Cideries")
                                .font(.footnote)
                                .padding(.top, -5)
                        }
                        VStack{
                            Image("FoodandDrink")
                                .padding(.top, -10)
                            Text("Food &\nDrink")
                                .font(.footnote)
                                .multilineTextAlignment(.center)
                                .padding(.top, -20)
                        }
                    }
                }
                VStack{
                    ZStack{
                        Rectangle()
                            .frame(width: .infinity, height: 150)
                            .foregroundColor(Color.white)
                        Text("Recommended For You")
                            .padding(.bottom, 100).padding(.leading, -175)
                    }.padding(.top, 10)
                    ZStack{
                        Rectangle()
                            .frame(width: .infinity, height: 150)
                            .foregroundColor(Color.white)
                        Text("Top Rated Locations")
                            .padding(.bottom, 100).padding(.leading, -175)
                    }.padding(.top, 10)
                    ZStack{
                        Rectangle()
                            .frame(width: .infinity, height: 150)
                            .foregroundColor(Color.white)
                        Text("Your Favorites")
                            .padding(.bottom, 100).padding(.leading, -175)
                    }.padding(.top, 10)
                    ZStack{
                        Rectangle()
                            .frame(width: .infinity, height: 150)
                            .foregroundColor(Color.white)
                        Text("Try Something New")
                            .padding(.bottom, 100).padding(.leading, -175)
                    }.padding(.top, 10)
                }
                /*
                //scrollable view of beverages
                VStack(alignment: .leading) {
                    let DrinksList = createItems()
                    //use DrinkItem objects in the vstack
                    //the contents of these items would pull from the contents of "Drink" structs
                    ForEach(0...DrinksList.count - 1, id:\.self) { i in
                        //makes a drink item to be shown in a list on the beverages tab
                        //each item leads to the drinks profile page when clicked
                        NavigationLink(destination: DrinkProfile(drink: DrinksList[i])){
                            DrinkItem(drink:DrinksList[i])
                        }
                        .padding(.horizontal, 10.0)
                    }
                }
                 */
            }
            .frame(maxHeight: 713)
        }
    }
}

/*
 This is the view for each of the drinks when a user clicks on a drink. It is basically a function view that takes in a drink
 and returns a view displaying it a certain way.
 */
struct DrinkProfile: View {
    var drink: Drink
    var body: some View {
        ScrollView{
            Section{
                Text(drink.drinkName)
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
            }
            VStack{
                HStack(spacing: (SBWidth/3) - 60) {
                    
                    VStack{
                        Image(drink.drinkBigImage)
                        //nutritionalInfo
                    }
                    Text(drink.rating)
                        .foregroundColor(Color.black)
                    
                }.frame(maxWidth: .infinity)
                Text(drink.description)
                    .foregroundColor(Color.black)
            }
        }
        .padding(.bottom, 50.0)
    }
}

struct ContentView_Previews2: PreviewProvider {
    static var previews: some View {
        Group {
            LandingView()
            LocationsView()
            LoginView()
        }
    }
}

/*
 Items for the drink page view
 */
struct DrinkItem: View {
    var drink: Drink
    var body: some View{
        //from left to right, there should be:
        //the thumbnail for the drink
        //name
        //rating
        //button to see full drink page?
        HStack() {
            //still need to fine tune parameters for spacing as well as add colors etc.
            Image(drink.drinkImage)
            Text(drink.drinkName)
            Text("Rating: " + drink.rating)
            Image(systemName: "chevron.right")
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .foregroundColor(Color.black)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                .stroke(Color.black, lineWidth: 2)
        )
    }
}

/*
 Items for the profile page view
 */
struct UserFavDrinks: View {
    var Contents: Array<Drink>
    var body: some View {
        VStack{
            HStack(spacing: (SBWidth/4) - 60){
                ForEach(0...Contents.count - 1, id:\.self) { i in
                    //makes a drink item to be shown in a list on the beverages tab
                    //each item leads to the drinks profile page when clicked
                    NavigationLink(destination: DrinkProfile(drink: Contents[i])){
                        Image(Contents[i].drinkImage)
                    }
                    .padding(.all, 10.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .stroke(Color.black, lineWidth: 2)
                    )
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 60)
            .padding(.vertical, 20.0)
            .overlay(
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .stroke(Color.black, lineWidth: 2)
            )
        }
    }
}
