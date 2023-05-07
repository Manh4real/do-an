const patterns = {
    // user related
    email:
        /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,
    password: /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/,
    phone:
        /^((\+0?1\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4})|((\+\d{1,2}\s?)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4})$/,
    postalCode: /[0-9]+/,
    name: /^(?!\s*$).{1,10}$/,
    address: /^(?!\s*$).+$/,
    rating: /^[1-5]$/,
    review: /^[.\s\S]{5,500}$/,
    reviewTitle: /^[.\s\S]{0,50}$/,
    // product related
    product_name: /^(?!\s*$).{1,50}$/,
    category: /^(?!\s*$).{1,50}$/,
    target: /^(?!\s*$).{1,20}$/,
    number: /^[0-9]+$/,
    description: /^(?!\s*$).{0,}$/
};

class Validation {
    validateEmail(email: string) {
        return {
            isValid: patterns["email"].test(email),
            errorMessage: "Please enter correct email format"
        };
    }
    validatePassword(password: string) {
        return {
            isValid: patterns["password"].test(password),
            errorMessage: "Password must has more than 8 characters that contain letters and numbers"
        };
    }
    validatePhone(phone: string) {
        return {
            isValid: patterns["phone"].test(phone),
            errorMessage: "Please enter correct phone format"
        };
    }
    validateName(name: string) {
        return {
            isValid: patterns["name"].test(name),
            errorMessage: "Must less than 10 characters"
        };
    }
    validateBirthday(birthday: Date) {
        if (!birthday) return {
            isValid: false,
            errorMessage: "Birthday is in a wrong format"
        }

        const now = new Date();
        const year = birthday.getFullYear();
        const month = birthday.getMonth() + 1;
        const day = birthday.getDate();

        // valid check
        if (!validCheck()) return {
            isValid: false,
            errorMessage: "Birthday is an invalid date"
        }
        // check age
        if (now.getFullYear() - year <= 12 || now.getFullYear() - year > 70) return {
            isValid: false,
            errorMessage: "Your age must be greater than 12 and less than 70"
        }

        return {
            isValid: true,
            errorMessage: ""
        }

        function validCheck() {
            if (month === 2) {
                if (isLeapYear(year)) {
                    if (day > 29 || day <= 0) return false;
                } else {
                    if (day > 28 || day <= 0) return false;
                }
            } else if (month === 1 || month === 3 || month === 5 || month === 7 || month === 8 || month === 10 || month === 12) {
                if (day > 31 || day <= 0) return false;
            } else if (month === 4 || month === 6 || month === 9 || month === 11) {
                if (day > 30 || day <= 0) return false;
            }

            return true;
        }
        function isLeapYear(year: number) {
            if ((year % 4 === 0 && year % 100 !== 0 && year % 400 !== 0) || (year % 100 === 0 && year % 400 === 0)) {
                return true;
            } else {
                return false;
            }
        };
    }
    validateProductName(value: string) {
        return {
            isValid: patterns["product_name"].test(value),
            errorMessage: "Product name must less than 50 characters"
        };
    }
    validateCategory(value: string) {
        return {
            isValid: patterns["category"].test(value),
            errorMessage: "Category must less than 50 characters"
        };
    }
    validateTarget(value: string) {
        return {
            isValid: patterns["target"].test(value),
            errorMessage: "Must less than 50 characters"
        };
    }
    validateNumber(value: string) {
        return {
            isValid: patterns["number"].test(value),
            errorMessage: "Must contains digits from 0-9"
        };
    }
    validateDescription(value: string) {
        return {
            isValid: patterns["description"].test(value),
            errorMessage: "Please describe the product"
        };
    }
}

export default Validation;