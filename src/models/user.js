import {Sequelize} from 'sequelize'
import sequelize from '../database'

const User = sequelize.define('user', {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true 
    },
    name: {
        type: Sequelize.TEXT
    },
    user: {
        type: Sequelize.TEXT
    },
    pass: {
        type: Sequelize.TEXT
    } ,
    create_at: {
        type: Sequelize.DATE
    },
    edited_at: {
        type: Sequelize.DATE
    }
},{
    timestamps: false
})

export default User