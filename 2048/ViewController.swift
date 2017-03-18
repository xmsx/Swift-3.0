//
//  ViewController.swift
//  2048
//
//  Created by MFS on 16/12/2.
//  Copyright © 2016年 MFS. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    //外挂（直接成功通过）
    @IBAction func Gua(_ sender: AnyObject) {
        data = [ [0,0,0,0],
                 [0,0,1024,0],
                 [0,0,0,0],
                 [0,0,1024,0] ]
        update()
        judgeScore()
        steps = 0
        step.text = ""
        score.text = ""
    }
    
    //存储积分排名的结构体
    struct TT{
        var steps,max,score:Int   //分别是步数、最大值、最终得分
    }
    
    //存储数组
    var TopTen:[TT]=[TT(steps:0,max:0,score:0)]
    
    //结构体排序
    func cmp(a:TT,b:TT)->Bool{
        if a.max != b.max {return a.max>b.max}
        if a.score != b.score {return a.score>b.score}
        return a.steps<b.steps
    }

    //基础操作数组
    var data:[[Int ]] = [ [0,0,0,0],
                          [0,0,2,0],
                          [0,0,0,0],
                          [0,0,2,0] ]
    
    var mark :Bool = false  //是否有操作发生
    var max :Int = 0  //最大值
    var s :Int = 0   //得分
    var steps:Int = 0 //走的步数
    @IBOutlet weak var head: UILabel!
    
    @IBOutlet weak var step: UILabel!
    //界面图标
    @IBOutlet weak var l0: UILabel!
    @IBOutlet weak var l1: UILabel!
    @IBOutlet weak var l2: UILabel!
    @IBOutlet weak var l3: UILabel!
    @IBOutlet weak var l4: UILabel!
    @IBOutlet weak var l5: UILabel!
    @IBOutlet weak var l6: UILabel!
    @IBOutlet weak var l7: UILabel!
    @IBOutlet weak var l8: UILabel!
    @IBOutlet weak var l9: UILabel!
    @IBOutlet weak var l10: UILabel!
    @IBOutlet weak var l11: UILabel!
    @IBOutlet weak var l12: UILabel!
    @IBOutlet weak var l13: UILabel!
    @IBOutlet weak var l14: UILabel!
    @IBOutlet weak var l15: UILabel!
    
    @IBOutlet weak var score: UILabel!//总分
    @IBOutlet weak var form: UILabel!//边框
    //填充选择
    func filldata(t:UILabel , k:Int) {
        t.text = String(k)
        switch k {
        case 0:
            t.text = ""
            t.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        case 2:
            t.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        case 4:
            t.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        case 8:
            t.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        case 16:
            t.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        case 32:
            t.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        case 64:
            t.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        case 128:
            t.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        case 256:
            t.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        case 512:
            t.backgroundColor = #colorLiteral(red: 0.5791940689, green: 0.1280144453, blue: 0.5726861358, alpha: 1)
        case 1024:
            t.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        case 2048:
            t.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            
        default:
            t.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    //界面更新
    func update() {
        filldata(t: l0, k: data[0][0])
        filldata(t: l1, k: data[0][1])
        filldata(t: l2, k: data[0][2])
        filldata(t: l3, k: data[0][3])
        filldata(t: l4, k: data[1][0])
        filldata(t: l5, k: data[1][1])
        filldata(t: l6, k: data[1][2])
        filldata(t: l7, k: data[1][3])
        filldata(t: l8, k: data[2][0])
        filldata(t: l9, k: data[2][1])
        filldata(t: l10, k: data[2][2])
        filldata(t: l11, k: data[2][3])
        filldata(t: l12, k: data[3][0])
        filldata(t: l13, k: data[3][1])
        filldata(t: l14, k: data[3][2])
        filldata(t: l15, k: data[3][3])
        step.text = String(steps)
    }
    //数字移动
    func up_remove_blank(){
        var k:Int
        for j in 0..<4{
            for i in 1..<4{
                k=i;
                if(data[k][j] != 0){
                while(k-1>=0 && data[k-1][j]==0){ //上面的那个为空
                    swap(&data[k][j],&data[k-1][j]);
                    k-=1
                    mark = true
                }
                }
            }
        }
    }
    func down_remove_blank(){
        var k:Int
        for j in 0..<4{
            for i in (0...2).reversed(){
                k=i;
                if(data[k][j] != 0){
                while(k+1<=3 && data[k+1][j]==0){
                    swap(&data[k][j],&data[k+1][j]);
                    k+=1
                    mark = true
                }
                }
            }
        }
    }
    func left_remove_blank(){
        var k:Int
        for i in 0..<4{
            for j in 1..<4{
                k=j
                if(data[i][k] != 0){
                while(k-1>=0 && data[i][k-1]==0){
                    swap(&data[i][k],&data[i][k-1])
                    k-=1
                    mark = true
                }
                }
            }
        }
    }

    func right_remove_blank(){
        var k:Int
        for i in 0..<4{
            for j in (0...2).reversed(){
                k=j
                if(data[i][k] != 0){
                while(k+1<=3 && data[i][k+1]==0){
                    swap(&data[i][k], &data[i][k+1])
                    k+=1
                    mark = true
                }
                }
            }
        }
    }
    
    //数字合并
    func left(){
        for i in 0..<4{
            for j in 0..<3{
                if data[i][j]==data[i][j+1] && data[i][j] != 0 {
                    data[i][j]+=data[i][j+1]
                    data[i][j+1] = 0
                    left_remove_blank()
                    mark = true
                }
            }
        }
    }
    func right(){
        for i in 0..<4{
            for j in (1...3).reversed(){
                if data[i][j] == data[i][j-1] && data[i][j] != 0{
                    data[i][j]+=data[i][j-1]
                    data[i][j-1]=0
                    right_remove_blank()
                    mark = true
                }
            }
        }
    }
    func up(){
        for j in 0..<4{
            for i in 0..<3{
                if data[i][j]==data[i+1][j] && data[i][j] != 0{
                    data[i][j]+=data[i+1][j]
                    data[i+1][j]=0
                    up_remove_blank()
                    mark = true
                }
            }
        }
    }
    
    func down(){
        for j in 0..<4{
            for i in (1...3).reversed(){
                if data[i][j]==data[i-1][j] && data[i][j] != 0{
                    data[i][j]+=data[i-1][j]
                    data[i-1][j]=0
                    down_remove_blank()
                    mark = true
                }
            }
        }
    }
    //重新开始游戏
    func replay() {
        data = [ [0,0,0,0],
                [0,0,2,0],
                [0,0,0,0],
                [0,0,2,0] ]
        update()
        judgeScore()
        steps = 0
        step.text = ""
        score.text = ""
    }
    @IBAction func Replay(_ sender: AnyObject) {
        replay()
    }
    
    //音效模块
    func playsound (){
        var sId:SystemSoundID = 0
        let sF: String = Bundle.main.path(forResource: "move", ofType: "wav")!
        let sURL:NSURL = NSURL(fileURLWithPath:sF)
        AudioServicesCreateSystemSoundID(sURL, &sId)
        AudioServicesPlaySystemSound(sId)
    }
    
    //判断是否有空位
    func judge()->Bool{
        var flag:Bool = false
        for i in 0..<4{
            for j in 0..<4{
                if( data[i][j]==0){
                    flag=true
                }
            }
            if(flag) {
                break
            }
        }
        return flag
    }
    //判断数字相邻是否相等
    func judgestate()->Bool{
        var flag :Bool = false
        //var flag1 :Bool = false
        for i in 0...3{
            for j in 0...3{
                if((i-1>=0&&data[i][j]==data[i-1][j])||(i+1<=3&&data[i][j]==data[i+1][j])||(j+1<4&&data[i][j]==data[i][j+1])||(j-1>=0&&data[i][j]==data[i][j-1])){
                    flag = true
                }
            }
            if(flag) {break}
        }
        return flag
    }
    //统计数字总和及最大值
    func judgeScore() {
        s = 0
        max = 0
        for i in 0...3{
            for j in 0...3{
                s += data[i][j]
                if data[i][j]>max{
                    max = data[i][j]
                }
            }
        }
        score.text = String(s)
        //游戏结束判定（最大值达2048  相邻无相等数字   没有空闲位置）
        if(max>=2048||(judgestate()==false&&judge()==false)){
            over()
            max = 0
        }
    }
    
    //界面数字增添
    func add(){
        
        //有空位置存在 && 有操作发生
        if(judge()&&mark){
            var x = Int(arc4random_uniform(4))
            var y = Int(arc4random_uniform(4))
            
            //寻找空位
            while data[x][y] != 0{
                x = Int(arc4random_uniform(4))
                y = Int(arc4random_uniform(4))
            }
            let kind:Int = Int(arc4random_uniform(2))
            if kind == 1 {
                data[x][y]=2
            }else {
                data[x][y]=4
            }
            //重置标记
            mark = false
        }
    }
    
    //游戏结束弹出窗
    func over() {
        //定义提示窗口，基础信息（相当于一个view，我觉得）
        let aC :UIAlertController
        if(max>=2048){
            aC = UIAlertController(title: "Congratulation!",
                                       message: "You are very Smart!",
                                       preferredStyle: UIAlertControllerStyle.alert)
        }else{
            aC = UIAlertController(title: "Game Over!",
                                   message: "",
                                       preferredStyle: UIAlertControllerStyle.alert)
        }
        
        
        //定义一个事件
        let dA = UIAlertAction(title: "OK",
                               style: UIAlertActionStyle.cancel,
                               handler: nil)
        let a1 = UIAlertAction(title: "Replay",
                               style: UIAlertActionStyle.default ,
                               handler:{(alertAction: UIAlertAction) in
                               self.replay()
        })
        
        //将事件加入提示窗口
        aC.addAction(dA)
        aC.addAction(a1)
        //显示窗口
        present(aC, animated: true, completion: nil)
        
        //分数存储
        //let tD: NSDate = NSDate()  //获取当前日期
        //let dF: DateFormatter = DateFormatter()//定义时间格式
        //dF.dateFormat = "MMMM d, yyyy"
        //let tDs:String = dF.string(from: tD as Date) //转化成字符串
        
        TopTen.append(TT(steps:steps,max:max,score:s))
        TopTen.sort(by: cmp)
        
        var TTmax:[Int]=[]
        var TTsum:[Int]=[]
        var TTstep:[Int]=[]
        for i in 0..<10{
            TTmax.append(TopTen[i].max)
            TTsum.append(TopTen[i].score)
            TTstep.append(TopTen[i].steps)
        }
        UserDefaults.standard.set(TTstep, forKey: "step")
        UserDefaults.standard.set(TTsum, forKey: "sum")
        UserDefaults.standard.set(TTmax, forKey: "max")
    }

    //界面滑动操作
    @IBAction func U(_ sender: AnyObject) {
        up_remove_blank()
        up()
        
        //有操作步数增加  播放音效
        if mark {
            steps+=1
            playsound()
        }
        add()
        update()
        judgeScore()
    }
    
    
    @IBAction func D(_ sender: AnyObject) {
        
        down_remove_blank()
        down()
        if mark {
            steps+=1
            playsound()
        }
        add()
        
        update()
        judgeScore()
    }
    @IBAction func L(_ sender: AnyObject) {
        left_remove_blank()
        left()
        if mark {
            steps+=1
            playsound()
        }
        add()
        update()
        judgeScore()
    }
    @IBAction func R(_ sender: AnyObject) {
        right_remove_blank()
        right()
        if mark {
            steps+=1
            playsound()
        }
        add()
        update()
        judgeScore()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        
        //由于数据量不大，所以采用了 UserDefaults 存储
        let J = UserDefaults.standard.array(forKey: "max")
        //第一次打开游戏，J 为空，所以要初始化，以后再打开则不需要。
        if(J==nil){
            for _ in 0..<10{
                TopTen.append(TT(steps:0,max:0,score:0))
            }
            var TTmax:[Int]=[]
            var TTsum:[Int]=[]
            var TTstep:[Int]=[]
            for i in 0..<10{
                TTmax.append(TopTen[i].max)
                TTsum.append(TopTen[i].score)
                TTstep.append(TopTen[i].steps)
            }
            //UserDefaults 是不能存储结构体的，所以要分开存起来
            UserDefaults.standard.set(TTstep, forKey: "step")
            UserDefaults.standard.set(TTsum, forKey: "sum")
            UserDefaults.standard.set(TTmax, forKey: "max")
        }
        else{
            //二次打开，则直接存储当次玩的数据。
            var TTmax:[Int]=UserDefaults.standard.array(forKey: "max") as! [Int]
            var TTsum:[Int]=UserDefaults.standard.array(forKey: "sum") as! [Int]
            var TTstep:[Int]=UserDefaults.standard.array(forKey: "step") as! [Int]
            for i in 0..<10{
                TopTen.append(TT(steps:TTstep[i],max:TTmax[i],score:TTsum[i]))
            }

        }
        //Label 圆角
        head.clipsToBounds = true
        head.layer.cornerRadius = 10
        
        form.clipsToBounds = true
        form.layer.cornerRadius = 8
        
        score.clipsToBounds = true
        score.layer.cornerRadius = 4
        
        step.clipsToBounds = true
        step.layer.cornerRadius = 4
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func exitToHere(sender: UIStoryboardSegue) {
        // No code needed!
    }

}

