import 'dart:convert';
import 'package:http/http.dart' as http;
//import "package:drfungus_app/env.dart";

class VectaraService {
  final String apiKey;
  final String corpusKey;

  VectaraService({
    required this.apiKey,
    required this.corpusKey,
  });

  Future<String?> queryVectara(String query) async {
    final url = Uri.parse('https://api.vectara.io:443/v2/chats');
    final headers = {
      'X-API-key': apiKey,
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      "query": query,
      "search": {
        "corpora": [
          {
            "corpus_key": "AskDrFungus",
            "metadata_filter": "",
            "lexical_interpolation": 0.005,
            "custom_dimensions": {}
          }
        ],
        "offset": 0,
        "limit": 25,
        "context_configuration": {
          "sentences_before": 0,
          "sentences_after": 0,
          "start_tag": "%START_SNIPPET%",
          "end_tag": "%END_SNIPPET%"
        },
        "reranker": {"type": "mmr", "diversity_bias": 0}
      },
      "generation": {
        "generation_preset_name": "mockingbird-1.0-2024-07-16",
        "max_used_search_results": 5,
        "prompt_text": "",
        "response_language": "eng",
        "enable_factual_consistency_score": true
      },
      "chat": {"store": true}
    });

    try {
      final response = await http
          .post(url, headers: headers, body: body)
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        //print(responseData);
        // Parse the response to get the desired text
        if (responseData['answer'] != null &&
            responseData['answer'].isNotEmpty) {
          final answer = responseData["answer"];
          return answer;
        } else {
          return 'No results found - Are you connected to the internet?';
        }
      } else {
        //print('Failed to get response: ${response.statusCode}');
        //print('Response body: ${response.body}');
        return "Are you connected to the internet?";
      }
    } catch (e) {
      //print('Error occurred: $e');
      return "Are you connected to the internet?";
    }
  }
}


/*

curl -L -X POST 'https://api.vectara.io/v2/query' \
-H 'Accept: application/json' \
-H 'x-api-key: zut_0k3aDfp_WWJvbY-sbY16tVqBZc2VG3n7KphWfw' \
-H 'Content-Type: application/json' \
-d '{
  "query": "What is histoplasmosis?",
  "search": {
    "corpora": [
      {
        "custom_dimensions": {},
        "lexical_interpolation": 0.025,
        "semantics": "default",
        "corpus_key": "AskDrFungus"
      }
    ],
    "offset": 0,
    "limit": 10,
    "context_configuration": {
      "characters_before": 30,
      "characters_after": 30,
      "sentences_before": 3,
      "sentences_after": 3,
      "start_tag": "<em>",
      "end_tag": "</em>"
    }
  }
}'

*/