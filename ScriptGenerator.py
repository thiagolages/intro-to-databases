import random
import datetime
cont = 0
aux_dig = 0
cont2 = 0

tipo = ("Casa","Apartamento","Quitinete","Flat","Duplex","Sobrado")
status_documento = ("Valido")
status_permissao = ("Licitado")
localizacoes = ("Belo Horizonte","Porto Alegre","Gramado","Curitiba", "Rio de Janeiro","Fortaleza","Recife","Aracaju","Contagem","Manaus")
status_obra = ("Aguardando pagamento","Aguardando autorizacao","Em projeto","Iniciada","Entregue")
status_pagamento = ("Autorizado","Bloqueado","Nao efetuado")
fornecedores = ("Leroy Merlin","Telhanorte","Dicico","Taqi","Duas Irmas","Patria Unida")
produtos = ("Cimento","Areia","Pedra Brita","Aditivos","Concreto","Cal","Argamassa","Aco","Tijolo Ceramico","Bloco de Concreto","Madeira","Telha","Tinta","Portas","Janelas","Pisos","Revestimento","Materiais Hidraulicos","Materiais Eletricos")
nomes = ("Laura","Beatriz","Maria","Julia","Alice","Mariana","Larissa","Maria Eduarda","Sofia","Isabela","Helena","Camila","Lara","Valentina","Leticia","Amanda","Yasmim","Rebeca","Juliana","Bruna","Cecilia","Fernanda","Isadora","Lorena","Livia","Manuela","Vitoria","Bianca","Miguel","Lucas","Guilherme","Gabriel","Arthur","Enzo","Rafael","Joao","Gustavo","Pedro","Bernardo","Matheus","Davi","Heitor","Henrique","Bruno","Samuel","Felipe","Lorenzo","Benjamin","Vinicius","Rodrigo","Eduardo","Diego","Antonio","Leonardo","Noah","Nicolas","Daniel","Thiago")
sobrenome = ("Fernandes", "Santana", "Carvalho", "Martins", "Santos", "Boaventura", "Oliveira", "Moraes", "Leao", "Garcia", "Alves", "Costa", "Oliveira", "Martinez", "Novaes", "Oliveira", "Araujo", "Maia", "Vasconcelos", "Goncalves", "Guimaraes", "Menezes", "Sampaio", "Cavalcante", "Lacerda", "Mello", "Moraes", "Muniz", "Figueira", "Paes", "Lima", "Marques", "Duarte", "Vasconcelos", "Vieira", "Souza", "Soares", "Silva", "Duarte", "Morais", "Gomes", "Paiva", "Junqueira", "Queiroz", "Barreto", "Campos", "Pilar", "Chaves", "Lessa", "Garcia", "Frota", "Xavier", "Ribeiro")

ids = []
cpfs = []


def generateId():
    global cont
    global aux_dig
    ID = 0
    for i in range (0,8):
        if i == 2:
            ID += cont*pow(10,i)
        elif i == 5:
            ID += aux_dig*pow(10,i)
        else:
           ID+= random.randrange(0,10) * pow(10,i)
    return ID

def generateCPF():
    CPF = 0
    global cont
    global aux_dig
    for i in range(0,9):
        if i == 3:
            CPF += cont*pow(10,i+2)
            cont+=1
        elif i == 7:
            CPF += aux_dig*pow(10,i+2)
            if cont == 9:
                aux_dig+=1
                cont = 0
        elif i == 9:
            CPF+= random.randrange(1,10) * pow(10,i+2)
        else:
            CPF+= random.randrange(0,10) * pow(10,i+2)
    
    #calculo dos digitos verificadores

    ver1 = 0
    for i in range (1,10):
        ver1 += CPF//pow(10,i+1) %10 * (10 - i)
    
    ver1 = ver1%11
    ver1 = ver1%10
    CPF += ver1*10

    ver2 = 0

    for i in range (0,9):
        ver2 += CPF//pow(10,i+1) %10 * (9-i)
    
    ver2 = ver2%11
    ver2 = ver2%10
    CPF += ver2



    return CPF

def generate_salario_eng():
    return random.randrange (3000,10000)

def generate_salario_func():
    return random.randrange (1500,3000)

def generate_nome ():
    pnome = nomes[random.randrange(0,len(nomes))]
    lnome1 = sobrenome [random.randrange(0,len(sobrenome))]
    lnome2 = sobrenome [random.randrange(0,len(sobrenome))]
    while lnome1 == lnome2:
        lnome2 = sobrenome [random.randrange(0,len(sobrenome))]
    return pnome + " " + lnome1 + " " + lnome2 

def generate_localizacao():
    return localizacoes[random.randrange(0,len(localizacoes))]

def generate_tipo():
    return tipo[random.randrange(0,len(tipo))]

def generate_status_obra():
    return status_obra[random.randrange(0,len(status_obra))]

def generate_permissao():
    return status_permissao

def generate_situacao():
    return status_documento

def generate_pagamento():
    return status_pagamento[random.randrange(0,len(status_pagamento))]

def generate_fornecedor():
    return fornecedores[random.randrange(0,len(fornecedores))]

def generate_produto():
    return produtos [random.randrange(0,len(produtos))]

def generate_date_max():
    return datetime.datetime(random.randrange(2020,2030),random.randrange(1,12),random.randrange(1,28))

def generate_date_min():
    return datetime.datetime(random.randrange(2017,2020),random.randrange(1,12),random.randrange(1,28))

