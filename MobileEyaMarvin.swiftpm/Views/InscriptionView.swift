//
//  SwiftUIView.swift
//  
//
//  Created by etud on 14/03/2024.
//

import SwiftUI

struct BasicInfoView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var email: String = ""
    @State private var association: String = ""
    @State private var phoneNumber: String = ""

    var body: some View {
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

            NavigationLink(destination: AdditionalInfoView(firstName: firstName, lastName: lastName, username: username, password: password, email: email, association: association, phoneNumber: phoneNumber)) {
                Text("Suivant")
            }
            .padding()
        }
        .padding()
        .navigationBarTitle("Inscription")
    }
}

struct AdditionalInfoView: View {
    var firstName: String
    var lastName: String
    var username: String
    var password: String
    var email: String
    var association: String
    var phoneNumber: String

    @State private var chercheUnLogement: Bool = false
    @State private var isVegetarian: Bool = false
    @State private var tshirtSize = 0
    @State private var tshirtSizes = ["S", "M", "L"]

    var body: some View {
        VStack {
            HStack {
                Text("Cherche un logement ?")
                    .font(.headline)
                    .padding(.bottom, 4)
                
                Spacer()
                
                Picker("Cherche un logement ?", selection: $chercheUnLogement) {
                    Text("Oui").tag(true)
                    Text("Non").tag(false)
                }
                .pickerStyle(MenuPickerStyle())
            }
            .padding()

            HStack {
                Text("Végétarien ?")
                    .font(.headline)
                    .padding(.bottom, 4)
                
                Picker("Végétarien ?", selection: $isVegetarian) {
                        Text("Oui").tag(true)
                        Text("Non").tag(false)
                }
                .pickerStyle(MenuPickerStyle())
                .padding(.leading)
            }

            HStack {
                Text("Taille du t-shirt")
                .font(.headline)
                .padding(.bottom, 4)

                Picker(selection: $tshirtSize, label: Text("")) {
                        ForEach(0 ..< tshirtSizes.count) {
                            Text(self.tshirtSizes[$0])
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding(.leading)
            }

            Spacer()

            Button(action: {
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
        print("Prénom: \(firstName), Nom: \(lastName), Pseudo: \(username), Mot de passe: \(password), Email: \(email), Association: \(association), Numéro de téléphone: \(phoneNumber), Cherche un logement: \(chercheUnLogement), Végétarien: \(isVegetarian), Taille du t-shirt: \(tshirtSizes[tshirtSize])")

        //Ajouter logique d'inscription iciappel API
    }
}

// Vue principale qui démarre le formulaire d'inscription
struct SignupFormView: View {
    var body: some View {
        NavigationView {
            BasicInfoView()        }
    }
}

// Affichez la vue principale dans l'aperçu
struct SignupFormView_Previews: PreviewProvider {
    static var previews: some View {
        SignupFormView()
    }
}
