﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using KoiProject.Repositories.Entities;
using KoiProject.Service.Interfaces;

namespace KoiProject.WebApplication.Pages.KoiFish
{
    public class DetailsModel : PageModel
    {
        private readonly IKoiManagementService _koiManagementService;

        public DetailsModel(IKoiManagementService koiManagementService)
        {
            _koiManagementService = koiManagementService;
        }

        public KoiManagement KoiManagement { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            // Sử dụng service để lấy thông tin Koi dựa trên ID
            var koimanagement = await _koiManagementService.GetKoiByIdAsync(id.Value);

            if (koimanagement == null)
            {
                return NotFound();
            }
            else
            {
                KoiManagement = koimanagement;
            }

            return Page();
        }
    }

}
