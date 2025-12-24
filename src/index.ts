import { Hono } from "hono";
import { getConnInfo } from "hono/cloudflare-workers";

const app = new Hono<{ Bindings: CloudflareBindings }>();

app.get("/refresh", (c) => {
  const info = getConnInfo(c);
  return c.text(`${info.remote.address}`);
});

export default app;
