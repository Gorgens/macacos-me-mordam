# Macacos me mordam!

A expressão popular "macacos me mordam" possui diversos significados, cada um com nuances sutis e origens distintas. **Uma delas é para enfatizar a intensidade de um sentimento**:

> Surpresa, espanto ou perplexidade: Dizer "macacos me mordam!" é uma forma exclamativa de expressar grande surpresa diante de algo inesperado ou inacreditável.

> **Macacos me mordam** é um bordão que ganhou grande popularidade no Brasil através dos desenhos animados do Popeye, na década de 1980. A frase original em inglês, "Well, blow me down!", era dublada como "Macacos me mordam!", se tornando um bordão marcante do personagem.

![Macacos](/img/monkeyWatch.jpg "Macacos na floresta por AI")

O monitoramento de macacos em campo é um conjunto de técnicas e métodos utilizados para estudar e acompanhar as populações desses animais em seu habitat natural. Essa prática é crucial para a conservação das espécies, fornecendo informações valiosas sobre sua ecologia, comportamento, saúde e status de ameaça. Diversas metodologias podem ser empregadas no monitoramento de macacos, variando de acordo com os objetivos específicos da pesquisa, a espécie-alvo e as características do local de estudo. Dentre as técnicas mais comuns está a realização de censos voltado para a estimativa da abundância e distribuição populacional dos macacos em uma área específica.

O monitoramento de macacos em campo é uma atividade complexa e multifacetada que exige conhecimento especializado, habilidades técnicas e um compromisso com a ética e a conservação. A coleta em campo exige um grande esforço do cientista. Longos dias, expostos ao tempo, caminhando por horas e com muita paciência. Por isto tecnologias avançadas tem um grande potencial de revolucionar a área!

> Google AI Gemini + Drones: Utilização de drones para obter imagens aéreas de macacos e seus habitats, permitindo uma visão mais ampla e detalhada de suas atividades, e Gemini para analisar as imagens!

```
# Set up the model
generation_config = {
  "temperature": 1,
  "top_p": 0.95,
  "top_k": 0,
  "max_output_tokens": 8192,
}

safety_settings = [
  {
    "category": "HARM_CATEGORY_HARASSMENT",
    "threshold": "BLOCK_MEDIUM_AND_ABOVE"
  },
  {
    "category": "HARM_CATEGORY_HATE_SPEECH",
    "threshold": "BLOCK_MEDIUM_AND_ABOVE"
  },
  {
    "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
    "threshold": "BLOCK_MEDIUM_AND_ABOVE"
  },
  {
    "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
    "threshold": "BLOCK_MEDIUM_AND_ABOVE"
  },
]

model = genai.GenerativeModel(model_name="gemini-1.5-pro-latest",
                              generation_config=generation_config,
                              safety_settings=safety_settings)
```

# Treinamento

![Few shots](/img/slide1.png "Imagens treinamento")

```
prompt_parts = [
  "imagem: ",
  genai.upload_file("/content/train/vlcsnap-2024-05-10-21h48m05s650.png"),
  "macacos: Macacos me mordam, nesta imagem encontrei 4!",
  "imagem: ",
  genai.upload_file("/content/train/vlcsnap-2024-05-10-21h48m19s514.png"),
  "macacos: Macacos me mordam, nesta imagem encontrei 3!",
  "imagem: ",
  genai.upload_file("/content/train/vlcsnap-2024-05-10-21h48m45s319.png"),
  "macacos: Macacos me mordam, nesta imagem encontrei 3!",
  "imagem: ",
  genai.upload_file("/content/train/vlcsnap-2024-05-10-21h50m30s363.png"),
  "macacos: Macacos me mordam, nesta imagem encontrei 3!",
  "imagem: ",
  genai.upload_file("/content/train/vlcsnap-2024-05-10-21h53m39s571.png"),
  "macacos: Macacos me mordam, nesta imagem encontrei 7!",
  "imagem: ",
  genai.upload_file("/content/train/vlcsnap-2024-05-10-21h54m11s856.png"),
  "macacos: Macacos me mordam, nesta imagem encontrei 8!",
  "imagem: ",
  genai.upload_file("/content/test/vlcsnap-2024-05-10-21h55m42s301.png"),
  "macacos: ",
]
```

# Teste

![Teste](/img/slide2.png "Imagem teste")

```
response = model.generate_content(prompt_parts)
print(response.text)
```

# Créditos

Este trabalho só foi possivel graças a:

1. Eric Bastos Gorgens - Prof. do PPGCF/UFVJM
2. Bárbara Ferreira Santos Vieira - Mestranda PPGCF/UFVJM 
3. Waldney Pereira Martins - Prof. Unimontes
4. Fabiano Rodrigues de Melo - Prof. UFV
