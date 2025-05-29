
import UIKit
import AVFoundation

@available(iOS 15.0, *)
class ViewController: UIViewController {
    
    var audioPlayer : AVPlayer!
    

    @IBAction func moveNext(_ sender: Any) {
        // 이동할 뷰 컨트롤러 객체를 StoryBoardID 정보를 이용하여 참조
        let uvc = self.storyboard!.instantiateViewController(withIdentifier: "Asection")
        
        // 화면 전환할 때의 애니메이션 타입
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        //전체화면
        uvc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        // 인자값으로 뷰 컨트롤러 인스턴스를 넣고 프레젠트 메소드 호출
        self.present(uvc, animated: true)
    }
    
    @IBAction func moveNextToSchool(_ sender: Any) {
        // 이동할 뷰 컨트롤러 객체를 StoryBoardID 정보를 이용하여 참조
        let schoolvc = self.storyboard!.instantiateViewController(withIdentifier: "SchoolSection")
        
        // 화면 전환할 때의 애니메이션 타입
        schoolvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        //전체화면
        schoolvc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        // 인자값으로 뷰 컨트롤러 인스턴스를 넣고 프레젠트 메소드 호출
        self.present(schoolvc, animated: true)
    }

    @IBAction func audio(_ sender: Any) {
        guard let url = Bundle.main.url(forResource: "voice", withExtension: "mp3") else {
                   print("error to get the mp3 file")
                   return
               }
               do {
                   audioPlayer = try AVPlayer(url: url)
               } catch {
                   print("audio file error")
               }
               audioPlayer?.play()
    }

    
}

