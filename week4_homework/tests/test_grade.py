from odoo.tests import common

class TestGradeModel(common.TransactionCase):
    def test_case_a(self):
        vals= {
            'code': 2,
            'stu_name': 'Wiraphorn wannasorn',
            'stu_point': 80
        }
        record = self.env['we.grade'].create(vals)
        self.assertEqual(record.stu_grade,'A')

    def test_case_b(self):
        vals= {
            'code': 2,
            'stu_name': 'Wiraphorn wannasorn',
            'stu_point': 70
        }
        record = self.env['we.grade'].create(vals)
        self.assertEqual(record.stu_grade,'B')

    def test_case_c(self):
        vals= {
            'code': 2,
            'stu_name': 'Wiraphorn wannasorn',
            'stu_point': 60
        }
        record = self.env['we.grade'].create(vals)
        self.assertEqual(record.stu_grade,'C')

    def test_case_d(self):
        vals= {
            'code': 2,
            'stu_name': 'Wiraphorn wannasorn',
            'stu_point': 50
        }
        record = self.env['we.grade'].create(vals)
        self.assertEqual(record.stu_grade,'D')

    def test_case_f(self):
        vals= {
            'code': 2,
            'stu_name': 'Wiraphorn wannasorn',
            'stu_point': 49
        }
        record = self.env['we.grade'].create(vals)
        self.assertEqual(record.stu_grade,'F')
