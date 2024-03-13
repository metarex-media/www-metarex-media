/** reg query - temp function while database is being fixed */
let mrxReg = {
  div: "#mrx-reg-response",
  hdr: "#mrx-reg-header",
  hlp: "#mrx-reg-help",
  style: "",
  GET: function (regId) {
    $(mrxReg.hdr).html(`query ${regId}`)
    $(mrxReg.div).html(`<div id=""waiting...`)

    $.ajax({
      url: `/reg/${regId}/register.json`,
      type: 'GET',
      cache: false,
      success: function (result) {
        if (!result)
          return
        mrxReg.raw(result)
      },
      error: function (data) {
        $(mrxReg.div).html(
          `<div class="ui error message"><div class="header">${data.status}</div><div class="content">${data.statusText}</div></div>`
        )
      }
    })

    $.ajax({
      url: `/reg/${regId}/help.md`,
      type: 'GET',
      cache: false,
      success: function (result) {
        if (!result)
          return
        let md = window.markdownit();
        let htm = md.render(result);
        $(mrxReg.hlp).html(`<code id="mrx-hlp" class="language-markdown">${htm}</code>`)
      },
      error: function (data) {
        $(mrxReg.hlp).html(
          `<div class="ui warning message"><div class="header">No Help file</div></div>`
        )
      }
    })

  },
  raw: function(mrxRecord, id){
    $(mrxReg.div).html(`<pre><code id="mrx-reg" class="language-javascript">${JSON.stringify(mrxRecord, null, 2)}</code></pre>`)
    Prism.highlightElement($('#mrx-reg ')[0])

  }
}

mrxReg.GET("MRX.123.456.789.ghi")