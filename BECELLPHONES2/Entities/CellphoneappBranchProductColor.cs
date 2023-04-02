using System;
using System.Collections.Generic;

namespace BECELLPHONES2.Entities;

public partial class CellphoneappBranchProductColor
{
    public int Id { get; set; }

    public int Amount { get; set; }

    public int IdBranchId { get; set; }

    public int IdProductColorId { get; set; }

    public virtual ICollection<CellphoneappBranchPromotionProduct> CellphoneappBranchPromotionProducts { get; } = new List<CellphoneappBranchPromotionProduct>();

    public virtual ICollection<CellphoneappOrderdetail> CellphoneappOrderdetails { get; } = new List<CellphoneappOrderdetail>();

    public virtual CellphoneappBranch IdBranch { get; set; } = null!;

    public virtual CellphoneappProductColor IdProductColor { get; set; } = null!;
}
