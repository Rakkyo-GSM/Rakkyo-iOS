
import FSCalendar

final class RakkyoCalendar: FSCalendar{
    init(){
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.appearance.todayColor = RakkyoIOSAsset.Colors.rakkyoMainColor.color
        self.appearance.titleDefaultColor = UIColor.gray
        self.locale = Locale(identifier: "en")
        self.appearance.headerDateFormat = "YYYY MMMM"
        self.appearance.headerTitleColor = RakkyoIOSAsset.Colors.rakkyoMainColor.color
        self.appearance.headerMinimumDissolvedAlpha = 0
        self.placeholderType = .none
        self.headerHeight = 101
        self.appearance.headerTitleFont = UIFont(name: "Helvetica", size: 24)
        self.appearance.weekdayFont = UIFont(name: "Helvetica", size: 20)
        self.appearance.titleFont = UIFont(name: "Helvetica", size: 20)
        self.scrollEnabled = true
        self.scrollDirection = .horizontal
        self.layer.cornerRadius = 16
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 16
        self.layer.shadowPath = nil
        self.calendarWeekdayView.weekdayLabels[0].text = "S"
        self.calendarWeekdayView.weekdayLabels[0].textColor = .red
        self.calendarWeekdayView.weekdayLabels[1].text = "M"
        self.calendarWeekdayView.weekdayLabels[1].textColor = .darkGray
        self.calendarWeekdayView.weekdayLabels[2].text = "T"
        self.calendarWeekdayView.weekdayLabels[2].textColor = .darkGray
        self.calendarWeekdayView.weekdayLabels[3].text = "W"
        self.calendarWeekdayView.weekdayLabels[3].textColor = .darkGray
        self.calendarWeekdayView.weekdayLabels[4].text = "T"
        self.calendarWeekdayView.weekdayLabels[4].textColor = .darkGray
        self.calendarWeekdayView.weekdayLabels[5].text = "F"
        self.calendarWeekdayView.weekdayLabels[5].textColor = .darkGray
        self.calendarWeekdayView.weekdayLabels[6].text = "S"
        self.calendarWeekdayView.weekdayLabels[6].textColor = RakkyoIOSAsset.Colors.rakkyoMainColor.color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
