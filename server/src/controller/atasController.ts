import { Request, Response } from "express";
import connection from "../db/data";
import { CRIAR_ATA, INSERIR_COLABORADOR_ATA, REMOVER_COLABORADOR_ATA } from "../queries/sqlQueries";

class AtasController{
    
    criarAta (req: Request, res: Response) {
        const { workshopId } = req.body;
        const dataAtual = new Date()
        connection.query(CRIAR_ATA,[workshopId, dataAtual], (error) => {
            if(error) {
                res.status(400).json({error: 'Bad request'})
                console.log(error)
                return;
            }
            res.status(200).json({ message: 'Ata criada com sucesso' });
        });  
    }
    
   inserirColaboradorAta (req: Request, res: Response) {
        const { ataId, colaboradorId } = req.params;
        connection.query(INSERIR_COLABORADOR_ATA,[ataId, colaboradorId], (error) => {
            if(error) {
                res.status(400).json({error: 'Bad request'})
                console.log(error);
                return;
            }
            res.status(200).json({ message: 'Colaborador adicionado à ata com sucesso' });
        });
    } //ok

    removerColaboradorAta (req: Request, res:Response) {
        const { ataId, colaboradorId } = req.params;
        connection.query(REMOVER_COLABORADOR_ATA,[ataId, colaboradorId], (error) => {
            if(error) {
                res.status(400).json({error: 'Bad request'})
                return;
            }
            res.status(200).json({ message: 'Colaborador removido à ata com sucesso' });
        });
    }

}

export { AtasController };

