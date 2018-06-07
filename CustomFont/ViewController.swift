//
//  ViewController.swift
//  CustomFont
//
//  Created by Lightwing Ng on 2018/6/7.
//  Copyright © 2018 Lightwing Ng. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableViewController: UIViewController {
     @IBInspectable var LightStatusBar: Bool = false
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            if LightStatusBar {
                return UIStatusBarStyle.lightContent
            } else {
                return UIStatusBarStyle.default
            }
        }
    }
}



class ViewController: DesignableViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data = [
        "30 Days Swift",
        "顶配辉腾 Top Gear Phaeton",
        "婊学测试 Bitchsim",
        "钟晓迪",
        "佩子临",
        "唐宇恒",
    ]
    
    var fontNames = [
        "MFTongXin_Noncommercial-Regular",
        "MFJinHei_Noncommercial-Regular",
        "MFZhiHei_Noncommercial-Regular",
        "Zapfino",
        "Gaspar Regular"
    ]
    
    var fontRowIndex = 0
    
    @IBOutlet weak var changeFontButton: UIButton!
    @IBOutlet weak var fontTableView: UITableView!
    @IBAction func changeFontDidTouch(_ sender: AnyObject) {
        fontRowIndex = (fontRowIndex + 1) % 5
        print(fontNames[fontRowIndex])
        fontTableView.reloadData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontTableView.dataSource = self
        fontTableView.delegate = self
        changeFontButton.layer.cornerRadius = 60
        changeFontButton.layer.borderWidth = 1
        changeFontButton.layer.borderColor = UIColor(red:15/255, green:136/255, blue:235/255, alpha: 1).cgColor
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fontTableView.dequeueReusableCell(withIdentifier: "FontCell", for: indexPath)
        let text = data[indexPath.row]
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor(red: 15/255, green: 136/255, blue: 235/255, alpha: 1.0)
        cell.textLabel?.font = UIFont(name:self.fontNames[fontRowIndex], size: 32)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}
