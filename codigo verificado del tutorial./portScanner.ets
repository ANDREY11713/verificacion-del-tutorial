import router from '@ohos.router'; 
import hilog from '@ohos.hilog';
@Entry  
@Component  
 

export struct PortScanner { 

  message: string = 'Escáner de Puertos' 
  ipInputLabel: string = 'Ingrese URL o IP'
  portsInputLabel: string = 'Seleccione los puertos'
  objectiveInputPlaceHolder: string = 'www.ejemplo.com o 192.168.56.15'
  startPortPlaceHolder: string = 'Puerto Inicial'
  endPortPlaceHolder: string = 'Puerto Final'
  speedInputLabel: string = 'Seleccione la velocidad'
  radioBtnPopular: string = 'Puertos Populares'
  radioBtnTodos: string = 'Todos los Puertos'
  radioBtnGroup: string = 'puertos'
  homeButtonMessage: string = 'Volver'
  homeURL: string = 'pages/index'
  backgroundColor: string = '#0d1321'
  textColor: string = '#f0ebd8'
  buttonColor: string = '#3e5c76'
  comboBoxBgColor: string = '#f4f0ed'
  scanBtnLbl: string = 'Escanear'
  cleanBtnLbl: string = 'Limpiar'

  
  tituloCaracterInvalido: string = 'Caracter inválido'
  mensajeErrorIPInvalida: string = 'Sólo se permiten caracteres, numeros, puntos y guiones'
  mensajeErrorPuertoInvalido: string = 'Sólo se permiten numeros'
  tituloObjetivoInvalido: string = 'Error, Objetivo Inválido'
  mensajeObjetivoInvalido: string = 'Se debe ingresar una direción IP o un dominio válido'
  textoPredeterminadoSelect: string = 'Seleccione una opción'
  tituloPuertoIncorrecto: string = 'Error, Puerto Inválido'
  mensajePuertoIncorrecto: string = 'El puerto inicial no puede ser mayor que el final'
  tituloPuertoFueraDeRango: string = 'Error, Puerto Fuera de Rango'
  mensajePuertoFueraDeRango: string = 'El puerto máximo a escanear es el 65,535'
  tituloSeleccionarVelocidad: string = 'Error, velocidad no seleccionada'
  mensajeSeleccionarVelocidad: string = 'Se debe seleccionar una velocidad de escaneo'


  
  characterIpURLRegex: string = '^[a-zA-Z0-9.\\-]+$'
  portsRegex: string = '^[0-9]*$'

  
  fullDomainRegex: string = '^[a-zA-Z0-9-]+(\.[a-zA-Z]+)+$'
  fullIpRegex: string = '^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'


  @State ipOURL: string = ''
  @State puertoInicial: string = ''
  @State puertoFinal: string = ''
  @State velocidadEscaneo: number = 0

  
  @State radioSeleccionado: boolean = false
  @State campoDeTextoSeleccionado: boolean = false

