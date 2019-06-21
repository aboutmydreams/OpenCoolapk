import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:opencoolapk/data/api/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // String captchaImageUrl = "";
  // bool reqHashGet = false;

  // AuthRequest authRequest = AuthRequest();

  // String err;

  @override
  void initState() {
    super.initState();
    // authRequest.getRequestHash().then((resp) {
    //   setState(() {
    //     reqHashGet = true;
    //   });
    // }).catchError((er) {
    //   setState(() {
    //     this.err = er;
    //   });
    // });
    // captchaImageUrl = authRequest.getCaptchaImageUrl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: BackButtonIcon(), onPressed: () {
          Navigator.pop(context);
        }),
        title: Text("登录"),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 400,
          child: _buildForm(), // err == null ? _buildForm() : _buildErr(),
        ),
      ),
    );
  }

  String sessid;
  String token;
  String uid;
  String username;

  //
  _build() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextFormField(
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            filled: true,
            hintText: "SESSID",
          ),
          onFieldSubmitted: (v) {
            setState(() {
              sessid = v;
            });
          },
        ),
        TextFormField(
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            filled: true,
            hintText: "token",
          ),
          onFieldSubmitted: (v) {
            setState(() {
              token = v;
            });
          },
        ),
        TextFormField(
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            filled: true,
            hintText: "uid",
          ),
          onFieldSubmitted: (v) {
            setState(() {
              uid = v;
            });
          },
        ),
        TextFormField(
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            filled: true,
            hintText: "username",
          ),
          onFieldSubmitted: (v) {
            setState(() {
              username = v;
            });
          },
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Form(
      child: Column(
        children: <Widget>[
          Text(
            "登入 酷安",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Theme.of(context).textTheme.title.color),
          ),
          Expanded(
            child: _build(),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("登入"),
          ),
          FlatButton(
            onPressed: () {
              _aboutThis();
            },
            child: Text("如何使用?"),
          )
        ],
      ),
      onChanged: () {},
      onWillPop: () async {},
    );
  }

  _aboutThis() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text("关于登录"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: Divider(),
                ),
                Text(
                  'Q: 如何使用？\r\nA: 前往 https://account.coolapk.com/auth/loginByCoolapk\r\n登录后，打开您浏览器的cookie管理窗口，找到与输入框对应的提示名称的cookie，填入相应的值。',
                  softWrap: true,
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Divider(),
                ),
                Text(
                  'Q: 为什么使用这种登录方式？\r\nA: 因为这个登录方式可能更为安全(其实还是没做好)',
                  softWrap: true,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
                  child: Divider(),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text("了解!"),
              )
            ],
          );
        });
  }

  // Widget _buildErr() {
  //   return RaisedButton(
  //       onPressed: () {
  //         Navigator.pop(context);
  //       },
  //       child: Text(
  //         "出错!点击返回\r\n" + err.toString(),
  //       ));
  // }

  // List<Widget> _buildFormField() {
  //   return <Widget>[
  //     TextFormField(
  //       textCapitalization: TextCapitalization.words,
  //       decoration: InputDecoration(
  //         filled: true,
  //         icon: Icon(Icons.person),
  //         hintText: "用户名",
  //       ),
  //       onFieldSubmitted: (v) {
  //         setState(() {
  //           this.authRequest.account = v;
  //         });
  //       },
  //     ),
  //     TextFormField(
  //       obscureText: true,
  //       textCapitalization: TextCapitalization.words,
  //       decoration: InputDecoration(
  //         filled: true,
  //         icon: Icon(Icons.vpn_key),
  //         hintText: "密码",
  //       ),
  //       onFieldSubmitted: (v) {
  //         setState(() {
  //           this.authRequest.passwd = v;
  //         });
  //       },
  //     ),
  //     TextFormField(
  //       textCapitalization: TextCapitalization.words,
  //       decoration: InputDecoration(
  //         filled: true,
  //         hintText: "验证码",
  //         suffix: captchaImageUrl == null
  //             ? Container(
  //                 width: 0,
  //               )
  //             : Image.network(
  //                 captchaImageUrl,
  //                 scale: 2,
  //               ),
  //       ),
  //       onFieldSubmitted: (v) {
  //         setState(() {
  //           this.authRequest.captcha = v;
  //         });
  //       },
  //     )
  //   ];
  // }
}
