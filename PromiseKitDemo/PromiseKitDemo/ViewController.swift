//
//  ViewController.swift
//  PromiseKitDemo
//
//  Created by 李凯 on 2019/5/7.
//  Copyright © 2019 LK. All rights reserved.
//

import UIKit
import PromiseKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        _ = cook()
            .then{ data -> Promise<String> in
                return self.eat(data: data)
            }.then{ data -> Promise<String> in
                return self.wash(data: data)
            }.done{ data in
                print(data)
            }.catch{ error in
                print(error.localizedDescription + "没法吃!")
            }.finally {
                print("出门上班")
            }
        
        //开始监听通知
        beginObserve()
    }
    
    // MARK: Notification
    func beginObserve() {
        NotificationCenter.default.observe(once: UIApplication.didEnterBackgroundNotification).done { notification in
                print("程序进入后台")
            //通知相应后 PromiseKit会自动将通知取消 因此想继续监听 需要再次调用
            self.beginObserve()
        }
    }
    
    // MARK: Async
    func cook() -> Promise<String> {
        print("开始做饭")
        let promise = Promise<String> { resolver in
            //延迟操作
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
                print("做饭完毕")
                //fulfil为满足/完成状态, 进入then函数
                resolver.fulfill("鸡蛋炒饭")
            })
            
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
//                print("做饭失败")
//                let error = NSError(domain: "PromiseKitDemo", code: 0, userInfo: [NSLocalizedDescriptionKey : "烧焦的米饭"])
//                //reject为拒绝状态, 进入catch函数
//                resolver.reject(error)
//            })
        }
        return promise
    }
    
    func eat(data: String) -> Promise<String> {
        print("开始吃饭:" + data)
        let promise = Promise<String> { resolver in
            //延迟操作
            after(seconds: 1).done{
                print("吃饭完毕")
                resolver.fulfill("一双筷子一个碗")
            }
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
//                print("吃饭完毕")
//                resolver.fulfill("一双筷子一个碗")
//            })
        }
        return promise
    }
    
    func wash(data: String) -> Promise<String> {
        print("开始洗碗:" + data)
        let promise = Promise<String> { resolver in
            //延迟操作
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
                print("洗碗完毕")
                resolver.fulfill("干净的碗筷")
            })
        }
        return promise
    }
    

}

