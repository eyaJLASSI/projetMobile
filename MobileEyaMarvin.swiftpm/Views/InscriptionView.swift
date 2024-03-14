//
//  SwiftUIView.swift
//  
//
//  Created by etud on 14/03/2024.
//

import SwiftUI

struct InscriptionView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var email: String = ""
    @State private var association: String = ""
    @State private var phoneNumber: String = ""
    @State private var chercheUnLogement: Bool = false
    @State private var housingOptions = ["Oui", "Non"]
    @State private var selectedOption = 0
    @State private var isVegetarian: Bool = false
    @State private var tshirtSize = 0
    @State private var tshirtSizes = ["S", "M", "L"]
    
    
    var body: some View {
                
        ScrollView {
            Text("Inscription")
                        .font(.title)
            VStack {
                                
                TextField("Prénom", text: $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Nom", text: $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Pseudo", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Mot de passe", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Association", text: $association)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Numéro de téléphone", text: $phoneNumber)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                VStack(alignment: .leading) {
                    Text("Cherche un logement ?")
                        .font(.headline)
                        .padding(.bottom, 4)
                    
                    Picker("Cherche un logement ?", selection: $chercheUnLogement) {
                        Text("Oui").tag(true)
                        Text("Non").tag(false)
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Végétarien ?")
                        .font(.headline)
                        .padding(.bottom, 4)
                    
                    Picker("Végétarien ?", selection: $isVegetarian) {
                        Text("Oui").tag(true)
                        Text("Non").tag(false)
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Taille du t-shirt")
                        .font(.headline)
                        .padding(.bottom, 4)
                    
                    Picker(selection: $tshirtSize, label: Text("")) {
                        ForEach(0 ..< tshirtSizes.count) {
                            Text(self.tshirtSizes[$0])
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding()
                
            }
            .fixedSize(horizontal: false, vertical: true)
                
                Button(action: {
                    // Action à exécuter lorsque le bouton est appuyé
                    self.signup()
                }) {
                    Text("S'inscrire")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                
            }
            .padding()
        }
        
    
    
    func signup() {
        // Logique d'inscription ici
        print("Prénom: \(firstName), Nom: \(lastName), Pseudo: \(username), Mot de passe: \(password)")
        
        // Vous pouvez ajouter votre logique d'inscription ici, par exemple en appelant une API
    }
}

struct InscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        InscriptionView()
    }
}

