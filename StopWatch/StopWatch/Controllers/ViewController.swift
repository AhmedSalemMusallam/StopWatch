//
//  ViewController.swift
//  StopWatch
//
//  Created by Ahmed Salem on 08/02/2023.
//

import UIKit

class ViewController: UIViewController {

    //Mark:- outlest
    @IBOutlet weak var timeLable: UILabel!
    
    @IBOutlet weak var startBtn: UIButton!
    
    @IBOutlet weak var resetBtn: UIButton!
    
    //Mark:- actions
    @IBAction func startBtnTapped(_ sender: Any) {
        if timingCounting
        {
            timingCounting = false
            timer.invalidate()
            startBtn.setTitle("Start", for: .normal)
            startBtn.setTitleColor(UIColor.green, for: .normal)
        }else{
            timingCounting = true
            startBtn.setTitle("Stop", for: .normal)
            startBtn.setTitleColor(UIColor.red, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func resetBtnTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Reset Timer? ", message: "Are You Sure You Would Like To Reset The Timer?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "CANCEL", style: .cancel, handler: {
            (_) in
            //do nothing
        }))
        alert.addAction(UIAlertAction(title: "YES", style: .default, handler: {
            (_) in
            self.count = 0
            self.timer.invalidate()
            self.timeLable.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
            self.startBtn.setTitle("Start", for: .normal)
            self.startBtn.setTitleColor(UIColor.green, for: .normal)
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    //Mark:- @obj for timer Counter
    @objc func timerCounter()
    {
        count = count + 1
        let time = secondsToHoursMiniutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        timeLable.text = timeString
    }
    
    //Mark:- seconds to hours minutes seconds (seconds: Int) -> (Int, Int, Int)
    func secondsToHoursMiniutesSeconds(seconds: Int) -> (Int, Int, Int)
    {
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    //MArk:- make time string function
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String
    {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
      
        return timeString
    }
    
    //MArk:- varibles
    var timer:Timer = Timer()
    var count:Int = 0
    var timingCounting:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startBtn.setTitleColor(UIColor.green, for: .normal)
    }


}

