import User from '../models/user'


export const createUser = async (req, res) =>{
    const {name, user, pass} = req.body
    try {
        let newUser = await User.create({
            name,
            user,
            pass
        },{ 
            fields: ["name", "user", "pass"] 
    });

        if(newUser){
            res.status(200).json({
                message: 'Usuario creado exitosamente',
                data: newUser
            })
        }
    } catch (e) {
        console.log(e);
        res.status(500).json({
            message: 'Ocurrio un error en la creacion del usuario :(',
            data: {}
        })
        console.log(e);
    }
}

export const findAllUser = async (req, res) => {
    try {
        let users = await User.findAll()
        res.status(200).json({
        data: users
    })
    } catch (e) {
        console.log(e);
        res.status(500).json({
            message: 'Ooops a ocurrido un problema :(',
            data: {}
        })
    }
    
}

export const findOneUser = async (req, res) => {
    const {id} = req.params;
    try {
        const user = await User.findOne({
            where: {
                id
            }
        });
        res.status(200).json({
            data: user
        })
    } catch (e) {
        console.log(e);
        res.status(500).json({
            message: 'Ooops a ocurrido un problema :(',
            data: {}
        })
    }
}

export const deleteUser = async (req, res) => {
    const {id} = req.params;
    try {
        const deleteRowCount = await User.destroy({
            where: {
                id
            }
        });
        res.status(200).json({
            data: deleteRowCount
        })
    } catch (e) {
        console.log(e);
        res.status(500).json({
            message: 'Ooops a ocurrido un problema :(',
            data: {}
        })
    }
}