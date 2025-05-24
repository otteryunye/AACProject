
import UIKit
import SnapKit

import AVFoundation

@available(iOS 15.0, *)
class Bsection: UIViewController {
    
    var selectImageTxtList : [Asection.imageTxtTupple] = []
    
    var bmiNumber: String?
    var recentSize = 0
    var recentSizeMax = 2
    
    func updateSelectedImagesAndText() {
        selectedImageView1.image = selectImageTxtList[0].image
        selectedImageView2.image = selectImageTxtList[1].image
        selectedImageView3.image = selectImageTxtList[2].image
//        selectedImageView4.image = selectImageTxtList[3].image
//        selectedImageView5.image = selectImageTxtList[4].image

        selectedImageView1Text.text = selectImageTxtList[0].txt
        selectedImageView2Text.text = selectImageTxtList[1].txt
        selectedImageView3Text.text = selectImageTxtList[2].txt
//        selectedImageView4Text.text = selectImageTxtList[3].txt
//        selectedImageView5Text.text = selectImageTxtList[4].txt
    }
    
    @IBOutlet weak var texttext: UILabel!
    

    
    @IBOutlet weak var selectedImageView1: UIImageView!
    @IBOutlet weak var selectedImageView2: UIImageView!
    @IBOutlet weak var selectedImageView3: UIImageView!
    @IBOutlet weak var selectedImageView1Text: UILabel!
    @IBOutlet weak var selectedImageView2Text: UILabel!
    @IBOutlet weak var selectedImageView3Text: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSelectedImagesAndText()
        print("두번째화면")
        guard let bmi = bmiNumber else {return}
        texttext.text = String(bmi)
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
    var onBack: (([Asection.imageTxtTupple], Int) -> Void)?
     
    
    @IBAction func back(_ sender: Any) {
        onBack?(selectImageTxtList, recentSize)
        // 2) 화면 닫기
        dismiss(animated: true)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Bsection",
            let bvc = segue.destination as? Bsection {
            bvc.selectImageTxtList = self.selectImageTxtList
            bvc.recentSize = self.recentSize
         }
    }
    
    
    //튜플 최대 사이즈 한계선
    func maxNum(){
        guard recentSize < recentSizeMax else {
               showAlert(message: "최대 개수를 초과했습니다!")
               return
           }
    }
    func showAlert(message: String) {
           let alert = UIAlertController(title: "경고", message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "확인", style: .default))
           present(alert, animated: true)
       }
    
    
    
    
    
}




    //
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
    

