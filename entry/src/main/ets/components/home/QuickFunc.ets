// 快捷功能数据模型
interface QuickFuncItem {
  icon: Resource;
  name: string;
}

@Component
export struct QuickFunc {
  // 模拟HTML中的快捷功能数据
  private funcs: QuickFuncItem[] = [
    { icon: $r("app.media.ic_album"), name: "相册选择" },
    { icon: $r("app.media.ic_location"), name: "位置管理" },
    { icon: $r("app.media.ic_calendar"), name: "有效期提醒" },
    { icon: $r("app.media.ic_share"), name: "共享协作" }
  ];

  build() {
    Grid() {
      ForEach(this.funcs, (item: QuickFuncItem) => {
        GridItem() {
          Button() {
            Column({ space: 4 }) {
              Image(item.icon)
                .width(24)
                .height(24)
                .fillColor($r("app.color.secondary"))

              Text(item.name)
                .fontSize($r("app.float.font_xs"))
                .fontColor($r("app.color.secondary"))
            }
          }
          .width('100%')
          .height('100%')
          .backgroundColor($r("app.color.light"))
          .border({ width: 1, color: $r("app.color.secondary"), radius: $r("app.float.radius_sm") })
          .borderRadius($r("app.float.radius_sm"))
          // .onHover((isHover: boolean) => {
          //   // 悬停切换边框色
          //   this.borderColor = isHover ? $r("app.color.accent") : $r("app.color.secondary");
          // })
        }
      })
    }
    .gridTemplateColumns('repeat(4, 1fr)')
    .gap(12)
    .margin({ bottom: 32 })
    .height(120)
  }
}