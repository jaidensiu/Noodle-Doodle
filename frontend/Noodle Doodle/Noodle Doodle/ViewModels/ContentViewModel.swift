import Foundation
import Alamofire

class ContentViewModel: ObservableObject {
    @Published var posts: [Post] = []

    func fetchPostsAndCookRamen() {
        AF.request("http://10.19.135.185:5000/cook-ramen")
            .responseDecodable(of: [Post].self) { response in
                switch response.result {
                case .success(let posts):
                    self.posts = posts
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
