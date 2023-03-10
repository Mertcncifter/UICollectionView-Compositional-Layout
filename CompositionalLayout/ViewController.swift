//
//  ViewController.swift
//  CompositionalLayout
//
//  Created by mert can çifter on 8.03.2023.
//

import UIKit
import SnapKit
import SDWebImage

class ViewController: UIViewController {

    // MARK: - Properties
        
    private lazy var collectionView = UICollectionView(frame: .zero,collectionViewLayout:
         UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
        
        if sectionNumber == 0 {
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            item.contentInsets.trailing = 2
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            
            section.orthogonalScrollingBehavior = .paging
                        
            section.boundarySupplementaryItems = [
                .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading),
                .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottomLeading)
            ]
            return section
        } else if sectionNumber == 1 {
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(150)))
            item.contentInsets.trailing = 16
            item.contentInsets.bottom = 16
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.leading = 16
            
            section.boundarySupplementaryItems = [
                .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading),
                .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottomLeading)
            ]
            
            return section
        }
        else if sectionNumber == 2 {
            let item = NSCollectionLayoutItem.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            item.contentInsets.trailing = 32
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(125)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            section.contentInsets.leading = 16
            
            section.boundarySupplementaryItems = [
                .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading),
                .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottomLeading)
            ]
            
            return section
        } else {
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(300)))
            item.contentInsets.bottom = 16
            item.contentInsets.trailing = 16
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1000)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 32, leading: 16, bottom: 0, trailing: 0)
            
            section.boundarySupplementaryItems = [
                .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading),
                .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottomLeading)
            ]
            
            
            return section
        }
        
    })
    
    
    private let cellId = "cellId"
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self,
                                forCellWithReuseIdentifier: cellId)
        
        collectionView.register(TrendingMovieCollectionViewCell.self, forCellWithReuseIdentifier: TrendingMovieCollectionViewCell.identifier)
        collectionView.register(TrendingTVCollectionViewCell.self, forCellWithReuseIdentifier: TrendingTVCollectionViewCell.identifier)
        collectionView.register(PopulerCollectionViewCell.self, forCellWithReuseIdentifier: PopulerCollectionViewCell.identifier)
        collectionView.register(UpComingCollectionViewCell.self, forCellWithReuseIdentifier: UpComingCollectionViewCell.identifier)

        
        collectionView.register(TrendingMovieHeaderReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: TrendingMovieHeaderReusableView.identifier)
        collectionView.register(TrendingTVHeaderReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: TrendingTVHeaderReusableView.identifier)
        collectionView.register(PopulerHeaderReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: PopulerHeaderReusableView.identifier)
        collectionView.register(UpComingHeaderReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: UpComingHeaderReusableView.identifier)
        
        collectionView.register(TrendingMovieFooterReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: TrendingMovieFooterReusableView.identifier)
        collectionView.register(TrendingTVFooterReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: TrendingTVFooterReusableView.identifier)
        collectionView.register(PopulerFooterReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: PopulerFooterReusableView.identifier)
        collectionView.register(UpComingFooterReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: UpComingFooterReusableView.identifier)
        
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        
        case UICollectionView.elementKindSectionHeader:
            let section = indexPath.section
            switch section {
            case 0:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TrendingMovieHeaderReusableView.identifier, for: indexPath)
                return header
            case 1:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TrendingTVHeaderReusableView.identifier, for: indexPath)
                return header
            case 2:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PopulerHeaderReusableView.identifier, for: indexPath)
                return header
            case 3:
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: UpComingHeaderReusableView.identifier, for: indexPath)
                return header
            default:
                assert(false, "Unexpected element kind")
            }
            
        case UICollectionView.elementKindSectionFooter:
            let section = indexPath.section
            switch section {
            case 0:
                let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TrendingMovieFooterReusableView.identifier, for: indexPath)
                return footer
            case 1:
                let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TrendingTVFooterReusableView.identifier, for: indexPath)
                return footer
            case 2:
                let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PopulerFooterReusableView.identifier, for: indexPath)
                return footer
            case 3:
                let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: UpComingFooterReusableView.identifier, for: indexPath)
                return footer
            default:
                assert(false, "Unexpected element kind")
            }
            
        default:
            assert(false, "Unexpected element kind")
        }
        
    }
        
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = indexPath.section
        
        if section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendingMovieCollectionViewCell.identifier, for: indexPath) as? TrendingMovieCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        } else if section == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendingTVCollectionViewCell.identifier, for: indexPath) as? TrendingTVCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        } else if section == 2 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopulerCollectionViewCell.identifier, for: indexPath) as? PopulerCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpComingCollectionViewCell.identifier, for: indexPath) as? UpComingCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        }
    }
}


class TrendingMovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: TrendingMovieCollectionViewCell.self)


    // MARK: - Properties
        
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
}

extension TrendingMovieCollectionViewCell {
    func configureSubviews() {
        var randomInt = Int.random(in: 0..<100)
        imageView.sd_setImage(with: URL(string: "https://source.unsplash.com/random/200x200?sig=\(randomInt)"))
        
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.right.equalTo(contentView.snp.right)
            make.left.equalTo(contentView.snp.left)
            make.bottom.equalTo(contentView.snp.bottom)
        }

    }
}

class TrendingMovieHeaderReusableView: UICollectionReusableView {
    
    static let identifier = "TrendingMovieHeaderReusableView"

    let label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.text = "Trending Movies Header"
        
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class TrendingMovieFooterReusableView: UICollectionReusableView {
    
    static let identifier = "TrendingMovieFooterReusableView"

    let label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.text = "Trending Movies Footer"
        
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class TrendingTVCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: TrendingTVCollectionViewCell.self)


    // MARK: - Properties
        
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TrendingTVCollectionViewCell {
    func configureSubviews() {
        let randomInt = Int.random(in: 0..<100)

        imageView.sd_setImage(with: URL(string: "https://source.unsplash.com/random/200x200?sig=\(randomInt)"))

        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.right.equalTo(contentView.snp.right)
            make.left.equalTo(contentView.snp.left)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
}


class TrendingTVHeaderReusableView: UICollectionReusableView {
    
    static let identifier = "TrendingTVHeaderReusableView"

    let label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.text = "Trending TV Header"
        
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class TrendingTVFooterReusableView: UICollectionReusableView {
    
    static let identifier = "TrendingTVFooterReusableView"

    let label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.text = "Trending TV Footer"
        
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class PopulerCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: PopulerCollectionViewCell.self)


    // MARK: - Properties
        
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
}

extension PopulerCollectionViewCell {
    func configureSubviews() {
        var randomInt = Int.random(in: 0..<100)
        imageView.sd_setImage(with: URL(string: "https://source.unsplash.com/random/200x200?sig=\(randomInt)"))
        
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.right.equalTo(contentView.snp.right)
            make.left.equalTo(contentView.snp.left)
            make.bottom.equalTo(contentView.snp.bottom)
        }

    }
}

class PopulerHeaderReusableView: UICollectionReusableView {
    
    static let identifier = "PopulerHeaderReusableView"

    let label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.text = "Populer Header"
        
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class PopulerFooterReusableView: UICollectionReusableView {
    
    static let identifier = "PopulerFooterReusableView"

    let label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.text = "Populer Footer"
        
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class UpComingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: UpComingCollectionViewCell.self)


    // MARK: - Properties
        
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
}

extension UpComingCollectionViewCell {
    func configureSubviews() {
        var randomInt = Int.random(in: 0..<100)
        imageView.sd_setImage(with: URL(string: "https://source.unsplash.com/random/200x200?sig=\(randomInt)"))
        
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.right.equalTo(contentView.snp.right)
            make.left.equalTo(contentView.snp.left)
            make.bottom.equalTo(contentView.snp.bottom)
        }

    }
}

class UpComingHeaderReusableView: UICollectionReusableView {
    
    static let identifier = "UpComingHeaderReusableView"

    let label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.text = "UpComing Header"
        
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class UpComingFooterReusableView: UICollectionReusableView {
    
    static let identifier = "UpComingFooterReusableView"

    let label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.text = "UpComing Footer"
        
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
