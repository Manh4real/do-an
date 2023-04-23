require("dotenv").config();

const jwt = require("jsonwebtoken");

module.exports = {
	authenticateToken(req, res, next) {
		const authHeader = req.headers['authorization'];
		const token = authHeader && authHeader.split(" ")[1];

		if(!token) return res.status(401).json({
			status: "error",
			message: "Invalid token"
		});

		jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
			if(err) { 
				return res.status(403).json({
					status: "error",
					message: "The token is no longer valid"
				});
			}

			req.user = user;
			next();
		});
	}
}