import SwiftUI

struct WordCardView: View {
    let word: Word

    var body: some View {
        VStack(alignment: .leading) {
            Text("English: \(word.wordEN)")
            Text("Hebrew: \(word.wordHE)")
            Text("Date Added: \(formatDate(word.dateAdd))")

            Button(action: {
                // Implement the delete action here
            }) {
                Text("Remove")
                    .foregroundColor(.red)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
    }

    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
}
