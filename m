Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730993;
	b=RJwHTyfEWxTfqKNxq7HzHKrnEfPI0kAtEcPHBZ2rlEcvtvFCBRuIjqhRLxLpXnfbGXL2
	 L+cdyWn6KDxqrDXO5I02uhuZO3YZmu6u99skMzlr/DJzxJdRDK//9lv2WOn0x+uAEQHMl
	 xobZwOd0Bl/BFHVegPHkR/3wrR9gjmcA8OQYe4NEHTej9sEXyxqQ7Pn2PzR28Yu0X6rup
	 SQubdNcLzjS5zaqR8OPZ0/Bm+TL2h5mKk8IJmGsaPy7KGkJ0CCBJN2s3qVdf8mnN6LLhc
	 Qtgli4i4godiFXcYcLOum8LVHaEjCnIeb3XbcUy1XJlDLlA081dloPWjP97kNczDSpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730993;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=yQeJnP5V5/Ohs9CrMgdc1fH8PlxpIX/yKjmjgLn1b34=;
	b=2yYcXMNlm8d6lhm8wmoS+4D2RKJ34Ql64gfqwdI5oHk0d9XT2cD5t9ZZgw9cXkZRS/RQ
	 wYkgAPLFxIBNGiYKQl3vxMlKMQx/d0qZ3LF3jXDIlxpd6jSQZMOe9BlsoEyM1uRxnu+jd
	 7GjmM55hucpcpOkHxEUOPaTl+CaLxDE9+9+9bwVySFNIEaD30kgqOKuSLDnZHSzjiVjr7
	 /i9K39rIdHdl0R/FBNCOhKWPPJDfEcMgyJbANj5spG91evcVaV/i7xdH1J/ROZLgtfKTq
	 3avgPDAIrxUmtZjj7D3oakh2XOZTi/x94KlGyv2y/UlZnE2zwVrgXtzVLK4PYogPHJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dOobkq52;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075FF606A338
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 18:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 075FF606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dOobkq52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793730993; x=1825266993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ap0RIokYnNVeZsOMOjRBySbVRJvN7Y25xfL+fXH/8jY=;
  b=dOobkq52Sz3yCIipixN82zOLyHomueSKbkE+Kwrgmns7qL6bJ8ImHpCI
   2TjFOQz33KjYv4m8HcMlIBycjygtUGcq5/BNBrgOHSrlfyeombH8X63v/
   FMlWiGk/a+Ydy9x+Eekobf53G5qtSXstgqjGuvwZw1U1J/V4Ldj2omJFF
   CxqCMos7jE4Co+yqImP7UiWic7fa4hS1a5V1kz3/E+LclYM7PHvMGq3HL
   metwCT3WsjRMULeHck7xtV4y+T69rdO0y9AhCQrufewZ7hBaVR/g+U2Qu
   DOoDutI5BFV7GDDv4OXo2qw/D6C5rkFHyWIhOeB8ktBanKHcyfSC9qrsY
   w==;
X-CSE-ConnectionGUID: HsePvZvsQlKiHJLX39UPSw==
X-CSE-MsgGUID: xpfEfj+5TA6Jge4mQ480rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2500853"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2500853"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 10:36:33 -0800
X-CSE-ConnectionGUID: 6si9iwlGQOy7zNtd8aiHeA==
X-CSE-MsgGUID: Yoq9kQFeThebt/CifmI+6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6324391"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 10:36:28 -0800
Date: Tue, 3 Nov 2026 20:36:26 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Ruslan Bay <ruslanbey@proton.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
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
Subject: Re: [RFC PATCH v2 00/12] media: ipu6: Add support for IPU4P hardware
Message-ID: <auopqnqgOTY2x7No@ashevche-desk.local>
References: <2MQDQgaaKZ4HAu3U6zhMj_Muf_H8tsVGLh_CSXM_kxcTL51pE14U9-brGqLYwPPJfDXHog_jWWWOTgToPYLMVZN-KW80t9sDIlEw1uwg-FA=@proton.me>
 <auj3IU5FC2lejqa7@kekkonen.localdomain>
 <aDZJlXzfVn1R7UC47TgI2YbHkd7cFWAqFk62vFouazo-xyzLXPnqKoZ_fWP6DX2YrCNI5F0hmapeic6LiKHdlluFARAsH_MTybxQjkIov6E=@proton.me>
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
In-Reply-To: <aDZJlXzfVn1R7UC47TgI2YbHkd7cFWAqFk62vFouazo-xyzLXPnqKoZ_fWP6DX2YrCNI5F0hmapeic6LiKHdlluFARAsH_MTybxQjkIov6E=@proton.me>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 03, 2026 at 12:36:26PM +0000, Ruslan Bay wrote:
> On Monday, November 2nd, 2026 at 9:48 PM, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > On Sat, Oct 31, 2026 at 12:18:19PM +0000, Ruslan Bay wrote:
> > > This series adds IPU4P support to the upstream IPU6/IPU7 driver.
> > > The IPU4 family includes IPU4 (Apollo Lake) and IPU4P (Ice Lake);
> > > this series supports IPU4P only.
> > >
> > > Most of the groundwork was done by Antti Laakso in the IPU7 support
> > > series [1]. I added the IPU4P-specific parts, using Intel's downstream
> > > driver as a reference [2]. The code mostly generated using AI.
> > >
> > > Image capture was tested on a Surface Pro 7 (i5-1035G4) with
> > > both the front OV5693 and rear OV8865 cameras. Test logs: [3]
> > >
> > > Thanks to the linux-surface community and the libcamera developers for
> > > testing the downstream driver and sharing their findings.
> > 
> > Please use git send-email to send further versions of the set if any --
> > threading is broken in this version. No need to send a new version just for
> > that though.
> 
> Thank you for taking your personal time to review the series.
> 
> I'll address your feedback, send the updated series to the linux-surface project for testing, and then post a non-RFC version upstream. I'll use git send-email for the upstream posting to preserve the thread.

Have you written this reply with AI assistance? This promise already is broken
as I pointed out to the very same issue in RFC v1. I highly recommend to reduce
AI usage and start doing something.

-- 
With Best Regards,
Andy Shevchenko


