import UIKit

//Usage
tableView.prefetchDataSource = self

//In UITableViewDataSourcePrefetching
extension VC: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        //페이지가 1일때는 필요 없으니
        //2페이지부터 실행되도록 빠른 탈출 구문을 넣었다.
        guard self.currentPage != 1 else { return }
        
        //indexPaths는 다음에 불러올 Cell의 인덱스 값을 가지고 있다.
        //예를 들어 현재 6번째 Cell이 보여지고 있다면, indexPaths는 16,17,18...
        indexPaths.forEach({
            //미리 불러오는 값이 2페이지라면
            //2페이지에 대한 내용을 다시 네트워크 요청한다.
            if ($0.row + 1)/25 + 1 == self.currentPage {
                self.fetchBeers(of: self.currentPage)
            }
        })
    }
}
