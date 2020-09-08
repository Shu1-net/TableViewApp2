//
//  TableViewController.swift
//  TableViewApp2
//
//  Created by 天野修一 on 2020/09/07.
//  Copyright © 2020 shuichiama.com. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

//    ①入力した文字をデータとして格納する用の配列を作成
    var resultArray = [String]()
    
//    画面がaddListから戻るだけで、データを反映するコード
//    何度でも戻ってくることができる
    override func viewWillAppear(_ animated: Bool) {
//  関数viewWillAppearは下の条件によって反映される(配列データを表示する)かどうかをBoolで判断
        
//UserDefailtsが空でなければ
        if UserDefaults.standard.object(forKey: "add") != nil {
//UserDefaultsに保存された配列の値を、配列resultArrayに格納 ＝＞配列の値(データ)を更新できる
            resultArray = UserDefaults.standard.object(forKey: "add")as! [String]
        }
        tableView.reloadData()
    }
    

//アプリを立ち上げたときのみ動く
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

//セクション数を指定するアクション 戻り値＝1なので、セクション数は1で固定
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

//セクション内の列(セル)を指定するアクション 戻り値＝配列resultArrayの値(データ)の数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resultArray.count
    }

//下のコメントアウトを外す
    
//tableViewの表示を変える(更新して表示する)アクション
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath)

        
//indexPathが配列resultArrayのrow番目のデータを取得＆保持し、
//cellにtextLabelのテキストとして、表示
        cell.textLabel?.text = resultArray[indexPath.row]
        
        return cell
    }

//ここまで
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

//delete機能を追加するためにコメントアウトを外す
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//          下のコードを追加
            resultArray.remove(at: indexPath.row)
            // Delete the row from the data source
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }

        UserDefaults.standard.set(resultArray, forKey: "add")
        print(resultArray)
//tableView.reloadData()
    }
//ここまで

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
