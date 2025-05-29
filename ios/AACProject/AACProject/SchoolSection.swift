//
//  ViewController.swift
//  AACProject
//
//  Created by 윤예원 on 1/25/25.
//

import UIKit
import SnapKit

import AVFoundation

@available(iOS 15.0, *)


class SchoolSection: UIViewController {
    
    let button = UIButton(type: .system)
    var buttonWidth: CGFloat = 100  // 버튼 크기 저장 변수
    let slider = UISlider()


//버튼 화면 띄우기//
    
    /* 버튼 아울렛 */
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button13: UIButton!
    @IBOutlet weak var button14: UIButton!
    @IBOutlet weak var button15: UIButton!
    
    
    
    // 1) 개별 아웃렛을 모아서 배열로
      lazy var buttons: [UIButton] = {
          return [
              button1, button2, button3, button4, button5,
              button6, button7, button8, button9, button10,
              button11, button12, button13, button14, button15
          ]
      }()

      let borderColors: [UIColor] = [
        .red, .systemGreen, .systemGreen ,.systemBlue, .systemBlue,
          .red, .systemGreen, .systemGreen,.systemBlue, .systemBlue,
            .red, .systemGreen, .systemGreen, .systemBlue, .systemBlue
      ]

    func btnLayer(){
          for (btn, color) in zip(buttons, borderColors) {
              btn.layer.borderWidth  = 5
              btn.layer.borderColor  = color.cgColor
              btn.layer.cornerRadius = 10
              btn.clipsToBounds      = true
          }
      }
    

    
    
    /* 선택된 이미지 */
    @IBOutlet weak var selectedImageView1: UIImageView!
    @IBOutlet weak var selectedImageView2: UIImageView!
    @IBOutlet weak var selectedImageView3: UIImageView!
    
    /* 선택된 텍스트 */
    @IBOutlet weak var selectedImageView1Text: UILabel!
    @IBOutlet weak var selectedImageView2Text: UILabel!
    @IBOutlet weak var selectedImageView3Text: UILabel!
    
    /* 버튼 텍스트 */
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var text2: UILabel!
    @IBOutlet weak var text3: UILabel!
    @IBOutlet weak var text4: UILabel!
    @IBOutlet weak var text5: UILabel!
    @IBOutlet weak var text6: UILabel!
    @IBOutlet weak var text7: UILabel!
    @IBOutlet weak var text8: UILabel!
    @IBOutlet weak var text9: UILabel!
    @IBOutlet weak var text10: UILabel!
    @IBOutlet weak var text11: UILabel!
    @IBOutlet weak var text12: UILabel!
    @IBOutlet weak var text13: UILabel!
    @IBOutlet weak var text14: UILabel!
    @IBOutlet weak var text15: UILabel!
    
