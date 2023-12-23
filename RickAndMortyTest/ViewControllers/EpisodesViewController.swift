//
//  EpisodesViewController.swift
//  RickAndMortyTest
//
//  Created by mac on 10.12.2023.
//
//

import UIKit

class EpisodesViewController: UIViewController {

    // MARK: - Properties
    private let netvorkManager = NetworkManager.shared
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var results = [Episode]()
    private var rickAndMorty: RickAndMorty?
    private var rickAndMortyCharacter:  RickAndMorty?
    private var episodes: String?

   
    var character: Character!
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        setupView() // - вызов UI
        setupBinding() // - вызов логики
        fetchCharacterData(from: RickAndMortyAPI.baseURL.url)
        //fetchData(from: RickAndMortyAPI.episodeURL.url)
        setupNavigationBar()
        
        if let navigationController = navigationController {
            print("EpisodesViewController is wrapped inside a UINavigationController")
        } else {
            print("EpisodesViewController is NOT wrapped inside a UINavigationController")
        }

    }
    
    // MARK: - Private Methods
 

    @objc func cellTapped(_ sender: UITapGestureRecognizer) {
        print("cell tapped")
        guard let cell = sender.view as? EpisodeCustomCell,
              let indexPath = collectionView.indexPath(for: cell),
              let characterDetailsVC = storyboard?.instantiateViewController(withIdentifier: "CharacterDetailsViewController") as? CharacterDetailsViewController,
              let episode = rickAndMortyCharacter?.results[indexPath.item] else {
                  return
        }
        
        // Настройка characterDetailsVC с использованием данных из выбранной ячейки
        //characterDetailsVC.character = episode.description
        
       //  Выполнение перехода на экран CharacterDetailsViewController
        navigationController?.pushViewController(characterDetailsVC, animated: true)
    }

    private func setupNavigationBar() {
        title = "Rick & Morty"
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .white
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    private func fetchCharacterData(from url: URL?) {
        netvorkManager.fetch(RickAndMorty.self, from: url) { result in
            switch result {
            case .success(let character):
                self.rickAndMortyCharacter = character // сюда приходят данные с апи
                print(character)
                self.collectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


// MARK: - Setup extensions

private extension EpisodesViewController {

    func setupView() {
        addViews()
        setupCollectionView()
        layout()
        setupBinding()
    }

    func setupBinding() {

   }
    
}

// MARK: - Setup components extensions

private extension EpisodesViewController {

    func addViews() {
        view.addSubview(collectionView)
    }

    func setupCollectionView() {
        
        collectionView.dataSource = self
        collectionView.delegate = self

       
        collectionView.register(EpisodeCustomCell.self, forCellWithReuseIdentifier: "CustomCell")
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped(_:)))
//           collectionView.addGestureRecognizer(tapGesture)

    }
}

// MARK: - Layout extension

private extension EpisodesViewController {
    func layout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension EpisodesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       rickAndMortyCharacter?.results.count ?? 0
       
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! EpisodeCustomCell
        if let episode = rickAndMortyCharacter?.results[indexPath.item] {
            cell.configure(with: episode)
        }

        return cell
    }
}


// MARK: - UICollectionViewDelegate

extension EpisodesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let characterDetailsVC = CharacterDetailsViewController()
              let episode = rickAndMortyCharacter?.results[indexPath.item]
        
              // Передача данных в characterDetailsVC
              self.navigationController?.pushViewController(characterDetailsVC, animated: true)

    }
}



// MARK: - UICollectionViewDelegateFlowLayout

extension EpisodesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = 311
        let height: CGFloat = 357
        return CGSize(width: width, height: height)
        
    }
}
