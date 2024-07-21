import bodyParser from 'body-parser';
import 'dotenv/config';
import express from 'express';
import swaggerUi from "swagger-ui-express";
import swaggerDocument from "../swagger.json";
import routes from './router/routes';


const app = express();
app.use(bodyParser.json());

app.use("/", routes);
app.use("/api/docs", swaggerUi.serve, swaggerUi.setup(swaggerDocument));
app.post("/api/workshops", routes) //http://localhost:3000/api/workshops
app.get("/api/workshops", routes) //http://localhost:3000/api/workshops
app.post("/api/colaboradores", routes) //http://localhost:3000/api/colaboradores
app.get("/api/colaboradores", routes) //http://localhost:3000/api/colaboradores
app.post("/api/atas", routes) //http://localhost:3000/api/atas
app.put('/api/atas/:ataId/colaboradores/:colaboradorId', routes);
app.delete('/api/atas/:ataId/colaboradores/:colaboradorId', routes);

const PORT = process.env.PORT;
app.listen(PORT, () => console.log(`Servidor rodando na porta ${PORT}`));