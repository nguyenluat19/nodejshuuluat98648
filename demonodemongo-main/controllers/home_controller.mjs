import City from "../models/city.mjs";
class HomeController {
  static async index(req, res) {
    try {
      let data = await City.find({});
      let cityIndex = parseInt(req.query.city);

      // Kiểm tra tính hợp lệ của cityIndex và đảm bảo rằng data có phần tử tại cityIndex
      if (!isNaN(cityIndex) && cityIndex >= 0 && cityIndex < data.length) {
        let plate_no = data[cityIndex].plate_no;
        console.log(plate_no);
        res.render("index", { title: "Home Page", data, plate_no });
      } else {
        res.status(400).send("Invalid city index");
      }
    } catch (error) {
      console.error("Error fetching data:", error);
      res.status(500).send("Internal Server Error");
    }
  }
}

export default HomeController;
