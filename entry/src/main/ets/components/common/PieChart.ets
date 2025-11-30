// 扩展为Canvas绘制所需格式
interface ChartItem {
  name: string
  value: number
  color?: Color // 添加颜色字段
  startAngle?: number // 起始角度
  endAngle?: number // 结束角度
}

@Component
export struct PieChartComponent {
  @Prop data: ChartItem[] = []
  private totalValue: number = 0;

  aboutToAppear() {
    this.calculateAngles()
  }

  // 计算饼图角度
  private calculateAngles() {
    this.totalValue = this.data.reduce((sum, item) => sum + item.value, 0)
    let startAngle = 0
    this.data.forEach(item => {
      item.startAngle = startAngle
      item.endAngle = startAngle + (item.value / this.totalValue) * 360
      startAngle = item.endAngle
    })
  }

  build() {
    Canvas()
      .width(300)
      .height(300)
      .onReady(() => {
        // 绘制逻辑
      })
      .onTouch((e) => {
        this.data.forEach(item => {
          console.log(`选中的${item.name}`)
        })
      })
  }
}