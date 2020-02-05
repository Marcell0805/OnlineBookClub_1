using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace BookClub.Core
{
    public class BookDetails
    {
        
        [Required]
        [Key]
        public int BookNumber { get; set; }
        [Required]
        public string BookName { get; set; }
        [Required]
        public string Author { get; set; }
        [Required]
        [Range(1, 5, ErrorMessage = "Rate between 1 & 5")]
        public int BookRating { get; set; }

    }
}