    func usualtext(){
        text1.text=imageTxtList[1].txt
        text2.text=imageTxtList[2].txt
        text3.text=imageTxtList[3].txt
        text4.text=imageTxtList[4].txt
        text5.text=imageTxtList[5].txt
        text6.text=imageTxtList[6].txt
        text7.text=imageTxtList[7].txt
        text8.text=imageTxtList[8].txt
        text9.text=imageTxtList[9].txt
        text10.text=imageTxtList[10].txt
        text11.text=imageTxtList[11].txt
        text12.text=imageTxtList[12].txt
        text13.text=imageTxtList[13].txt
        text14.text=imageTxtList[14].txt
        text15.text=imageTxtList[15].txt
        
    }
    var recentSize = 0
    var recentSizeMax = 3
    
    
    var imageTxtList = [
        imageTxtTupple(image: "000.png", txt: " "),

        imageTxtTupple(image: "people.png", txt: "사람"),
        imageTxtTupple(image: "subject.png", txt: "과목"),
        imageTxtTupple(image: "place.png", txt: "장소"),
        imageTxtTupple(image: "do.png", txt: "동작"),
        imageTxtTupple(image: "emotion.png", txt: "감정"),
        
            imageTxtTupple(image: "098.png", txt: "나"),
            imageTxtTupple(image: "136.png", txt: "휠체어"),
            imageTxtTupple(image: "object.6png", txt: "사물"),
            imageTxtTupple(image: "169.png", txt: "도와주세요"),
            imageTxtTupple(image: "170.png", txt: "안녕하세요"),
            
            imageTxtTupple(image: "099.png", txt: "선생님"),
            imageTxtTupple(image: "137.png", txt: "화장실"),
            imageTxtTupple(image: "138.png", txt: "약"),
            imageTxtTupple(image: "171.png", txt: "예"),
            imageTxtTupple(image: "172.png", txt: "아니요"),
            
           
        ]

    
    //튜플 최대 사이즈 한계선
    func maxNum(){
        guard recentSize < recentSizeMax else {
               showAlert(message: "최대 개수를 초과했습니다!")
            recentSize = 3
               return
           }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button1 .setImage(UIImage(named: "people.png"),   for: .normal)
            button2 .setImage(UIImage(named: "subject.png"),   for: .normal)
            button3 .setImage(UIImage(named: "place.png"),   for: .normal)
            button4 .setImage(UIImage(named: "do.png"),   for: .normal)
            button5 .setImage(UIImage(named: "emotion.png"),   for: .normal)

            button6 .setImage(UIImage(named: "098.png"),   for: .normal)
            button7 .setImage(UIImage(named: "136.png"),   for: .normal)
            button8 .setImage(UIImage(named: "object.6png"),  for: .normal)
            button9 .setImage(UIImage(named: "169.png"),   for: .normal)
            button10.setImage(UIImage(named: "170.png"),   for: .normal)

            button11.setImage(UIImage(named: "099.png"),   for: .normal)
            button12.setImage(UIImage(named: "137.png"),   for: .normal)
            button13.setImage(UIImage(named: "138.png"),   for: .normal)
            button14.setImage(UIImage(named: "171.png"),   for: .normal)
            button15.setImage(UIImage(named: "172.png"),   for: .normal)
        print("두번째화면")
        btnLayer()
        usualtext()
        updateSelectedImagesAndText()
    }
    
    var selectImageTxtList = [
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
        imageTxtTupple(image: "000.png", txt: " "),
                       
        ]
    
    
    /* ------------선택된 이미지 & 텍스트 업데이트----------*/
    
    // 선택된 이미지뷰&텍스트 업데이트
    func updateSelectedImagesAndText() {
        selectedImageView1.image = selectImageTxtList[0].image
        selectedImageView2.image = selectImageTxtList[1].image
        selectedImageView3.image = selectImageTxtList[2].image
        
        selectedImageView1Text.text = selectImageTxtList[0].txt
        selectedImageView2Text.text = selectImageTxtList[1].txt
        selectedImageView3Text.text = selectImageTxtList[2].txt
    }
    
    //콜백
    var onBack: (([imageTxtTupple], Int) -> Void)?
    
    //--------------범주1--------------------
    
    @IBAction func image1(_ sender: UIButton) {
        print("버튼2눌림-범주1")
        performSegue(withIdentifier: "SchoolAsection", sender: nil)
    }

    @IBAction func Image2(_ sender: UIButton) {
        print("버튼2눌림-범주1")
        performSegue(withIdentifier: "SchoolBsection", sender: nil)
    }
    
    @IBAction func Image3(_ sender: UIButton) {
        print("버튼2눌림-범주1")
        performSegue(withIdentifier: "SchoolCsection", sender: nil)
    }
    
    @IBAction func Image4(_ sender: UIButton) {
        print("버튼2눌림-범주1")
        performSegue(withIdentifier: "SchoolEsection", sender: nil)
    }
    
    @IBAction func Image5(_ sender: UIButton) {
        print("버튼2눌림-범주1")
        performSegue(withIdentifier: "SchoolFsection", sender: nil)
    }
    
