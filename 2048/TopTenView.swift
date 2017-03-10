//
//  TopTenView.swift
//  2048
//
//  Created by MFS on 16/12/6.
//  Copyright © 2016年 MFS. All rights reserved.
//

import UIKit

class TopTenView: UIViewController {
    
    @IBOutlet weak var r0: UILabel!
    @IBOutlet weak var r1: UILabel!
    @IBOutlet weak var r2: UILabel!
    @IBOutlet weak var r3: UILabel!
    @IBOutlet weak var r4: UILabel!
    @IBOutlet weak var r5: UILabel!
    @IBOutlet weak var r6: UILabel!
    @IBOutlet weak var r7: UILabel!
    @IBOutlet weak var r8: UILabel!
    @IBOutlet weak var r9: UILabel!
    
    @IBOutlet weak var test: UILabel!
    
    func filldata(t:UILabel , rank:Int ,max:Int , sum:Int , step:Int ) {
        
        t.text = String(rank)+"  |  "+String(max)+"  |  "+String(sum)+"  |  "+String(step)
        switch max {
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

    func show(){
        let TTmax:[Int] = UserDefaults.standard.array(forKey: "max") as! [Int]
        let TTsum:[Int] = UserDefaults.standard.array(forKey: "sum") as! [Int]
        let TTstep:[Int] = UserDefaults.standard.array(forKey: "step") as! [Int]
        filldata(t: r0, rank: 1, max: TTmax[0], sum: TTsum[0], step: TTstep[0])
        filldata(t: r1, rank: 2, max: TTmax[1], sum: TTsum[1], step: TTstep[1])
        filldata(t: r2, rank: 3, max: TTmax[2], sum: TTsum[2], step: TTstep[2])
        filldata(t: r3, rank: 4, max: TTmax[3], sum: TTsum[3], step: TTstep[3])
        filldata(t: r4, rank: 5, max: TTmax[4], sum: TTsum[4], step: TTstep[4])
        filldata(t: r5, rank: 6, max: TTmax[5], sum: TTsum[5], step: TTstep[5])
        filldata(t: r6, rank: 7, max: TTmax[6], sum: TTsum[6], step: TTstep[6])
        filldata(t: r7, rank: 8, max: TTmax[7], sum: TTsum[7], step: TTstep[7])
        filldata(t: r8, rank: 9, max: TTmax[8], sum: TTsum[8], step: TTstep[8])
        filldata(t: r9, rank: 10, max: TTmax[9], sum: TTsum[9], step: TTstep[9])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        show()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
