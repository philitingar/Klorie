//
//  MealViewModel.swift
//  Klorie
//
//  Created by Timea Bartha on 26/4/23.
//

import Foundation

class MealViewModel: ObservableObject {
    
    
    // MARK: Meat list
    
    @Published var meatlist: [Meal] = [
        Meal(name: "Beef", kcal: 171, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Steak", kcal: 217, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Veal", kcal: 282, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Ham", kcal: 145, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Pepperoni", kcal: 183, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Turkey Breast", kcal: 104, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Chicken Breast", kcal: 172, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Duck", kcal: 337, quantity: 100, unit: "g", isFav: false, date: Date()),
            ]
   
    // MARK: Sea-Food list
    
    @Published var seaFoodList: [Meal] = [
        Meal(name: "Salmon", kcal: 206, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Sardines", kcal: 208, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Shrimp", kcal: 99, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Trout", kcal: 190, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Tuna", kcal: 132, quantity: 100, unit: "g", isFav: false, date: Date()),
        
    ]
   
    // MARK: Cold Drinks list
    
    @Published var coldDrinksList: [Meal] = [
       
        Meal(name: "7up", kcal: 44, quantity: 100, unit: "ml", isFav: false, date: Date()),
        Meal(name: "Coke", kcal: 42, quantity: 100, unit: "ml", isFav: false, date: Date()),
        Meal(name: "Coke Zero", kcal: 0, quantity: 100, unit: "ml", isFav: false, date: Date()),
        Meal(name: "Dr. Pepper", kcal: 27, quantity: 100, unit: "ml", isFav: false, date: Date()),
        Meal(name: "Fanta", kcal: 39, quantity: 100, unit: "ml", isFav: false, date: Date()),
        Meal(name: "Pepsi", kcal: 44, quantity: 100, unit: "ml", isFav: false, date: Date()),
        Meal(name: "Vanilla Coke", kcal: 37, quantity: 100, unit: "ml", isFav: false, date: Date()),
    ]
    // MARK: Fruit list
    
    @Published var fruitList: [Meal] = [
        Meal(name: "Apple", kcal: 52, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Avocado", kcal: 160, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Banana", kcal: 89, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Blackberries", kcal: 43, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Blueberries", kcal: 57, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Grapes", kcal: 69, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Orange", kcal: 47, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Watermelon", kcal: 30, quantity: 100, unit: "g", isFav: false, date: Date()),
    ]
    // MARK: Vegetable list
    
    @Published var vegetablesList: [Meal] = [
        Meal(name: "Bell Pepper", kcal: 20, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Broccoli", kcal: 34, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Carrot", kcal: 41, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Cucumber", kcal: 16, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Lettuce", kcal: 15, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Onion", kcal: 40, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Potato", kcal: 77, quantity: 100, unit: "g", isFav: false, date: Date()),
        
    ]
    // MARK: Nuts list
    
    @Published var nutsList: [Meal] = [
        
        Meal(name: "Almonds", kcal: 23, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Hazelnut", kcal: 628, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Peanuts", kcal: 567, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Pistachios", kcal: 562, quantity: 100, unit: "g", isFav: false, date: Date()),
        
    ]
    
    // MARK: Pasta list
    
    @Published var pastaList: [Meal] = [
        
        Meal(name: "Cannelloni", kcal: 146, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Egg Noodles", kcal: 384, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Fusilli", kcal: 352, quantity: 100, unit: "g", isFav: false, date: Date()),
        Meal(name: "Linguine", kcal: 357, quantity: 100, unit: "g", isFav: false, date: Date()),
        
    ]
    
    // MARK: Dairy list
    
    @Published var dairyList: [Meal] = [
    Meal(name: "Almond Milk", kcal: 17, quantity: 100, unit: "ml", isFav: false, date: Date()),
    Meal(name: "Fresh Mozzarella", kcal: 280, quantity: 100, unit: "g", isFav: false, date: Date()),
    Meal(name: "Whole Milk", kcal: 61, quantity: 100, unit: "ml", isFav: false, date: Date()),
    Meal(name: "Yogurt", kcal: 61, quantity: 100, unit: "g", isFav: false, date: Date()),
    ]
    
   
    //MARK: CategoryList
    
    @Published var categorylist: [Category] = [
        Category(title: "Fruit", image: "Fruit"),
        Category(title: "Beef & Chicken", image: "Beef"),
        Category(title: "Fast Food", image: "FastFood"),
        Category(title: "Vegetable", image: "Vegetable"),
        Category(title: "Pasta", image: "Pasta"),
        Category(title: "Dessert", image: "Dessert"),
        Category(title: "Hot Drinks", image: "HotDrink"),
        Category(title: "Cold Drinks", image: "ColdDrink"),
        Category(title: "Dairy", image: "Dairy"),
        Category(title: "Pastries", image: "Pastries"),
        Category(title: "Nuts", image: "Nuts"),
        Category(title: "SeaFood", image: "SeaFood"),
        ]
    
    //MARK: Meal List Checker
    
    func checkMealList(text:String,vm:MealViewModel) -> [Meal] {

        if text == "Fruit"{
            return  self.filterMeals(text: self.searchText, mealList: vm.fruitList)
        }
        else if text == "Vegetable"{
            return self.filterMeals(text: self.searchText, mealList: vm.vegetablesList)
        }
        else if text == "Nuts"{
            return self.filterMeals(text: self.searchText, mealList: vm.nutsList)
        }
        else if text == "SeaFood"{
            return self.filterMeals(text: self.searchText, mealList: vm.seaFoodList)
        }
        else if text == "Beef & Chicken"{
            return self.filterMeals(text: self.searchText, mealList: vm.meatlist)
        }
        else if text == "Dairy"{
            return self.filterMeals(text: self.searchText, mealList: vm.dairyList)
        }
       
        else if text == "Cold Drinks"{
            return self.filterMeals(text: self.searchText, mealList: vm.coldDrinksList)
        } else {
            return self.filterMeals(text: self.searchText, mealList: vm.pastaList)
        }
    }
    
    
    
    @Published var meals:[Meal] = [] {
        didSet{
            saveMeal()
        }
    }
    
    @Published var userKcal:String = "" {
        didSet{
            saveUserKcal()
        }
    }
    
    @Published var favoriteMeals:[Meal] = [] {
        didSet{
            saveFav()
        }
    }
    
    @Published var kcalCount:[Float] = [] {
        didSet{
            saveKcalData()
        }
    }
   
    
    @Published var userDailyCal:String = ""
    @Published var searchText:String = ""
    @Published var date = Date()
    
    let mealKey:String = "mealList"
    
    let kcalKey:String = "kcalCount"
    
    let favMeals:String = "favMealList"
    
    let userDKcal:String = "userKcal"
    
    
    
   //MARK: init FUNC
    
    init() {
    getMeals()
    getMealKcal()
    getFavMeals()
    getUserKcal()
    getDay()
    deleteAtDayEnd()
    
    }
    //MARK: FilterMeals
    
    private func filterMeals(text:String , mealList:[Meal]) -> [Meal] {
        guard !text.isEmpty else{
            return mealList
        }
        
        let lowerCased = text.lowercased()
        
        return mealList.filter { (mealList) -> Bool in
            return mealList.name.lowercased().contains(lowerCased)
        }
    }
    
//    func extractMealDate()->String{
//        let date = Date()
//        let calendar = Calendar.current
//        let hour = calendar.component(.hour, from: date)
//        let minutes = calendar.component(.minute, from: date)
//        return String(hour) + ":" + String(minutes)
//    }
    
    //MARK: ADD & Delete MEAL
    
    func addMeal(name:String,kcal:Float,quantity:Int,unit:String,date:Date){
        let newMeal = Meal(name: name, kcal: kcal, quantity: quantity,unit: unit,isFav: false, date: date)
        meals.append(newMeal)
    }
    
    func deleteKcal(indexSet:IndexSet){
        kcalCount.remove(atOffsets: indexSet)
    }
    
    func moveMeal(from:IndexSet,to:Int){
    meals.move(fromOffsets: from, toOffset: to)
    }
    
    func deleteMeal(indexSet:IndexSet){
     meals.remove(atOffsets:indexSet)
     deleteKcal(indexSet: indexSet)
    }
    
    func getMeals() {
        guard
            let data =  UserDefaults.standard.data(forKey: mealKey),
            let savedMeals = try? JSONDecoder().decode([Meal].self, from: data)
        else {return}
        self.meals = savedMeals
    }
    
    func saveMeal() {
        if let encoded=try? JSONEncoder().encode(meals){
            UserDefaults.standard.set(encoded, forKey: mealKey )
        }
    }
    
    //MARK: USER DAILY KCAL
    
    // Add user daily calorie needs
    func addKcal(kcal:String){
        let newKcal = kcal
        userKcal = newKcal
    }
    
    func getUserKcal() {
        guard
            let data = UserDefaults.standard.data(forKey: userDKcal),
            let savedKcal = try? JSONDecoder().decode(String.self, from: data)
        else {return}
        self.userKcal = savedKcal
    }
    // save user daily calorie needs
    func saveUserKcal(){
        if let encoded=try? JSONEncoder().encode(userKcal){
            UserDefaults.standard.set(encoded,forKey: userDKcal)
        }
    }
    // Add meal to the favorite list
    
    //MARK: FAV LIST
    
    func addMealToFav(name:String,kcal:Float,quantity:Int,unit:String,date:Date){
        let newFav = Meal(name: name, kcal: kcal, quantity: quantity,unit: unit, isFav: true, date: date)
        favoriteMeals.append(newFav)
    }
    
    func getFavMeals() {
        guard
            let data = UserDefaults.standard.data(forKey: favMeals),
            let savedFav = try? JSONDecoder().decode([Meal].self,from: data)
        else{return}
        self.favoriteMeals = savedFav
    }
    
    // save meal to the favorite list
    func saveFav() {
        if let encoded=try? JSONEncoder().encode(favoriteMeals){
            UserDefaults.standard.set(encoded,forKey: favMeals)
        }
    }
    
    // check if the meal is selected to be favorite before or not
    func checkFav(name:String,list:[Meal]) -> Bool {
        
        if list.contains(where: {$0.name == name}) {
            return true
        }
        return false
    }
    
    func deleteFavMeal(index:IndexSet) {
        favoriteMeals.remove(atOffsets: index)
    }
    
    func moveFavMeal(from:IndexSet,to:Int) {
    favoriteMeals.move(fromOffsets: from, toOffset: to)
    }
    
    //MARK: TOTAL KCAL
    func getMealKcal() {
        guard
            let data =  UserDefaults.standard.data(forKey: kcalKey),
            let savedkcal = try? JSONDecoder().decode([Float].self, from: data)
        else {return}
        self.kcalCount = savedkcal
    }
    
    // save total kcal
    func saveKcalData() {
        if let encoded = try? JSONEncoder().encode(kcalCount) {
            UserDefaults.standard.set(encoded, forKey: kcalKey )
        }
    }
    
    // insert kcal in List
    func setCountKcal(count:Float) {
        kcalCount.append(count)
    }
    
    // count the sum of kcal list
    func getCountKcal() -> Double {
        let total = kcalCount.reduce(0, +)
        return Double(total)
    }
    
    //MARK: DELETE AT THE END func
    
    
    @Published var day:Int = 0 {
        didSet{
            saveDay()
        }
    }
    
    
    let dayEnd:String = "dayEnd"
    
    
    func addDay(d:Int) {
        let newDay = d
        day = newDay
    }
    func getDay() {
        guard
            let data = UserDefaults.standard.data(forKey: dayEnd),
            let savedDay = try? JSONDecoder().decode(Int.self, from: data)
        else { return }
        self.day = savedDay
    }
    
    func saveDay(){
        if let encoded = try? JSONEncoder().encode(day) {
            UserDefaults.standard.set(encoded, forKey: dayEnd )
        }
    }
    
    func deleteAtDayEnd() {
        let date = Date()
        let calender = Calendar.current
        let day1 = calender.component(.day, from: date)


        if(day1 == day) {
            addDay(d: day1)
        } else {
            meals.removeAll()
            kcalCount.removeAll()
            addDay(d: day1)
        }

    }
}

