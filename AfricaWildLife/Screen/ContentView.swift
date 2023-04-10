//
//  ContentView.swift
//  AfricaWildLife
//
//  Created by Nileshkumar M. Prajapati on 04/08/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    @State private var isGridViewActive: Bool = false
    let heptics = UIImpactFeedbackGenerator(style: .medium)
    //let gridLayout = Array(repeating: GridItem(.flexible()), count: 2)
    @State private var isAnimating: Bool = true
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid Number \(gridColumn)")
        
        // Toolbar Image
        switch gridColumn {
            case 1:
                toolbarIcon = "square.grid.2x2"
            case 2:
                toolbarIcon = "square.grid.3x2"
            case 3:
                toolbarIcon = "rectangle.grid.1x2"
            default:
                toolbarIcon = "square.grid.2x2"
        }
    }
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) {animal in
                            NavigationLink(destination: AnimalDetailsView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }//: LINK
                        } //: LOOP
                        
                        CreditsView()
                            .modifier(CenterModifier())
                    }//: LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailsView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                } //: LINK
                            }//: LOOP
                        }//: VGRID
                        .padding(10)
                        .animation(.easeIn)
                    }//: Scroll
                }//: End of Condition
            }//: Group
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        //LIST
                        Button {
                            print("listview is activated")
                            isGridViewActive = false
                            heptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        // GRID
                        Button {
                            print("gridview is activated")
                            isGridViewActive = true
                            heptics.impactOccurred()
                            gridSwitch()
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }
                }//: BUTTONS
            }//: ToolBar
        }//: NAVIGATION
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
