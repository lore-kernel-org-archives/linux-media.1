Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1493932CD
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 10:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800192; cv=none; b=qGYUeLP1IAbxqXeoEOY1FTMlKh0E0HBoZODsrjdabZB9r1aDKfnwMq5hIwUyixWpUi+paPKV0GlyHCvNJnrZWdjCKszergcVA8aiPwqh3jvKflYNatCn+4oJXfTYvLBMzYQjEOgq53GH42a606aXHYc9WaScvem9kTq0clFbuzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800192; c=relaxed/simple;
	bh=61FnA4sCXOLtOycBqiHoSMLLUzV3zQ9qIA01mZ+DvkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mEAV1TCAxcz/AkU+VSL3GI9g9D3QtcSwBLS1DFNTZETNyb4KIU1EBvQ+6Qsmdf/zflmfDkvw8YtgZF/7hgNbnH/fbnwkgQCsBFm9bmfMM9cbcpkRxdY3aCMR0j6O0aznWQ0APUtu1t9bcr1Zapis7WXNevne1byVz3B7VhfMGqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d7cLBdCZ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d7cLBdCZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791800182; x=1823336182;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=61FnA4sCXOLtOycBqiHoSMLLUzV3zQ9qIA01mZ+DvkA=;
  b=d7cLBdCZJXc/yhv2lMCjkGGu+EgFcwhJD9vqTrpukfo0hysNDx0qJQXX
   aF/slrDhM6iCh7qHy2U16V3niIs17P7R8yjK/AA4sTm094Euff2Ymdx7H
   oBIlHx2qdV5hOwogwQN6Sp1uJu0TntncTQskdC9HliRanZHY+Scgkn9RN
   XQTI6mv5P99XiQMVa9a5Rpx4WIDejBh2PvGD7Vbn/PIGgxS7x7qgPQ3tH
   H+YH9scQXr5G7jLRYQVLsWAVFV2PAiBir6AP062ziqvSLx/JRmGy67xmB
   G8qH8FZn8Nr/4v9Vihzs/hPHumr2cOO8vpzDubj4PrJxu5gJE0lj44BM9
   Q==;
X-CSE-ConnectionGUID: oHuaEqGiQSmw71xQiQdOjg==
X-CSE-MsgGUID: u9r+24UzSWGRDAIoB1GKLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="509591"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="509591"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 03:16:21 -0700
X-CSE-ConnectionGUID: CY+acVNCStWnsqTHcoTHKg==
X-CSE-MsgGUID: MQ5ucHdcQAybPtP5CeDJTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="940529"
Received: from alekseim-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.165])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 03:16:16 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8C7A3121B9E;
	Mon, 12 Oct 2026 13:16:19 +0300 (EEST)
Date: Mon, 12 Oct 2026 13:16:19 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To: Ruslan Bay <ruslanbey@proton.me>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"tfiga@chromium.org" <tfiga@chromium.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH 04/12] media: ipu6: Add IPU4P ISYS firmware ABI
 definitions
Message-ID: <asyzc6CsBUT-i-nJ@kekkonen.localdomain>
References: <h67Um68BP1VslpsztVmKAyUu6AoQcVo4s_A0r3mDfxX_hG-qeXrzlJHcZqfJcoK0AXLB82AzrcDCtXrFt7PkSdzfSC53YU4mboVhmLgFIZU=@proton.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <h67Um68BP1VslpsztVmKAyUu6AoQcVo4s_A0r3mDfxX_hG-qeXrzlJHcZqfJcoK0AXLB82AzrcDCtXrFt7PkSdzfSC53YU4mboVhmLgFIZU=@proton.me>

Hi Ruslan,

