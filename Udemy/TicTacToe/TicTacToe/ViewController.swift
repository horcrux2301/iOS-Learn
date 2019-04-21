//
//  ViewController.swift
//  TicTacToe
//
//  Created by Harsh Khajuria on 19/04/19.
//  Copyright © 2019 horcrux2301. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var solutionLabel: UILabel!
    
    @IBAction func resetState(_ sender: Any) {
        reset()
    }
    
    var nature = 0
    var winner = 0
    
    var arr1 = Array(repeating: Array(repeating: 0, count: 3) , count: 3)
    var arr2 = Array(repeating: Array(repeating: 0, count: 3) , count: 3)
    
    func reset(){
        winner = 0
        nature = 0
        for i in 0...2{
            for j in 0...2{
                arr1[i][j]=0
                arr2[i][j]=0
            }
        }
        btn1Outlet.setImage(nil, for: .normal)
        btn2Outlet.setImage(nil, for: .normal)
        btn3Outlet.setImage(nil, for: .normal)
        btn4Outlet.setImage(nil, for: .normal)
        btn5Outlet.setImage(nil, for: .normal)
        btn6Outlet.setImage(nil, for: .normal)
        btn7Outlet.setImage(nil, for: .normal)
        btn8Outlet.setImage(nil, for: .normal)
        btn9Outlet.setImage(nil, for: .normal)
        solutionLabel.text = ""
        UIView.animate(withDuration: 0.3, animations: {
            self.solutionLabel.center.x -= self.view.bounds.width
        })
    }
    
    func checkDiagonal() -> (a:Int, b:Int){
        var f1=1, f2=1, f3=1, f4=1
        for i in 0...2{
            for j in 0...2{
                if i==j {
                    f1 = f1 & arr1[i][j]
                }
                if i+j==2{
                    f3 = f3 & arr1[i][j]
                }
            }
        }
        for i in 0...2{
            for j in 0...2{
                if i==j {
                    f2 = f2 & arr2[i][j]
                }
                if i+j==2{
                    f4 = f4 & arr2[i][j]
                }
            }
        }
        return (f1|f3,f2|f4)
    }
    
    func count() -> Int{
        var count = 0
        for i in 0...2{
            for j in 0...2{
                if (arr1[i][j]==1 || arr2[i][j]==1){
                    count+=1
                }
            }
        }
        return count
    }
    
    func checkRow() -> (a:Int, b:Int){
        var f1 = 0, f2 = 0
        for i in 0...2{
            var temp = 1
            for j in 0...2{
                temp = temp & arr1[i][j]
            }
            f1 = f1 | temp
        }
        for i in 0...2{
            var temp = 1
            for j in 0...2{
                temp = temp & arr2[i][j]
            }
            f2 = f2 | temp
        }
        return (f1,f2)
    }
    
    func checkCol() -> (a:Int, b:Int){
        var f1 = 0, f2 = 0
        for i in 0...2{
            var temp = 1
            for j in 0...2{
                temp = temp & arr1[j][i]
            }
            f1 = f1 | temp
        }
        for i in 0...2{
            var temp = 1
            for j in 0...2{
                temp = temp & arr2[j][i]
            }
            f2 = f2 | temp
        }
        return (f1,f2)
    }
    
    func getWinner() -> String {
        let temp = nature-1
        var ans:String
        if temp%2==0 {
            ans = "Nought Wins"
        } else {
            ans = "Cross Wins"
        }
        return ans
    }
    
    func check(){
       var f1=0, f2=0
       var temp = checkDiagonal()
        f1 = f1 | temp.a
        f2 = f2 | temp.b
        temp = checkCol()
        f1 = f1 | temp.a
        f2 = f2 | temp.b
        temp = checkRow()
        f1 = f1 | temp.a
        f2 = f2 | temp.b
        if (f1>0 || f2>0){
            winner=1
            solutionLabel.text = getWinner()
            UIView.animate(withDuration: 0.5, animations: {
                self.solutionLabel.center.x += self.view.bounds.width
            })
        }
        let filled = count()
        if filled==9{
            winner=1
            solutionLabel.text = "Draw match"
            UIView.animate(withDuration: 0.5, animations: {
                self.solutionLabel.center.x += self.view.bounds.width
            })
        }
    }
    
    func updateButton(x:Int, y:Int, btn:UIButton){
        if winner==1 {
            return
        }
        if (arr1[x][y] == 0 && arr2[x][y] == 0){
            if(nature%2==0){
                let btnImage = UIImage(named: "nought.png")
                btn.setImage(btnImage, for: .normal)
                nature+=1
                arr1[x][y]=1
            } else {
                let btnImage = UIImage(named: "cross.png")
                btn.setImage(btnImage, for: .normal)
                nature+=1
                arr2[x][y]=1
            }
        }
        check()
    }
    
    @IBOutlet weak var btn1Outlet: UIButton!
    @IBAction func btn1(_ sender: Any) {
        updateButton(x: 0, y: 0, btn: btn1Outlet)
    }
    
    @IBOutlet weak var btn2Outlet: UIButton!
    @IBAction func btn2(_ sender: Any) {
        updateButton(x: 0, y: 1, btn: btn2Outlet)
    }
    
    
    @IBOutlet weak var btn3Outlet: UIButton!
    @IBAction func btn3(_ sender: Any) {
        updateButton(x: 0, y: 2, btn: btn3Outlet)
    }
    
    @IBOutlet weak var btn4Outlet: UIButton!
    @IBAction func btn4(_ sender: Any) {
        updateButton(x: 1, y: 0, btn: btn4Outlet)
    }
    
    
    @IBOutlet weak var btn5Outlet: UIButton!
    @IBAction func btn5(_ sender: Any) {
        updateButton(x: 1, y: 1, btn: btn5Outlet)
    }
    
    
    @IBOutlet weak var btn6Outlet: UIButton!
    @IBAction func btn6(_ sender: Any) {
        updateButton(x: 1, y: 2, btn: btn6Outlet)
    }
    
    
    @IBOutlet weak var btn7Outlet: UIButton!
    @IBAction func btn7(_ sender: Any) {
        updateButton(x: 2, y: 0, btn: btn7Outlet)
    }
    
    @IBOutlet weak var btn8Outlet: UIButton!
    @IBAction func btn8(_ sender: Any) {
        updateButton(x: 2, y: 1, btn: btn8Outlet)
    }
    
    
    @IBOutlet weak var btn9Outlet: UIButton!
    @IBAction func btn9(_ sender: Any) {
        updateButton(x: 2, y: 2, btn: btn9Outlet)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        solutionLabel.center.x -= view.bounds.width
        solutionLabel.text = ""
        // Do any additional setup after loading the view.
    }


}


