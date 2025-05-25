import UIKit
import SnapKit

import AVFoundation

@available(iOS 15.0, *)
class Csection: UIViewController {
    
var selectImageTxtList : [imageTxtTupple] = []

var bmiNumber: String?
var recentSize = 0
var recentSizeMax = 3


/** -------------------선택된 상징 (상단칸)----------------**/
func updateSelectedImagesAndText() {
    selectedImageView1.image = selectImageTxtList[0].image
    selectedImageView2.image = selectImageTxtList[1].image
    selectedImageView3.image = selectImageTxtList[2].image
    
    selectedImageView1Text.text = selectImageTxtList[0].txt
    selectedImageView2Text.text = selectImageTxtList[1].txt
    selectedImageView3Text.text = selectImageTxtList[2].txt
}

@IBOutlet weak var selectedImageView1: UIImageView!
@IBOutlet weak var selectedImageView2: UIImageView!
@IBOutlet weak var selectedImageView3: UIImageView!
@IBOutlet weak var selectedImageView1Text: UILabel!
@IBOutlet weak var selectedImageView2Text: UILabel!
@IBOutlet weak var selectedImageView3Text: UILabel!



override func viewDidLoad() {
    super.viewDidLoad()
    updateSelectedImagesAndText()
    btnLayer()
    usualtext()
}


/*-------------초기화 버튼-------------*/

@IBAction func resetButton(_ sender: Any) {
    recentSize = 0
    
    selectImageTxtList[0].image = #imageLiteral(resourceName: "000")
    selectImageTxtList[1].image = #imageLiteral(resourceName: "000")
    selectImageTxtList[2].image = #imageLiteral(resourceName: "000")
    selectImageTxtList[0].txt = "0번"
    selectImageTxtList[1].txt = "0번"
    selectImageTxtList[2].txt = "0번"
    
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

// Asection이 설정해 줄 콜백
var onBack: (([imageTxtTupple], Int) -> Void)?


@IBAction func back(_ sender: Any) {
    onBack?(selectImageTxtList, recentSize)
    // 2) 화면 닫기
    dismiss(animated: true)
}

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "Csection",
       let bvc = segue.destination as? Csection {
        bvc.selectImageTxtList = self.selectImageTxtList
        bvc.recentSize = self.recentSize
    }
}


//튜플 최대 사이즈 한계선
func maxNum(){
    guard recentSize < recentSizeMax else {
        showAlert(message: "최대 개수를 초과했습니다!")
        recentSize = 2
        return
    }
}

func showAlert(message: String) {
    let alert = UIAlertController(title: "경고", message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "확인", style: .default))
    present(alert, animated: true)
}








/** ---------------------------나열된 상징들 (하단 칸)-----------------------*/

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


// 개별 아웃렛을 모아서 배열로
lazy var buttons: [UIButton] = {
    return [
        button1, button2, button3, button4, button5,
        button6, button7, button8, button9, button10,
        button11, button12, button13, button14, button15
    ]
}()

let borderColors: [UIColor] = [
    .red, .yellow, .systemGreen ,.systemGreen,.purple,
    .red, .yellow, .systemGreen,.systemGreen,.purple, .red, .yellow, .systemGreen,.systemGreen,.purple
]

func btnLayer(){
    for (btn, color) in zip(buttons, borderColors) {
        btn.layer.borderWidth  = 5
        btn.layer.borderColor  = color.cgColor
        btn.layer.cornerRadius = 10
        btn.clipsToBounds      = true
    }
}





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



var imageTxtList = [
    imageTxtTupple(image: #imageLiteral(resourceName: "000"), txt: "0번"),
    imageTxtTupple(image: #imageLiteral(resourceName: "001"), txt: "1번"),
    imageTxtTupple(image: #imageLiteral(resourceName: "003"), txt: "3번"),
    imageTxtTupple(image: #imageLiteral(resourceName: "004"), txt: "3번"),
    imageTxtTupple(image: #imageLiteral(resourceName: "005"), txt: "1번"),
    imageTxtTupple(image: #imageLiteral(resourceName: "006"), txt: "1번"),
    imageTxtTupple(image: #imageLiteral(resourceName: "007"), txt: "3번"),
    imageTxtTupple(image: #imageLiteral(resourceName: "008"), txt: "3번"),
    imageTxtTupple(image: #imageLiteral(resourceName: "009"), txt: "1번"),
    imageTxtTupple(image: #imageLiteral(resourceName: "001"), txt: "1번"),
    imageTxtTupple(image: #imageLiteral(resourceName: "001"), txt: "3번"),
    imageTxtTupple(image: #imageLiteral(resourceName: "001"), txt: "3번"),
    imageTxtTupple(image: #imageLiteral(resourceName: "001"), txt: "1번"),
    imageTxtTupple(image: #imageLiteral(resourceName: "001"), txt: "3번"),
    imageTxtTupple(image: #imageLiteral(resourceName: "001"), txt: "3번"),
    imageTxtTupple(image: #imageLiteral(resourceName: "001"), txt: "3번"),
]



/* ------------선택된 이미지 & 텍스트 업데이트----------*/


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
    maxNum()
    selectImageTxtList[recentSize]=imageTxtList[5]
    recentSize+=1
    print("버튼5눌림")
    updateSelectedImagesAndText()
}


@IBAction func Image6(_ sender: UIButton) {

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


///* TTS 음성 재생 클래스 */
//class C_TTS {
//
//static let speech = AVSpeechSynthesizer()
//
//static func play(_ string: String){
//    print("TTS 음성 재생 실행")
//    print("읽는 문장: \(string)")
//
//    let utterance = AVSpeechUtterance(string: string)
//    utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
//    utterance.voice = AVSpeechSynthesisVoice(identifier: "Yuna")
//    utterance.rate = 0.5
//    utterance.pitchMultiplier = 0.8
//    speech.speak(utterance)
//
//    try? AVAudioSession.sharedInstance().setCategory(.playback, options: .allowBluetooth)
//}
//


}
