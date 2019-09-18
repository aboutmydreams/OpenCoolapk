import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:opencoolapk/data/api/api.dart';
import 'package:opencoolapk/data/api/user.dart';
import 'package:opencoolapk/data/sharedpreference.dart';
import 'package:opencoolapk/redux/global.dart';

// 主要的登录逻辑：
// 保存参数到cookieJar,获取用户数据设置到GlobalState, 通知redux改变状态，
// 我知道很乱....

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
    Api.cjar.loadForRequest(Uri.parse("https://coolapk.com")).forEach((c) {
      oldValues[c.name] = c.value;
    });
  }

  Map<String, String> oldValues = {
    "SESSID": "",
    "token": "",
    "uid": "",
    "username": ""
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: BackButtonIcon(),
            onPressed: () {
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

  var sessidKey = GlobalKey<FormFieldState>();
  var tokenKey = GlobalKey<FormFieldState>();
  var uidKey = GlobalKey<FormFieldState>();
  var usernameKey = GlobalKey<FormFieldState>();

  //
  _build() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextFormField(
          controller: TextEditingController(text: oldValues['SESSID']),
          key: sessidKey,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            filled: true,
            hintText: "SESSID",
          ),
        ),
        TextFormField(
          controller: TextEditingController(text: oldValues['token']),
          key: tokenKey,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            filled: true,
            hintText: "token",
          ),
        ),
        TextFormField(
          controller: TextEditingController(text: oldValues['uid']),
          key: uidKey,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            filled: true,
            hintText: "uid",
          ),
        ),
        TextFormField(
          controller: TextEditingController(text: oldValues['username']),
          key: usernameKey,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            filled: true,
            hintText: "username",
          ),
        ),
      ],
    );
  }

  Widget _buildForm() {
    final form = Form(
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
          StoreConnector<GlobalState, GlobalState>(
              converter: (store) => store.state,
              builder: (context, state) {
                if (state.nowUser == null) return const SizedBox();
                return Text("登录成功");
              }),
          StoreConnector<GlobalState, VoidCallback>(
            converter: (store) {
              return () => store.dispatch(Action.LOGGED);
            },
            builder: (ctx, callback) {
              return RaisedButton(
                onPressed: () {
                  var sessid = (sessidKey.currentState.value);
                  var token = tokenKey.currentState.value;
                  var uid = uidKey.currentState.value;
                  var un = usernameKey.currentState.value;
                  Api.setLoginInfo(sessid, token, uid, un);
                  var context2 = context;
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      UserApi.getLoggedUserInfo(uid).then((info) {
                        var mobile = info.mobile; // 用这个确定是否是登录成功
                        if (mobile == null || mobile.toString() == "") {
                          throw new Exception("未成功登录");
                        } else {
                          // 登录成功
                          final sp = SharedPreference.instance;
                          sp.setString("sessid", sessid);
                          sp.setString("token", token);
                          sp.setString("uid", uid);
                          sp.setString("un", un); // 保存信息
                          GlobalState.instance.user = info;
                          callback();
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (ctx) {
                              return AlertDialog(
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(ctx);
                                      Navigator.pop(context2);
                                    },
                                    child: Text("ok"),
                                  ),
                                ],
                                title: Text("登录成功!"),
                                content: Text(info.username + "~ 欢迎回来~"),
                              );
                            },
                          );
                        }
                      }).catchError((er) {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pop(ctx);
                                  },
                                  child: Text("ok"),
                                ),
                              ],
                              title: Text("登录失败"),
                              content: Text(er.toString()),
                            );
                          },
                        );
                      });
                      callback();
                      return AlertDialog(
                        title: Text("登录中"),
                        semanticLabel: "登陆中",
                      );
                    },
                  );
                },
                child: Text("登录"),
              );
            },
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
    return form;
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
