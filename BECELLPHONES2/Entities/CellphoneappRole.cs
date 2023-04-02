using System;
using System.Collections.Generic;

namespace BECELLPHONES2.Entities;

public partial class CellphoneappRole
{
    public string NameRole { get; set; } = null!;

    public virtual ICollection<CellphoneappUser> CellphoneappUsers { get; } = new List<CellphoneappUser>();
}
