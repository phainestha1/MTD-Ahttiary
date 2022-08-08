//
//  CalendarCell.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/04.
//
// 캘린더에 표시될 각각의 날짜 셀 입니다.

import SwiftUI

struct CalendarCell: View {
    @EnvironmentObject var dateManager: DateViewModel
    let count: Int
    let startingSpaces: Int
    let totalDaysInMonth: Int
    let totalDaysInPreviousMonth: Int
    
    var body: some View {
        Text(fetchMonthStruct().day())
            .foregroundColor(textColor(type: fetchMonthStruct().monthType))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }// body
    
    private func fetchMonthStruct() -> MonthStruct {
        if (count <= startingSpaces) {
            let day = totalDaysInPreviousMonth + count - startingSpaces
            
            return MonthStruct(monthType: .previous, dayInt: day)
        } else if (count - startingSpaces > totalDaysInMonth) {
            let day = count - startingSpaces - totalDaysInMonth
            
            return MonthStruct(monthType: .next, dayInt: day)
        }
        
        let day = count - startingSpaces
        
        return MonthStruct(monthType: .current, dayInt: day)
    }
    
    // 현재 월에 속한 날짜가 아니라면 회색 처리
    private func textColor(type: MonthType) -> Color {
        if type == .current { return .black }
        return .gray
    }
    
}// CalendarCell

struct CalendarCell_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCell(
            count: 1,
            startingSpaces: 1,
            totalDaysInMonth: 1,
            totalDaysInPreviousMonth: 1
        )
    }
}
