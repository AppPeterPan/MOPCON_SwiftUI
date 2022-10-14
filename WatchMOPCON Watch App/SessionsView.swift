//
//  SessionsView.swift
//  WatchMOPCON Watch App
//
//  Created by Peter Pan on 2022/10/10.
//

import SwiftUI

struct SessionsView: View {
    @StateObject var provider = SessionsProvider()
    @State private var periodData: PeriodData?
    @State private var session: Session?
    
    var body: some View {
        NavigationStack {
            ZStack {
                sessionsContentView
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("議程")
            .commonStyle()
            .task {
                if periodData == nil {
                    do {
                        try await provider.fetch()
                        periodData = provider.periodDataArray.first
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
    
    var sessionsContentView: some View {
        VStack {
            PeriodPicker(periodData: $periodData, periodDataArray: provider.periodDataArray)
                .padding(.horizontal)
            if let periodData {
                List {
                    ForEach(periodData.period) { period in
                        if period.event.isEmpty {
                            ForEach(period.room) { session in
                                NavigationLink {
                                    SessionDetailView(session: session)
                                } label: {
                                    SessionRow(session: session, showFloor: false, isSelected: false)
                                }
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            }
                        } else {
                            PeriodRow(period: period)
                                .listRowBackground(Color.background)
                        }
                    }
                }
                .listStyle(.plain)
            }
        }
    }
}

struct SessionsView_Previews: PreviewProvider {
    static var previews: some View {
        SessionsView(provider: SessionsProvider(apiEnvironment: .local))
    }
}
