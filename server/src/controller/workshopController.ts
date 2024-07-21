import { Request, Response } from "express";
import connection from "../db/data";
import { formatarData } from "../funcs/formatData";
import { GET_WORKSHOP_DATA, GET_WORKSHOP_NOME, INSERIR_WORKSHOP } from "../queries/sqlQueries";

class WorkshopController{
    
    inserirWorkshop (req: Request, res: Response) {
        const { nome, descricao } = req.body
        const dataAtual = new Date()
        connection.query(INSERIR_WORKSHOP,[nome, dataAtual, descricao], (error) => {
            if(error) {
                res.status(400).json({error: 'Bad request'})
                console.log(error)
                return;
            }
            res.status(200).send({ mensagem: 'Workshop criado com sucesso'})
        });
    }

    filtroWorkshopNomeData (req: Request, res: Response) {
        const { nome, data } = req.query;
        let query: any;
        let params: any[] = [];

        switch (true) {
            case !!nome:
                query = GET_WORKSHOP_NOME;
                params = [`%${nome}%`];
                break;
            case !!data:
                const dataFormatada = formatarData(data);
                query = GET_WORKSHOP_DATA;
                params = [dataFormatada];
                break;
            default:
                res.status(400).json({ error: 'Parâmetro de filtro não fornecido' });
                return;
        }
        connection.query(query, params, (error, result) => {
            if (error) {
                res.status(400).json({ error: 'Bad request' });
                console.log(error);
                return;
            }
            res.status(200).json(result);
        });
    }
}

export { WorkshopController };

