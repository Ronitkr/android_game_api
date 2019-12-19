const router = require('express').Router();
const db = require('../config/database');


router.post('/', (req,res) => {
    const user_id = req.body.user_id;
    const betting_id = req.body.betting_id;
    const game_type = req.body.game_type;
    const amount = req.body.amount;
    const total_amount = req.body.total_amount;
    const type = req.body.type;
    const remark = req.body.remark;

    const sql = `INSERT INTO user_transactions (user_id, betting_id, game_type, amount, total_amount, type, remark ) VALUES ("${user_id}", "${betting_id}", "${game_type}", ${amount}, "${total_amount}", "${type}", "${remark}")`;

    db.query(sql, (err, result) => {
        if (err) throw err;
        console.log(" 1 result inserted");
    })    

});

    router.get('/fetch', (req, res) => {
        const query = 'select * from user_transactions';

        db.query(query, (err, rows, field) => {
            if (err) throw err; 
            res.json(rows);
        })
    })




module.exports = router;