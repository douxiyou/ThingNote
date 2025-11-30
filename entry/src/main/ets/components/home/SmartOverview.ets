import {PieChartComponent} from '../common/PieChart'
// 最近添加物品模型
interface RecentItem {
  img: Resource;
  name: string;
  loc: string;
}

// 有效期提醒模型
interface ExpiryItem {
  img: Resource;
  name: string;
  days: string;
  urgent: boolean;
}
interface ChartItem {
  name: string;
  value: number;
}
@Component
export struct SmartOverview {
  // 模拟数据（匹配HTML）
  private recent: RecentItem[] = [
    { img: $r("app.media.ic_mouse"), name: "无线鼠标", loc: "书房 · 桌面" },
    { img: $r("app.media.ic_tea"), name: "普洱茶饼", loc: "客厅 · 茶柜" },
    { img: $r("app.media.ic_cable"), name: "充电线", loc: "卧室 · 床头柜" }
  ];

  private expiry: ExpiryItem[] = [
    { img: $r("app.media.ic_milk"), name: "进口牛奶", days: "3天后过期", urgent: true },
    { img: $r("app.media.ic_mask"), name: "面膜", days: "15天后过期", urgent: false },
    // { img: $r("app.media.ic_sunscreen"), name: "防晒霜", days: "30天后过期", urgent: false }
  ];
  scroller: Scroller = new Scroller()
  // 饼图数据（匹配HTML的物品统计）
  private chartData: ChartItem[] = [
    { name: "电子", value: 12 },
    { name: "衣物", value: 9 },
    { name: "食品", value: 6 },
    { name: "书籍", value: 5 },
    { name: "药品", value: 3 }
  ];

  build() {
    Column({ space: 16 }) {
      // 标题
      Text($r("app.string.overview_title"))
        .fontSize($r("app.float.font_md"))
        .fontWeight(FontWeight.Bold)
        .fontFamily("serif")
        .fontColor($r("app.color.secondary"))
        .alignSelf(ItemAlign.Start)

      // 三列网格布局（匹配HTML的md:grid-cols-3）
      Grid() {
        // 物品统计饼图
        GridItem() {
          Column({ space: 8 }) {
            Row({ space: 'auto' }) {
              Text("物品统计")
                .fontSize($r("app.float.font_sm"))
                .fontWeight(FontWeight.Medium)
                .fontColor($r("app.color.secondary"))

              Image($r("app.media.ic_chart"))
                .width(16)
                .height(16)
                .fillColor($r("app.color.secondary"))
            }

            // 饼图容器（匹配HTML的canvas）
            Stack() {
              PieChartComponent({
                data: this.chartData
              })
              // Chart({
              //   type: ChartType.PIE,
              //   data: this.chartData,
              //   xField: 'name',
              //   yField: 'value',
              //   radius: 70,
              //   innerRadius: 49, // 70%的内半径，匹配HTML的cutout
              //   colors: [$r("app.color.secondary"), $r("app.color.accent"), $r("app.color.highlight"), "#6D8B74", "#8A7968"]
              // })
              //   .width(120)
              //   .height(120)
            }
            .alignSelf(ItemAlign.Center)

            Row({ space: 'auto' }) {
              Text("总计: 42 件")
                .fontSize($r("app.float.font_xs"))
                .fontColor($r("app.color.secondary"))

              Text("查看详情")
                .fontSize($r("app.float.font_xs"))
                .fontColor($r("app.color.accent"))
                .onClick(() => {})
            }
          }
          .width('100%')
          .height('100%')
          .padding(16)
          .backgroundColor($r("app.color.light"))
          .border({ width: 1, color: $r("app.color.secondary"), radius: $r("app.float.radius_sm") })
          .borderRadius($r("app.float.radius_sm"))
        }

        // 最近添加
        GridItem() {
          Column({ space: 8 }) {
            Row({ space: 'auto' }) {
              Text("最近添加")
                .fontSize($r("app.float.font_sm"))
                .fontWeight(FontWeight.Medium)
                .fontColor($r("app.color.secondary"))

              Image($r("app.media.ic_clock"))
                .width(16)
                .height(16)
                .fillColor($r("app.color.secondary"))
            }

            // 最近添加列表（滚动）
            Scroll(this.scroller) {
              Column({ space: 8 }) {
                ForEach(this.recent, (item: RecentItem) => {
                  Row({ space: 8 }) {
                    Image(item.img)
                      .width(32)
                      .height(32)
                      .borderRadius(8)
                      .border({ width: 1, color: $r("app.color.secondary") })

                    Column({ space: 2 }) {
                      Text(item.name)
                        .fontSize($r("app.float.font_xs"))
                        .fontColor($r("app.color.secondary"))

                      Text(item.loc)
                        .fontSize(10)
                        .fontColor($r("app.color.secondary") + '80')
                    }
                  }
                  .padding(8)
                  .backgroundColor($r("app.color.primary"))
                  .borderRadius(8)
                  // .onHover((isHover: boolean) => {
                  //   this.backgroundColor = isHover ? $r("app.color.secondary") + '10' : $r("app.color.primary");
                  // })
                })
              }
            }
            .flexGrow(1)
          }
          .width('100%')
          .height('100%')
          .padding(16)
          .backgroundColor($r("app.color.light"))
          .border({ width: 1, color: $r("app.color.secondary"), radius: $r("app.float.radius_sm") })
          .borderRadius($r("app.float.radius_sm"))
        }

        // 有效期提醒
        GridItem() {
          Column({ space: 8 }) {
            Row({ space: 'auto' }) {
              Text("有效期提醒")
                .fontSize($r("app.float.font_sm"))
                .fontWeight(FontWeight.Medium)
                .fontColor($r("app.color.secondary"))

              Image($r("app.media.ic_warning"))
                .width(16)
                .height(16)
                .fillColor($r("app.color.accent"))
            }

            // 有效期提醒列表（滚动）
            Scroll(this.scroller) {
              Column({ space: 8 }) {
                ForEach(this.expiry, (item: ExpiryItem) => {
                  Row({ space: 8 }) {
                    Image(item.img)
                      .width(32)
                      .height(32)
                      .borderRadius(8)
                      .border({ width: 1, color: $r("app.color.secondary") })

                    Column({ space: 2 }) {
                      Text(item.name)
                        .fontSize($r("app.float.font_xs"))
                        .fontColor($r("app.color.secondary"))

                      Text(item.days)
                        .fontSize(10)
                        .fontColor(item.urgent ? $r("app.color.accent") : $r("app.color.secondary") + '80')
                    }
                  }
                  .padding(8)
                  .backgroundColor(item.urgent ? $r("app.color.accent") + '10' : $r("app.color.primary"))
                  .border({ width: item.urgent ? 1 : 0, color: $r("app.color.accent") + '20', radius: 8 })
                  .borderRadius(8)
                })
              }
            }
            .flexGrow(1)
          }
          .width('100%')
          .height('100%')
          .padding(16)
          .backgroundColor($r("app.color.light"))
          .border({ width: 1, color: $r("app.color.secondary"), radius: $r("app.float.radius_sm") })
          .borderRadius($r("app.float.radius_sm"))
        }
      }
      // .gridTemplateColumns('repeat(1, 1fr)')
      // .gridTemplateColumns('repeat(3, 1fr)') // 中等屏幕以上三列
      // .gap(16)
      .height(320)
      .margin({ bottom: 32 })
    }
  }
}