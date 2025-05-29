
import UIKit
import SnapKit

import AVFoundation

@available(iOS 15.0, *)
class Esection: UIViewController {
    
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

        button1 .setImage(UIImage(named: "049.png"), for: .normal)  // 주세요
            button2 .setImage(UIImage(named: "050.png"), for: .normal)  // 가요
            button3 .setImage(UIImage(named: "051.png"), for: .normal)  // 일어나요
            button4 .setImage(UIImage(named: "052.png"), for: .normal)  // 앉아요
            button5 .setImage(UIImage(named: "053.png"), for: .normal)  // 누워요
            button6 .setImage(UIImage(named: "054.png"), for: .normal)  // 켜다
            button7 .setImage(UIImage(named: "055.png"), for: .normal)  // 끄다
            button8 .setImage(UIImage(named: "056.png"), for: .normal)  // 얼마예요
            button9 .setImage(UIImage(named: "057.png"), for: .normal)  // 먹어요
            button10.setImage(UIImage(named: "058.png"), for: .normal)  // 그만할래요
            button11.setImage(UIImage(named: "059.png"), for: .normal)  // 입어요
            button12.setImage(UIImage(named: "060.png"), for: .normal)  // 벗어요
            button13.setImage(UIImage(named: "061.png"), for: .normal)  // 씻어요
            button14.setImage(UIImage(named: "062.png"), for: .normal)  // 열어요
            button15.setImage(UIImage(named: "063.png"), for: .normal)  // 닫아요
        

        updateSelectedImagesAndText()
        btnLayer()
        usualtext()
    }
    
    
    /*-------------초기화 버튼-------------*/
    
    @IBAction func resetButton(_ sender: Any) {
        recentSize = 0
        
        selectImageTxtList[0].image =  UIImage(named: "000.png")!
        selectImageTxtList[1].image =  UIImage(named: "000.png")!
        selectImageTxtList[2].image =  UIImage(named: "000.png")!
        selectImageTxtList[0].txt = " "
        selectImageTxtList[1].txt = " "
        selectImageTxtList[2].txt = " "
        
        updateSelectedImagesAndText()
    }
    
    
    /*-----------선택된 그림의 텍스트 읽기-----------*/
    
    @IBAction func readingButtonAction(_ sender: Any) {
        var readingSentence = " "
        for i in 0..<3 {
            readingSentence += selectImageTxtList[i].txt
            readingSentence += "        "
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
        if segue.identifier == "Esection",
           let bvc = segue.destination as? Bsection {
            bvc.selectImageTxtList = self.selectImageTxtList
            bvc.recentSize = self.recentSize
        }
    }
    
    
    //튜플 최대 사이즈 한계선
    func maxNum(){
        guard recentSize < recentSizeMax else {
            showAlert(message: "최대 개수를 초과했습니다!")
            recentSize = 3
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
    
    
    // 1) 개별 아웃렛을 모아서 배열로
    lazy var buttons: [UIButton] = {
        return [
            button1, button2, button3, button4, button5,
            button6, button7, button8, button9, button10,
            button11, button12, button13, button14, button15
        ]
    }()
    
    let borderColors: [UIColor] = [
        .systemBlue,.systemBlue,.systemBlue,.systemBlue,.systemBlue,
        .systemBlue,.systemBlue,.systemBlue,.systemBlue,.systemBlue,
        .systemBlue,.systemBlue,.systemBlue,.systemBlue,.systemBlue
    ]
    
    func btnLayer(){
        for (btn, color) in zip(buttons, borderColors) {
            btn.layer.borderWidth  = 5
            btn.layer.borderColor  = color.cgColor
            btn.layer.cornerRadius = 10
            btn.clipsToBounds      = true
            btn.backgroundColor = .white
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
        imageTxtTupple(image: "000.png", txt: ""),
        imageTxtTupple(image: "049.png", txt: "주세요"),
        imageTxtTupple(image: "050.png", txt: "가요"),
        imageTxtTupple(image: "051.png", txt: "일어나요"),
        imageTxtTupple(image: "052.png", txt: "앉아요"),
        imageTxtTupple(image: "053.png", txt: "누워요"),
        imageTxtTupple(image: "054.png", txt: "켜다"),
        imageTxtTupple(image: "055.png", txt: "끄다"),
        imageTxtTupple(image: "056.png", txt: "얼마예요"),
        imageTxtTupple(image: "057.png", txt: "먹어요"),
        imageTxtTupple(image: "058.png", txt: "그만할래요"),
        imageTxtTupple(image: "059.png", txt: "입어요"),
        imageTxtTupple(image: "060.png", txt: "벗어요"),
        imageTxtTupple(image: "061.png", txt: "씻어요"),
        imageTxtTupple(image: "062.png", txt: "열어요"),
        imageTxtTupple(image: "063.png", txt: "닫아요"),
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
        print(recentSize)
        updateSelectedImagesAndText()
    }
    
    @IBAction func Image5(_ sender: UIButton) {
        maxNum()
        selectImageTxtList[recentSize]=imageTxtList[5]
        recentSize+=1
        print("버튼5눌림")
        print(recentSize)
        updateSelectedImagesAndText()
    }
    

    @IBAction func Image6(_ sender: UIButton) {
  
        maxNum()
        selectImageTxtList[recentSize]=imageTxtList[6]
        recentSize+=1
        print("버튼6눌림")
        print(recentSize)
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
