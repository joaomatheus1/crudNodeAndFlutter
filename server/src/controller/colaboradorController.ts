import { Request, Response } from "express";
import connection from "../db/data";
import { GET_COLABORADOR_WORK_INFO, INSERIR_COLABORADOR } from "../queries/sqlQueries";

class ColaboradorController {
  inserirColaborador(req: Request, res: Response) {
    const { nome } = req.body;
    connection.query(
      INSERIR_COLABORADOR, [nome],
      (error) => {
        if (error) {
          res.status(400).json({ error: "Bad request" });
          console.log(error);
          return;
        }
        res.status(200).send({ mensagem: "Colaborador inserido com sucesso" });
      }
    );
  }

  getColaboradorWorkInfo(req: Request, res: Response) {
    connection.query(
      GET_COLABORADOR_WORK_INFO,
      (error, result) => {
        if (error) {
          res.status(400).json({ error: "Bad request" });
          console.log(error);
          return;
        }
        res.status(200).json(result);
      }
    );
  }
}

export { ColaboradorController };

