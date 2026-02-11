import { Hono } from 'hono'

const app = new Hono()

app.get('/', (c) => {
  return c.text('Hello Hono!')
})

app.get('/test', (c) => {
  return c.json({
    name: "my friend",
    challenge: "yes"
  })
})

const port = parseInt(process.env.PORT || '3000')

export default {
  port,
  fetch: app.fetch,
}
