import responder

api = responder.API()

@api.route("/predict/{number}")
async def greet_world(req, resp, *, number):
    resp.text = f"{float(number) - 1.0}"

if __name__ == '__main__':
    api.run()
