using System;
using System.Collections.Generic;

namespace BECELLPHONES2.Entities;

public partial class CellphoneappOrder
{
    public int Id { get; set; }

    public DateTime OrderDate { get; set; }

    public string DeliveryAddress { get; set; } = null!;

    public string DeliveryPhone { get; set; } = null!;

    public string Status { get; set; } = null!;

    public int IdUserId { get; set; }

    public virtual ICollection<CellphoneappOrderdetail> CellphoneappOrderdetails { get; } = new List<CellphoneappOrderdetail>();

    public virtual CellphoneappUser IdUser { get; set; } = null!;
}
