import User from "../models/user.mjs";
class UserController {
  static async index(req, res) {
    let q = req.query.q;
    q = `.*${q}.*`;
    var re = new RegExp(q);
    let users = await User.find({});
    res.render("user", { title: "User Management", users });
  }
  static async new(req, res) {
    res.render("formnew", { title: "User Management" });
  }
  static async delete(req, res) {
    let userdelete = await User.deleteOne({ _id: req.params.id });
    res.redirect("/users");
  }
  static async create(req, res) {
    let { email, name, role } = req.body;
    let user = await User.create({ email, name, role });
    if (user) {
      res.redirect("/users");
    } else {
      res.render("formnew", { title: "User Management" });
    }
  }
}

export default UserController;
