using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Project.Models
{
    public class Notification
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public int NoteType  { get; set; }
        [Required]
        public string NoteMessage { get; set; }
        public bool Seen { get; set; }

        public string UserId { get; set; }
        [ForeignKey("UserId")]
        public ApplicationUser User { get; set; }


    }

}