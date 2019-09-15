# -*- encoding: utf-8 -*-
# Part of Odoo. See LICENSE file for full copyright and licensing details.
from odoo.models import Model
from odoo import api, fields
from odoo.fields import Char
from odoo.fields import Float
from odoo.fields import Many2one as m2o


class WEGrade(Model):
    _name = "we.grade"
    _description = "Grade Calculate"

    code = Char("Code")
    stu_name = Char("Student Name")
    stu_point = Float("Point")
    stu_grade = Char("Grade", compute="_get_grade")

    def check_grade(self, point):
        if point >= 80:
            # A
            return "A"
        elif point >= 70:
            # B
            return "B"
        elif point >= 60:
            # C
            return "C"
        elif point >= 50:
            # D
            return "D"
        else:
            # F
            return "F"

    @api.depends('stu_point')
    @api.multi
    def _get_grade(self):
        for obj in self:
            point = obj.stu_point
            grade = self.check_grade(point)
            self.update({
                'stu_grade': grade
            })