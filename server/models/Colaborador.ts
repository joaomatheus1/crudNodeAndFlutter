class Colaborador {
    id: number;
    nome: string;
    workshops: Workshop[];

    constructor(id: number, nome: string, workshops: Workshop[]){
        this.id = id;
        this.nome = nome;
        this.workshops = workshops;
    }
}