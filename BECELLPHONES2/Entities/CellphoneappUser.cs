using System;
using System.Collections.Generic;

namespace BECELLPHONES2.Entities;

public partial class CellphoneappUser
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Email { get; set; } = null!;

    public short Gender { get; set; }

    public string Hometown { get; set; } = null!;

    public string UserName { get; set; } = null!;

    public string? PassWord { get; set; }

    public DateTime BirthDay { get; set; }

    public string PhoneNumber { get; set; } = null!;

    public string IdRoleId { get; set; } = null!;

    public virtual ICollection<CellphoneappComment> CellphoneappComments { get; } = new List<CellphoneappComment>();

    public virtual ICollection<CellphoneappOrder> CellphoneappOrders { get; } = new List<CellphoneappOrder>();

    public virtual CellphoneappRole IdRole { get; set; } = null!;
}
