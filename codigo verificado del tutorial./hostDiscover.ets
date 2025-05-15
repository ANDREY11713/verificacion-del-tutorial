import router from '@ohos.router';
@Entry  
@Component  

struct HostDiscover {  

  titleMessage: string = 'Descubrir Hosts'  
  homeButtonMessage: string = 'Volver al inicio'
  CIDRlbl: string = 'Ingrese CIDR'
  CIDRInputPlaceHolder: string = 'Ejemplo: 192.168.1.0/24'
  descubrirOSLbl: string = '¿Descubrir OS?'
  radioBtnSi: string = 'Si'
  radioBtnNo: string = 'No'
  radioBtnGroup: string = 'DescubrirOS'
  buttonText: string = 'Descubrir'
  homeURL: string = 'pages/index'
  backgroundColor: string = '#0d1321'
  textColor: string = '#f0ebd8'
  buttonColor: string = '#3e5c76'

  build() { 
    Grid() { 
      
      GridItem(){
        Button() { 
          Text(this.homeButtonMessage)
            .fontSize(20)
            .fontColor(this.textColor)
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Center)
            .padding('10%')
        }
        .type(ButtonType.Capsule)
        .backgroundColor(this.buttonColor)
        .height('40%')
        .margin(5)
        .onClick(()=>{
          router.push({ url: this.homeURL })
        })
      } .height('55%')

      GridItem() {
        Text(this.titleMessage)
          .fontSize(45) 
          .fontColor(this.textColor)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Start)
          .padding({right:'20%'})
      } .columnStart(2) .columnEnd(5) .width('100%')

      GridItem(){
        Text(this.CIDRlbl)
          .fontSize(25)
          .fontColor(this.textColor)
          .textAlign(TextAlign.Center)
      } .columnStart(1) .columnEnd(2) .margin({left:'20%'})

      GridItem(){
        TextInput({placeholder:this.CIDRInputPlaceHolder})
          .width('45%')
          .height(40)
          .fontSize(20)
          .fontColor(this.textColor)
      } .columnStart(3) .columnEnd(5) .margin({right: '20%'})

      GridItem(){
        Text(this.descubrirOSLbl)
          .fontSize(25)
          .fontColor(this.textColor)
          .textAlign(TextAlign.Center)
      } .columnStart(1) .columnEnd(2) .margin({left:'20%'})

      GridItem(){
        Column(){
          Text(this.radioBtnSi) .fontColor(this.textColor) .fontSize(15) .fontWeight(FontWeight.Bold)
          Radio({value:this.radioBtnSi, group:this.radioBtnGroup})
            .checked(false)
            .height(25)
            .width(25)
        }
      } .columnStart(3) .columnEnd(4)

      GridItem(){
        Column(){
          Text(this.radioBtnNo) .fontColor(this.textColor) .fontSize(15) .fontWeight(FontWeight.Bold)
          Radio({value:this.radioBtnNo, group:this.radioBtnGroup})
            .checked(false)
            .height(25)
            .width(25)
        }
      }

      GridItem(){
        Button() {
          Text(this.buttonText)
            .fontSize(20)
            .fontColor(this.textColor)
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Center)
            .padding('10%')
        }
        .type(ButtonType.Capsule) 
        .backgroundColor(this.buttonColor)
        .height('40%')
        .margin(5)
      } .columnStart(2) .columnEnd(4) .margin({left:'70%'}) .width('100%')
    }
    .width('100%')
    .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
    .rowsTemplate('1fr 1fr 1fr 1fr')
    .height('100%')
    .backgroundColor(this.backgroundColor)
  }
}
