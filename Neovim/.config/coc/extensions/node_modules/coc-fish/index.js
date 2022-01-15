const {sources, workspace} = require('coc.nvim')
const {exec} = require('child_process')
const {promisify} = require('util')

const execPromise = promisify(exec)

exports.activate = async context => {
  const {nvim} = workspace
  const hasFish = await nvim.call('executable', 'fish')
  if (!hasFish) {
    workspace.showMessage('Cannot find fish in $PATH', 'error')
    return
  }
  const source = {
    name: 'fish',
    doComplete: async opt => {
      const cmd = opt.line.replace(/(['$`\\])/g, '\\$1')
      const result = await execPromise(`fish -c "complete --do-complete='${cmd}'"`)
      return {
        items: result
          .stdout
          .trim()
          .split('\n')
          .map(l => l.split('\t'))
          .map(pieces => ({
            word: pieces[0],
            abbr: `${pieces[0]}${pieces[1] ? ` (${pieces[1]})` : ''}`,
            menu: this.menu || '[fish]'
          }))
      }
    },
  }

  context.subscriptions.push(sources.createSource(source))
}