    @IBAction func Image8(_ sender: UIButton) {
        print("버튼2눌림-범주1")
        performSegue(withIdentifier: "SchoolDsection", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //A섹션 정보 넘기기,
        if segue.identifier == "SchoolAsection",
           let sAvc = segue.destination as? SchoolAsection {
            sAvc.selectImageTxtList = self.selectImageTxtList
            sAvc.recentSize = self.recentSize
            
            // **핵심**: B → A로 돌아올 때 실행될 클로저 지정
            sAvc.onBack = { [weak self] updatedList, updatedSize in
                guard let self = self else { return }
                self.selectImageTxtList = updatedList
                self.recentSize = updatedSize
                // 필요하면 UI 갱신 호출
                self.updateSelectedImagesAndText()
            }
        }
        
        //B섹션 정보 넘기기,
        if segue.identifier == "SchoolBsection",
           let sBvc = segue.destination as? SchoolBsection {
            sBvc.selectImageTxtList = self.selectImageTxtList
            sBvc.recentSize = self.recentSize
            
            // **핵심**: B → A로 돌아올 때 실행될 클로저 지정
            sBvc.onBack = { [weak self] updatedList, updatedSize in
                guard let self = self else { return }
                self.selectImageTxtList = updatedList
                self.recentSize = updatedSize
                // 필요하면 UI 갱신 호출
                self.updateSelectedImagesAndText()
            }
        }
        
        //C섹션 정보 넘기기
        if segue.identifier == "SchoolCsection",
           let sCvc = segue.destination as? SchoolCsection {
            sCvc.selectImageTxtList = self.selectImageTxtList
            sCvc.recentSize = self.recentSize
            
            // **핵심**: B → A로 돌아올 때 실행될 클로저 지정
            sCvc.onBack = { [weak self] updatedList, updatedSize in
                guard let self = self else { return }
                self.selectImageTxtList = updatedList
                self.recentSize = updatedSize
                // 필요하면 UI 갱신 호출
                self.updateSelectedImagesAndText()
            }
        }
        
        //D섹션 정보 넘기기
        if segue.identifier == "SchoolDsection",
           let sDvc = segue.destination as? SchoolDsection {
            sDvc.selectImageTxtList = self.selectImageTxtList
            sDvc.recentSize = self.recentSize
            
            // **핵심**: B → A로 돌아올 때 실행될 클로저 지정
            sDvc.onBack = { [weak self] updatedList, updatedSize in
                guard let self = self else { return }
                self.selectImageTxtList = updatedList
                self.recentSize = updatedSize
                // 필요하면 UI 갱신 호출
                self.updateSelectedImagesAndText()
            }
        }
        
        //E섹션 정보 넘기기
        if segue.identifier == "SchoolEsection",
           let sEvc = segue.destination as? SchoolEsection {
            sEvc.selectImageTxtList = self.selectImageTxtList
            sEvc.recentSize = self.recentSize
            
            // **핵심**: B → A로 돌아올 때 실행될 클로저 지정
            sEvc.onBack = { [weak self] updatedList, updatedSize in
                guard let self = self else { return }
                self.selectImageTxtList = updatedList
                self.recentSize = updatedSize
                // 필요하면 UI 갱신 호출
                self.updateSelectedImagesAndText()
            }
        }
        //F섹션 정보 넘기기,
        if segue.identifier == "SchoolFsection",
           let sFvc = segue.destination as? SchoolFsection {
            sFvc.selectImageTxtList = self.selectImageTxtList
            sFvc.recentSize = self.recentSize
            
            // **핵심**: B → A로 돌아올 때 실행될 클로저 지정
            sFvc.onBack = { [weak self] updatedList, updatedSize in
                guard let self = self else { return }
                self.selectImageTxtList = updatedList
                self.recentSize = updatedSize
                // 필요하면 UI 갱신 호출
                self.updateSelectedImagesAndText()
            }
        }
    }
    

    @IBAction func Image6(_ sender: UIButton) {
        maxNum()
        selectImageTxtList[recentSize]=imageTxtList[6]
        recentSize+=1
        print("버튼7눌림")
        updateSelectedImagesAndText()
    }
    
    
    
    @IBAction func Image7(_ sender: UIButton) {
        maxNum()
        selectImageTxtList[recentSize]=imageTxtList[7]
        recentSize+=1
        print("버튼7눌림")
        updateSelectedImagesAndText()
    }
    
    @IBAction func Image9(_ sender: UIButton) {
        maxNum()
        selectImageTxtList[recentSize]=imageTxtList[9]
        recentSize+=1
        print("버튼9눌림")
        updateSelectedImagesAndText()
    }
    
    @IBAction func Image10(_ sender: UIButton) {
        maxNum()
        selectImageTxtList[recentSize]=imageTxtList[10]
        recentSize+=1
        print("버튼10눌림")
        updateSelectedImagesAndText()
    }
   
    @IBAction func Image11(_ sender: UIButton) {
        maxNum()
        selectImageTxtList[recentSize]=imageTxtList[11]
        recentSize+=1
        print("버튼11눌림")
        updateSelectedImagesAndText()
    }
    
    @IBAction func Image12(_ sender: UIButton) {
        maxNum()
        selectImageTxtList[recentSize]=imageTxtList[12]
        recentSize+=1
        print("버튼12눌림")
        updateSelectedImagesAndText()
    }
    
    @IBAction func Image13(_ sender: UIButton) {
        maxNum()
        selectImageTxtList[recentSize]=imageTxtList[13]
        recentSize+=1
        print("버튼13눌림")
        updateSelectedImagesAndText()
    }
    
    @IBAction func Image14(_ sender: UIButton) {
        maxNum()
        selectImageTxtList[recentSize]=imageTxtList[14]
        recentSize+=1
        print("버튼14눌림")
        updateSelectedImagesAndText()
    }
    
    @IBAction func Image15(_ sender: UIButton) {
        maxNum()
        selectImageTxtList[recentSize]=imageTxtList[15]
        recentSize+=1
        print("버튼15눌림")
        updateSelectedImagesAndText()
    }
    
    
    
    
    
   /*   recentSizeMax 도달 경고창 (화면에 띄울 수 있는 크기 넘쳤을 경우)    */
    func showAlert(message: String) {
           let alert = UIAlertController(title: "경고", message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "확인", style: .default))
           present(alert, animated: true)
       }
    
