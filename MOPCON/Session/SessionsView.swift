//
//  SessionsView.swift
//  MOPCONSwiftUIMultiplatform
//
//  Created by Peter Pan on 2022/9/26.
//

import SwiftUI

struct SessionsView: View {
    @StateObject var provider = SessionsProvider()
    @State private var periodData: PeriodData?
    @State private var session: Session?
    
    var body: some View {
        NavigationSplitView {
            ZStack {
                sessionsContentView
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("議程")
            .commonStyle()
            #if os(macOS)
            .navigationSplitViewColumnWidth(min: 350, ideal: 350)
            #endif
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
        } detail: {
            if let session {
                SessionDetailView(session: session)
            } else {
                Text("選擇一個議程吧")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.background)
            }
        }
    }
    
    var sessionsContentView: some View {
        VStack {
            PeriodPicker(periodData: $periodData, periodDataArray: provider.periodDataArray)
                .padding(.horizontal)
            if let periodData {
                List(selection: $session) {
                    ForEach(periodData.period) { period in
                        if period.event.isEmpty {
                            ForEach(period.room) { session in
                                SessionRow(session: session, showFloor: false, isSelected: self.session == session)
                                    .listRowSeparator(.hidden)
                                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                     #if os(macOS)
                                    .listRowBackground(Color.background)
                                     #endif
                            }
                        } else {
                            PeriodRow(period: period)
                                .listRowBackground(Color.background)
                                .listRowSeparator(.hidden)
                        }
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
            }
        }
    }
}

struct SessionsView_Previews: PreviewProvider {
    static var previews: some View {
        SessionsView(provider: SessionsProvider(apiEnvironment: .local))
            .previewCommonStyle(sizeThatFits: false)
    }
}
