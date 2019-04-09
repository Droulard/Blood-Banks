import tornado.ioloop
import tornado.web
import os
import SQL_Interface as sql
import file_writer as fw


root = os.path.join(os.path.dirname(__file__), ".")


class MainHandler(tornado.web.RequestHandler):

    # Get function is what renders the html page when it is called, we also backup the database at this time as well
    def get(self):
        self.render('index.html', output=' ')
        fw.newbackup()
        sql.BackUpALL()

    # Post function is where all functionality comes from, each if statement represents a different button
    def post(self):

        out = """"""
        # Following buttons gather data
        if self.get_argument("dona", None) is not None:
            # Do Donation Procedure here
            city = self.get_argument("city", " ")
            date = self.get_argument("rdate", " ")
            x = str(1) + "," + city + "," + date
            fw.varwrite(x)
            out = sql.FindDon(city, date.replace("-", ""))[0]

        if self.get_argument("request", None) is not None:
            # Do Request Procedure here
            city = self.get_argument("city", " ")
            date = self.get_argument("rdate", " ")
            x = str(2) + "," + city + "," + date
            fw.varwrite(x)
            out = sql.FindR(city, date.replace("-", ""))[0]

        if self.get_argument("inv", None) is not None:
            city = self.get_argument("city", " ")
            out = sql.checkinv(city)[0]

        # Following buttons will write data, backup functions should be uncommented at go time
        if self.get_argument("updateinv", None) is not None:
            # Do Update Procedure here
            fw.backup(sql.PrintInventory())
            x = fw.varread()
            y = x.split(",")
            x = y[2]
            y[2] = y[2].replace('-', '')
            z = int(y[0])
            if z == 1:
                print('Donation Made for ' + y[1] + " on " + x)
                v = x + ' Donation Made for ' + y[1]
                fw.trans(v)
                print('Totals')
                sql.updateinv(y[1], y[2], z)
            elif z == 2:
                print('Request Made for ' + y[1] + " on " + x)
                v = x + ' Request Made for ' + y[1]
                fw.trans(v)
                print('Totals: ')
                sql.updateinv(y[1], y[2], z)
            out = sql.checkinv(y[1])[0]

        if self.get_argument("donation", None) is not None:
            # Do Create Donation Procedure here
            print("Donation Button Pushed")
            fw.backup(sql.PrintDonation())
            date = self.get_argument("Date", " ")
            lname = self.get_argument("lastname", " ")
            quant = self.get_argument("quantity(ml)", " ")
            city = self.get_argument("city", " ")
            out = sql.CreateDon(date.replace("-", ""), lname, quant, city)
            fw.trans(date + out)

        if self.get_argument("req", None) is not None:
            # Do Create Request Procedure here
            print("Request Button Pushed")
            fw.backup(sql.PrintRequests())
            date = self.get_argument("date", " ")
            hname = self.get_argument("hname", " ")
            btype = self.get_argument("btype", " ")
            quant = self.get_argument("quantity", " ")
            sql.CreateReq(date.replace("-", ""), hname, btype, quant)
            x = '''Request Made:\n'''
            y = """Date: """ + str(date) + """\nHospital Name: """ + hname + """\nQuantity: """ + \
                str(quant) + """\nBlood Type: """ + btype
            fw.trans(x+y)
            out = x + y

        self.render('index.html', output=out)
        print(out)


def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
        (r"/assets/(.*)", tornado.web.StaticFileHandler, {'path': os.path.join(root, 'assets')})
    ])


if __name__ == "__main__":
    app = make_app()
    app.listen(8886)
    tornado.ioloop.IOLoop.current().start()
