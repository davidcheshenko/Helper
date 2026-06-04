//
//  ProfileViewController.swift
//  Helper
//
//  Created by David Cheshenko on 19.12.25.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: Private properties
    
    private var viewModel: IProfileViewModel
    private let imageView = UIImageView(image: UIImage(systemName:"person.crop.circle.fill"))
    
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    private let passwordLabel = UILabel()
    
    private let nameTextField = UITextField()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    
    private let saveButton: UIButton = {
        let button = UIButton( type: .system)
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        return button
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 6
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
    }()
    
    // MARK: Lifecycle
    
    init(viewModel: IProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        bindViewModel()
    }
    
    // MARK: Private methods
    
    private func setupLayout() {
        view.addSubview(stackView)
        view.addSubview(saveButton)
        view.addSubview(imageView)
        
        nameLabel.text = "name"
        nameLabel.font = .systemFont(ofSize: 14, weight: .medium)
        nameLabel.textColor = .black
        
        emailLabel.text = "email"
        emailLabel.font = .systemFont(ofSize: 14, weight: .medium)
        emailLabel.textColor = .black
        
        passwordLabel.text = "password"
        passwordLabel.font = .systemFont(ofSize: 14, weight: .medium)
        passwordLabel.textColor = .black
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(nameTextField)
        stackView.setCustomSpacing(18, after: nameTextField)
        
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(emailTextField)
        stackView.setCustomSpacing(18, after: emailTextField)
        
        stackView.addArrangedSubview(passwordLabel)
        stackView.addArrangedSubview(passwordTextField)
        
        saveButton.addTarget(self, action: #selector(didTapSave), for: .touchUpInside)
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.centerX.equalToSuperview()
            make.size.equalTo(120)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(50)
        }
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(70)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(52)
        }
        
        [nameTextField, emailTextField, passwordTextField].forEach { input in
            input.backgroundColor = .lightGray
            input.layer.cornerRadius = 12
            
            input.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 50))
            input.leftViewMode = .always
            
            input.snp.makeConstraints { make in
                make.height.equalTo(50)
            }
        }
    }
    
    private func bindViewModel() {
        viewModel.onDataChanged = { [weak self] in
            guard let self = self else { return }
            self.nameTextField.text = self.viewModel.userName
            self.emailTextField.text = self.viewModel.userEmail
            self.passwordTextField.text = self.viewModel.userPassword
            self.showAlert(title: "Успешно", message: "Данные сохранены")
        }
        
        viewModel.onError = { [weak self] error in
            self?.showAlert(title: "Ошибка", message: error)
        }
        
        nameTextField.text = viewModel.userName
        emailTextField.text = viewModel.userEmail
        passwordTextField.text = viewModel.userPassword
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    // MARK: - Action
    
    @objc private func didTapSave() {
        viewModel.saveProfile(
            name: nameTextField.text ?? "",
            email: emailTextField.text ?? "",
            password: passwordTextField.text ?? ""
        )
    }
}
