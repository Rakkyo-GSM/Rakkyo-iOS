import UIKit
import SnapKit
import Then
import Tabman
import Pageboy

final class TabBarVC: TabmanViewController{
    
    private var viewControllers = [SchoolCalendarVC(), SchoolMealVC(), SchedulerVC()]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bar = TMBar.TabBar().then{
            $0.backgroundView.style = .blur(style: .light)
            $0.layout.transitionStyle = .snap
            $0.buttons.customize { (button) in
                button.selectedTintColor = RakkyoIOSAsset.Colors.rakkyoMainColor.color
                button.tintColor = RakkyoIOSAsset.Colors.rakkyoTabbaShadowColor.color
            }
        }
        addBar(bar, dataSource: self, at: .bottom)
        setUp()
    }
    
    func setUp(){
        self.dataSource = self
        view.backgroundColor = .white
    }
}

extension TabBarVC: PageboyViewControllerDataSource, TMBarDataSource {

    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }

    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        
        let calendarImage = TMBarItem(title: "")
        calendarImage.image = Image.calendarImage
        
        let schoolMealImage = TMBarItem(title: "")
        schoolMealImage.image = Image.schoolMealImage
        
        let scheduleImage = TMBarItem(title: "")
        scheduleImage.image = Image.scheulerImage
        
        
        // MARK: - return tabBar
        switch index {
                case 0:
                    return calendarImage
                case 1:
                    return schoolMealImage
                case 2:
                    return scheduleImage
        default:
            return TMBarItem(title: "")
        }
    }
}
