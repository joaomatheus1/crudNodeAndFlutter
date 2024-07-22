import bodyParser from 'body-parser';
import 'dotenv/config';
import express, { NextFunction, Request, Response } from 'express';
import jwt from 'jsonwebtoken';
import swaggerUi from 'swagger-ui-express';
import swaggerDocument from '../swagger.json';
import routes from './router/routes';

const app = express();
const secreto = 'joaomatheus';
app.use(bodyParser.json());

function verifyJwt(req: Request, res: Response, next: NextFunction) {
    const { authorization } = req.headers;
    if (!authorization) {
        return res.status(401).json({ message: 'Não autorizado' });
    }

    const token = authorization.split(' ')[1];
    jwt.verify(token, secreto, (err) => {
        if (err) {
            return res.status(500).json({ message: 'Token inválido' });
        }
        next();
    });
}

app.get("/login", (req, res) => {
    if (req.body.user === 'joao' && req.body.senha === '123') {
        const token = jwt.sign({ id: 1 }, secreto, { expiresIn: '1h' });
        return res.json({ auth: true, token });
    }
    res.status(401).end();
});
app.use('/',verifyJwt, routes);
app.use('/api/docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

const PORT = process.env.PORT;
app.listen(PORT, () => console.log(`Servidor rodando na porta ${PORT}`));
