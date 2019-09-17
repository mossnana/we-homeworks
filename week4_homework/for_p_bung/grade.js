exports.checkGrade = (point) => {
    if(point >= 80) {
        return "A"
    } else if(point >= 70) {
        return "B"
    } else if(point >= 60) {
        return "C"
    } else if(point >= 50) {
        return "D"
    } else {
        return "F"
    }
}