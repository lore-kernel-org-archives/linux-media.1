Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001849;
	b=VY0OaD6v++QEiw/kq1ruUJu7uWNUOcXsIDFag/Y48bwI8OsokIu8l+k0gBBhjo6WiLsn
	 6ktGdE7wIJqlB7fK+Skoq9AxnnbDtienWLkOtc+9Ll8yGeUfPY7Y/zmVBFduYXmEBwucc
	 nz26mxyBn4Dy05BCcrWNy1rzx3tTA+nGfvBqaxWpJhTn+YGS2jzQkFk44g59VldY21ZRi
	 RQN2d36l4TwiqOZxOWjjlpT/D5dOH7yTpZbu8nx7w0NLv7wjF/dMwDhyc+i+5JYHfKNfd
	 TSonnuEi/3cTJVSgEbUzERDfQ3/ygbxxuOVpeooN1ZSXTPsTcFJd1wCRc9W4/na4RHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001849;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=jF8l6au+qW0mhT4ujwQ3fTVPLxWplhmpuA8FoIYYSu4=;
	b=be/L0AjE2K36TuNAFRsw12mA2MI3BUWyHfr4YdlCM6XK5YrWSO+stOBs0Jtzf26R/P55
	 4g/aczrQSBP6pOax6j3tLwEbGyLEe06C8m50iQELfQ9CAT3ulvBC8BZVkEF7sstoQ94vn
	 JRsh2UGq+TL0NPamA1LkQjkc08VJZ9op3AGXWP8Zml9yWmO1yqXfzI4Fgmfi853IvLuOt
	 zvfVetTsqvBlFu7qU0hY66vZ0FWV6cd1C7ug55ZZ8Xc0qBkMXwkf2Zs/fONGKYON4NxBT
	 C86k7ow9UPFZWoKBOdbzLanLQByx5GuLzppKB7SeGjIYxGkP4kkbohwQQdDniaNs09A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gIj27hs+;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C228B606A320;
	Wed, 18 Nov 2026 11:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C228B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gIj27hs+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795001848; x=1826537848;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yh+KpAP41gGxV7MFLK9TOv5pTo3pj/yyBQtvn0T/3bo=;
  b=gIj27hs+6m9xS+Q4AiY0l9EySh8kVW9InhAU+M0MxPHI2FCnL4Iy62aa
   44IJk71H0ShCN9+WCbqWvjd2zpA/F03vj53atXCG7rD9/YvCaRrgaulmn
   Bm1P2FFo/9zd/XdAOnIR2lvwswHLo97iU9uvkbcqp/zXIHvcmZuemE4ct
   Hlq3mdAL6MmwYnvgZOagFkNhYmRGK7IzVuBe06TKyXxiepufJsqkvRJOj
   OTQZj6uP/+37FWCj6FRCCkZmh00zw/G1WR/ehcVqsOD6bWthoPsKKpLoa
   E8tTBNW+tcKRfAoviKE5A3qQDed6blSrg1Du1vjMYERof6RnRTWGii3HF
   w==;
X-CSE-ConnectionGUID: USMNTVSsSGuYbylByFWZzg==
X-CSE-MsgGUID: sUJYutE5QyWxI7qpHGpTxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3695898"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3695898"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 03:37:28 -0800
X-CSE-ConnectionGUID: OgMj5SdYT9+JKMQFfKNUTA==
X-CSE-MsgGUID: r3Qv7R0XQ8u2O21l2IblyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10131779"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 03:37:26 -0800
Date: Wed, 18 Nov 2026 13:37:23 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Volodymyr Chapman <volodymyrchapman@gmail.com>
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org,
	dan.scally@ideasonboard.com, hansg@kernel.org, andy@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] media: Add Sony IMX175 sensor driver (Lenovo
 ThinkPad 10 rear camera)
Message-ID: <av2N81gHOXYpaV-C@ashevche-desk.local>
References: <20261116175151.20150-1-volodymyrchapman@gmail.com>
 <avwnh1o6rFzayxkj@ashevche-desk.local>
 <20261117175614.11710-1-volodymyrchapman@gmail.com>
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
In-Reply-To: <20261117175614.11710-1-volodymyrchapman@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 17, 2026 at 05:56:14PM +0000, Volodymyr Chapman wrote:
> Hi Andy,
> 
> On Tue, Nov 17, 2026 at 12:08:07PM +0200, Andy Shevchenko wrote:
> > > Not supported: the voice coil motor (the firmware does not name its
> > > type) and the LM3554 flash.
> >
> > Why not flash? It's in the kernel provided by drivers/leds/leds-lm355x.c
> 
> I should have mentioned that leds-lm355x cannot be used on this machine as
> it is: it only probes with platform data (it has no ACPI or DT matching,
> and nothing in the tree provides the platform data), it does not drive the
> LM3554's HWEN enable line, which has to be raised here before the chip
> responds, and it registers plain LED class devices rather than a flash
> LED class device.
> 
> When atomisp's own LM3554 driver was removed in commit f1aa35ab5943
> ("media: atomisp: Drop the atomisp custom lm3554 flash driver"), the
> commit message said it should be re-implemented with the
> led-class-flash API if it turned out to be needed, so that is what I
> did. The new driver binds to the same ACPI ID (INTCF1C) and uses the
> same GPIO order (0 strobe, 1 torch, 2 enable) as the removed one.
> 
> I have sent it to linux-leds:
> 
> https://lore.kernel.org/linux-leds/20261116180809.26946-1-volodymyrchapman@gmail.com/
> 
> Whether that or extending leds-lm355x is the better way is up to the LED
> maintainers; I will ask on that thread. In v2 of this series, I will reword
> the cover letter to point to it. The VCM has since turned out to be a
> DW9714 at the address listed in _CRS, and I have a follow-up patch for
> it which I can include in v2.

You still can mention that the AtomISP specific LM3554 driver was dropped and
the replacement should be developed from a scratch or using existing LEDS
driver as a base.

-- 
With Best Regards,
Andy Shevchenko


