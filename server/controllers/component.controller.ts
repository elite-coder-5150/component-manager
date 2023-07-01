// @ts-ignore
import {db} from "../database/database";
export class ComponentController {
    // todo: finish this method tomorrow in the mid monning after reading the bible.
    createComponent(req, res) {
        const {name, description, image_url, price, owner} = req.body;
        const sql = `
            insert into component (component_id, author, name, version, description, type, 
                                   has_documentation, has_tests, styles, logic, template, created_at, updated_at)
                                   created, updated, likes, shares, comments) (null, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            `;

        // why is null giving the error?

        db.query(sql, [null, owner, name, description, image_url, price, new Date(), new Date()], (err, results) => {
            if (err) {
                console.error(err);
            } else {
                res.json(results);
            }
        });
    }

    // q: can you help my in wrting sql?
    // a: yes, I can help you in writing sql
}
