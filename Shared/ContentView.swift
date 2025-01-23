import SwiftUI


struct PlayerRegistrationView: View {
    @State private var players: [PlayerWithCard] = [] // List of players and their cards
    @State private var currentPlayerName = ""
    @State private var cardToShow: Card? // The card to show in the detail view
    @State private var showConfirmation = false // Show confirmation dialog
    @State private var cardToReveal: Card? // The card to reveal after confirmation

    let deck = Deck()

    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(gradient: Gradient(colors: [.purple, .pink]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack {
                // Fixed TextField for player name
                TextField("Enter player name", text: $currentPlayerName)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 2)
                    .padding()

                // Add player button
                Button(action: {
                    if !currentPlayerName.isEmpty {
                        let newCard = deck.draw() // Draw a card for the new player
                        let newPlayer = PlayerWithCard(name: currentPlayerName, card: newCard)
                        players.append(newPlayer)
                        cardToShow = newCard // Immediately set the cardToShow to show the new player's card
                        currentPlayerName = "" // Reset the text field for the next player
                    }
                }) {
                    Text("Add Player")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(currentPlayerName.isEmpty ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .opacity(currentPlayerName.isEmpty ? 0.6 : 1.0)
                }
                .disabled(currentPlayerName.isEmpty)
                .padding()

                // Scrollable Grid of Players
                ScrollView {
                    PlayerGridView(players: players) { card in
                        // Store the selected card to reveal later
                        cardToReveal = card
                        showConfirmation = true // Show confirmation alert
                    }
                    .padding(.top) // To add some space between the grid and button
                }
                .padding(.top)
            }
            .padding()
        }
        // Display the card detail view when a card is tapped or after adding a player
        .sheet(item: $cardToShow) { card in
            CardDetailView(card: card)
        }
        // Show a confirmation dialog before revealing the card
        .alert(isPresented: $showConfirmation) {
            Alert(
                title: Text("Are you sure?"),
                message: Text("Do you really want to reveal this player's role?"),
                primaryButton: .destructive(Text("Yes")) {
                    // Show the card details and reveal the image
                    if let cardToReveal = cardToReveal {
                        self.cardToShow = cardToReveal
                    }
                },
                secondaryButton: .cancel() {
                    // Cancel action, nothing happens
                    showConfirmation = false
                }
            )
        }
    }
}
struct CardDetailView: View {
    let card: Card
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Text("Your Card")
                .font(.largeTitle)
                .padding()

            Image(uiImage: card.image)
                .resizable()
                .frame(width: 200, height: 300)
                .cornerRadius(15)
                .shadow(radius: 5)
                .padding()

            Text(card.protagonist.name)
                .font(.title2)
                .padding()

            Text(card.protagonist.description)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()

            Button(action: {
                // Dismiss the view (handled by SwiftUI automatically)
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Dismiss")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

struct PlayerGridView: View {
    var players: [PlayerWithCard]
    var onCardTapped: (Card) -> Void

    var body: some View {
        // Grid layout of players
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
            ForEach(players) { player in
                VStack {
                    // Hide player image initially, show it after confirmation
                    Image("Unknown") // Placeholder image
                        .resizable()
                        .frame(width: 100, height: 100)
                        .background(Color.gray)
                        .cornerRadius(10)
                        .padding()
                        .onTapGesture {
                            // Trigger the alert when the card is tapped
                            onCardTapped(player.card)
                        }

                    // Safely unwrap the player name to avoid Optional value issues
                    Text(player.name ?? "Unknown Player")
                        .font(.caption)
                        .foregroundColor(.white)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct PlayerWithCard: Identifiable {
    let id = UUID() // This makes the player uniquely identifiable
    let name: String?
    let card: Card
}
