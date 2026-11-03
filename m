Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736616;
	b=3S2BWRZ3rNX6mHTsAXRHmbl95ZZHt/qXaILG3VI3FAcaa/Lq9RvrA9rnsKkHcfo3uPBO
	 2Z5Dcx7kSn6cIQHGG+3tOAoSNPRMXiEok9cv2pFqL7F8o3xq2NmZ0EZmmnpdp0bbf14OT
	 Nk6vEgDYGKWG5ZwKeGtwLdGMHu28opfNV0YrbaNx2iZj/CUhdwodl27Di+kNdoqW1174U
	 XuDyQ05xS0N5WCMxUXHSVUZGMzehjcQYfsPNv7w7J+nG0bcG+4v84FcqtHuPUYEyVpcIM
	 +cmUJQrYXwcYVmr3u4pZBtZVyBZBN2JolH1ZJP3Mtqjnk6n+6mQbLd9qcbMErmMKbQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736616;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=/QLGfZzYTtrPucViCgVc0oNLEt8Ven9VeZwnC7wXFI0=;
	b=ONLpOHV+g8VCsYKyilpltISifGlQk5W3oQJZyTYqKFRbxC9E+qGL9dzYzXSXjINuGU8B
	 DVRyaI9jeXN70mIrT255sBR+GyvImycAULDgkPIHSkTUh1vh8dAj2oQ24qFlaBOotfslX
	 Hh2qZCKJSQlKp1HaD6Iy8qPDNy6S0XPB7+75sCamoev9iU5oFFI8iZZV4fMU4uVXtIpjV
	 UZW4UNg9C6imie6WA311w84Z/j67tJubUtBUxHLjtE1YRo1FU6ppHArc/6vbDacP1coU0
	 kNtu+PbbtIKL/3bq6ZjWHm3y4K2TWiK4yuX7y5qbv7srz9ypecC1kTWoJLVMVd6M+CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jCUkH8aK;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A4C606A31B
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 20:10:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01A4C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jCUkH8aK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793736616; x=1825272616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O/R0hr/RTmnACsCcBZ5Q5TnrAsE1z5igPib3kdxUMhE=;
  b=jCUkH8aKPL+/Kp2cALaMG/5xn55QWxZGaN/jzl3arqCLxiSaJhWfdE3x
   hnFnCWi34lxxbGr9dX4pl59maMQ8UxUGir06XzleUfZygdh+bIApEG3MV
   9l0h01atEeCrRoubeutJb+sAlu1+Qs2Os3PrsVIZ6paiahjVFHN3RWDxU
   xYGZ74K82s/FymHXmoJ5ClsmwHGBYiK6nL65b4lz81Cd+Upo28pe+ZWYu
   5GFRr/1XKqpAyf8mTjEC4xmBE/bp4zkE7jD80P3ui6cSPaz2DvGJ0DgnF
   BEeJ3wpOR91p1JJs/E3qCkVKj7tC4z0KG/XRw0RIklZHm8pwoC1NDeBSW
   g==;
X-CSE-ConnectionGUID: c2lsb5llSjyu/bk5sm41mQ==
X-CSE-MsgGUID: 6tNYjNF0Rh+tGvN2+oqyyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2488925"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2488925"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 12:10:16 -0800
X-CSE-ConnectionGUID: 9F3wlAzRQN+qdxZzVXRF+g==
X-CSE-MsgGUID: pPX/y1Z0Sj+ePVJeRZI4bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6639514"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 12:10:12 -0800
Date: Tue, 3 Nov 2026 22:10:10 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Ruslan Bay <ruslanbey@proton.me>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"tfiga@chromium.org" <tfiga@chromium.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH v2 04/12] media: ipu6: Add IPU4P ISYS firmware ABI
 definitions
Message-ID: <auo_otSfsGLegm5m@ashevche-desk.local>
References: <qJpspBAWzqglGBR73yrjsGpt-xP4GhpO-73O__h9kLQEoqcTFymSrOlMxiG45wqdn8KmRxM6nkpNwuatbAl8IVltCj991siWcK_CbCpru4Q=@proton.me>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qJpspBAWzqglGBR73yrjsGpt-xP4GhpO-73O__h9kLQEoqcTFymSrOlMxiG45wqdn8KmRxM6nkpNwuatbAl8IVltCj991siWcK_CbCpru4Q=@proton.me>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Oct 31, 2026 at 12:33:05PM +0000, Ruslan Bay wrote:
> Define the IPU4P ISYS firmware message types, queue tokens and data
> structures.

...

> +#define IPU4P_ISYS_OPEN_RETRY			2000
> +#define IPU4P_ISYS_CLOSE_RETRY			2000

RETRIES? Or is it missing the unit?

...

> +enum ipu4p_fw_isys_resp_type {
> +	IPU4P_FW_ISYS_RESP_TYPE_STREAM_OPEN_DONE = 0,

Here and in the similar cases this assignment makes no sense. If this is HW
related bits, then *all* of them should be explicitly assigned (to avoid
reordering and hence renumbering), otherwise 0 is guaranteed by the C standard.

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

...

> +struct ipu4p_fw_isys_resolution {
> +	u32 width;
> +	u32 height;
> +};

We have already data structure like this in the media/v4l2 headers. Why not
using it? IIRC struct v4l2_area.

...

> +struct ipu4p_fw_isys_isa_cfg {
> +	struct ipu4p_fw_isys_resolution
> +		isa_res[IPU4P_ISYS_RESOLUTION_INFO_MAX];

It's bad indentation. Just make a single line. And FWIW it fits precisely
the limit of 80.

> +	u32 cfg_fields;

...

> +struct ipu4p_fw_isys_cropping {
> +	s32 top_offset;
> +	s32 left_offset;
> +	s32 bottom_offset;
> +	s32 right_offset;
> +};

Also, look at the existing struct definitions in v4l2 headers. I don't remember
by heart but I believe that we should have it already in one or the other form.

...

> +/**
> + * struct ipu4p_fw_isys_output_pin_info - IPU4P output pin configuration
> + *
> + * Unlike the IPU6 ABI, IPU4P ends this structure at reserve_compression;
> + * snoopable and sensor_type are not part of the IPU4P firmware wire format.
> + *
> + * @link_id: PPG link; zero selects offline capture

Run kernel-doc validator, there are many warnings here.

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

...

> +struct ipu4p_fw_isys_frame_buff_set {
> +	struct ipu4p_fw_isys_output_pin_payload
> +		output_pins[IPU4P_MAX_OPINS];

Indentation...

> +	struct ipu4p_fw_isys_param_pin process_group_light;
> +	u8 send_irq_sof;
> +	u8 send_irq_eof;
> +	u8 send_irq_capture_ack;
> +	u8 send_irq_capture_done;
> +	u8 send_resp_sof;
> +	u8 send_resp_eof;
> +	u8 frame_counter;
> +};

...

> +struct ipu4p_fw_isys_error_info {
> +	u32 error;
> +	u32 error_details;
> +};

> +struct ipu4p_fw_isys_proxy_error_info {
> +	u32 error;
> +	u32 error_details;
> +};

Why?! Just use a single type for both.

...

Are you sure that we may use the native endianness for all of the fields?

-- 
With Best Regards,
Andy Shevchenko


