

import Foundation
import UIKit
import SnapKit
import Then

final class DetailVC: baseVC{
    
    private let mainView = ShadowView()
    
    private let mainTextLabel = UILabel().then{
        $0.text = "2차 지필평가"
        $0.font = UIFont(name: "Helvetica-Bold", size: 22)
        $0.textColor = UIColor.darkGray
    }
    
    private let statusTextLabel = UILabel().then{
        $0.text = "학사일정"
        $0.font = UIFont(name: "Helvetica", size: 19)
        $0.textColor = UIColor.darkGray
    }
    
    private let statusImageView = UIImageView(image: UIImage(systemName: "graduationcap.fill"))
    
    private let addButton = UIButton().then{
        $0.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        $0.addTarget(self, action: #selector(addTodo), for: .touchUpInside)
    }
    
    private let noWorkLabel = UILabel().then{
        $0.text = "오늘은 할 일이 없어요!"
        $0.font = UIFont(name: "Helvetica", size: 18)
        $0.textColor = UIColor.black
    }
    
    private let centerAddButton = UIButton().then {
        $0.setTitle("할 일 추가하기", for: .normal)
        $0.setTitleColor(UIColor.systemBlue, for: .normal)
        $0.backgroundColor = .clear
        $0.addTarget(self, action: #selector(addTodo), for: .touchUpInside)
    }
    
    override func addView() {
        view.addSubViews(mainView,addButton,noWorkLabel,centerAddButton)
        mainView.addSubViews(mainTextLabel,statusTextLabel,statusImageView)
    }
    
    override func setLayout() {
        mainView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(100)
            make.top.equalTo(81)
        }
        mainTextLabel.snp.makeConstraints { make in
            make.centerX.equalTo(mainView)
            make.top.equalTo(52)
        }
        statusTextLabel.snp.makeConstraints { make in
            make.centerX.equalTo(mainView)
            make.top.equalTo(20)
        }
        statusImageView.snp.makeConstraints { make in
            make.centerY.equalTo(statusTextLabel)
            make.width.equalTo(20)
            make.height.equalTo(15)
            make.rightMargin.equalTo(statusTextLabel).inset(70)
        }
        addButton.snp.makeConstraints { make in
            make.width.height.equalTo(20)
            make.centerX.equalTo(mainView.snp.right).inset(5)
            make.top.equalTo(mainView.snp.bottom).offset(13)
        }
        noWorkLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        centerAddButton.snp.makeConstraints { make in
            make.centerX.equalTo(noWorkLabel)
            make.top.equalTo(noWorkLabel.snp.bottom).offset(8)
        }
    }
    @objc func addTodo(_ sender: Any){
        let alert = UIAlertController(title: "할 일 추가", message: "할 일을 입력해주세요", preferredStyle: .alert)
        alert.addTextField()
        
        let okAction = UIAlertAction(title: "확인", style: .default) {(action) in
            
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(cancel)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}