    /*-------------초기화 버튼-------------*/
    @IBAction func resetButton(_ sender: Any) {
        recentSize = 0
        
        selectImageTxtList = [
            imageTxtTupple(image: "000.png", txt: " "),
            imageTxtTupple(image: "000.png", txt: " "),
            imageTxtTupple(image: "000.png", txt: " ")
//            imageTxtTupple(image: #imageLiteral(resourceName: "000"), txt: "0번"),
//            imageTxtTupple(image: #imageLiteral(resourceName: "000"), txt: "0번")
            ]
        
        updateSelectedImagesAndText()
    }
    
    /*-----------선택된 그림의 텍스트 읽기-----------*/
    
    @IBAction func readingButtonAction(_ sender: Any) {
        var readingSentence = " "
        for i in 0..<recentSize {
            readingSentence += selectImageTxtList[i].txt
        }
        
        C_TTS.play(readingSentence)
    }

    /*-----------슬라이더로 버튼 크기 설정-----------*/
    
//    @IBAction func settingsSize(_ sender: UISlider) {
//
//    }
//
//

    
    
    @IBAction func back(_ sender: Any) {
           // dismiss 로 호출 해제
           self.presentingViewController?.dismiss(animated: true)
       }
   }



//extension UIImage {
//    func resize(targetSize: CGSize) -> UIImage? {
//        let newRect = CGRect(x: 0, y: 0, width: targetSize.width, height: targetSize.height).integral
//        UIGraphicsBeginImageContextWithOptions(newRect.size, true, 0)
//        guard let context = UIGraphicsGetCurrentContext() else { return nil }
//        context.interpolationQuality = .high
//        draw(in: newRect)
//        let newImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return newImage
//    }
//}

