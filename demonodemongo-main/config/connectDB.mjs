import mongoose from "mongoose";

export function connectDB() {
  mongoose
    .connect("mongodb://127.0.0.1:27017/demomonggodb")
    .then(() => console.log("Connected!"));
}
