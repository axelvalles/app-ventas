import '@babel/polyfill'
import app from './app'

function main(){
    app.listen(app.get('port'), () => {
        console.log('Servidor a su servicio en el puerto ' + app.get('port') );
        console.log('http://localhost:3000');
    });
}

main()