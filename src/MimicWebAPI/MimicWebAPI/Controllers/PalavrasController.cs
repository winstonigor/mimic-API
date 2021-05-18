using Microsoft.AspNetCore.Mvc;
using MimicWebAPI.Database;
using MimicWebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MimicWebAPI.Controllers
{
    [Route("api/palavras")]
    public class PalavrasController : ControllerBase
    {
        //injeção de dependencia
        private readonly MimicContext _banco;
        public PalavrasController(MimicContext banco)
        {
            _banco = banco;
        }

        //APP
        [Route("")]
        [HttpGet]
        public ActionResult ObterTodasPalavras()
        {
            return Ok(_banco.Palavras);
        }

        //Exemplo -> WEB --/api/palavras/1
        [Route("{id}")]
        [HttpGet]
        public ActionResult ObterPalavras(int id)
        {
            return Ok(_banco.Palavras.Find(id));
        }

        [Route("")]
        [HttpPost]
        public ActionResult CadastrarPalavras(Palavra palavra)
        {

            _banco.Palavras.Add(palavra);
            _banco.SaveChanges();

            return Ok();
        }

        [Route("{id}")]
        [HttpPut]
        public ActionResult AtualizarPalavra(int id, Palavra palavra)
        {
            _banco.Palavras.Update(palavra);
            _banco.SaveChanges();

            return Ok();
        }

        [Route("{id}")]
        [HttpDelete]
        public ActionResult Deletar(int id)
        {
            _banco.Palavras.Remove(_banco.Palavras.Find(id));
            _banco.SaveChanges();
            return Ok();
        }

    }
}
