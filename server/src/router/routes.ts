import express from "express";
import { AtasController } from "../controller/atasController";
import { ColaboradorController } from "../controller/colaboradorController";
import { redirecionarDoc } from "../controller/swaggerDoc";
import { WorkshopController } from "../controller/workshopController";

const router = express.Router();
const workshop = new WorkshopController;
const colaborador = new ColaboradorController;
const atas = new AtasController;

router.get("/", redirecionarDoc);

router.post("/api/workshops", (req, res) => {
    workshop.inserirWorkshop(req, res);
});
router.get("/api/workshops", (req, res) => {
    workshop.filtroWorkshopNomeData(req, res);
});
router.post("/api/colaboradores", (req, res) => {
    colaborador.inserirColaborador(req, res);
});
router.get("/api/colaboradores", (req, res) => {
    colaborador.getColaboradorWorkInfo(req, res);
});
router.post("/api/atas", (req, res) => {
    atas.criarAta(req, res);
});
router.put("/api/atas/:ataId/colaboradores/:colaboradorId", (req, res) => {
    atas.inserirColaboradorAta(req, res);
});
router.delete("/api/atas/:ataId/colaboradores/:colaboradorId", (req, res) => {
    atas.removerColaboradorAta(req, res);
});

export default router;