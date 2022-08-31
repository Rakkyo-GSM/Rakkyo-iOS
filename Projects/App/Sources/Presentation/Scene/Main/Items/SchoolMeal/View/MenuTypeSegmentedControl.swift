import UIKit

final class MenuTypeSegmentedControl: UIView {
    
    private let menuType: [String] = ["아침", "점심", "저녁"]
    private let image = UIImage()
    
    private lazy var menuTypeSegmentedControl = UISegmentedControl(items: menuType).then {
        $0.setBackgroundImage(image, for: .normal, barMetrics: .default)
        $0.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for:.normal )
        $0.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0.425, green: 0.62, blue: 1, alpha: 1), .font: UIFont.systemFont(ofSize: 13, weight: .semibold)], for: .selected)
    }
    
    private let menuTypeView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.949, green: 0.965, blue: 0.992, alpha: 1)
        $0.layer.cornerRadius = 10
    }
    
    init() {
          super.init(frame: .zero)
          addView()
          setLayout()
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
}

private extension MenuTypeSegmentedControl {
    func addView() {
        addSubViews(menuTypeView)
        menuTypeView.addSubview(menuTypeSegmentedControl)
    }
    
    func setLayout() {
        menuTypeSegmentedControl.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(40)
        }
        menuTypeView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(50)
        }
    }
    
    
}
