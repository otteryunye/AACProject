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
class Asection: UIViewController {
    
    let button = UIButton(type: .system)
    var buttonWidth: CGFloat = 100  // 버튼 크기 저장 변수
    let slider = UISlider()

    
//    func setupButton(){
//        print("버튼 들어왓슈~~~~~~~~~~~")
//        print(buttonWidth)
//        print("버튼 들어왓슈~~~~~~~~~~~")
//        button.setTitle("크기 변경", for: .normal)
//               button.backgroundColor = .systemBlue
//               button.setTitleColor(.white, for: .normal)
//               button.layer.cornerRadius = 10
//               view.addSubview(button)
//
//               button.translatesAutoresizingMaskIntoConstraints = false
//               NSLayoutConstraint.activate([
//                   button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                   button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//                   button.widthAnchor.constraint(equalToConstant: buttonWidth),
//                   button.heightAnchor.constraint(equalToConstant: buttonWidth)
//               ])
//
//           }
////
//    func setupSlider() {
//            slider.minimumValue = 100
//            slider.maximumValue = 300
//            slider.value = Float(buttonWidth)
//            slider.addTarget(self, action: #selector(settingsSize(_:)), for: .valueChanged)
//            view.addSubview(slider)
//            
//            slider.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([
//                slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                slider.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 30),
//                slider.widthAnchor.constraint(equalToConstant: 300)
//            ])
//        }
//
//            
        

//버튼 화면 띄우기//
    
    /* 선택된 이미지 */
    @IBOutlet weak var selectedImageView1: UIImageView!
    @IBOutlet weak var selectedImageView2: UIImageView!
    @IBOutlet weak var selectedImageView3: UIImageView!
    @IBOutlet weak var selectedImageView4: UIImageView!
    @IBOutlet weak var selectedImageView5: UIImageView!
    
    /* 선택된 텍스트 */
    @IBOutlet weak var selectedImageView1Text: UILabel!
    @IBOutlet weak var selectedImageView2Text: UILabel!
    @IBOutlet weak var selectedImageView3Text: UILabel!
    @IBOutlet weak var selectedImageView4Text: UILabel!
    @IBOutlet weak var selectedImageView5Text: UILabel!
    
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
        
    }
    /* 이미지 & 텍스트 튜플 */
    //이미지 배열
