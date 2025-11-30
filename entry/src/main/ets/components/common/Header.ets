@Entry
@Component
export struct Header {
  build() {
    Row() {
      // Logo区域（立方体+物小记文字）
      Row({ space: $r("app.float.margin_sm") }) {
        Stack() {
          Image($r("app.media.ic_thing_note"))
            .width(24)
            .height(24)
        }
        .width(40)
        .height(40)
        .backgroundColor($r("app.color.accent"))
        .borderRadius($r("app.float.radius_sm"))

        Text($r("app.string.app_name"))
          .fontSize($r("app.float.font_lg"))
          .fontWeight(FontWeight.Bold)
          .fontFamily("serif")
          .fontColor($r("app.color.secondary"))
      }

      // 搜索栏（仅中等以上屏幕显示，匹配HTML的768px断点）
      Search({ placeholder: $r("app.string.search_hint") })
        .width('40%')
        .backgroundColor($r("app.color.light"))
        .borderRadius($r("app.float.radius_md"))
        .margin({ left: 12, right: 12 })
        .placeholderColor($r("app.color.secondary"))
        .fontColor($r("app.color.secondary"))

      // 右侧功能按钮组（麦克风/铃铛/头像）
      Row({ space: 8 }) {
        // 铃铛按钮
        Button() {
          Image($r("app.media.ic_bell"))
            .width(20)
            .height(20)
            .fillColor($r("app.color.secondary"))
        }
        .width(40)
        .height(40)
        .borderRadius($r("app.float.radius_md"))
        .backgroundColor($r("app.color.light"))
        .border({ width: 1, color: $r("app.color.secondary"), radius: 20 })
        .margin({ left: 8 })
      }
    }
    .width('100%')
    .padding({ left: 16, right: 16, top: 12, bottom: 12 })
    .backgroundColor($r("app.color.primary"))
    .border({ width: { bottom: 1 }, color: $r("app.color.secondary") + '20', style: BorderStyle.Solid })
  }
}