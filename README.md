# saesmart

A new Flutter project.

## Hive

- Como Gerar arquivo Adapter.
- 1. Criar o arquivo em hive/models com @HiveType junto da classe e forneça um typeId(entre 0 e 223).
- 2. Anote todos os campos que devem ser armazenados com@HiveField.
- 3. Adicione abaixo dos imports: `part '{nome do arquivo}.g.dart;` .
- 4. Executar tarefa de compilação: `flutter packages pub run build_runner build`.
- 5. Mova o novo arquivo gerado .g.dart para o diretório hive/adapters.
- 6. Remova as linhas: `part '{nome do arquivo}.g.dart;` do código.