On Sun, Oct 11, 2026 at 02:35:21PM +0000, Ruslan Bay wrote:
> Add IPU4P ISYS firmware ABI structures, enums, constants, and limits
> used by the firmware interface. Explicitly align 64-bit fields to keep
> the wire layout stable on 32-bit x86 builds.
> 
> Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
> ---
>  drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h | 408 +++++++++++++++++++
>  drivers/media/pci/intel/ipu6/ipu6-isys.h     |   5 +
>  2 files changed, 413 insertions(+)
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h b/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h
> new file mode 100644
> index 000000000000..afc288b939bd
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h
> @@ -0,0 +1,408 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright (C) 2026 Intel Corporation */
> +
> +#ifndef IPU4P_FW_ISYS_H
> +#define IPU4P_FW_ISYS_H
> +
> +#include <linux/build_bug.h>
> +#include <linux/irqreturn.h>
> +#include <linux/stddef.h>
> +#include <linux/types.h>
> +
> +struct ipu6_bus_device;
> +struct ipu6_fw_isys_ops;
> +struct ipu6_isys;
> +struct ipu6_isys_video;
> +struct ipu6_isys_stream;
> +struct ipu6_isys_buffer_list;
> +struct isys_fw_msgs;

At least some of these aren't referenced below; you should add these in the
patch that needs them.

