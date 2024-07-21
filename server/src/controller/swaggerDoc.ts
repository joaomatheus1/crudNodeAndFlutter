import { Request, Response } from "express";

export const redirecionarDoc = (req: Request, res: Response) => {
    res.redirect("/api/docs");
};