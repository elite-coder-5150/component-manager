// @ts-ignore
/**
 * @deprecated
 * @see ComponentController
 */
// @ts-ignore
import fs from 'fs';
const fp = '';
const fc = 'testing'
export class FileController {
    createFile(req, res) {
        const { file_path, file_content, error } = req.body;

        if (error) {
            console.log('error creating file')
        } else {
            fs.writeFile(file_path, file_content, err => {
                if (err) {
                    console.error(err);
                } else {
                    console.log('file created');
                }
            });
        }
    }

    readFile(req, res) {
        const { file_path, error } = req.body;

        if (error) {
            console.log('error reading file')
        } else {
            fs.readFile(file_path, 'utf8', (err, data) => {
                if (err) {
                    console.error(err);
                } else {
                    console.log(data);
                }
            });
        }
    }

    // q: what does the above function do?
    // a: it reads the file at the given path and returns the contents of the file as a string

    updateFile(req, res) {
        const { file_path, file_content, error } = req.body;

        if (error) {
            console.log('error updating file')
        } else {
            fs.writeFile(file_path, file_content, err => {
                if (err) {
                    console.error(err);
                } else {
                    console.log('file updated');
                }
            });
        }
    }

    deleteFile(req, res) {
        const { file_path, error } = req.body;

        if (error) {
            console.log('error deleting file')
        } else {
            fs.unlink(file_path, err => {
                if (err) {
                    console.error(err);
                } else {
                    console.log('file deleted');
                }
            });
        }
    }
}
