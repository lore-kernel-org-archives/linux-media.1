Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4EE321457
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 13:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898032; cv=none; b=bktQroZ3Wj8/PfEirIigGl9lmqt1i4TgrDm6bcRwrOHTfXQviMsNu+9VqNb7T2bOwGFCsiqLzPiuUMXNQvGgzdYrtd74ai4pGx6C5EXcoS2QnHH3nbdJL7gJ8mxUES6RkxxEepy4atcMBKLPw6WR3xnsHWLcamCCAMPbjz8SslY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898032; c=relaxed/simple;
	bh=gfcYEhJgPCJXlGknEv9Uw9pvG39mAtXg0fHzgYERYj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObEudxuPf04glFfLJONI05vbZhk8izl76kA1YIzSBEtM1LgBd5bZRXIdgAzs0ye3MFBBE8mXRQXWhHUWrRo7AnMS3jHJ6Fxan6oC6uENeYE3RW2j860OUR1D1YA8/53z20np4z2V0QMdG1eGwnH92yNJ7bxKpyCxYAkKuhH+3mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DLoe5HdA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DLoe5HdA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791898031; x=1823434031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gfcYEhJgPCJXlGknEv9Uw9pvG39mAtXg0fHzgYERYj8=;
  b=DLoe5HdAkPXTUtmuZnQ91F/ngLKeBfNEi1z3UQpFMB5BKtNpzfAVh3b2
   vJ0CbIlcLucLf5GvjCV0iJtwoqMaVlGqjxc78vUE6o2IP4xUXvNYDrfQ0
   42XW1rxyPwO4E/84d7AaEWCLG4dV008Z96ieCJLjS7M08ZeCJGGTEPPT8
   bIRPX5RcDcXH60VIx4T/AljJQQgZoRIauEe/vNWzJPr4R1/gmwuQExHSB
   BH2xOO+lxivr8+Q/s3VngrdY9r5IbzxN8lM4JQ7w0SKPr/0owVcIxsYxk
   vVb0GYm0nMdVWKhnd8VwezFjdSl5RfTXKOrmUs735Zh/jRUuDFPwjHJ2d
   g==;
X-CSE-ConnectionGUID: J/PUnYpoRE+jOzofgNNZWw==
X-CSE-MsgGUID: GRTZwuweRIKk2twJ9hVfqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="653626"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="653626"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 06:27:10 -0700
X-CSE-ConnectionGUID: ivW2T+4ARnulLCa2HdBjqA==
X-CSE-MsgGUID: c1u8l+T/Q5KHW7EFZDofYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1132972"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 06:27:07 -0700
Date: Tue, 13 Oct 2026 16:27:03 +0300
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Ruslan Bay <ruslanbey@proton.me>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"tfiga@chromium.org" <tfiga@chromium.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH 12/12] media: ipu6: Enable IPU4P PCI device
Message-ID: <as4xpwnJgk_E6QWQ@ashevche-desk.local>
References: <O9-1Zx4ykYAqVbmmKdXWlV8znkPlWAssbXfVk-y48EcfJr2jUXDnwGULXfz8OtsKEOKcw-kG_0cr9A0H-7c4e17mnb-CycgRuTmN9eg82B4=@proton.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <O9-1Zx4ykYAqVbmmKdXWlV8znkPlWAssbXfVk-y48EcfJr2jUXDnwGULXfz8OtsKEOKcw-kG_0cr9A0H-7c4e17mnb-CycgRuTmN9eg82B4=@proton.me>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Oct 11, 2026 at 02:44:09PM +0000, Ruslan Bay wrote:
> Register IPU4P in the PCI ID table after its required MMU, buttress,
> firmware, ISYS, and CSI PHY support is present.

...

>  	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_MTL) },
>  	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7) },
>  	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7P5) },
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU4P) },

Please, order by the device ID name.

>  	{ }
>  };

-- 
With Best Regards,
Andy Shevchenko


