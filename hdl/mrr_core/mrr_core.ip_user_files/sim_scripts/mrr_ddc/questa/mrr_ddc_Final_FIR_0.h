
//------------------------------------------------------------------------------
// (c) Copyright 2023 Advanced Micro Devices. All rights reserved.
//
// This file contains confidential and proprietary information
// of AMD, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//------------------------------------------------------------------------------ 
//
// C Model configuration for the "mrr_ddc_Final_FIR_0" instance.
//
//------------------------------------------------------------------------------
//
// coefficients: 17,11,10,4,-6,-18,-30,-37,-37,-29,-12,8,27,39,38,24,-1,-30,-54,-65,-56,-28,12,54,83,90,68,21,-38,-93,-124,-120,-76,-3,80,147,175,150,73,-36,-146,-222,-236,-175,-50,105,245,323,306,188,-6,-224,-397,-464,-390,-177,125,434,650,687,503,115,-394,-885,-1196,-1178,-737,136,1357,2753,4099,5160,5744,5744,5160,4099,2753,1357,136,-737,-1178,-1196,-885,-394,115,503,687,650,434,125,-177,-390,-464,-397,-224,-6,188,306,323,245,105,-50,-175,-236,-222,-146,-36,73,150,175,147,80,-3,-76,-120,-124,-93,-38,21,68,90,83,54,12,-28,-56,-65,-54,-30,-1,24,38,39,27,8,-12,-29,-37,-37,-30,-18,-6,4,10,11,17
// chanpats: 173
// name: mrr_ddc_Final_FIR_0
// filter_type: 2
// rate_change: 0
// interp_rate: 1
// decim_rate: 10
// zero_pack_factor: 1
// coeff_padding: 7
// num_coeffs: 146
// coeff_sets: 1
// reloadable: 0
// is_halfband: 0
// quantization: 0
// coeff_width: 18
// coeff_fract_width: 0
// chan_seq: 0
// num_channels: 1
// num_paths: 1
// data_width: 16
// data_fract_width: 0
// output_rounding_mode: 1
// output_width: 17
// output_fract_width: 0
// config_method: 0

const double mrr_ddc_Final_FIR_0_coefficients[146] = {17,11,10,4,-6,-18,-30,-37,-37,-29,-12,8,27,39,38,24,-1,-30,-54,-65,-56,-28,12,54,83,90,68,21,-38,-93,-124,-120,-76,-3,80,147,175,150,73,-36,-146,-222,-236,-175,-50,105,245,323,306,188,-6,-224,-397,-464,-390,-177,125,434,650,687,503,115,-394,-885,-1196,-1178,-737,136,1357,2753,4099,5160,5744,5744,5160,4099,2753,1357,136,-737,-1178,-1196,-885,-394,115,503,687,650,434,125,-177,-390,-464,-397,-224,-6,188,306,323,245,105,-50,-175,-236,-222,-146,-36,73,150,175,147,80,-3,-76,-120,-124,-93,-38,21,68,90,83,54,12,-28,-56,-65,-54,-30,-1,24,38,39,27,8,-12,-29,-37,-37,-30,-18,-6,4,10,11,17};

const xip_fir_v7_2_pattern mrr_ddc_Final_FIR_0_chanpats[1] = {P_BASIC};

static xip_fir_v7_2_config gen_mrr_ddc_Final_FIR_0_config() {
  xip_fir_v7_2_config config;
  config.name                = "mrr_ddc_Final_FIR_0";
  config.filter_type         = 2;
  config.rate_change         = XIP_FIR_INTEGER_RATE;
  config.interp_rate         = 1;
  config.decim_rate          = 10;
  config.zero_pack_factor    = 1;
  config.coeff               = &mrr_ddc_Final_FIR_0_coefficients[0];
  config.coeff_padding       = 7;
  config.num_coeffs          = 146;
  config.coeff_sets          = 1;
  config.reloadable          = 0;
  config.is_halfband         = 0;
  config.quantization        = XIP_FIR_INTEGER_COEFF;
  config.coeff_width         = 18;
  config.coeff_fract_width   = 0;
  config.chan_seq            = XIP_FIR_BASIC_CHAN_SEQ;
  config.num_channels        = 1;
  config.init_pattern        = mrr_ddc_Final_FIR_0_chanpats[0];
  config.num_paths           = 1;
  config.data_width          = 16;
  config.data_fract_width    = 0;
  config.output_rounding_mode= XIP_FIR_TRUNCATE_LSBS;
  config.output_width        = 17;
  config.output_fract_width  = 0,
  config.config_method       = XIP_FIR_CONFIG_SINGLE;
  return config;
}

const xip_fir_v7_2_config mrr_ddc_Final_FIR_0_config = gen_mrr_ddc_Final_FIR_0_config();

