require("dotenv").config()
const express = require("express"); // import express
const db = require("../db");
const app = express();
const request = require("supertest"); // supertest is a framework that allows to easily test web apisconst app = express(); //an instance of an express app, a 'fake' express app
const userRoutes = require("../routes/users"); //import file we are testing
app.use("/users", userRoutes); //routes


jest.mock("./fakeUsers.json", () => [
    {
        emailUser:'jean5414@yahoo.com', 
        mdpUser: 'bonjour89654',
        nomUser:'Dupont' ,
        prenomUser: 'Jean', 
        telUser:'0647458966', 
        adresseUser: '2 rue Jean Jaurès', 
        paysUser: 'France',
        situationUser:'',
        handicapUser:false
    },
    {
        emailUser:'martine.dubert@laposte.fr', 
        mdpUser: 'md654',
        nomUser: 'Dubert' ,
        prenomUser: 'Martine', 
        telUser:'0647458966', 
        adresseUser: '2 rue Jean Jaurès', 
        paysUser: 'France',
        situationUser:'',
        handicapUser:false
    },
  ]); //callback function with mock data

describe("user-routes", () => {
  it("GET /users - success", async () => {
    const { body } = await request(app).get("/users"); //use the request function that we can use the app// save the response to body variable
    expect(body).toEqual([
        {
            id: '1',
            emailUser:'jean5414@yahoo.com', 
            mdpUser: 'bonjour89654',
            nomUser:'Dupont' ,
            prenomUser: 'Jean', 
            telUser:'0647458966', 
            adresseUser: '2 rue Jean Jaurès', 
            paysUser: 'France',
            situationUser:'',
            handicapUser:false
        },
        {
          id: 2,
          emailUser:'martine.dubert@laposte.fr', 
          mdpUser: 'md654',
          nomUser: 'Dubert' ,
          prenomUser: 'Martine', 
          telUser:'0647458966', 
          adresseUser: '2 rue Jean Jaurès', 
          paysUser: 'France',
          situationUser:'',
          handicapUser:false
        },
    ]);
    const firstUser = body[0].id;
  })   

  it("GET /users/1 - success", async () => {
    const firstUser = {
      id: '1',
      emailUser:'jean5414@yahoo.com', 
      mdpUser: 'bonjour89654',
      nomUser:'Dupont' ,
      prenomUser: 'Jean', 
      telUser:'0647458966', 
      adresseUser: '2 rue Jean Jaurès', 
      paysUser: 'France',
      situationUser:'',
      handicapUser:false
    }
    const { body } = await request(app).get(`/users/${firstUser.id}`);

    expect(firstUser).toEqual(1);
  });
});