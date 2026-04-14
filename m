Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7DC3AC0FC;
	Tue, 14 Apr 2026 10:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161185; cv=none; b=CIj3Qg5AflPprSU9fCA7v8lQO6pv5Wb9Xf9DIvEl78TctCjxb8xsAOUAw8it0XBHiKE60YPyJ1bfNa2eg13aB8uWHojhjb4UuRWTT6WZgOUNgBhas9lSb2nGYj6XgQ4VZvn20yqtxdES6nZprHeIG7WSDllxM3+TQm2ajNCr9Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161185; c=relaxed/simple;
	bh=tHQoTY8SV7CyDiDPhZ/GDk+DYRpzE66BamPWxv3QsCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrfqUJK0DhQBDLsUB4w3KaxzQA/z8aho0F5c6Xlj9IJIuNDunrJOFM9CewTLCRfaq4vH0pPHQv2LXmN755072j2F9kNRCX2zq9w5cRO0GlxC/lITEXHcD7WtZnc69GzMzl6+psiH7i2n5dBT5XYu9EU8hcqZbNDbJNQecjzPbxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHBcd51o; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHBcd51o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776161184; x=1807697184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tHQoTY8SV7CyDiDPhZ/GDk+DYRpzE66BamPWxv3QsCs=;
  b=fHBcd51o1B1NVwkvhH2HZ04vyWo5KX17Bz9BldH6AM7aFGKZpKBQ36uO
   QA3F4b9JU7wGuLzEZT95EyiKPncbpv7do/FK1K1/DkcDf9d0Ynn5rkCW7
   5OmDe2GrjWKLs6krt59EXdWQxT8MXR1V8b7n/FQhfyb2q3CbBi4UZ9DcC
   lMDiBfuYlcSodIzdxOG8uqa1GbhDr34RM6hOOr5gn0TotMWYqEIAam4q6
   iYS2kVyVG8f33DUq9iYAn37yf9DLfW6nyflkcQGUCa2hPcOnRoNexPdU2
   bobijF7axDNBhAfnRQ/AJlCXLi0rV4HPc5jVTUKSRZWBq4eZjs3Y9YqzS
   w==;
X-CSE-ConnectionGUID: 8y6fSYstTTqgRUi7SwF6zQ==
X-CSE-MsgGUID: H/l8HEoZTPKEjnjfznB4Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="94513630"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="94513630"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 03:06:23 -0700
X-CSE-ConnectionGUID: d8zoFkAHT2+CTknHr9L9fg==
X-CSE-MsgGUID: kxzvHMgpT9q9tX5STKoF5A==
X-ExtLoop1: 1
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.154])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 03:06:19 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C41DA120333;
	Tue, 14 Apr 2026 13:06:37 +0300 (EEST)
Date: Tue, 14 Apr 2026 13:06:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] media: i2c: add os02g10 image sensor driver
Message-ID: <ad4RrbNLa1EXYZM0@kekkonen.localdomain>
References: <20260414084952.217215-1-elgin.perumbilly@siliconsignals.io>
 <20260414084952.217215-3-elgin.perumbilly@siliconsignals.io>
 <20260414092758.GE4061@killaraus.ideasonboard.com>
 <MA0P287MB2178FAA81D07B561FA68014988252@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
 <20260414095727.GF4061@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414095727.GF4061@killaraus.ideasonboard.com>

Hi Laurent,

On Tue, Apr 14, 2026 at 12:57:27PM +0300, Laurent Pinchart wrote:
> On Tue, Apr 14, 2026 at 09:43:32AM +0000, Elgin Perumbilly wrote:
> > Hi Laurent,
> >  
> > > I sent a review comment on v1.
> > >
> > > On Tue, Apr 14, 2026 at 02:19:45PM +0530, Elgin Perumbilly wrote:
> > > > Add a v4l2 subdevice driver for the Omnivision os02g10 sensor.
> > > >
> > > > The Omnivision os02g10 is a CMOS image sensor with an active array size of
> > > > 1920 x 1080.
> > > >
> > > > The following features are supported:
> > > > - Manual exposure an gain control support
> > > > - vblank/hblank control support
> > > > - vflip/hflip control support
> > > > - Test pattern control support
> > > > - Supported resolution: 1920 x 1080 @ 30fps (SBGGR10)
> > > >
> > > > Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> > > > Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
> > > > ---
> > > >  MAINTAINERS                 |    1 +
> > > >  drivers/media/i2c/Kconfig   |   10 +
> > > >  drivers/media/i2c/Makefile  |    1 +
> > > >  drivers/media/i2c/os02g10.c | 1039 +++++++++++++++++++++++++++++++++++
> > > >  4 files changed, 1051 insertions(+)
> > > >  create mode 100644 drivers/media/i2c/os02g10.c
> >  
> > I have added a new function, os02g10_set_framefmt, which dynamically sets
> > the mode register.
> >  
> > Please let me know if I have missed anything or if further changes are
> > needed.
> 
> You also need to drop the supported_modes array, and implement support
> for .set_selection().

I don't think we have a very well established behaviour for set_selections
on sensors before the common raw sensor model, do we? I guess it can be the
same as get_selections, though.

Hopefully we can merge the metadata series soon...

-- 
Regards,

Sakari Ailus
