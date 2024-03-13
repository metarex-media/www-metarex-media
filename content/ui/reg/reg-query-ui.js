/** reg query - temp function while database is being fixed */
let mrxRegUi = {
  samples: [
    {u:"MRX.123.456.789.abc", i:"file code outline", t:"Metarx register definition",},
    {u:"MRX.123.456.789.def", i:"file code outline", t:"Rexy sunbathing sample",},
    {u:"MRX.123.456.789.ghi", i:"file code outline", t:"Rexy sunbathing sample",},
    {u:"MRX.123.456.789.jkl", i:"file code outline", t:"Rexy sunbathing sample",},
    {u:"06da8618-925d-4238-a89d-84bc070df937", i:"exclamation circel", t:"Error - missing",},
  ],
  div: "#mrx-reg-ui",
  title: "Query the MetaRex Register",

}

$(mrxRegUi.div).html(
`<div class="ui segment">
<div id="mrxRegUiHdr" class="ui message"><div class="header">${mrxRegUi.title}</div></div>
<div id="mrxRegUiApp"></div>
<div id="mrxRegUiHlp" class="ui segment"></div>
</div`)

$(`#mrxRegUiApp`).html(`
  <div class="ui disabled warning center aligned message">
    <p>Under Development - try the sample links below until then.</p>
  </div>
`)

let samplesHtml=''
mrxRegUi.samples.forEach (s=> {
  samplesHtml+=`
  <div class="item">
    <i class="${s.i}"></i>
    <div class="content">
      <div class="description" >
      <a onclick='mrxReg.GET("${s.u}")'>${s.u}</a> ${s.t}</div>
    </div>
  </div>
`
})

$(`#mrxRegUiHlp`).html(`
<div class="ui list">
  <div class="item">
    <i class="folder icon"></i>
    <div class="content">
      <div class="header">samples</div>
      <div class="description">Register entries for mrx-demo</div>
      <div class="list">
${samplesHtml}
      </div>
    </div>
  </div>
</div>
`)
