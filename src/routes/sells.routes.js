import {Router} from 'express'
const router = Router()

router.get('/', (req, res) => {
    res.json({hola: 'mundo desde ventas'})
})

export default router