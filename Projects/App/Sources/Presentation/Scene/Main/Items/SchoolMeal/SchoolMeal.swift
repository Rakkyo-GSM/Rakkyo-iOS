
import UIKit

final class SchoolMealVC: baseVC{
    
    private let menuLabel = UILabel().then(){
        $0.text = "급식"
    }
    
    private let dateButton = UIButton().then(){
        $0.setTitle("20xx년 xx월 xx일", for: .normal)
        $0.backgroundColor = RakkyoIOSAsset.Colors.rakkyoMainColor.color
    }
    
}
