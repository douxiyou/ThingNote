// 家庭分区数据模型
interface ZoneItem {
  icon: Resource;
  name: string;
  count: number;
  desc: string;
}

@Component
export struct ZoneNav {
  // 模拟HTML中的分区数据
  private zones: ZoneItem[] = [
    { icon: $r("app.media.ic_bedroom"), name: "卧室", count: 12, desc: "衣柜、床头柜、梳妆台" },
    { icon: $r("app.media.ic_kitchen"), name: "厨房", count: 8, desc: "橱柜、冰箱、抽屉" },
    { icon: $r("app.media.ic_study"), name: "书房", count: 5, desc: "书架、书桌、文件柜" },
    { icon: $r("app.media.ic_living"), name: "客厅", count: 7, desc: "电视柜、茶几、展示柜" }
  ];

  build() {
    Column({ space: 16 }) {
      // 标题+管理按钮
      Row({ space: 'auto' }) {
        Text($r("app.string.zone_title"))
          .fontSize($r("app.float.font_md"))
          .fontWeight(FontWeight.Bold)
          .fontFamily("serif")
          .fontColor($r("app.color.secondary"))

        Text("管理分区")
          .fontSize($r("app.float.font_xs"))
          .fontColor($r("app.color.secondary"))
          .onClick(() => {})
          .suffix(Image($r("app.media.ic_arrow")).width(12).height(12).fontColor($r("app.color.secondary")))
      }
      .alignSelf(ItemAlign.Start)

      // 4列分区网格（匹配HTML的md:grid-cols-4）
      Grid() {
        ForEach(this.zones, (item: ZoneItem) => {
          GridItem() {
            Column({ space: 8 }) {
              Row({ space: 'auto' }) {
                Image(item.icon)
                  .width(24)
                  .height(24)
                  .fillColor($r("app.color.secondary"))

                Text(`${item.count}件`)
                  .fontSize(10)
                  .padding({ left: 4, right: 4, top: 2, bottom: 2 })
                  .backgroundColor($r("app.color.primary"))
                  .borderRadius(8)
                  .fontColor($r("app.color.secondary"))
              }

              Text(item.name)
                .fontSize($r("app.float.font_sm"))
                .fontWeight(FontWeight.Medium)
                .fontColor($r("app.color.secondary"))

              Text(item.desc)
                .fontSize(10)
                .fontColor($r("app.color.secondary") + '80')
                .maxLines(2)
                .textAlign(TextAlign.Center)
            }
            .width('100%')
            .height('100%')
            .padding(16)
            .backgroundColor($r("app.color.light"))
            .border({ width: 1, color: $r("app.color.secondary"), radius: $r("app.float.radius_sm") })
            .borderRadius($r("app.float.radius_sm"))
            // .onHover((isHover: boolean) => {
            //   this.borderColor = isHover ? $r("app.color.accent") : $r("app.color.secondary");
            //   this.shadow = isHover ? { radius: 4, color: $r("app.color.secondary") + '20', offsetX: 0, offsetY: 2 } : none;
            // })
          }
        })
      }
      .gridTemplateColumns('repeat(2, 1fr)')
      .gridTemplateColumns('repeat(4, 1fr)') // 中等屏幕以上4列
      .gap(12)
      .height(200)
      .margin({ bottom: 32 })
    }
  }
}