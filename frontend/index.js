import express from 'express';
import fetch from 'node-fetch';

const app = express();
const port = 4000();

app.get("/", async (req, res) => {
    try {
        const response = await fetch("https://192.168.100.10:3000/peliculas");
        const data = await response.json();

        const tableRows = data.map(movie => `
            <tr>
                <td>${movie.IdPelicula}</td>
                <td>${movie.Nombre}</td>
                <td>${movie.Genero}</td>
            </tr>
        `);

        const html = `
            <html>
                <head>
                    <title>Frontend</title>
                </head>
                <body>
                    <h1>Frontend</h1>
                    <table>
                        <thead>
                            <tr>
                                <th>IdPelicula</th>
                                <th>Nombre</th>
                                <th>Genero</th>
                            </tr>
                        </thead>
                        <tbody>
                            ${tableRows.join('')}
                        </tbody>
                    </table>
                </body>
            </html>
        `;

        res.send(html);
    } catch (error) {
        res.status(500).send('Error fetching data');
    }
});

app.listen(port, () => {
    console.log(`Frontend server running at http://localhost:${port}`);
});