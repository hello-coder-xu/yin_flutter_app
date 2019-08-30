import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/mvp/ui/main/main_model.dart';
import 'package:flutter_app/com/addcn/mvp/ui/main/main_presenter.dart';
import 'package:weui/button/index.dart';




Widget renderWidget({String title, int index, MvpPresenter mvpPresenter, MvpModel mvpModel}) {
  return Container(
    child: Column(
      children: <Widget>[
        SizedBox(height: 10),
        Align(
          child: Text(title),
        ),
        Row(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              alignment: Alignment.center,
              color: Colors.green,
              child: Text(
                '$index',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: <Widget>[
                  WeButton(
                    '更新main',
                    size: WeButtonSize.mini,
                    theme: WeButtonType.primary,
                    onClick: mvpPresenter.updateIndex,
                  ),
                  WeButton(
                    '更新1',
                    size: WeButtonSize.mini,
                    theme: WeButtonType.primary,
                    onClick: mvpPresenter.updateOneIndex,
                  ),
                  WeButton(
                    '更新2',
                    size: WeButtonSize.mini,
                    theme: WeButtonType.primary,
                    onClick: mvpPresenter.updateTwoIndex,
                  ),
                  WeButton(
                    '更新3',
                    size: WeButtonSize.mini,
                    theme: WeButtonType.primary,
                    onClick: mvpPresenter.updateThreeIndex,
                  ),
                  WeButton(
                    '切换tab',
                    size: WeButtonSize.mini,
                    theme: WeButtonType.primary,
                    onClick: mvpPresenter.updateTabPosition,
                  ),
                  WeButton(
                    '调整four',
                    size: WeButtonSize.mini,
                    theme: WeButtonType.primary,
                    onClick: mvpPresenter.toFour,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
