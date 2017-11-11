//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class Recipe: NSObject
{
    var id: String
    var category: String
    var recipeTitle: String
    var prepTime: Int
    var difficulty: Int
    var serves: Int
    var dishImage: UIImage?
    var featuredFlag: Bool
    
    init (category: String, recipeTitle: String, prepTime: Int, difficulty: Int, serves: Int, dishImage: UIImage?, featuredFlag: Bool)
    {
        self.id = UUID().uuidString
        self.category = category
        self.recipeTitle = recipeTitle
        self.prepTime = prepTime
        self.difficulty = difficulty
        self.serves = serves
        self.dishImage = dishImage
        self.featuredFlag = featuredFlag
    }
}

class MyViewController : UITableViewController
{
    // Properties
    
    let headerTitles = ["Featured Recipes", "Latest"]
    
    var data = [[Recipe]]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell")
        
        sampleData()
    }
    
    // Table View Methods
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        // Count # of data
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // Count # of embedded arrays in section [] []
        return data[section].count
        
     }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // Dequeue the cell with identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Set up text by calling -> section & row
        let recipe = data[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = recipe.recipeTitle
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        // If the section < header count
        
        if section < headerTitles.count
        {
            return headerTitles[section]
        }
        
        return nil
    }
    

    
    // Actions
    func sampleData()
    {
        let recipe1 = Recipe(category: "Healthy", recipeTitle: "Pasta Salad", prepTime: 30, difficulty: 1, serves: 6, dishImage: nil, featuredFlag: false)
        let recipe2 = Recipe(category: "Brunch", recipeTitle: "Pancakes", prepTime: 30, difficulty: 1, serves: 1, dishImage: nil, featuredFlag: false)
        let recipe3 = Recipe(category: "Soup", recipeTitle: "Pasta Salad", prepTime: 30, difficulty: 2, serves: 4, dishImage: nil, featuredFlag: true)
        let recipe4 = Recipe(category: "Dessert", recipeTitle: "Chocolate-covered Strawberries", prepTime: 30, difficulty: 1, serves: 2, dishImage: nil, featuredFlag: false)
        let recipe5 = Recipe(category: "Healthy", recipeTitle: "Kombucha", prepTime: 30, difficulty: 3, serves: 10, dishImage: nil, featuredFlag: true)
        
        let recipes = [recipe1, recipe2, recipe3, recipe4, recipe5]
        
        sortRecipes(recipes: recipes)
    }
    
    func sortRecipes (recipes: [Recipe])
    {
        var recipeFeatured = [Recipe]()
        var recipeLatest = [Recipe]()
        
        for recipe in recipes
        {
            if recipe.featuredFlag
            {
                recipeFeatured.append(recipe)
            } else {
                recipeLatest.append(recipe)
            }
        }
        
        // Append sorted recipes to the data variable
        data.append(recipeFeatured)
        data.append(recipeLatest)
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()



