> +
> +#define IPU4P_ISYS_MAX_STREAMS			8U
> +#define IPU4P_MAX_IPINS				4U
> +#define IPU4P_MAX_OPINS				6U
> +#define IPU4P_NOF_SRAM_BLOCKS_MAX		8U
> +#define IPU4P_DEV_SEND_QUEUE_SIZE		8U
> +#define IPU4P_ISYS_SIZE_RECV_QUEUE		40U
> +#define IPU4P_ISYS_SIZE_SEND_QUEUE		40U
> +#define IPU4P_ISYS_SIZE_PROXY_RECV_QUEUE	5U
> +#define IPU4P_ISYS_SIZE_PROXY_SEND_QUEUE	5U
> +#define IPU4P_ISYS_OPEN_RETRY			2000
> +#define IPU4P_ISYS_CLOSE_RETRY			2000
> +
> +#define IPU4P_BASE_PROXY_SEND_QUEUES		0U
> +#define IPU4P_BASE_DEV_SEND_QUEUES		1U
> +#define IPU4P_BASE_MSG_SEND_QUEUES		2U
> +#define IPU4P_BASE_PROXY_RECV_QUEUES		0U
> +#define IPU4P_BASE_MSG_RECV_QUEUES		1U
> +#define IPU4P_N_MAX_RECV_QUEUES			2U
> +
> +#define IPU4P_ISYS_CROPPING_LOCATION_MAX	4U
> +#define IPU4P_ISYS_RESOLUTION_INFO_MAX		2U
> +#define IPU4P_ISYS_QUEUE_TYPE_MAX		3U
> +
> +enum ipu4p_fw_isys_resp_type {
> +	IPU4P_FW_ISYS_RESP_TYPE_STREAM_OPEN_DONE = 0,
> +	IPU4P_FW_ISYS_RESP_TYPE_STREAM_START_ACK,
> +	IPU4P_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK,
> +	IPU4P_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_ACK,
> +	IPU4P_FW_ISYS_RESP_TYPE_STREAM_STOP_ACK,
> +	IPU4P_FW_ISYS_RESP_TYPE_STREAM_FLUSH_ACK,
> +	IPU4P_FW_ISYS_RESP_TYPE_STREAM_CLOSE_ACK,
> +	IPU4P_FW_ISYS_RESP_TYPE_PIN_DATA_READY,
> +	IPU4P_FW_ISYS_RESP_TYPE_PIN_DATA_WATERMARK,
> +	IPU4P_FW_ISYS_RESP_TYPE_FRAME_SOF,
> +	IPU4P_FW_ISYS_RESP_TYPE_FRAME_EOF,
> +	IPU4P_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE,
> +	IPU4P_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_DONE,
> +	IPU4P_FW_ISYS_RESP_TYPE_PIN_DATA_SKIPPED,
> +	IPU4P_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_SKIPPED,
> +	IPU4P_FW_ISYS_RESP_TYPE_FRAME_SOF_DISCARDED,
> +	IPU4P_FW_ISYS_RESP_TYPE_FRAME_EOF_DISCARDED,
> +	IPU4P_FW_ISYS_RESP_TYPE_STATS_DATA_READY,
> +	N_IPU4P_FW_ISYS_RESP_TYPE
> +};
> +
> +enum ipu4p_fw_isys_send_type {
> +	IPU4P_FW_ISYS_SEND_TYPE_STREAM_OPEN = 0,
> +	IPU4P_FW_ISYS_SEND_TYPE_STREAM_START,
> +	IPU4P_FW_ISYS_SEND_TYPE_STREAM_START_AND_CAPTURE,
> +	IPU4P_FW_ISYS_SEND_TYPE_STREAM_CAPTURE,
> +	IPU4P_FW_ISYS_SEND_TYPE_STREAM_STOP,
> +	IPU4P_FW_ISYS_SEND_TYPE_STREAM_FLUSH,
> +	IPU4P_FW_ISYS_SEND_TYPE_STREAM_CLOSE,
> +	N_IPU4P_FW_ISYS_SEND_TYPE
> +};
> +
> +enum ipu4p_fw_isys_queue_type {
> +	IPU4P_FW_ISYS_QUEUE_TYPE_PROXY = 0,
> +	IPU4P_FW_ISYS_QUEUE_TYPE_DEV,
> +	IPU4P_FW_ISYS_QUEUE_TYPE_MSG,
> +	N_IPU4P_FW_ISYS_QUEUE_TYPE
> +};
> +
> +enum ipu4p_fw_isys_stream_source {
> +	IPU4P_FW_ISYS_STREAM_SRC_PORT_0 = 0,
> +	IPU4P_FW_ISYS_STREAM_SRC_PORT_1,
> +	IPU4P_FW_ISYS_STREAM_SRC_PORT_2,
> +	IPU4P_FW_ISYS_STREAM_SRC_PORT_3,
> +	IPU4P_FW_ISYS_STREAM_SRC_PORT_4,
> +	IPU4P_FW_ISYS_STREAM_SRC_PORT_5,
> +	IPU4P_FW_ISYS_STREAM_SRC_PORT_6,
> +	IPU4P_FW_ISYS_STREAM_SRC_PORT_7,
> +	IPU4P_FW_ISYS_STREAM_SRC_PORT_8,
> +	IPU4P_FW_ISYS_STREAM_SRC_PORT_9,
> +	IPU4P_FW_ISYS_STREAM_SRC_PORT_10,
> +	IPU4P_FW_ISYS_STREAM_SRC_PORT_11,
> +	IPU4P_FW_ISYS_STREAM_SRC_PORT_12,
> +	IPU4P_FW_ISYS_STREAM_SRC_PORT_13,
> +	IPU4P_FW_ISYS_STREAM_SRC_PORT_14,
> +	IPU4P_FW_ISYS_STREAM_SRC_PORT_15,
> +	IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_0,
> +	IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_1,
> +	IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_2,
> +	IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_3,
> +	IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_4,
> +	IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_5,
> +	IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_6,
> +	IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_7,
> +	IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_8,
> +	IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_9,
> +	N_IPU4P_FW_ISYS_STREAM_SRC
> +};
> +
> +enum ipu4p_fw_isys_mipi_vc {
> +	IPU4P_FW_ISYS_MIPI_VC_0 = 0,
> +	IPU4P_FW_ISYS_MIPI_VC_1,
> +	IPU4P_FW_ISYS_MIPI_VC_2,
> +	IPU4P_FW_ISYS_MIPI_VC_3,
> +	N_IPU4P_FW_ISYS_MIPI_VC
> +};
> +
> +enum ipu4p_fw_isys_frame_format_type {
> +	IPU4P_FW_ISYS_FRAME_FORMAT_NV11 = 0,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_NV12,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_NV12_16,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_NV12_TILEY,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_NV16,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_NV21,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_NV61,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_YV12,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_YV16,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_YUV420,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_YUV420_10,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_YUV420_12,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_YUV420_14,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_YUV420_16,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_YUV422,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_YUV422_16,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_UYVY,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_YUYV,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_YUV444,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_YUV_LINE,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_RAW8,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_RAW10,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_RAW12,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_RAW14,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_RAW16,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_RGB565,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_PLANAR_RGB888,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_RGBA888,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_QPLANE6,
> +	IPU4P_FW_ISYS_FRAME_FORMAT_BINARY_8,
> +	N_IPU4P_FW_ISYS_FRAME_FORMAT
> +};
> +
> +enum ipu4p_fw_isys_mipi_data_type {
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_FRAME_START_CODE = 0x00,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_FRAME_END_CODE = 0x01,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_LINE_START_CODE = 0x02,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_LINE_END_CODE = 0x03,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_EMBEDDED = 0x12,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_YUV420_8 = 0x18,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_YUV420_10 = 0x19,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_YUV422_8 = 0x1e,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_YUV422_10 = 0x1f,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_RGB_565 = 0x22,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_RGB_888 = 0x24,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_RAW_6 = 0x28,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_RAW_7 = 0x29,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_RAW_8 = 0x2a,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_RAW_10 = 0x2b,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_RAW_12 = 0x2c,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_RAW_14 = 0x2d,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_RAW_16 = 0x2e,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_USER_DEF1 = 0x30,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_USER_DEF2 = 0x31,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_USER_DEF3 = 0x32,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_USER_DEF4 = 0x33,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_USER_DEF5 = 0x34,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_USER_DEF6 = 0x35,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_USER_DEF7 = 0x36,
> +	IPU4P_FW_ISYS_MIPI_DATA_TYPE_USER_DEF8 = 0x37,
> +	N_IPU4P_FW_ISYS_MIPI_DATA_TYPE = 0x40
> +};
> +
> +enum ipu4p_fw_isys_pin_type {
> +	IPU4P_FW_ISYS_PIN_TYPE_MIPI = 0,
> +	IPU4P_FW_ISYS_PIN_TYPE_RAW_NS,
> +	IPU4P_FW_ISYS_PIN_TYPE_RAW_S,
> +	IPU4P_FW_ISYS_PIN_TYPE_RAW_SOC,
> +	IPU4P_FW_ISYS_PIN_TYPE_METADATA_0,
> +	IPU4P_FW_ISYS_PIN_TYPE_METADATA_1,
> +	IPU4P_FW_ISYS_PIN_TYPE_AWB_STATS,
> +	IPU4P_FW_ISYS_PIN_TYPE_AF_STATS,
> +	IPU4P_FW_ISYS_PIN_TYPE_HIST_STATS,
> +	IPU4P_FW_ISYS_PIN_TYPE_PAF_FF,
> +	N_IPU4P_FW_ISYS_PIN_TYPE
> +};
> +
> +enum ipu4p_fw_isys_isl_use {
> +	IPU4P_FW_ISYS_USE_NO_ISL_NO_ISA = 0,
> +};
> +
> +enum ipu4p_fw_isys_mipi_store_mode {
> +	IPU4P_FW_ISYS_MIPI_STORE_MODE_NORMAL = 0,
> +	IPU4P_FW_ISYS_MIPI_STORE_MODE_DISCARD_LONG_HEADER,
> +	N_IPU4P_FW_ISYS_MIPI_STORE_MODE
> +};
> +
> +enum ipu4p_fw_isys_link_id {
> +	IPU4P_FW_ISYS_LINK_OFFLINE = 0,
> +	IPU4P_FW_ISYS_LINK_MAIN_OUTPUT = 1,
> +	IPU4P_FW_ISYS_LINK_PDAF_OUTPUT = 2,
> +	N_IPU4P_FW_ISYS_LINK_ID
> +};
> +
> +enum ipu4p_fw_isys_error {
> +	IPU4P_FW_ISYS_ERROR_NONE = 0,
> +	IPU4P_FW_ISYS_ERROR_FW_INTERNAL_CONSISTENCY,
> +	IPU4P_FW_ISYS_ERROR_HW_CONSISTENCY,
> +	IPU4P_FW_ISYS_ERROR_DRIVER_INVALID_COMMAND_SEQUENCE,
> +	IPU4P_FW_ISYS_ERROR_DRIVER_INVALID_DEVICE_CONFIGURATION,
> +	IPU4P_FW_ISYS_ERROR_DRIVER_INVALID_STREAM_CONFIGURATION,
> +	IPU4P_FW_ISYS_ERROR_DRIVER_INVALID_FRAME_CONFIGURATION,
> +	IPU4P_FW_ISYS_ERROR_INSUFFICIENT_RESOURCES,
> +	IPU4P_FW_ISYS_ERROR_HW_REPORTED_STR2MMIO,
> +	IPU4P_FW_ISYS_ERROR_HW_REPORTED_SIG2CIO,
> +	IPU4P_FW_ISYS_ERROR_SENSOR_FW_SYNC,
> +	IPU4P_FW_ISYS_ERROR_STREAM_IN_SUSPENSION,
> +	IPU4P_FW_ISYS_ERROR_RESPONSE_QUEUE_FULL,
> +	N_IPU4P_FW_ISYS_ERROR
> +};
> +
> +enum ipu4p_fw_proxy_error {
> +	IPU4P_FW_PROXY_ERROR_NONE = 0,
> +	IPU4P_FW_PROXY_ERROR_INVALID_WRITE_REGION,
> +	IPU4P_FW_PROXY_ERROR_INVALID_WRITE_OFFSET,
> +	N_IPU4P_FW_PROXY_ERROR
> +};
> +
> +struct ipu4p_fw_isys_resolution {
> +	u32 width;
> +	u32 height;
> +};
> +
> +struct ipu4p_fw_isys_isa_cfg {
> +	struct ipu4p_fw_isys_resolution
> +		isa_res[IPU4P_ISYS_RESOLUTION_INFO_MAX];
> +	u32 cfg_fields;
> +};
> +
> +struct ipu4p_fw_isys_cropping {
> +	s32 top_offset;
> +	s32 left_offset;
> +	s32 bottom_offset;
> +	s32 right_offset;
> +};
> +
> +struct ipu4p_fw_isys_input_pin_info {
> +	struct ipu4p_fw_isys_resolution input_res;
> +	u8 dt;
> +	u8 mipi_store_mode;
> +	u8 bits_per_pix;
> +	u8 mapped_dt;
> +};
> +
> +/**
> + * struct ipu4p_fw_isys_output_pin_info - IPU4P output pin configuration
> + *
> + * Unlike the IPU6 ABI, IPU4P ends this structure at reserve_compression;
> + * snoopable and sensor_type are not part of the IPU4P firmware wire format.
> + *
> + * @link_id: PPG link; zero selects offline capture
> + */
> +struct ipu4p_fw_isys_output_pin_info {
> +	struct ipu4p_fw_isys_resolution output_res;
> +	u32 stride;
> +	u32 watermark_in_lines;
> +	u32 payload_buf_size;
> +	u8 send_irq;
> +	u8 input_pin_id;
> +	u8 pt;
> +	u8 ft;
> +	u8 link_id;
> +	u8 reserve_compression;
> +};
> +
> +struct ipu4p_fw_isys_stream_cfg {
> +	/* Preserve the firmware ABI slot; ISA is disabled by this driver. */
> +	struct ipu4p_fw_isys_isa_cfg isa_cfg;
> +	struct ipu4p_fw_isys_cropping crop[IPU4P_ISYS_CROPPING_LOCATION_MAX];
> +	struct ipu4p_fw_isys_input_pin_info input_pins[IPU4P_MAX_IPINS];
> +	struct ipu4p_fw_isys_output_pin_info output_pins[IPU4P_MAX_OPINS];
> +	u32 compfmt;
> +	u8 nof_input_pins;
> +	u8 nof_output_pins;
> +	u8 send_irq_sof_discarded;
> +	u8 send_irq_eof_discarded;
> +	u8 send_resp_sof_discarded;
> +	u8 send_resp_eof_discarded;
> +	u8 src;
> +	u8 vc;
> +	u8 isl_use;
> +};
> +
> +struct ipu4p_fw_isys_output_pin_payload {
> +	__aligned_u64 out_buf_id;
> +	u32 addr;
> +	u32 compress;
> +};
> +
> +struct ipu4p_fw_isys_param_pin {
> +	__aligned_u64 param_buf_id;
> +	u32 addr;
> +};
> +
> +struct ipu4p_fw_isys_frame_buff_set {
> +	struct ipu4p_fw_isys_output_pin_payload
> +		output_pins[IPU4P_MAX_OPINS];
> +	struct ipu4p_fw_isys_param_pin process_group_light;
> +	u8 send_irq_sof;
> +	u8 send_irq_eof;
> +	u8 send_irq_capture_ack;
> +	u8 send_irq_capture_done;
> +	u8 send_resp_sof;
> +	u8 send_resp_eof;
> +	u8 frame_counter;
> +};
> +
> +struct ipu4p_fw_isys_error_info {
> +	u32 error;
> +	u32 error_details;
> +};
> +
> +struct ipu4p_fw_isys_resp_info {
> +	__aligned_u64 buf_id;
> +	struct ipu4p_fw_isys_output_pin_payload pin;
> +	struct ipu4p_fw_isys_param_pin process_group_light;
> +	struct ipu4p_fw_isys_error_info error_info;
> +	u32 timestamp[2];
> +	u8 stream_handle;
> +	u8 type;
> +	u8 pin_id;
> +	u8 acc_id;
> +	u8 frame_counter;
> +	u8 written_direct;
> +};
> +
> +struct ipu4p_fw_isys_proxy_error_info {
> +	u32 error;
> +	u32 error_details;
> +};
> +
> +struct ipu4p_fw_isys_proxy_resp_info {
> +	u32 request_id;
> +	struct ipu4p_fw_isys_proxy_error_info error_info;
> +};
> +
> +struct ipu4p_fw_isys_send_token {
> +	__aligned_u64 buf_handle;

Is this useful? Shouldn't this be rather taken into account when allocating
memory? This probably is already effectively the case though.

> +	u32 payload;
> +	u16 send_type;
> +	u16 stream_id;
> +};
> +
> +struct ipu4p_fw_isys_recv_token {
> +	struct ipu4p_fw_isys_resp_info resp_info;
> +};
> +
> +struct ipu4p_fw_isys_proxy_send_token {
> +	u32 request_id;
> +	u32 region_index;
> +	u32 offset;
> +	u32 value;
> +};
> +
> +struct ipu4p_fw_isys_proxy_recv_token {
> +	struct ipu4p_fw_isys_proxy_resp_info proxy_resp_info;
> +};
> +
> +struct ipu4p_fw_isys_buffer_partition {
> +	u32 num_gda_pages[IPU4P_ISYS_MAX_STREAMS];
> +};
> +
> +struct ipu4p_fw_isys_fw_config {
> +	struct ipu4p_fw_isys_buffer_partition buffer_partition;
> +	u32 num_send_queues[IPU4P_ISYS_QUEUE_TYPE_MAX];
> +	u32 num_recv_queues[IPU4P_ISYS_QUEUE_TYPE_MAX];
> +};
> +
> +/*
> + * These structures are copied directly to and from the IPU4P firmware queues.
> + * Keep the 64-bit fields 8-byte aligned; the firmware ABI depends on the
> + * exact sizes and offsets below.
> + */
> +static_assert(sizeof(struct ipu4p_fw_isys_output_pin_info) == 28);
> +static_assert(offsetof(struct ipu4p_fw_isys_output_pin_info, link_id) == 24);
> +static_assert(offsetof(struct ipu4p_fw_isys_output_pin_info,
> +		       reserve_compression) == 25);
> +static_assert(sizeof(struct ipu4p_fw_isys_stream_cfg) == 316);
> +static_assert(offsetof(struct ipu4p_fw_isys_stream_cfg, output_pins) == 132);
> +static_assert(offsetof(struct ipu4p_fw_isys_stream_cfg, compfmt) == 300);
> +static_assert(offsetof(struct ipu4p_fw_isys_stream_cfg, src) == 310);
> +static_assert(sizeof(struct ipu4p_fw_isys_frame_buff_set) == 120);
> +static_assert(sizeof(struct ipu4p_fw_isys_resp_info) == 64);
> +
> +extern const struct ipu6_fw_isys_ops ipu4p_fw_isys_ops;
> +
> +#endif /* IPU4P_FW_ISYS_H */
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
> index 8674c041b994..3a91f6a34c5a 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
> @@ -19,6 +19,7 @@
>  #include "ipu6.h"
>  #include "ipu6-fw-isys.h"
>  #include "ipu7-fw-isys.h"
> +#include "ipu4p-fw-isys.h"
>  #include "ipu6-isys-csi2.h"
>  #include "ipu6-isys-video.h"
>  
> @@ -179,6 +180,10 @@ struct isys_fw_msgs {
>  			struct ipu7_fw_isys_frame_buff_set frame;
>  			struct ipu7_fw_isys_stream_cfg stream;
>  		} ipu7;
> +		union {
> +			struct ipu4p_fw_isys_frame_buff_set frame;
> +			struct ipu4p_fw_isys_stream_cfg stream;
> +		} ipu4p;
>  	};
>  	struct list_head head;
>  	dma_addr_t dma_addr;

-- 
Regards,

Sakari Ailus
