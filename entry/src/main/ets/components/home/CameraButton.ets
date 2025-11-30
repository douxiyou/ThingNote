@Component
export struct CameraButton {
  @State scale: number = 1; // 呼吸动效缩放值

  build() {
    Stack({ alignContent: Alignment.Center }) {
      // 呼吸动效外圈
      Circle()
        .width(80)
        .height(80)
        // .fontColor($r("app.color.accent") + '30')
        .scale({ x: this.scale, y: this.scale })
        .animation({
          duration: 1500,
          tempo: 1,
          curve: Curve.EaseInOut,
          iterations: -1, // 无限循环
          playMode: PlayMode.Alternate
        })

      // 核心拍照按钮
      Button() {
        Image($r("app.media.ic_camera"))
          .width(32)
          .height(32)
          .fillColor($r("app.color.white"))
      }
      .width(60)
      .height(60)
      .borderRadius($r("app.float.radius_circle"))
      .backgroundColor($r("app.color.accent"))
      .shadow({ radius: 8, color: $r("app.color.accent") + '50', offsetX: 0, offsetY: 4 })

      // 提示文字（悬停显示，匹配HTML）
      Text($r("app.string.camera_tip"))
        .fontSize($r("app.float.font_xs"))
        .fontColor($r("app.color.white"))
        .backgroundColor($r("app.color.secondary"))
        .padding({ left: 8, right: 8, top: 2, bottom: 2 })
        .borderRadius(4)
        .margin({ top: 80 })
        .opacity(0)
        // .onHover((isHover: boolean) => {
        //   this.opacity = isHover ? 1 : 0;
        // })
    }
    .margin({ top: 8, bottom: 24 })
    .onAppear(() => {
      this.scale = 1.2; // 启动呼吸动效
    })
  }
}