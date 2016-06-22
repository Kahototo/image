//
//  ViewController.swift
//  test3
//
//  Created by 小西夏穂 on 2016/06/20.
//  Copyright © 2016年 小西夏穂. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var myImagePicker: UIImagePickerController!
    var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Select a Image"
        
        myImageView = UIImageView(frame: self.view.bounds)
        
        // インスタンス生成
        myImagePicker = UIImagePickerController()
        
        // デリゲート設定
        myImagePicker.delegate = self
        
        // 画像の取得先はフォトライブラリ
        myImagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        // 画像取得後の編集を不可に
        myImagePicker.allowsEditing = false
    }
    
    override func viewDidAppear(animated: Bool) {
        self.presentViewController(myImagePicker, animated: true, completion: nil)
        
    }
    
    /**
     画像が選択された時に呼ばれる.
     */
    func ImagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        //選択された画像を取得.
        var myImage: AnyObject?  = info[UIImagePickerControllerOriginalImage]
            
        //選択された画像を表示するViewControllerを生成.
        let secondViewController = SecondViewController()
        //選択された画像を表示するViewContorllerにセットする.
        secondViewController.mySelectedImage = myImage as! UIImage
        
        myImagePicker.pushViewController(secondViewController, animated: true)
        
    }
    
    /**
     画像選択がキャンセルされた時に呼ばれる.
     */
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        // モーダルビューを閉じる
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
