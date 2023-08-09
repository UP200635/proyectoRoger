import express from 'express';
import { createConnection } from 'mysql2';
import cors from 'cors';

const app = express();
app.use(cors());

const pool = createConnection({
    host: "mysqldb",
    port: 3306,
    user: "angel",
    password: "110202",
    database: "test"
});

app.get("/", (req, res) => {
    res.json("Hola desde el back");
});

app.get("/peliculas", async (request, response) => {
    try{
        const [rows] = await pool.query("SELECT * FROM pelicula");
        response.json(rows);
    } catch (error){
        response.status(500).json({ error: "Internal server error" });
    }
});

app.listen(3000, () => {
    console.log("Server on port 3000");
});