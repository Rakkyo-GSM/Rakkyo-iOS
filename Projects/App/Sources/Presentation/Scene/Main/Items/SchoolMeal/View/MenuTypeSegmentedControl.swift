import UIKit

final class MenuTypeSegmentedControl: UIView {
    
    let menuType: [String] = ["아침", "점심", "저녁"]
    
    private lazy var menuTypeSegmentedControl = UISegmentedControl(items: menuType).then {
        $0.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.958, alpha: 1)
    }
    
    init() {
          super.init(frame: .zero)
          addView()
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
}

private extension MenuTypeSegmentedControl {
    func addView() {
        addSubViews(menuTypeSegmentedControl)
    }
    
    
}