//    var sectionAimages : [UIImage] = [#imageLiteral(resourceName: "000"), #imageLiteral(resourceName: "001"), #imageLiteral(resourceName: "002"), #imageLiteral(resourceName: "003"), #imageLiteral(resourceName: "004"), #imageLiteral(resourceName: "005"), #imageLiteral(resourceName: "006"), #imageLiteral(resourceName: "007"), #imageLiteral(resourceName: "008")]
    var recentSize = 0
    var recentSizeMax = 4
    
    //튜플
    struct imageTxtTupple {
        var image : UIImage
        var txt: String
    }
    
    var imageTxtList = [
        imageTxtTupple(image: #imageLiteral(resourceName: "000"), txt: "0번"),
        imageTxtTupple(image: #imageLiteral(resourceName: "001"), txt: "1번"),
        imageTxtTupple(image: #imageLiteral(resourceName: "002"), txt: "2번"),
        imageTxtTupple(image: #imageLiteral(resourceName: "003"), txt: "3번"),
        imageTxtTupple(image: #imageLiteral(resourceName: "004"), txt: "4번"),
        imageTxtTupple(image: #imageLiteral(resourceName: "005"), txt: "5번"),
        imageTxtTupple(image: #imageLiteral(resourceName: "006"), txt: "6번"),
        imageTxtTupple(image: #imageLiteral(resourceName: "007"), txt: "7번"),
        imageTxtTupple(image: #imageLiteral(resourceName: "008"), txt: "8번"),
        imageTxtTupple(image: #imageLiteral(resourceName: "009"), txt: "9번"),
        imageTxtTupple(image: #imageLiteral(resourceName: "010"), txt: "10번")
    ]
    
    //튜플 최대 사이즈 한계선
    func maxNum(){
        guard recentSize < recentSizeMax else {
               showAlert(message: "최대 개수를 초과했습니다!")
               return
           }
    }
    
    

//    @objc func sliderValueChanged(_ sender: UISlider) {
//           buttonWidth = CGFloat(sender.value)  // 현재 크기 저장
//           button.frame.size.width = buttonWidth
//       }
//        self.view.addSubview(nextButton)
//
//        nextButton.translatesAutoresizingMaskIntoConstraints = false
//
//
//        nextButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        nextButton.widthAnchor.constraint(equalToConstant: CGFloat(settingSizeValue)).isActive = true
//        nextButton.heightAnchor.constraint(equalToConstant: CGFloat(settingSizeValue)).isActive = true
//        nextButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
   
    
    /* 실행시 이미지, txt 값 넣기 */
//    func firstViewDidLoadBase(){
//        image1.image=sectionAimages[0]
//    }
//
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("두번째화면")
        usualtext()
        updateSelectedImagesAndText()
        

//        setupSlider()
//        setupButton()
        
    }
    var selectImageTxtList = [
        imageTxtTupple(image: #imageLiteral(resourceName: "000"), txt: "0번"),
        imageTxtTupple(image: #imageLiteral(resourceName: "000"), txt: "0번"),
        imageTxtTupple(image: #imageLiteral(resourceName: "000"), txt: "0번"),
        imageTxtTupple(image: #imageLiteral(resourceName: "000"), txt: "0번"),
        imageTxtTupple(image: #imageLiteral(resourceName: "000"), txt: "0번")
        ]
    
    
    /* ------------선택된 이미지 & 텍스트 업데이트----------*/
    
    // 선택된 이미지뷰&텍스트 업데이트
    func updateSelectedImagesAndText() {
        selectedImageView1.image = selectImageTxtList[0].image
        selectedImageView2.image = selectImageTxtList[1].image
        selectedImageView3.image = selectImageTxtList[2].image
        selectedImageView4.image = selectImageTxtList[3].image
        selectedImageView5.image = selectImageTxtList[4].image

        selectedImageView1Text.text = selectImageTxtList[0].txt
        selectedImageView2Text.text = selectImageTxtList[1].txt
        selectedImageView3Text.text = selectImageTxtList[2].txt
        selectedImageView4Text.text = selectImageTxtList[3].txt
        selectedImageView5Text.text = selectImageTxtList[4].txt
    }
    
    @IBAction func image1(_ sender: UIButton) {
        maxNum()
        selectImageTxtList[recentSize]=imageTxtList[1]
        recentSize+=1
        print("버튼1눌림")
        updateSelectedImagesAndText()
    }
    
    @IBAction func Image2(_ sender: UIButton) {
        maxNum()
        selectImageTxtList[recentSize]=imageTxtList[2]
        recentSize+=1
        print("버튼2눌림")
        updateSelectedImagesAndText()
    }
    
    @IBAction func Image3(_ sender: UIButton) {
        maxNum()
        selectImageTxtList[recentSize]=imageTxtList[3]
        recentSize+=1
        print("버튼3눌림")
        updateSelectedImagesAndText()
    }
    
    @IBAction func Image4(_ sender: UIButton) {
        maxNum()
        selectImageTxtList[recentSize]=imageTxtList[4]
        recentSize+=1
        print("버튼4눌림")
        updateSelectedImagesAndText()
    }
    
    
    @IBAction func Image5(_ sender: UIButton) {
//        sender.frame.size.width = buttonWidth
        maxNum()
        selectImageTxtList[recentSize]=imageTxtList[5]
        recentSize+=1
        print("버튼5눌림")
        updateSelectedImagesAndText()
    }
    
    @IBAction func Image6(_ sender: UIButton) {
        sender.frame.size.width = buttonWidth
        maxNum()
        selectImageTxtList[recentSize]=imageTxtList[6]
        recentSize+=1
        print("버튼6눌림")
        updateSelectedImagesAndText()
    }
    
    @IBAction func Image7(_ sender: UIButton) {
        maxNum()
        selectImageTxtList[recentSize]=imageTxtList[7]
        recentSize+=1
        print("버튼7눌림")
        updateSelectedImagesAndText()
    }
    
    @IBAction func Image8(_ sender: UIButton) {
        maxNum()
        selectImageTxtList[recentSize]=imageTxtList[8]
        recentSize+=1
        print("버튼8눌림")
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
    
    
   /*   recentSizeMax 도달 경고창 (화면에 띄울 수 있는 크기 넘쳤을 경우)    */
//    func showAlert(message: String) {
//        if let vc = UIApplication.shared.connectedScenes.compactMap({ ($0 as? UIWindowScene)?.keyWindow?.rootViewController }).first {
//            let alert = UIAlertController(title: "경고", message: message, preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "확인", style: .default))
//            vc.present(alert, animated: true)
//        }
//    }
    func showAlert(message: String) {
           let alert = UIAlertController(title: "경고", message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "확인", style: .default))
           present(alert, animated: true)
       }
    
    /*-------------초기화 버튼-------------*/
    @IBAction func resetButton(_ sender: Any) {
        recentSize = 0
        
        selectImageTxtList = [
            imageTxtTupple(image: #imageLiteral(resourceName: "000"), txt: "0번"),
            imageTxtTupple(image: #imageLiteral(resourceName: "000"), txt: "0번"),
            imageTxtTupple(image: #imageLiteral(resourceName: "000"), txt: "0번"),
            imageTxtTupple(image: #imageLiteral(resourceName: "000"), txt: "0번"),
            imageTxtTupple(image: #imageLiteral(resourceName: "000"), txt: "0번")
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


/* TTS 음성 재생 클래스 */
class C_TTS {

    static let speech = AVSpeechSynthesizer()
    
    static func play(_ string: String){
        print("TTS 음성 재생 실행")
        print("읽는 문장: \(string)")
        
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        utterance.voice = AVSpeechSynthesisVoice(identifier: "Yuna")
        utterance.rate = 0.5
        utterance.pitchMultiplier = 0.8
        speech.speak(utterance)
        
        try? AVAudioSession.sharedInstance().setCategory(.playback, options: .allowBluetooth)
    }

}
