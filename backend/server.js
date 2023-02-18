require("dotenv").config();

const express = require("express");
const app = express();
const server = require("http").createServer(app);
const io = require("socket.io")(server, { cors: { origin: "*" } });
const mongoose = require("mongoose");
const config = require("./config/defaults");

app.use(express.json());

app.use(function (req, res, next) {
    req.io = io;
    next();
});

const usersRouter = require("./routes/customer.routes");
app.use("/api/customer", usersRouter);

const printRoutes = require("./routes/print.routes");
app.use("/api/print", printRoutes);

const transactionRoutes = require("./routes/transaction.routes");
app.use("/api/transaction", transactionRoutes);

const shopkeepersRouter = require("./routes/shopkeeper.routes");
app.use("/api/shopkeeper", shopkeepersRouter);

const orderRoutes = require("./routes/order.routes");
app.use("/api/order", orderRoutes);

const authRoutes = require("./routes/auth.routes");
app.use("/api/auth", authRoutes);

const itemRoutes = require("./routes/item.routes");
app.get("/", (req, res, next) => {
    return res.send("Kameng Kriti API v0.0.1");
});
app.use("/api/item", itemRoutes);

app.use((err, req, res, next) => {
    console.log(err.message);
    const { status = 500, message = "Something went wrong!" } = err;
    return res.status(status).json({
        error: true,
        message: message,
    });
});

io.on("connection", (socket) => {
    console.log("Client connected", socket.id);
    socket.on("join-room", (room) => socket.join(room));
    socket.on("cancelled-order", (data) => {
        console.log(data);
        io.to(data.shopkeeperId).emit("cancelled-order", data.orderId);
        io.to(data.customerId).emit("cancelled-order", data.customerId);
    });
});

mongoose.set("strictQuery", false);
mongoose
    .connect(config.MONGO_URI)
    .then(() => {
        console.log("DB Connected");
        server.listen(config.PORT, () => console.log("Server Started on port", config.PORT));
    })
    .catch((e) => {
        console.log(e);
        process.exit(1);
    });
