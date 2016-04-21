import UIKit
import PageMenu

class ViewController: UIViewController {

  var pageMenu : CAPSPageMenu?

  override func viewDidLoad() {
    super.viewDidLoad()
       
    var controllers : [UIViewController] = []
    for i in 1...4 {
      let controller   = TableViewController(
        nibName: "TableViewController",
        bundle:  nil
      )
      controller.title = "MENU" + String(i)
      controllers.append(controller)
    }

    let params: [CAPSPageMenuOption] = [
      .ScrollMenuBackgroundColor(UIColor.blackColor()),
      .ViewBackgroundColor(UIColor.whiteColor()),
      .SelectionIndicatorColor(UIColor.orangeColor()),
      .MenuItemFont(UIFont(name: "HelveticaNeue", size: 15.0)!),
      .MenuHeight(80.0),
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