//
//  ViewController.swift
//  AACProject
//
//  Created by 윤예원 on 1/25/25.
//

import UIKit

class ViewController: UIViewController {


    
    @IBOutlet weak var selectedImageView1: UIImageView!
    
    @IBOutlet weak var selectedImageView2: UIImageView!
    
    @IBOutlet weak var selectedImageView3: UIImageView!
    
    @IBOutlet weak var selectedImageView4: UIImageView!
    
    
    var num : [Int] = [0,0,0,0]
    var recentSize : Int = 0
    
    // 이미지 배열 (하단에 표시될 이미지들)
    var sectionAimages : [UIImage] = [#imageLiteral(resourceName: "001"), #imageLiteral(resourceName: "002"), #imageLiteral(resourceName: "003"), #imageLiteral(resourceName: "004"), #imageLiteral(resourceName: "005"), #imageLiteral(resourceName: "006"), #imageLiteral(resourceName: "007"), #imageLiteral(resourceName: "008")]


    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("첫화면")
        updateSelectedImages()
       
    }
    
    
    func updateSelectedImages() {
        // 선택된 이미지뷰 업데이트
        selectedImageView1.image = sectionAimages[num[0]]
        selectedImageView2.image = sectionAimages[num[1]]
        selectedImageView3.image = sectionAimages[num[2]]
        selectedImageView4.image = sectionAimages[num[3]]
    }
    
    @IBAction func Image1(_ sender: UIButton) {
        num[recentSize] = 0
        recentSize+=1
        print("버튼1눌림")
        updateSelectedImages()
    }
    
    @IBAction func Image2(_ sender: UIButton) {
        num[recentSize] = 1
        recentSize+=1
        print("버튼2눌림")
        updateSelectedImages()
    }
    
    @IBAction func Image3(_ sender: UIButton) {
        num[recentSize] = 2
        recentSize+=1
        print("버튼3눌림")
        updateSelectedImages()
    }
    
    @IBAction func Image4(_ sender: UIButton) {
        num[recentSize] = 3
        recentSize+=1
        print("버튼4눌림")
        updateSelectedImages()
    }
}

// 버튼 하나 누르면 바로 selectedImageView1로 넘어가게..
//버튼 누른걸 배열로 저장 바로바로 하는거임
//그럼 배열1이 생겼다 그럼 바로 선택이미지뷰로 넘어가고
//버튼 하나 더 눌러서 배열2가 생겼다. 그럼 바로 선택이미지뷰2로 넘어가고
//선택이미지뷰1=배열.0
//선택이미지뷰2=배열.1
//이런식으로 하면 되지 않으려나?
//만약에 이미지 선택한거 취소하고 싶다.
//-이미지를 누르면 삭제시키고 싶어.
//이미지 터치 됐으면, 해당 이미지 배열 빈공간으로 만들고... 그럼 땡기는게 에반데
//선택이미지뷰 뭔가 제공되는 라이브러리? 프레임워크? 있을 거 같다.
//전체삭제 버튼도 있어야 겠다.
