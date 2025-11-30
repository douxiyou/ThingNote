// 空间数据模型（从DataModel.ts导入，此处内联简化）
interface SpaceItem {
  icon: Resource;
  name: string;
  isSelected: boolean;
}

@Component
export struct SpaceSwitcher {
  // 模拟HTML中的空间数据
  private spaces: SpaceItem[] = [
    { icon: $r("app.media.ic_home"), name: "家庭", isSelected: true },
    { icon: $r("app.media.ic_office"), name: "办公室", isSelected: false },
    { icon: $r("app.media.ic_warehouse"), name: "仓库", isSelected: false },
    { icon: $r("app.media.ic_car"), name: "车辆", isSelected: false }
  ];
  scroller: Scroller = new Scroller()
  build() {
    Column({ space: 3 }) {
      // 标题+添加按钮
      Row() {
        Text($r("app.string.space_title"))
          .fontSize($r("app.float.font_md"))
          .fontWeight(FontWeight.Bold)
          .fontFamily("serif")
          .fontColor($r("app.color.secondary"))

        Button() {
          Text($r("app.string.add"))
            .fontSize($r("app.float.font_xs"))
            .fontColor($r("app.color.secondary"))
        }
        .backgroundColor($r("app.color.transparent"))
        .margin({ left: 'auto' })
      }

      // 横向滚动的空间选项（匹配HTML的overflow-x: auto）
      Scroll(this.scroller) {
        Row({ space: 3 }) {
          ForEach(this.spaces, (item: SpaceItem) => {
            Column({ space: 4 }) {
              Image(item.icon)
                .width(24)
                .height(24)
                .fillColor(item.isSelected ? $r("app.color.highlight") : $r("app.color.secondary"))

              Text(item.name)
                .fontSize($r("app.float.font_xs"))
                .fontColor(item.isSelected ? $r("app.color.highlight") : $r("app.color.secondary"))
            }
            .width(60)
            .height(60)
            .borderRadius($r("app.float.radius_sm"))
            .backgroundColor($r("app.color.light"))
            .border({
              width: item.isSelected ? 2 : 1,
              color: item.isSelected ? $r("app.color.highlight") : $r("app.color.secondary"),
              style: BorderStyle.Solid
            })
            .justifyContent(FlexAlign.Center)
          })

          // 新增空间按钮（虚线边框，匹配HTML）
          Column() {
            Image($r("app.media.ic_plus"))
              .width(20)
              .height(20)
              .fillColor($r("app.color.secondary") + '50')
          }
          .width(60)
          .height(60)
          .borderRadius($r("app.float.radius_sm"))
          .backgroundColor($r("app.color.light"))
          .border({ width: 1, color: $r("app.color.secondary") + '30', style: BorderStyle.Dashed })
          .justifyContent(FlexAlign.Center)
        }
      }
    }
    .margin({ bottom: 24 })
  }
}