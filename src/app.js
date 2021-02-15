import express, {json, urlencoded} from 'express'
import morgan from 'morgan'
const app = express()

//importing routes
import IndexRoutes from './routes/index.routes'
import UserRoutes from './routes/users.routes'
import ProviderRoutes from './routes/providers.routes'
import ProductRoutes from './routes/products.routes'
import ClientRoutes from './routes/clients.routes'
import SellRoutes from './routes/sells.routes'
import HeaderRoutes from './routes/headers.routes'


//settings
app.set('port', process.env.PORT || 3000 )
app.use(json())
app.use(urlencoded({extended: false}))
app.use(morgan('dev'))


//routes
app.use(IndexRoutes)
app.use('/api/users', UserRoutes)
app.use('/api/providers', ProviderRoutes)
app.use('/api/products', ProductRoutes)
app.use('/api/clients', ClientRoutes)
app.use('/api/sells', SellRoutes)
app.use('/api/headers', HeaderRoutes)

export default app