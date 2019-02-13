﻿using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using Newtonsoft.Json;
using freebyTech.Common.Data.Interfaces;

namespace tivBudget.Dal.Models
{
    public partial class ReportCategory : IEditableData
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int DisplayIndex { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
        public string ModifiedBy { get; set; }
        public byte[] Ts { get; set; }
    }
}
