import { exec } from "child_process";
import express from "express";

const app = express();
const port = 8080;

app.use(express.json());

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.get("/cpp", (req, res) => {
    exec("g++ --version", (error, stdout, stderr) => {
        if (error) {
            console.log(`error: ${error.message}`);
            return;
        }
        if (stderr) {
            console.log(`stderr: ${stderr}`);
            return;
        }
        console.log(`stdout: ${stdout}`);
        return res.json({
            message: "outpt: "+stdout
        });
    });
    
});

app.get("/java", (req, res) => {
    exec("java --version", (error, stdout, stderr) => {
        if (error) {
            console.log(`error: ${error.message}`);
            return;
        }
        if (stderr) {
            console.log(`stderr: ${stderr}`);
            return;
        }
        console.log(`stdout: ${stdout}`);
        return res.json({
            message: "outpt: "+stdout
        });
    });
});

app.listen(port, (req, res) => {
    console.log(`Server is running on http://localhost:${port}.`);
});