using System;
using System.Collections.Generic;

namespace BECELLPHONES2.Entities;

public partial class CellphoneappComment
{
    public int Id { get; set; }

    public string ContentComment { get; set; } = null!;

    public int IdProductId { get; set; }

    public int IdUserId { get; set; }

    public int? IdReply { get; set; }

    public virtual CellphoneappProduct IdProduct { get; set; } = null!;

    public virtual CellphoneappComment? IdReplyNavigation { get; set; }

    public virtual CellphoneappUser IdUser { get; set; } = null!;

    public virtual ICollection<CellphoneappComment> InverseIdReplyNavigation { get; } = new List<CellphoneappComment>();
}
