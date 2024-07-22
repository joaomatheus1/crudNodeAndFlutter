export const INSERIR_COLABORADOR = `INSERT INTO colaboradores (nome) VALUES (?)`;

export const GET_COLABORADOR_WORK_INFO = `
SELECT 
    colaboradores.id AS colaborador_id, 
    colaboradores.nome AS colaborador_nome, 
    workshops.id AS workshop_id, 
    workshops.nome AS workshop_nome, 
    workshops.descricao AS workshop_descricao, 
    workshops.dataRealizacao AS workshop_dataRealizacao
FROM 
    colaboradores
LEFT JOIN 
    ata_colaboradores ON colaboradores.id = ata_colaboradores.colaborador_id
LEFT JOIN 
    atas ON ata_colaboradores.ata_id = atas.id
LEFT JOIN 
    workshops ON atas.workshop_id = workshops.id
ORDER BY 
    colaboradores.nome;
`;

export const INSERIR_WORKSHOP = `INSERT INTO workshops (nome, dataRealizacao, descricao) VALUES (?, ?, ?)`;

export const CRIAR_ATA = `INSERT INTO atas (workshop_id, data) VALUES (?, ?)`;

export const INSERIR_COLABORADOR_ATA = `INSERT INTO ata_colaboradores (ata_id, colaborador_id) VALUES (?, ?)`;

export const REMOVER_COLABORADOR_ATA = `DELETE FROM ata_colaboradores WHERE ata_id = (?) AND colaborador_id = (?)`;

export const GET_WORKSHOP_DATA =  `
SELECT 
    colaboradores.id AS colaborador_id, 
    colaboradores.nome AS colaborador_nome, 
    workshops.id AS workshop_id, 
    workshops.nome AS workshop_nome, 
    workshops.descricao AS workshop_descricao, 
    workshops.dataRealizacao AS workshop_dataRealizacao
FROM 
    colaboradores
JOIN 
    ata_colaboradores ON colaboradores.id = ata_colaboradores.colaborador_id
JOIN 
    atas ON ata_colaboradores.ata_id = atas.id
JOIN 
    workshops ON atas.workshop_id = workshops.id
WHERE 
    workshops.dataRealizacao = ?
ORDER BY 
    colaboradores.nome;
`;

export const GET_WORKSHOP_NOME = `
SELECT 
    colaboradores.id AS colaborador_id,          
    colaboradores.nome AS colaborador_nome,      
    workshops.id AS workshop_id,                 
    workshops.nome AS workshop_nome
FROM 
    colaboradores
    JOIN ata_colaboradores ON colaboradores.id = ata_colaboradores.colaborador_id
    JOIN atas ON ata_colaboradores.ata_id = atas.id
    JOIN workshops ON atas.workshop_id = workshops.id
WHERE 
    workshops.nome LIKE ?
`;