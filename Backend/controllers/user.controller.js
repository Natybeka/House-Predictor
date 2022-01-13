exports.allAccess = (req, res) => {
  res.status(200).send("Public Content.");
};

exports.userScreen = (req, res) => {
  res.status(200).send("User Content.");
};

exports.adminAccess = (req, res) => {
  res.status(200).send({ msg: "Admin access granted" });
};

exports.creatorScreen = (req, res) => {
  res.status(200).send("CreatorContent Content.");
};
