//
//  ContentView.swift
//  Shape
//
//  Created by Mac11 on 2025/3/7.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
                Color(red: 251/255, green: 174/255, blue: 252/255
                )
                /*Color(red: 174/255, green: 252/255, blue: 255/255
                )*/
                .ignoresSafeArea()
            Lighting().foregroundStyle(Color(red: 252/255, green: 227/255, blue: 143/255))
            Text("Raichu")
                .font(.largeTitle)
                .foregroundStyle(Color(red:79/255, green:31/255, blue:1/255))
                .offset(y:-200)
            /*Text("Firechu")
                .font(.largeTitle)
                .foregroundStyle(Color(red: 250/255, green: 81/255, blue: 75/255))
                .offset(y:-200)*/
            Text("猜猜我是誰?")
                .font(.largeTitle)
                .foregroundStyle(Color(red:79/255, green:31/255, blue:1/255))
                //.foregroundStyle(Color(red: 250/255, green: 81/255, blue: 75/255))
                .offset(y:-240)
            Group {
                //耳朵外面
                EarOut().fill(Color(red: 161/255, green: 122/255, blue: 76/255))
                //EarOut().fill(Color(red: 250/255, green: 81/255, blue: 75/255))  //火焰耳
                EarOut().stroke(Color(red:79/255, green:31/255, blue:1/255),lineWidth: 4)
                //耳朵內面
                EarIn().fill(Color(red: 252/255, green: 227/255, blue: 143/255))
                EarIn().stroke(Color(red:79/255, green:31/255, blue:1/255),lineWidth:4)
                //影子
                Head().fill(Color(red: 101/255, green: 136/255, blue: 173/255)).offset(y:20)
                Head().fill(Color(red: 221/255, green: 162/255, blue: 222/255)).offset(y:20) //pink
                //頭跟身體
                Head().fill(Color(red: 252/255, green: 227/255, blue: 143/255))
                Capsule() //後背紋路＿上
                    .trim(from: 0.5, to: 1)
                    .frame(width: 20, height: 45)
                    .foregroundStyle(Color(red: 161/255, green: 122/255, blue: 76/255))
                    //.foregroundStyle(Color(red: 250/255, green: 81/255, blue: 75/255)) //FireColor
                    .rotationEffect(.degrees(-69))
                    .offset(x:145, y:70)
                Capsule() //後背紋路＿下
                    .trim(from: 0.5, to: 1)
                    .frame(width: 20, height: 45)
                    .foregroundStyle(Color(red: 161/255, green: 122/255, blue: 76/255))
                    //.foregroundStyle(Color(red: 250/255, green: 81/255, blue: 75/255)) //FireColor
                    .rotationEffect(.degrees(-55))
                    .offset(x:130, y:105)
                //先放背部紋路，在用線蓋過，感覺比較好看～
                Head().stroke(Color(red:79/255, green:31/255, blue:1/255),lineWidth: 6)
                //手
                Hand().fill(Color(red: 161/255, green: 122/255, blue: 76/255))
                //Hand().fill(Color(red: 250/255, green: 81/255, blue: 75/255)) //FireColor
                //Hand().stroke(Color.orange,lineWidth:4)
                HandOutline().stroke(Color(red:79/255, green:31/255, blue:1/255),style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                //肚子
                Belly()
                //尾巴邊
                Tail().stroke(Color(red:79/255, green:31/255, blue:1/255),style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                //尾巴影子
                TailLight().fill(Color(red: 101/255, green: 136/255, blue: 173/255)).offset(y:10).opacity(0.7)
                TailLight().fill(Color(red: 221/255, green: 162/255, blue: 222/255)).offset(y:10).opacity(0.7) //pink
                //尾巴閃電填色
                TailLight().fill(Color(red: 252/255, green: 227/255, blue: 143/255))
                //尾巴閃電描邊
                TailLight().stroke(Color(red:79/255, green:31/255, blue:1/255),style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                //眼
                Eye().stroke(Color(red:79/255, green:31/255, blue:1/255),style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                //嘴
                Mouth().fill(Color(red: 254/255, green: 201/255, blue: 138/255))
                Mouth().stroke(Color(red:79/255, green:31/255, blue:1/255),style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                Ellipse() //左頰
                    .frame(width: 30, height: 30)
                    .foregroundStyle(Color(red:254/255, green:248/255, blue:220/255))
                    .offset(x:-13,y:-45)
                Ellipse() //右頰
                    .frame(width: 40, height: 40)
                    .foregroundStyle(Color(red:254/255, green:248/255, blue:220/255))
                    .offset(x:130,y:0)
            }
            .offset(x:-50, y:100)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View {
        ContentView()
    }
}

struct Lighting: View {
    var body: some View {
        Group{     //lighting
            Rectangle()
                .trim(from: 0.25, to: 0.60)
                .frame(width: 150, height: 300)
                .rotationEffect(.degrees(10))
                .offset(x: -150, y: -400)
                //.foregroundStyle(.blue)
            Rectangle()
                .frame(width: 350, height: 90)
                .rotationEffect(.degrees(-5))
                .offset(x: -11, y: -225)
                //.foregroundStyle(.blue)
            Rectangle()
                .trim(from: 0.25, to: 0.55)
                .frame(width: 100, height: 900)
                .rotationEffect(.degrees(195))
                .offset(x:92, y:164)
                //.foregroundStyle(.blue)
                
        }
        .shadow(radius: 5)
    }
}

struct Head: Shape{
    func path(in rect:CGRect) -> Path{
        Path{(path) in
            path.move(to: CGPoint(x: 190, y: 375))
            path.addQuadCurve(to: CGPoint(x: 290, y: 363), control: CGPoint(x: 230, y: 350))
            path.addQuadCurve(to: CGPoint(x: 355, y: 491), control: CGPoint(x: 390, y: 400))
            path.addQuadCurve(to: CGPoint(x: 300, y: 575), control: CGPoint(x: 345, y: 566))
            path.addQuadCurve(to: CGPoint(x: 180, y: 562), control: CGPoint(x: 257, y: 590))
            path.addQuadCurve(to: CGPoint(x: 162, y: 431), control: CGPoint(x: 60, y: 510))
            path.addQuadCurve(to: CGPoint(x: 190, y: 375), control: CGPoint(x: 152, y: 400))
                
        }
    }
}
struct EarOut: Shape{
    func path(in rect:CGRect) -> Path{
        Path{(path) in
            path.move(to: CGPoint(x: 290, y: 370))
            path.addQuadCurve(to: CGPoint(x: 220, y: 325), control: CGPoint(x: 260, y: 340))
            path.addQuadCurve(to: CGPoint(x: 200, y: 400), control: CGPoint(x: 220, y: 390))
            path.addQuadCurve(to: CGPoint(x: 290, y: 370), control: CGPoint(x: 280, y: 390))
            
            path.move(to: CGPoint(x: 335, y: 385))
            path.addQuadCurve(to: CGPoint(x: 440, y: 420), control: CGPoint(x: 380, y: 385))
            path.addQuadCurve(to: CGPoint(x: 390, y: 470), control: CGPoint(x: 375, y: 440))
            path.addQuadCurve(to: CGPoint(x: 335, y: 465), control: CGPoint(x: 350, y: 470))
            path.addQuadCurve(to: CGPoint(x: 335, y: 385), control: CGPoint(x: 330, y: 400))
        }
    }
}
struct EarIn: Shape{
    func path(in rect:CGRect) -> Path{
        Path{(path) in
            path.move(to: CGPoint(x: 250, y: 390))
            path.addQuadCurve(to: CGPoint(x: 220, y: 325), control: CGPoint(x: 265, y: 370))
            path.addQuadCurve(to: CGPoint(x: 200, y: 400), control: CGPoint(x: 220, y: 390))
            path.addQuadCurve(to: CGPoint(x: 250, y: 390), control: CGPoint(x: 245, y: 395))
            
            path.move(to: CGPoint(x: 330, y: 450))
            path.addQuadCurve(to: CGPoint(x: 430, y: 420), control: CGPoint(x: 340, y: 410))
            path.addQuadCurve(to: CGPoint(x: 390, y: 470), control: CGPoint(x: 375, y: 440))
            path.addQuadCurve(to: CGPoint(x: 335, y: 465), control: CGPoint(x: 350, y: 470))
            path.addQuadCurve(to: CGPoint(x: 330, y: 450), control: CGPoint(x: 330, y: 460))
            
            path.move(to: CGPoint(x: 390, y: 470))
            path.addQuadCurve(to: CGPoint(x: 385, y: 480), control: CGPoint(x: 410, y: 480))
            path.addQuadCurve(to: CGPoint(x: 390, y: 470), control: CGPoint(x: 392, y: 475))
        }
    }
}
struct Hand: Shape{
    func path(in rect:CGRect) -> Path{
        Path{(path) in
            path.move(to: CGPoint(x: 162, y: 431))
            path.addQuadCurve(to: CGPoint(x: 150, y: 450), control: CGPoint(x: 130, y: 425))
            path.addQuadCurve(to: CGPoint(x: 162, y: 431), control: CGPoint(x: 170, y: 440))
            
            path.move(to: CGPoint(x: 312, y: 480))
            path.addQuadCurve(to: CGPoint(x: 300, y: 498), control: CGPoint(x: 345, y: 498))
            path.addQuadCurve(to: CGPoint(x: 312, y: 480), control: CGPoint(x: 306, y: 485))
            
            path.move(to: CGPoint(x: 120, y: 495))
            path.addQuadCurve(to: CGPoint(x: 120, y: 515), control: CGPoint(x: 80, y: 500))
            path.addQuadCurve(to: CGPoint(x: 120, y: 495), control: CGPoint(x: 125, y: 500))
            
            path.move(to: CGPoint(x: 280, y: 543))
            path.addQuadCurve(to: CGPoint(x: 263, y: 565), control: CGPoint(x: 308, y: 565))
            path.addQuadCurve(to: CGPoint(x: 280, y: 543), control: CGPoint(x: 272, y: 548))
        }
    }
}
struct HandOutline: Shape{
    func path(in rect:CGRect) -> Path{
        Path{(path) in
            path.move(to: CGPoint(x: 162, y: 431))
            path.addQuadCurve(to: CGPoint(x: 150, y: 450), control: CGPoint(x: 130, y: 425))
            
            path.move(to: CGPoint(x: 312, y: 480))
            path.addQuadCurve(to: CGPoint(x: 300, y: 498), control: CGPoint(x: 345, y: 498))
            
            path.move(to: CGPoint(x: 120, y: 495))
            path.addQuadCurve(to: CGPoint(x: 120, y: 515), control: CGPoint(x: 80, y: 500))
            
            path.move(to: CGPoint(x: 280, y: 543))
            path.addQuadCurve(to: CGPoint(x: 263, y: 565), control: CGPoint(x: 308, y: 565))
        }
    }
}

struct Belly: View {
    var body: some View {
        Ellipse()
            .frame(width: 150, height: 80)
            .foregroundStyle(Color(red: 254/255, green: 248/255, blue: 220/255))
            .rotationEffect(.degrees(15))
            .offset(x:15, y:50)
    }
}
struct Tail: Shape{
    func path(in rect: CGRect) -> Path {
        Path{(path) in
            path.move(to: CGPoint(x: 180, y: 562))
            path.addLine(to: CGPoint(x: 90, y: 624))
            path.addLine(to: CGPoint(x: 310, y: 635))
            path.addLine(to: CGPoint(x: 270, y: 655))
            path.addLine(to: CGPoint(x: 320, y: 670))
            path.addLine(to: CGPoint(x: 310, y: 683))
            path.addLine(to: CGPoint(x: 178, y: 675))
            path.addLine(to: CGPoint(x: 233, y: 653))
            path.addLine(to: CGPoint(x: 168, y: 630))
            path.addLine(to: CGPoint(x: 90, y: 624))
        }
    }
}
struct TailLight: Shape{
    func path(in rect: CGRect) -> Path{
        Path{(path) in
            path.move(to: CGPoint(x: 168, y: 630))
            path.addLine(to: CGPoint(x: 310, y: 635))
            path.addLine(to: CGPoint(x: 270, y: 655))
            path.addLine(to: CGPoint(x: 320, y: 670))
            path.addLine(to: CGPoint(x: 310, y: 683))
            path.addLine(to: CGPoint(x: 178, y: 675))
            path.addLine(to: CGPoint(x: 233, y: 653))
            path.addLine(to: CGPoint(x: 168, y: 630))
        }
    }
}
struct Eye: Shape{
    func path(in rect:CGRect) -> Path{
        Path{(path) in
            path.move(to: CGPoint(x: 215, y: 375))
            path.addQuadCurve(to: CGPoint(x: 240, y: 377), control: CGPoint(x: 225, y: 372))
            
            path.move(to: CGPoint(x: 325, y: 410))
            path.addQuadCurve(to: CGPoint(x: 300, y: 395), control: CGPoint(x: 310, y: 395))
        }
    }
}
struct Mouth: Shape{
    func path(in rect: CGRect) -> Path {
        Path{(path) in
            path.move(to: CGPoint(x: 245, y: 390))
            path.addQuadCurve(to: CGPoint(x: 260, y: 395), control: CGPoint(x: 238, y: 400))
            path.addQuadCurve(to: CGPoint(x: 285, y: 400), control: CGPoint(x: 280, y: 410))
            
            path.move(to: CGPoint(x: 285, y: 403))
            path.addQuadCurve(to: CGPoint(x: 260, y: 430), control: CGPoint(x: 285, y: 425))
            path.addQuadCurve(to: CGPoint(x: 238, y: 423), control: CGPoint(x: 235, y: 425))
            path.addQuadCurve(to: CGPoint(x: 243, y: 390), control: CGPoint(x: 227, y: 410))
        }
    }
}
