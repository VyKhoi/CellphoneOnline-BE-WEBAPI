using System;
using System.Collections.Generic;

namespace BECELLPHONES2.Entities;

public partial class CellphoneappProduct
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string NameManufactureId { get; set; } = null!;

    public string? Type { get; set; }

    public virtual ICollection<CellphoneappComment> CellphoneappComments { get; } = new List<CellphoneappComment>();

    public virtual CellphoneappEarphone? CellphoneappEarphone { get; set; }

    public virtual ICollection<CellphoneappImageproduct> CellphoneappImageproducts { get; } = new List<CellphoneappImageproduct>();

    public virtual CellphoneappLaptop? CellphoneappLaptop { get; set; }

    public virtual ICollection<CellphoneappProductColor> CellphoneappProductColors { get; } = new List<CellphoneappProductColor>();

    public virtual ICollection<CellphoneappReview> CellphoneappReviews { get; } = new List<CellphoneappReview>();

    public virtual CellphoneappSmartphone? CellphoneappSmartphone { get; set; }

    public virtual CellphoneappManufacture NameManufacture { get; set; } = null!;
}
