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

        //APP --/api/palavras?data=2021-05-18
        [Route("")]
        [HttpGet]
        public ActionResult ObterTodasPalavras(DateTime? data)
        {
            var obj = _banco.Palavras.AsQueryable();
            if (data.HasValue)
            {
                obj = obj.Where(a => a.Criado > data.Value || a.Atualizacao > data.Value);
            }
            return Ok(obj);
        }

        //Exemplo -> WEB --/api/palavras/1
        [Route("{id}")]
        [HttpGet]
        public ActionResult ObterPalavras(int id)
        {
            var obj = _banco.Palavras.Find(id);
            if (obj == null)
            {
                return NotFound(); // or statusCode(404);
            }

            //Console.WriteLine(obj);
            return Ok(obj);
        }

        [Route("")]
        [HttpPost]
        public ActionResult CadastrarPalavras([FromBody] Palavra palavra)
        {

            _banco.Palavras.Add(palavra);
            _banco.SaveChanges();

            return Created($"/api/palavras/{palavra.Id}", palavra);
        }

        [Route("{id}")]
        [HttpPut]
        public ActionResult AtualizarPalavra(int id, [FromBody] Palavra palavra)
        {
            palavra.Id = id;
            _banco.Palavras.Update(palavra);
            _banco.SaveChanges();

            return Ok();
        }

        [Route("{id}")]
        [HttpPatch]
        public ActionResult Desativar(int id)
        {
            var palavra = _banco.Palavras.Find(id);
            if (palavra == null)
            {
                return NotFound();
            }

            palavra.Ativo = false;
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
