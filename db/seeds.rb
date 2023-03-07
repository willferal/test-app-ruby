# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: 'metro@user.com', password: '123456', password_confirmation: '123456', nome: 'José da Silva')

Modulo.create(titulo: "Contratos", descricao: "Controle dos contratos vigentes", icone: "document-text", url: "http://localhost:3000", ativo: true)
Modulo.create(titulo: "Publicidade", descricao: "Gestão de alugueis das áreas", icone: "chat-bubble-oval-left", url: "http://localhost:3000", ativo: true)
Modulo.create(titulo: "Manutenção", descricao: "Controle de equipamentos", icone: "wrench-screwdriver", url: "http://localhost:3000", ativo: true)
Modulo.create(titulo: "Linhas", descricao: "Controle das linhas, estações, intervalos e trens", icone: "building-office", url: "http://localhost:3000", ativo: true)
Modulo.create(titulo: "Indicadores", descricao: "Gestão de dados", icone: "chart-bar", url: "http://localhost:3000", ativo: true)
Modulo.create(titulo: "Processos", descricao: "Tramitação online de documentos", icone: "book-open", url: "http://localhost:3000", ativo: true)
Modulo.create(titulo: "Documentos", descricao: "Criação e controle de documentos", icone: "document-plus", url: "http://localhost:3000", ativo: false)
Modulo.create(titulo: "Locação e Publicidade", descricao: "Gestão de alugues", icone: "clipboard-document-list", url: "http://localhost:3000", ativo: false)

Situacao.create([{ descricao: 'CADASTRADO' }, { descricao: 'APROVADO' }, { descricao: 'DESAPROVADO' }, { descricao: 'INATIVADO' }])

TipoEntidade.create([{ descricao: 'Física' }, { descricao: 'Jurídica' }])

Origem.create([{ descricao: 'Pública' }, { descricao: 'Privada' }, { descricao: 'Mista' }])

Atuacao.create([{ descricao: 'Fornecedor' }, { descricao: 'Cliente' }])

TipoDetalhe.create([{ descricao: 'Texto' }, { descricao: 'Link Vídeo' }, { descricao: 'Link Site' }])