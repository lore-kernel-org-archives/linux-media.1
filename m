Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992787;
	b=IQ9/1SmctMLrGDZjNa7M+o+rXoi9EoFeiReQ9jmHWq85qnG9qlQ46edczC571iMmjQpP
	 Z5L/a/FNVLhYym8ftC9frI9hUYdYbWsm5DxNbDGJ1s/9FhB6NiI2gI12zhHyQynSPtBjU
	 3qX+uI1/IhTgoaC8o+9GKnefm9fQLVRCC6ddhG4dKeSIN+Dfm4oRb+3V9KlV8IG11yCYS
	 rB2YLelVpOt/hWERU5+16taJ03u3YV7iVvmLresQaRG3g/sRRITHh28j2k5slbsuTEvYe
	 GFAWdmTB0yVc6yv540fiV8fzQycdfPyk4EebE2KlDMxlX5JnhBA3/+7NsKh2e8oKwPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992787;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=DUr456LeeaSVUm7rxW+lpREqXpH+Vn52irgz9c2/uFM=;
	b=QZTp4lDXweU9m2Fe888bEuDFAYEzdsVu+BS85cuhibl9l4ROG+HUGQ5YCleUCokJ8S+x
	 XSwpR3/EciRHA3/J5pZYDAVP6XNnDEmHCWRcpEExT/mk/UtC1ckEiCAayPUbVfFVi1MWP
	 k/WzfsNrvmKrmflO/hAzk/BD1vq56MssS29bbjR5itP9LbNzIFHxqP3pdztYmd/QrY5RP
	 nPkaqM9sFvfHTsKoTSph46K5y1bGFFS785wDemY6nM1mQLRwULiMk4M6HQrXQHv46WqX4
	 Y37paGcOmQnIMock/oUKi1zz4oU9z3TTMvcNn6lofI9ks31Y7GpC2n9UEUCmYaVKfDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KzhC1cfQ;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754E5606A31C
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 754E5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KzhC1cfQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794992788; x=1826528788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cec1z2MHDg4TKAZQbR0VkaDaFZtobRePay/JT2V/GrQ=;
  b=KzhC1cfQEBKkuLZBYEkC3nRIEpv83iwli5vS5/5Wn7QckHFKGkuAlTEt
   Xp37bQIUT18L6uU/Y0Aq9wEVCQFmMypjrnMz23iJdCBbcFDmgXOBRHhdv
   KGu9H4aG9uDmsAYXaH5jwF4eBQsWuwLvnA+xOn8jtb/KtUL91qM3H5Zn+
   rTVTqznw7der6KzdSo2QWxDbECizUUaSvJYSs7/EZqO175aaptwJfAzPr
   x9xUcV1tk4z4wUXIytzRx7xxUiyLmmoNsXxqrABmgMK4iIv5dGjjfK75X
   tX+Bpm1MtrjtJQ/Pnbm/K9M5pxQ9imZDXbwpJxl1MYcAHtGUWdEdbEL5+
   Q==;
X-CSE-ConnectionGUID: q+ibVDWqSJCE5sfB5o/7IQ==
X-CSE-MsgGUID: I2IiuE3MTIumsZ9ZJUPvRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3809888"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3809888"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 01:06:27 -0800
X-CSE-ConnectionGUID: CVDicjeZTjK76/MtvicG9A==
X-CSE-MsgGUID: e5nV1Q50S8y9mtyb8wUGEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10497314"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 01:06:23 -0800
Date: Wed, 18 Nov 2026 11:06:21 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ruslan Bay <ruslanbey@proton.me>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
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
Subject: Re: [RFC PATCH v2 01/12] media: ipu6: Add IPU4P hardware
 identification
Message-ID: <av1qjeqdNVbrmwBU@ashevche-desk.local>
References: <gq0RPklnWwh54C8bfSPed_4KhUyWsFte_HBmLeiQM49u4LWoUOGyWTNqEQc9WDnHekSmgDrVtHXOJ12brO7eZdIXH7yUJzjGR1V2axZumGY=@proton.me>
 <auouu3gvbMTNIwvv@ashevche-desk.local>
 <aur0JgcxAVg6ip-h@kekkonen.localdomain>
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
In-Reply-To: <aur0JgcxAVg6ip-h@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 04, 2026 at 11:00:22AM +0200, Sakari Ailus wrote:
> On Tue, Nov 03, 2026 at 08:58:03PM +0200, andriy.shevchenko@linux.intel.com wrote:
> > On Sat, Oct 31, 2026 at 12:26:23PM +0000, Ruslan Bay wrote:
> > > Add IPU_VERSION_4P and IS_IPU4P() to identify IPU4P hardware.
> > > Place IPU4P at BIT(0), shifting the existing version flags up one bit.
> > 
> > Is Kaby Lake IPU v3 or v4?
> 
> Kaby lake has IPU 3, but the CSI-2 receiver is different (CIO2) and
> unrelated to the IPU. Also the firmware interface is different enough to
> warrant writing a new driver (ipu3-imgu in staging).

Ah, I see. Thanks for clarification!

-- 
With Best Regards,
Andy Shevchenko


