import UIKit
import PageMenu

class ViewController: UIViewController {

  var pageMenu : CAPSPageMenu?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title           = "Dev News"
    let navBar           = self.navigationController?.navigationBar
    navBar!.barTintColor = UIColor.blackColor()
    navBar!.shadowImage  = UIImage()
    navBar!.tintColor    = UIColor.whiteColor()
    navBar!.titleTextAttributes =
      [NSForegroundColorAttributeName: UIColor.grayColor()]
    navBar!.setBackgroundImage(
      UIImage(), forBarMetrics: UIBarMetrics.Default
    )

    var controllers : [UIViewController] = []
    
    var feeds: [Dictionary<String, String>] =
      [
        [
          "link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/top/rss",
          "title": "top"
        ],
        [
          "link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/ruby/rss",
          "title": "ruby"
        ],
        [
          "link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/ios/rss",
          "title": "ios"
        ],
        [
          "link": "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/infrastructure/rss",
          "title": "infrastructure"
        ],
      ]
    for feed in feeds
    {
      let feedController = TableViewController(nibName: "TableViewController", bundle: nil)
      feedController.parent = self
      feedController.fetchFrom = feed["link"]!
      feedController.title = feed["title"]
      controllers.append(feedController)
    }
    


    let params: [CAPSPageMenuOption] = [
      .ScrollMenuBackgroundColor(UIColor.blueColor()),
      .ViewBackgroundColor(UIColor.whiteColor()),
      .SelectionIndicatorColor(UIColor.orangeColor()),
      .MenuItemFont(UIFont(name: "HelveticaNeue", size: 15.0)!),
      .MenuHeight(30.0),
      .MenuItemWidth(90.0),
      .CenterMenuItems(true)
    ]
    
    pageMenu = CAPSPageMenu(
      viewControllers: controllers,
      frame:           CGRectMake(
        0.0, 0.0, self.view.frame.width, self.view.frame.height
      ),
      pageMenuOptions: params
    )
    
    self.addChildViewController(pageMenu!)
    self.view.addSubview(pageMenu!.view)
    pageMenu!.didMoveToParentViewController(self)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}