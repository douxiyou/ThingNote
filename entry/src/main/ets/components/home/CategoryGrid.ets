// 物品分类数据模型
interface CategoryItem {
  icon: Resource;
  name: string;
  count: number;
}

@Component
export struct CategoryGrid {
  // 模拟HTML中的分类数据
  private categories: CategoryItem[] = [
    { icon: $r("app.media.ic_clothes"), name: "衣物", count: 9 },
    { icon: $r("app.media.ic_electronic"), name: "电子", count: 12 },
    { icon: $r("app.media.ic_food"), name: "食品", count: 6 },
    { icon: $r("app.media.ic_book"), name: "书籍", count: 5 },
    { icon: $r("app.media.ic_medicine"), name: "药品", count: 3 }
  ];

  build() {
    Column({ space: 16 }) {
      // 标题+全部分类按钮
      Row({ space: 'auto' }) {
        Text($r("app.string.category_title"))
          .fontSize($r("app.float.font_md"))
          .fontWeight(FontWeight.SemiBold)
          .fontFamily("serif")
          .fontColor($r("app.color.secondary"))

        Text("全部分类")
          .fontSize($r("app.float.font_xs"))
          .fontColor($r("app.color.secondary"))
          .onClick(() => {})
          .suffix(Image($r("app.media.ic_arrow")).width(12).height(12).fontColor($r("app.color.secondary")))
      }
      .alignSelf(ItemAlign.Start)

      // 5列分类网格（匹配HTML的md:grid-cols-5）
      Grid() {
        ForEach(this.categories, (item: CategoryItem) => {
          GridItem() {
            Column({ space: 8 }) {
              // 圆形图标容器（匹配HTML的rounded-full）
              Stack() {
                Circle()
                  .width(48)
                  .height(48)
                  .backgroundColor($r("app.color.primary"))
                  .border({ width: 1, color: $r("app.color.secondary") + '50', radius: 24 })

                Image(item.icon)
                  .width(24)
                  .height(24)
                  .fillColor($r("app.color.secondary"))
              }

              Text(item.name)
                .fontSize($r("app.float.font_sm"))
                .fontWeight(FontWeight.Medium)
                .fontColor($r("app.color.secondary"))

              Text(`${item.count}件`)
                .fontSize(10)
                .fontColor($r("app.color.secondary") + '80')
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
      .gridTemplateColumns('repeat(5, 1fr)') // 中等屏幕以上5列
      .gap(12)
      .height(220)
      .margin({ bottom: 32 })
    }
  }
}