import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trancentum_web_app/models/expedition.dart';
import 'package:trancentum_web_app/services/expeditions.dart';
import 'find_expedition_by_id_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([Expeditions])
void main() {
  group('find expedition by Id', () {
    test('returns an expedition if it finds it successfully', () async {
      final expeditions = MockExpeditions();
      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(expeditions.findById("-Ml0ideYJ77jyyYJlM_g")).thenReturn( Expedition(
            nomExpediteur: "hhhhh",
            telExpediteur: "0655489575",
            nomDestinataire: "hhhhhh",
            telDestinataire: "677845212",
            codeExpedition: "-Ml0ideYJ77jyyYJlM_g",
            dcreation: DateTime.now(),
            modePaiement: "PPE",
            nbrColis: 77,
            nbrFactures: 88.35,
            taxation: "taxation",
            typeLivraison: "",
            villeDestinataireId: "c1",
            villeExpediteurId: "c2",
            typeTaxation: "typeTaxation",
            nombre: "55",
            typeMarchandise: "Marchandise1",
            nombreBonsLivraison: 78,
            montant: 85.214,
            type: ""),);

      expect(expeditions.findById("-Ml0ideYJ77jyyYJlM_g"), isA<Expedition>());
    });

    test('returns null if the expedition is not found', () {
      final expeditions = MockExpeditions();

      when(expeditions.findById("qqqq")).thenReturn(null);

      expect(expeditions.findById("qqqq"), null);
    });
  });
}
