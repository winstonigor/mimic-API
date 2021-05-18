using Microsoft.EntityFrameworkCore;
using MimicWebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MimicWebAPI.Database
{
    /*Criando o contexto da aplicação*/
    public class MimicContext :DbContext
    {
        public MimicContext(DbContextOptions<MimicContext> options) : base(options)
        {

        }

        public DbSet<Palavra> Palavras { get; set; }
    }
}
