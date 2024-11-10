import mongoose from "mongoose";

const Schema = mongoose.Schema;

const citySchema = new Schema({
  city: String,
  plate_no: String,
});

const City = mongoose.model("city", citySchema);

export default City;
