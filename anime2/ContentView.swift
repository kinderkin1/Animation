//
//  ContentView.swift
//  anime2
//
//  Created by Kinder on 24/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State  var show = false
    @State var viewState = CGSize.zero
    @State var card = false
    @State var bott = CGSize.zero
    @State var full = false
    var body: some View {
        ZStack{
            Text("K.I.N.D.E.R.")
                .gradientForeground(colors: [.red, .blue, .purple])
            
            
            
                .padding(.bottom, 600)
                .opacity(card ? 0.4 : 1)
                .offset(y: card ? -200 : 0)
                .animation(Animation
                           
                            .default
                            .delay(0.1)
                           //        .speed(1)
                           //          .repeatCount(2)
                           
                           
                           
                           , value: card)
            ExtraView()
            
                .background(.red)
                .cornerRadius(20)
                .offset(x: 0, y: show ? -400 :  -40)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: card ? -180 : 0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 1.8), value: card)
                .shadow(radius: 10)
                .scaleEffect(card ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(.degrees(card ? -10 : 0))
                .rotation3DEffect(.degrees(10), axis: (x: 10 , y : 0 , z: 0))
                .animation(.easeInOut(duration: 12), value: 120 )
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.9), value: show)
            
            
            ExtraView()
                .offset(x: viewState.width, y: viewState.height)
                .background(.red)
                .cornerRadius(20)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: card ? -140 : 0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 1.8), value: card)
                .shadow(radius: 20)
                .scaleEffect(card ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotationEffect(.degrees(card ? -5 : 0))
                .rotation3DEffect(.degrees(5), axis: (x: 10 , y : 0 , z: 0))
                .blendMode(.darken)
                .animation(.easeInOut(duration: 0.7),value: show)
            
            
            CView()
                .gradientForeground(colors: [.red, .blue, .purple])
            
                .frame(width: card ? 375 : 340, height: 220)
                .cornerRadius(33)
                .shadow(radius: 60)
            
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: card ? -100 : 0)
                
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: viewState)
                .onTapGesture {
                    self.card.toggle()
                }
                .gesture(
                    DragGesture().onChanged{
                        value in self.viewState = value.translation
                        self.show = true
                        
                    }
                        .onEnded{
                            value in self.viewState = .zero
                            self.show = false
                        }
                )
            
            Text("\(bott.height)")
                .gradientForeground(colors: [.red, .blue, .purple])
                .offset(y: -300)
              
            
            Bottom()
                .offset(x: 0, y: card ? 360 : 2000)
                .offset(y: bott.height)
                .blur(radius: show ? 20 : 0)
             
                .animation(.timingCurve(0.2, 0.8, 0.5, 1, duration: 0.8), value: card)
                .gesture(DragGesture()
                         
                            .onChanged{
                    value in  self.bott = value.translation
                    if self.full {
                        self.bott.height += -300
                        if self.bott.height < -300 {
                            self.bott.height = -300
                        }
                     
                    }
                }
                            .onEnded{
                    value in
                    if self.bott.height > 100{
                        self.card = false
                    }
                    if (self.bott.height < -100 && !self.full)


                       || (self.bott.height < 250 && self.full) {
                        self.bott.height = -300
                       self.full = true
                    }
                    else{
                    self.bott = .zero
                        self.full = false
                    }
                }
                )
        }
        
    }
}

struct CView: View {
    var body: some View {
        
        Rectangle()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension View {
    public func gradientForeground(colors: [Color])-> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
    }
}


struct ExtraView: View {
    var body: some View {
        VStack{
            Spacer()
        }
        
        .frame(width: 340, height: 220)
        
    }
}

struct Bottom: View {
    var body: some View {
        VStack(spacing: 20){
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
                .blur(radius: 0.5)
            Text("Йоу собаки, я наруто удзумаки")
                .gradientForeground(colors: [.pink, .purple, .pink])
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 90)
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        
        .blur(radius: 0.5)
    }
}
