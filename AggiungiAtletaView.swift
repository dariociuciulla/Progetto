import SwiftUI
import SwiftData

struct AggiungiAtletaView: View {
    
    @Environment(\.dismiss) var dismiss
    // ⭐️ Contesto del modello per salvare il nuovo oggetto nel database
    @Environment(\.modelContext) private var modelContext
    
    // Campi di input con stato locale
    @State private var nome: String = ""
    @State private var cognome: String = ""
    @State private var eta: Int?
    @State private var peso: Double?
    @State private var altezza: Double? // In metri
    @State private var sport: String = ""
    
    private var decimalFormatter : NumberFormatter{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        return formatter
    }

    var isFormValid: Bool {
        return !nome.isEmpty && eta != nil && peso != nil && altezza != nil && !sport.isEmpty
    }
    
    var body: some View {
        NavigationView {
            Form {
                // Sezione Dati Anagrafici
                Section("Dati Anagrafici") {
                    TextField("Nome", text: $nome)
                    TextField("Cognome", text: $cognome)
                    
                    // Campo Età
                    TextField("Età", value: $eta, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                }

                // Sezione Dati Fisici e Sportivi
                Section("Misure e Sport") {
                    TextField("Peso (kg)", value: $peso, formatter: decimalFormatter)
                        .keyboardType(.decimalPad)
                    
                    TextField("Altezza (m)", value: $altezza, formatter: decimalFormatter)
                        .keyboardType(.decimalPad)
                    
                    TextField("Sport Praticato", text: $sport)
                }
            }
            .navigationTitle("Nuovo Atleta")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Annulla") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Salva") {
                        if let eta = eta, let peso = peso, let altezza = altezza {
                            // ⭐️ CREAZIONE E SALVATAGGIO DELL'OGGETTO ATLETA
                            let nuovoAtleta = Atleta(
                                nome: nome,
                                cognome: cognome,
                                eta: eta,
                                peso: peso,
                                altezza: altezza,
                                sport: sport
                            )
                            modelContext.insert(nuovoAtleta) // Inserisci nel database
                            dismiss()
                        }
                    }
                    .disabled(!isFormValid)
                }
            }
        }
    }
}
