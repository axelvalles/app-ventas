import {Sequelize} from 'sequelize'

const sequelize = new Sequelize(
    'app_ventas',
    'root',
    '',
    {
        host: 'localhost',
        dialect: 'mysql',
        pool: {
            max: 5,
            min: 0,
            require: 30000,
            idle: 10000
        },

        logging: false
        
    }
)

export default sequelize

