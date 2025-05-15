import router from '@ohos.router';
@Entry  
@Component  
  /* Colores:
   * Color de fondo: 0d1321
   * Color de letras: f0ebd8
   * Color de botones: 3e5c76
   * */

struct VulnAnalizer { 

  titleMessage: string = 'Analizar Vulnerabilidades'  
  homeButtonMessage: string = 'Volver al inicio'
  ipInputLbl: string = 'Ingresar IP o URL'
  targetInputPlaceHolder: string = 'www.ejemplo.com o 192.168.56.15'
  tipoAnalisisLbl: string = 'Tipo de Análisis'
  mainBtnText: string = 'Analizar'
  homeURL: string = 'pages/index'
  backgroundColor: string = '#0d1321'
  textColor: string = '#f0ebd8'
  buttonColor: string = '#3e5c76'

  build() {
    Grid() { 

      GridItem() {

        
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
        .margin(2)
        .onClick(() => {
          router.push({ url: this.homeURL })
        })
      }.height('55%') .margin({right:'20%'})

      
      GridItem() {
        Text(this.titleMessage) 
          .fontSize(45) //Tamaño del texto
          .fontColor(this.textColor)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Start)
          .padding({right:'30%'})
      } .width('100%') .columnStart(2) .columnEnd(3) .margin({right:'15%'})

      
      GridItem(){
        Text(this.ipInputLbl)
          .fontSize(25)
          .fontColor(this.textColor)
          .textAlign(TextAlign.Center)
      } .columnStart(1) .columnEnd(2) .margin({right:'30%'})

      //Input Ip o URL

      GridItem(){
        TextInput({placeholder:this.targetInputPlaceHolder})
          .width('100%')
          .height(40)
          .fontSize(20)
          .fontColor(this.textColor)
      } .margin({right:'30%'})

      
      GridItem(){
        Text(this.tipoAnalisisLbl)
          .fontSize(25)
          .fontColor(this.textColor)
          .textAlign(TextAlign.Center)
      } .columnStart(1) .columnEnd(2) .margin({right:'30%'})

      
      GridItem(){
        Select([
          {value: 'Seleccione una opción'},
          {value: 'Auth'},
          {value:'Default'},
          {value:'Discovery'},
          {value:'External'},
          {value: 'Intrusive'},
          {value: 'Búsqueda de Malware'},
          {value: 'Safe'},
          {value: 'Vuln'},
          {value: 'All'}])
          .selected(0)
          .font({size:20, weight:FontWeight.Lighter})
          .fontColor(this.textColor)
          .selectedOptionFont({ size: 20, weight: FontWeight.Medium })
          .selectedOptionFontColor(this.textColor)
          .optionFont({ size: 20, weight: FontWeight.Medium })
          .optionFontColor(this.textColor)
      }  .margin({right:'30%'})

      GridItem(){
        Button() { 
          Text(this.mainBtnText)
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
      } .columnStart(1) .columnEnd(3) .width('100%')

    }
    .columnsTemplate('1fr 1fr 1fr')
    .rowsTemplate('1fr 1fr 1fr 1fr')
    .width('100%') 
    .height('100%') 
    .backgroundColor(this.backgroundColor) 

  }
}
