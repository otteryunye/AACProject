//
//  ViewController.swift
//  AACProject
//
//  Created by 윤예원 on 1/25/25.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

//버튼 화면 띄우기//
    
    /* 이미지 */
    @IBOutlet weak var selectedImageView1: UIImageView!
    
    @IBOutlet weak var selectedImageView2: UIImageView!
    
    @IBOutlet weak var selectedImageView3: UIImageView!
    
    @IBOutlet weak var selectedImageView4: UIImageView!
    
    /* 텍스트 */
    @IBOutlet weak var selectedImageView1Text: UILabel!
    
    @IBOutlet weak var selectedImageView2Text: UILabel!
    
    @IBOutlet weak var selectedImageView3Text: UILabel!
    
    @IBOutlet weak var selectedImageView4Text: UILabel!
    
    
    /* 이미지 & 텍스트 튜플 */
    //이미지 배열
    var sectionAimages : [UIImage] = [#imageLiteral(resourceName: "000"), #imageLiteral(resourceName: "001"), #imageLiteral(resourceName: "002"), #imageLiteral(resourceName: "003"), #imageLiteral(resourceName: "004"), #imageLiteral(resourceName: "005"), #imageLiteral(resourceName: "006"), #imageLiteral(resourceName: "007"), #imageLiteral(resourceName: "008")]
    var recentSize = 0
    var recentSizeMax = 4
    
    //튜플
    struct imageTxtTupple {
        var image : Int
        var txt: String
    }

    var imageTxtList = [
     imageTxtTupple(image: 0, txt: " "),
     imageTxtTupple(image: 0, txt: " "),
     imageTxtTupple(image: 0, txt: " "),
     imageTxtTupple(image: 0, txt: " ")
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("첫화면")
        updateSelectedImages()
        updateSelectedImagesTxt()
       
    }
    
    
    
    /* ------------선택된 이미지 & 텍스트 업데이트----------*/
    
    // 선택된 이미지뷰 업데이트
    func updateSelectedImages() {
        selectedImageView1.image = sectionAimages[imageTxtList[0].image]
        selectedImageView2.image = sectionAimages[imageTxtList[1].image]
        selectedImageView3.image = sectionAimages[imageTxtList[2].image]
        selectedImageView4.image = sectionAimages[imageTxtList[3].image]
    }
    // 선택된 이미지뷰의 텍스트 업데이트
    func updateSelectedImagesTxt() {
        selectedImageView1Text.text = imageTxtList[0].txt
        selectedImageView2Text.text = imageTxtList[1].txt
        selectedImageView3Text.text = imageTxtList[2].txt
        selectedImageView4Text.text = imageTxtList[3].txt
    }
    
    
    
    
    @IBAction func Image1(_ sender: UIButton) {
        guard recentSize < recentSizeMax else {
               showAlert(message: "최대 개수를 초과했습니다!")
               return
           }
        
        var txt = "1번텍스트"
        imageTxtList[recentSize]=imageTxtTupple(image: 1, txt: txt)
        recentSize+=1
        print("버튼1눌림")
        updateSelectedImages()
        updateSelectedImagesTxt()
    }
    
    @IBAction func Image2(_ sender: UIButton) {
        guard recentSize < recentSizeMax else {
               showAlert(message: "최대 개수를 초과했습니다!")
               return
           }
        
        var txt = "2번텍스트"
        imageTxtList[recentSize]=imageTxtTupple(image: 2, txt: txt)
        recentSize+=1
        print("버튼2눌림")
        updateSelectedImages()
        updateSelectedImagesTxt()
    }
    
    @IBAction func Image3(_ sender: UIButton) {
        guard recentSize < recentSizeMax else {
               showAlert(message: "최대 개수를 초과했습니다!")
               return
           }
        
        var txt = "3번텍스트"
        imageTxtList[recentSize]=imageTxtTupple(image: 3, txt: txt)
        recentSize+=1
        print("버튼3눌림")
        updateSelectedImages()
        updateSelectedImagesTxt()
    }
    
    @IBAction func Image4(_ sender: UIButton) {
        guard recentSize < recentSizeMax else {
               showAlert(message: "최대 개수를 초과했습니다!")
               return
           }
        
        var txt = "4번텍스트"
        imageTxtList[recentSize]=imageTxtTupple(image: 4, txt: txt)
        recentSize+=1
        print("버튼4눌림")
        updateSelectedImages()
        updateSelectedImagesTxt()
    }
    
   /*   recentSizeMax 도달 경고창 (화면에 띄울 수 있는 크기 넘쳤을 경우)    */
    func showAlert(message: String) {
        if let vc = UIApplication.shared.connectedScenes.compactMap({ ($0 as? UIWindowScene)?.keyWindow?.rootViewController }).first {
            let alert = UIAlertController(title: "경고", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            vc.present(alert, animated: true)
        }
    }
    
    
    /*-------------초기화 버튼-------------*/
    @IBAction func resetButton(_ sender: Any) {
        recentSize = 0
        
        imageTxtList = [
         imageTxtTupple(image: 0, txt: " "),
         imageTxtTupple(image: 0, txt: " "),
         imageTxtTupple(image: 0, txt: " "),
         imageTxtTupple(image: 0, txt: " ")
        ]
        
        updateSelectedImages()
        updateSelectedImagesTxt()
    }
    
    /*-----------선택된 그림의 텍스트 읽기-----------*/
    
    @IBAction func readingButtonAction(_ sender: Any) {
        var readingSentence = " "
        for i in 0..<recentSize {
            readingSentence += imageTxtList[i].txt
        }
        
        C_TTS.play(readingSentence)
    }

    
}

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