  build() { 
    Grid(){

      
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
        Text(this.message) 
          .fontSize(45)
          .fontColor(this.textColor)
          .fontWeight(FontWeight.Bold) 
          .textAlign(TextAlign.Start)
          .padding({right:'30%'})
      } .columnStart(2) .columnEnd(4) .width('100%')

      GridItem(){
        Text(this.ipInputLabel)
          .fontSize(25)
          .fontColor(this.textColor)
          .textAlign(TextAlign.Center)
      } .columnStart(1) .columnEnd(2) .margin({left: '20%'})

      GridItem(){

        TextInput({placeholder:this.objectiveInputPlaceHolder,text:this.ipOURL})
          .width('55%')
          .height(40)
          .fontSize(20)
          .fontColor(this.textColor)
          .inputFilter((this.characterIpURLRegex),(caracterInvalido:string) => {

          
            AlertDialog.show({
              title: this.tituloCaracterInvalido, 
              message: this.mensajeErrorIPInvalida, 
              autoCancel:false, 
              alignment: DialogAlignment.Center, 
              confirm: {
                value:'Volver',
                action: () => {
                  return
                }
              }
            })
          })
          .onChange((valor:string)=>{ 
            this.ipOURL = valor /*En este caso, cad
          })

      } .columnStart(3) .columnEnd(4) .margin({right:'10%'})

      GridItem(){
        Text(this.portsInputLabel)
          .fontSize(25)
          .fontColor(this.textColor)
          .textAlign(TextAlign.Center)
      } .margin({left: '20%'})

      GridItem(){
        Column({space: 10}){
          Text(this.radioBtnPopular) .fontColor(this.textColor) .fontSize(15) .fontWeight(FontWeight.Bold)
          Radio({value:this.radioBtnPopular, group:this.radioBtnGroup})
            .enabled(!this.campoDeTextoSeleccionado)
            .checked(false)
            .height(25)
            .width(25)
            .onChange((isChecked:boolean)=>{ 
              if (isChecked) {
                this.radioSeleccionado = true
                this.puertoInicial = '1'
                this.puertoFinal = '1024'
              }
            })
        }
      }
      GridItem(){
        Column({space: 10}){
          Text(this.radioBtnTodos) .fontColor(this.textColor) .fontSize(15) .fontWeight(FontWeight.Bold)
          Radio({value:this.radioBtnTodos, group:this.radioBtnGroup})
            .enabled(!this.campoDeTextoSeleccionado)
            .checked(false)
            .height(25)
            .width(25)
            .onChange((isChecked:boolean)=>{ 
              if (isChecked) {
                this.puertoInicial = '1'
                this.puertoFinal = '65535'
                this.radioSeleccionado = true
              }
            })
        }
      }
      GridItem(){
        Column({space:10}){
          TextInput({placeholder:this.startPortPlaceHolder,text:this.puertoInicial})
            .enabled(!this.radioSeleccionado) 
            .width('55%')
            .height(40)
            .fontSize(20)
            .fontColor(this.textColor)
            .inputFilter((this.portsRegex),(puertoInvalido:string) => 

            
              AlertDialog.show({
                title: this.tituloCaracterInvalido,
                message: this.mensajeErrorPuertoInvalido,
                autoCancel:false,
                alignment: DialogAlignment.Center,
                confirm: {
                  value:'Volver',
                  action: () => {
                    return
                  }
                }
              })
            })
            .onChange((value:string)=>{
              this.campoDeTextoSeleccionado = true 
              if (value=== '') { 
                this.campoDeTextoSeleccionado = false
              }
              this.puertoInicial = value 
            })

          TextInput({placeholder:this.endPortPlaceHolder,text:this.puertoFinal})
            .enabled(!this.radioSeleccionado)
            .width('55%')
            .height(40)
            .fontSize(20)
            .fontColor(this.textColor)
            .inputFilter((this.portsRegex),(puertoFInvalido:string) => { 
              AlertDialog.show({ 
                title: this.tituloCaracterInvalido,
                message: this.mensajeErrorPuertoInvalido,
                autoCancel:false,
                alignment: DialogAlignment.Center,
                confirm: {
                  value:'Volver',
                  action: () => {
                    return
                  }
                }
              })
            })

            .onChange((value:string)=>{ 
              this.campoDeTextoSeleccionado = true
              if (value=== '') {
                this.campoDeTextoSeleccionado = false
              }
              this.puertoFinal = value
            })
        }
      }

      GridItem(){
        Text(this.speedInputLabel)
          .fontSize(25)
          .fontColor(this.textColor)
          .textAlign(TextAlign.Center)
      } .margin({left:'20%'}) .columnStart(1) .columnEnd(2)

      GridItem(){
        Select([
          {value: '1 (Rápido)'},
          {value:'2 (Medio)'},
          {value:'3 (Lento)'},
          {value:'4 (Muy Lento)'}])
          .selected(0)
          .font({size:20, weight:FontWeight.Lighter})
          .fontColor(this.textColor)
          .selectedOptionFont({ size: 20, weight: FontWeight.Medium })
          .selectedOptionFontColor(this.textColor)
          .optionFont({ size: 20, weight: FontWeight.Medium })
          .optionFontColor(this.textColor)
          .onSelect((index:number)=>{
            this.velocidadEscaneo = index
            console.info('Select:' + index)

          })
      } .columnStart(3) .columnEnd(4) .margin({right:'30%'})

      GridItem(){
        Button() { //Este método crea un botón
          Text(this.scanBtnLbl)
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

        
          if (!(this.ipOURL.match(this.fullDomainRegex) || this.ipOURL.match(this.fullIpRegex))) {
            

          
            AlertDialog.show({
              title: this.tituloObjetivoInvalido,
              message: this.mensajeObjetivoInvalido,
              autoCancel:false,
              alignment: DialogAlignment.Center,
              confirm: {
                value:'Volver',
                action: () => {
                }
              }
            })

            return 

          } else { 

            
            if (!(parseInt(this.puertoInicial) < parseInt(this.puertoFinal))) {
             

              
              AlertDialog.show({
                title: this.tituloPuertoIncorrecto,
                message: this.mensajePuertoIncorrecto,
                autoCancel:false,
                alignment: DialogAlignment.Center,
                confirm: {
                  value:'Volver',
                  action: () => {
                  }
                }
              })
              return 

            } else {

              if (!(parseInt(this.puertoFinal)> 65535)) {
                

               
                  console.info(this.ipOURL)
                  console.info(this.puertoInicial)
                  console.info(this.puertoFinal)
                  console.info(this.velocidadEscaneo.toString())

                  

                router.push({ 
                    url: 'pages/logic/portScan',
                    params: { 

                      objetivo: this.ipOURL, //
                      puertoI: this.puertoInicial, 
                      puertoF: this.puertoFinal,
                      velocidad: this.velocidadEscaneo,
                    },
                  })
              } else { 

              
                AlertDialog.show({
                  title: this.tituloPuertoFueraDeRango,
                  message: this.mensajePuertoFueraDeRango,
                  autoCancel:false,
                  alignment: DialogAlignment.Center,
                  confirm: {
                    value:'Volver',
                    action: () => {
                    }
                  }
                })
              }
            }
          }
        })
      } .columnStart(1) .columnEnd(2) .width('100%')


      GridItem(){
        Button() { 
          Text(this.cleanBtnLbl)
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
        .onClick(() => {

         
          this.ipOURL = ''

         
          if (this.radioSeleccionado) {
            this.puertoInicial = ''; 
            this.puertoFinal = ''; 
            this.radioSeleccionado = false; 
          }

          if (this.campoDeTextoSeleccionado) { 
            this.puertoInicial = '' 
            this.puertoFinal = ''
            this.campoDeTextoSeleccionado = false; 
          }

          
          this.velocidadEscaneo = 0;
          console.info('Campos limpiados')
        })
      } .columnStart(3) .columnEnd(4) .width('100%')
    }
    .columnsTemplate('1fr 1fr 1fr 1fr')
    .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
    .width('100%')
    .height('100%')
    .backgroundColor(this.backgroundColor)
  }
}
