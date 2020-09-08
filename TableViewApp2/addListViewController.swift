//
//  addListViewController.swift
//  TableViewApp2
//
//  Created by 天野修一 on 2020/09/07.
//  Copyright © 2020 shuichiama.com. All rights reserved.
//

import UIKit

class addListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet var addText: UITextField!
//    テキストフィールドに入力された文字を格納する配列
    var array = [String]()
    
    
    @IBAction func addButton(_ sender: Any) {
        
//  ボタンを押すごとに、配列にデータを再度格納し保存するコード
//  これにより、初期表示が可能
        if UserDefaults.standard.object(forKey: "add") != nil {
//UserDefaultsに保存された配列の値を、配列arrayに格納 ＝＞配列の値(データ)を更新できる
            array = UserDefaults.standard.object(forKey: "add")as! [String]
        }
        
//        nilでも格納できてしまっている？？？
        
//  配列arrayにテキストフィールドaddTextに入力された文字をオプショナル型にして追加！
        array.append(addText.text!)
        
        print(array)
        
//      <        保存するコード    >   配列に保存、そのキーは設定したボタンの文字”add”
        UserDefaults.standard.set(array, forKey: "add")
        
        
//        ボタンを押すと、navigationControllerの画面が戻るアクション
        self.navigationController?.popViewController(animated: true)
        
    }
    
       
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
