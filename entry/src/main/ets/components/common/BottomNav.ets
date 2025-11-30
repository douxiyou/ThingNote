@Component
export struct BottomNav {
  build() {
    Row() {
      // 首页
      Column({ space: 4 }) {
        Image($r("app.media.ic_home"))
          .width(24)
          .height(24)
          .fillColor($r("app.color.accent"))

        Text("首页")
          .fontSize($r("app.float.font_xs"))
          .fontColor($r("app.color.accent"))
      }
      .width('25%')
      .justifyContent(FlexAlign.Center)

      // 分类
      Column({ space: 4 }) {
        Image($r("app.media.ic_category"))
          .width(24)
          .height(24)
          .fillColor($r("app.color.secondary"))

        Text("分类")
          .fontSize($r("app.float.font_xs"))
          .fontColor($r("app.color.secondary"))
      }
      .width('25%')
      .justifyContent(FlexAlign.Center)

      // 统计
      Column({ space: 4 }) {
        Image($r("app.media.ic_chart"))
          .width(24)
          .height(24)
          .fillColor($r("app.color.secondary"))

        Text("统计")
          .fontSize($r("app.float.font_xs"))
          .fontColor($r("app.color.secondary"))
      }
      .width('25%')
      .justifyContent(FlexAlign.Center)

      // 我的
      Column({ space: 4 }) {
        Image($r("app.media.ic_profile"))
          .width(24)
          .height(24)
          .fillColor($r("app.color.secondary"))

        Text("我的")
          .fontSize($r("app.float.font_xs"))
          .fontColor($r("app.color.secondary"))
      }
      .width('25%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height(56)
    .backgroundColor($r("app.color.light"))
    .border({
      width: { top: 1 },
      color: $r("app.color.secondary") + '20',
      style: BorderStyle.Solid
    })
    .position({ bottom: 0 })
    .alignItems(VerticalAlign.Center)
  }
}