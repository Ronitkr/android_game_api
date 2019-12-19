// const express = require('express');
const router = require('express').Router();
const db = require('../config/database'); 
const address = require('address');

 
router.post('/', (req, res) => {
    const browsers = req.useragent.browser;
    const oss = req.useragent.os;
    const ips = req.ip;
    
    console.log(browsers);
    const contarct_id = req.body.contarct_id;
    const username = req.body.username;
    const password = req.body.password;
    const email = req.body.email;
    const mobile = req.body.mobile;
    const amount = req.body.amount;
    const email_verify_code = req.body.email_verify_code;
    const email_verify_status = req.body.email_verify_status;
    const otp = req.body.otp;
    const mobile_verify_status = req.body.mobile_verify_status;
    const ip = ips;
    const browser = browsers;
    const os = oss;
    // const last_login = req.body.last_login;
    // const added_on_on = req.body.added_on;
    // const modified_on = req.body.modified_on;
    const account_status = req.body.account_status;
    const sql = `INSERT INTO users (username, password, email, mobile, amount, email_verify_code, email_verify_status, otp, mobile_verify_status, ip, browser_detail, os, account_status) VALUES ("${username}", "${password}", "${email}", "${mobile}", "${amount}","${email_verify_code}", "${email_verify_status}", "${otp}", "${mobile_verify_status}", "${ip}", "${browser}", "${os}", "${account_status}")`;
    db.query(sql, (err, result) => {
        if(err) throw err;
        console.log("1 record inserted")
    })
    console.log(ip, browsers, os);

});

router.get('/fetch', (req, res) => {
    const fetch = "SELECT * FROM users";
    db.query(fetch, (err, rows, field)=>{
        if(err) throw err;
        res.json(rows);
    })

})

module.exports = router;