def generateProdutores(fd):
    for i in range (0,len(fornecedores)):
        id = str(generateId())
        while id in ids:
            id = str(generateId())
        ids.append(id)
        fornecedor = "\n\nINSERT INTO Fornecedor (ID_Fornecedor, nome) VALUES (" + id + ",\"" + fornecedores[i] + "\");\n"
        fd.write(fornecedor)

def generateProdutos(fd):
    for i in range (0,len(produtos)):
        nome_produto = produtos[i]
        for j in range(0,len(ids)):
            check = random.randrange(0,10)
            if check < 6:
                Id_Fornecedor = str(ids[j])
                fornecedor_produtos = "INSERT INTO Fornecedor_Produtos ( ID_Fornecedor,produtos) VALUES ("+ Id_Fornecedor + ",\"" + nome_produto +"\");\n"
                fd.write(fornecedor_produtos)



def generateQuery(fd):

    global cont2
    

    Id_Obra = str(generateId())
    tipo_obra = generate_tipo()
    localizacao = generate_localizacao()
    obra_status = generate_status_obra()
    Id_Gerente = str(generateId())
    Id_Engenheiro = str(generateId())
    
    obra  = "INSERT INTO Obra (ID_Obra,tipo,localizacao,status_obra,ID_Gerente, ID_Engenheiro) VALUES (" + Id_Obra + ",\"" + tipo_obra + "\",\"" + localizacao + "\",\"" + obra_status + "\"," + Id_Gerente + "," + Id_Engenheiro +");\n"

    fd.write(obra)

    
    fornecedores_obra = []

    for i in range(0,len(fornecedores)//2):
        data_expiracao = str(generate_date_max())
        Id_Fornecedor = ids[random.randrange(0,len(ids))]
        while Id_Fornecedor in fornecedores_obra:
            Id_Fornecedor = ids[random.randrange(0,len(ids))]
        fornecedores_obra.append(Id_Fornecedor)
        fornece = "INSERT INTO Fornece (ID_Obra,ID_Fornecedor,    expiracao_contrato) VALUES ("+ Id_Obra + "," + Id_Fornecedor + ",\"" + data_expiracao + "\");\n"
        fd.write(fornece)

    cpf = str(generateCPF())
    nome = generate_nome()

    pessoa = "INSERT INTO Pessoa (cpf,nome) VALUES (" + cpf + ",\"" + nome +"\");\n"

    fd.write(pessoa)
    
    permissao = generate_permissao()
    participa = "INSERT INTO  Participa (cpf,ID_Obra,    permissao) VALUES ("+ cpf + "," + Id_Obra + ",\"" + permissao +"\");\n"

    fd.write(participa)
    
    pagamento = generate_pagamento()

    cliente = "INSERT INTO Cliente (cpf,status_pagamento) VALUES (" + cpf + ",\"" + pagamento + "\");\n"

    fd.write(cliente)

    obra_clientes = "INSERT INTO Obra_clientes (ID_Obra,ID_Cliente) VALUES ( " + Id_Obra +"," + cpf +");\n"

    fd.write(obra_clientes)

    cpf = str(generateCPF())
    nome = generate_nome()

    pessoa = "INSERT INTO Pessoa (cpf,nome) VALUES (" + cpf + ",\"" + nome +"\");\n"

    fd.write(pessoa)
    
    permissao = generate_permissao()
    participa = "INSERT INTO  Participa (cpf,ID_Obra,    permissao) VALUES ("+ cpf + "," + Id_Obra + ",\"" + permissao +"\");\n"

    fd.write(participa)

    salario = str(generate_salario_eng())
    data_admissao = str(generate_date_min())

    funcionario = "INSERT INTO Funcionario (cpf,salario,data_admissao) VALUES (" + cpf + "," + salario + ",\"" + data_admissao +"\");\n"

    fd.write(funcionario)
    cpfs.append(cpf)

    cont2 += 1

    if (len(cpfs) > 20 and cont2%2 == 0):
        cpf = str(cpfs [random.randrange(0,len(cpfs))])
    
    Id_Documento = str(generateId())
    situacao = generate_situacao()
    documento = "INSERT INTO Documento (ID_Documento,    ID_Responsavel,situacao,ID_Obra) VALUES (" + Id_Documento + "," + cpf + ",\"" + situacao + "\"," + Id_Obra + ");\n"
    fd.write(documento)
    
    max = random.randrange (5,20)
    for i in range(0,max):
        cpf = str(generateCPF())
        nome = generate_nome()
        pessoa = "INSERT INTO Pessoa (cpf,nome) VALUES (" + cpf + ",\"" + nome +"\");\n"

        fd.write(pessoa)
        
        permissao = generate_permissao()
        participa = "INSERT INTO  Participa (cpf,ID_Obra,    permissao) VALUES ("+ cpf + "," + Id_Obra + ",\"" + permissao +"\");\n"

        fd.write(participa)

        salario = str(generate_salario_func())
        data_admissao = str(generate_date_min())

        funcionario = "INSERT INTO Funcionario (cpf,salario,data_admissao) VALUES (" + cpf + "," + salario + ",\"" + data_admissao +"\");\n"

        fd.write(funcionario)




fd = open ("InsertQueries.sql","w")
generateProdutores(fd)
generateProdutos(fd)

for i in range (0,500):
    generateQuery(fd)

fd.close()

