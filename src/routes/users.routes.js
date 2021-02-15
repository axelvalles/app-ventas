import {Router} from 'express'
const router = Router()

import * as CtrlUsers from '../controllers/user.controller'

router.get('/', CtrlUsers.findAllUser )

router.post('/', CtrlUsers.createUser )

router.get('/:id', CtrlUsers.findOneUser )

router.post('/:id', CtrlUsers.deleteUser )

router.put('/')


export default router