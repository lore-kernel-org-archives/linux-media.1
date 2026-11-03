Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735207;
	b=DtgIXnylLguV/fOfi+7oDvw8l7zYVCEAa+WS9hgD4g9YLIM79tIqoCwQkORwteztk+f+
	 Kw+p5bYMnvnPByOyD2MMt9KHc5nESprAn9ocQFSTVM/mR1mmT0kuGDP0AwC1xzJ0MnG27
	 PuZ9okJ7mMzI3PHvMCDNv+NyKAK3Nhw/wQ7wHPQVn/Vudstq/Hgj7eLZRFceU35MLJW9E
	 VsYBMKiFJC+DKuI+CMxEvBz8AmYhpzcQYMhiI4AmJg8Y+ex5oNrbBcSfS/CUZ+6VO+eH/
	 iUVHgv9Yoqvixit/G2ezO+vSfuCS52PghiLiv6y9mTQuAANuHLQgJdGgTTKFZ5zmtNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735207;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=Fq1MBF9NXh3sw38bUMLBN6w4KGdFhU4RgMWaqMcxl/I=;
	b=ohB7FSBquCkRXbUiiYCOl8ogsMkXyNQn+ic8HmZQCeBVhKHBOtqKKMbWbNNDIem5t7Fs
	 zi9iSWgbhKcA0kwuQxTI1e2hWhoC3pYBlEjUuUdaAgMsKKXc/MqTgLYCJbWYZYjK6DRoo
	 lh8u3SPTW6fdaJgCbk0JZ4vr8aYs06AE2gGHAI+dzeB7gUp2fTlxwFcdzl+j9GPQTToqP
	 L3d4EdsKK1IHUFhrS52oJGZP4NbsetG4KKYaoONxxSmT+eAnpSm1eZ2ZFt90m86IUk7YZ
	 8ZZeBafMK5yvgbpSrInaC+7NRSTPI5m/spZcO7PYLXbe/OjdMMlIwkOija5iGHt0WKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EDOao6h9;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D562606A324
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 19:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D562606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EDOao6h9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793735206; x=1825271206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x0++jnHCs8F3NWSSgnSy/Egb+4jg/86WFOQd6qsRvMg=;
  b=EDOao6h9TJRlKLyEvUdnGD97dmaZhCLF4ttn2v2a2LjPUYCX7Cfq68YW
   NqNOQBkPu/O3q1hJKz4OQ7K9DbcVvY+sjgx4MvVlZBMt7+rFGoGCvBV/L
   3dmqOwxNVR0bApjwoHbubcKrxX8yYwvT7N6V9Iti7Mw36w0bZzgrTjlTg
   8uevUKFjhFPXF0H8zphiMeW6phG98rbVDSMckmPI/Qg8EZlrz1M5wb4jL
   M6pwbCjBZK2aiPhKEUXFtfQtHARs/qLfFLEaFATNut1wFyGG52FfjQmn1
   2Wfk+ECivR+4rcpfkg3zLp1bTXfSCzdmfTAgTgSu3E6/axAJLnLZI7wC9
   Q==;
X-CSE-ConnectionGUID: GhN+eVgKT02NucSEs8WzoA==
X-CSE-MsgGUID: ObhVrt+cT0yIQgYL3FQWmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2351636"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2351636"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 11:46:45 -0800
X-CSE-ConnectionGUID: KwgYyaKXTKC54KWeH2ZvxA==
X-CSE-MsgGUID: 2b41DikgR2OAPsilQDXczA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6599102"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 11:46:41 -0800
Date: Tue, 3 Nov 2026 21:46:38 +0200
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
Subject: Re: [RFC PATCH v2 02/12] media: ipu6: Add IPU4P MMU support
Message-ID: <auo6HmybmtDl00Vj@ashevche-desk.local>
References: <HIqY305sMFUHwl9wyKbGQ0DCE3QOKwFva_k_NSdEz_Rp9xb1o6GM6uTjXTP4ejKQwXlePFZaTVUWmL3UN4-wUXmfrB1p4hWNaWOeiP_A4bg=@proton.me>
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
In-Reply-To: <HIqY305sMFUHwl9wyKbGQ0DCE3QOKwFva_k_NSdEz_Rp9xb1o6GM6uTjXTP4ejKQwXlePFZaTVUWmL3UN4-wUXmfrB1p4hWNaWOeiP_A4bg=@proton.me>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Oct 31, 2026 at 12:29:19PM +0000, Ruslan Bay wrote:
> IPU4P uses the same MMUv2 programming model as IPU6, but has different
> MMU register offsets, instances and stream allocations.
> 
> Add IPU4P-specific ISYS and PSYS MMU data and select the corresponding
> operations during initialization.

...

> -static int __ipu6_mmu_init_hw_data(struct ipu6_mmu *mmu, struct device *dev,
> -				   void __iomem *base)
> +static int __ipu_mmu_init_hw_data(struct ipu6_mmu *mmu, struct device *dev,
> +				  void __iomem *base,
> +				  const struct ipu6_mmu_hwdata *hwdata_lookup,
> +				  unsigned int max_l1streams,
> +				  unsigned int max_l2streams)
>  {
>  	const struct ipu6_mmu_hwdata *lookup;
> -	struct ipu6_mmu_hw *mmu_hw, *src;
> +	struct ipu6_mmu_hw *mmu_hw;
> +	const struct ipu6_mmu_hw *src;
>  	unsigned int i, nr_mmus;

Keep reversed xmas tree order.

...

> +#define IPU4P_ISYS_IOMMU0_OFFSET		0x000e0000
> +#define IPU4P_ISYS_IOMMU1_OFFSET		0x000e0100
>  #define IPU6_ISYS_IOMMU0_OFFSET		0x2e0000
>  #define IPU6_ISYS_IOMMU1_OFFSET		0x2e0500
>  #define IPU6_ISYS_IOMMUI_OFFSET		0x2e0a00
>  
> +#define IPU4P_PSYS_IOMMU0_OFFSET		0x000b0000
> +#define IPU4P_PSYS_IOMMU1_OFFSET		0x000b0100
> +#define IPU4P_PSYS_IOMMU1R_OFFSET		0x000b0600
>  #define IPU6_PSYS_IOMMU0_OFFSET		0x1b0000
>  #define IPU6_PSYS_IOMMU1_OFFSET		0x1b0700
>  #define IPU6_PSYS_IOMMU1R_OFFSET	0x1b0e00
>  #define IPU6_PSYS_IOMMUI_OFFSET		0x1b1500

Better to be consistent in length, drop first two leading zeroes.

-- 
With Best Regards,
Andy Shevchenko


