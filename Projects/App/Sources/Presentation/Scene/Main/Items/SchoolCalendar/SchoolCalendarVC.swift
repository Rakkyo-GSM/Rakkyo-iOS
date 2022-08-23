
import UIKit
import FSCalendar
import Then
import SnapKit

final class SchoolCalendarVC: baseVC,FSCalendarDelegate,FSCalendarDataSource{
    
    private let calendar = RakkyoCalendar()
    
    private let shadowView = ShadowView()
    
    private let todoTableView = UITableView(frame: .zero, style: .plain).then {
        $0.register(TodoCell.self, forCellReuseIdentifier: "cell")
        $0.rowHeight = 60
        $0.separatorStyle = .none
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
        $0.rowHeight = 100
    }
    
    override func setup() {
        calendar.dataSource = self
        calendar.delegate = self
        todoTableView.dataSource = self
        todoTableView.delegate = self
    }
    
    override func addView() {
        view.addSubViews(calendar,shadowView,todoTableView)
        view.bringSubviewToFront(calendar)
    }
    override func setLayout() {
        calendar.snp.makeConstraints { make in
            make.top.equalTo(116)
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(450)
        }
        shadowView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(34)
            make.bottom.equalTo(calendar).offset(13)
        }
        todoTableView.snp.makeConstraints { make in
            make.top.equalTo(shadowView).offset(70)
            make.width.equalToSuperview()
            make.height.equalTo(150)
        }
    }
}

extension SchoolCalendarVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoCell
        return cell
    }
}
