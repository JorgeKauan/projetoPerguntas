# Quiz de Conhecimentos Gerais

Um aplicativo de quiz interativo desenvolvido em Flutter com perguntas de conhecimentos gerais de diferentes níveis de dificuldade.

## 🚀 Funcionalidades

### ✨ Principais Melhorias Implementadas

1. **15 Perguntas de Conhecimentos Gerais**
   - 5 perguntas de nível **Fácil** (10 pontos cada)
   - 5 perguntas de nível **Médio** (15 pontos cada)
   - 5 perguntas de nível **Difícil** (20 pontos cada)

2. **Sistema de Seleção Aleatória**
   - A cada jogo, 10 perguntas são selecionadas aleatoriamente
   - Garante variedade e rejogabilidade

3. **Interface Moderna e Responsiva**
   - Design com gradientes e sombras
   - Indicador de progresso visual
   - Badges coloridos para níveis de dificuldade
   - Botões com design moderno

4. **Sistema de Pontuação Melhorado**
   - Pontuação baseada na dificuldade da pergunta
   - Cálculo de aproveitamento em porcentagem
   - Classificação dinâmica baseada no desempenho

5. **Tela de Resultado Detalhada**
   - Estatísticas completas (pontuação, perguntas, aproveitamento)
   - Mensagens motivacionais personalizadas
   - Ícones e cores baseados no desempenho
   - Botão para reiniciar o jogo

## 📱 Estrutura do Projeto

```
lib/
├── main.dart              # Arquivo principal com lógica do quiz
├── questionario.dart      # Componente que exibe as perguntas
├── questão.dart          # Componente da pergunta individual
├── respostas.dart        # Componente dos botões de resposta
├── resultado.dart        # Tela de resultado final
├── login.dart           # Tela de login (não integrada)
└── cadastro.dart        # Tela de cadastro (não integrada)
```

## 🎯 Como Jogar

1. **Início**: O app seleciona automaticamente 10 perguntas aleatórias
2. **Progresso**: Acompanhe seu progresso com a barra de progresso
3. **Níveis**: Cada pergunta tem um indicador de dificuldade (Fácil/Médio/Difícil)
4. **Respostas**: Clique na resposta que considerar correta
5. **Resultado**: Veja sua pontuação final e classificação

## 🏆 Sistema de Classificação

- **Iniciante** (< 30%): Continue estudando!
- **Bom Conhecimento** (30-50%): Boa base de conhecimentos
- **Muito Bom** (50-70%): Conhecimento sólido
- **Excelente** (70-90%): Muito bem informado
- **Gênio** (90%+): Mestre do conhecimento

## 🎨 Design e UX

- **Cores**: Esquema azul com gradientes suaves
- **Tipografia**: Fonte clara e legível
- **Espaçamento**: Layout bem organizado e espaçado
- **Feedback Visual**: Indicadores visuais para progresso e dificuldade
- **Responsividade**: Adaptável a diferentes tamanhos de tela

## 🔧 Tecnologias Utilizadas

- **Flutter**: Framework principal
- **Dart**: Linguagem de programação
- **Material Design**: Componentes de UI
- **Gradientes**: Para efeitos visuais
- **Animações**: Transições suaves

## 📊 Perguntas Incluídas

### Nível Fácil (10 pontos)
- Capital do Brasil
- Número de planetas no Sistema Solar
- Maior oceano do mundo
- Autor da Mona Lisa
- Elemento mais abundante no universo

### Nível Médio (15 pontos)
- Ano do descobrimento do Brasil
- Velocidade da luz
- Autor de "Dom Casmurro"
- Fórmula química da água
- Continente do Egito

### Nível Difícil (20 pontos)
- Teoria da origem do universo
- Primeiro presidente do Brasil
- Processo de divisão celular
- Ano da Proclamação da República
- Maior cordilheira do mundo

## 🚀 Como Executar

1. Certifique-se de ter o Flutter instalado
2. Clone o repositório
3. Execute `flutter pub get`
4. Execute `flutter run`

## 🔮 Próximas Melhorias

- [ ] Integração com sistema de login
- [ ] Banco de dados para salvar pontuações
- [ ] Mais categorias de perguntas
- [ ] Modo multiplayer
- [ ] Sons e animações
- [ ] Modo offline

---

Desenvolvido com ❤️ usando Flutter
