Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495323B995B;
	Mon, 20 Jul 2026 22:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784585022; cv=none; b=ENg8Ro1hseiLxpTzP9+aL9JWaiOC2ityqlLPUT8qU8UqALApdeSxDJYktm6o+UYhNCDGSVqXh1WFiRKUEz8TssUbC0CBAZIJLdy7b9U4xlO+rDTdhO9SZOw6UObtitELCXaTGpCfVXeeF9g+yPkVz7Pm7uTjWlY93oGi9VRPgoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784585022; c=relaxed/simple;
	bh=HlXbNcdee9zjLXkRICHvc+Mr7VlNe+BvCEDkUEqsP3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIutQlHwaXfxJWCVdHG9OC/KOd8fG6CruVRJM9gc0B9LUdG+2pAiI2Es3qsK2v3i6P4i/V/84gvix3Q01ofpEB9hO2Kzr6MtYpMWRKuVwvcKQo3q44jClB2StLRpAeK7hcv0FvYLlkRYWxpoRHroyUQpSFNyr5TjuqpFW6ckXXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DHFG/S8/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DHFG/S8/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784585021; x=1816121021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HlXbNcdee9zjLXkRICHvc+Mr7VlNe+BvCEDkUEqsP3A=;
  b=DHFG/S8/UpOC2m7bJoE+cFyjKfbYNlVhMS1fnckvy1mLBFI+cmmq7PAV
   7ym+aeORVn7GQFfKik+kUfZrYxBsV7uUvcWiPaOXdWqT6Aceyz197c+Jd
   om6fp6bhg5a3cP8NSJmxCW9SNkG9EPVKLU+xp/8mTS/xH4nonnceXT6fx
   kCJYvDs5ua1wr+YWxsHPU8TxSWbTc/a49g6anUsL4dzYv1pGIIj0PZWvf
   cREZze7MyZGU7pOOtpkN7QosDFsnnZ2JMEP64GxTQwA24wgkDY2inZJbD
   WPgCkCuvZVZYDXC9S5tjScax0KsrYuHD4kfRX20BoamZUEjOx9xdWVSmK
   Q==;
X-CSE-ConnectionGUID: B27LXpVXQh61hjlTyIOvNA==
X-CSE-MsgGUID: z2usrvYiSHKa4UE3BaN5zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="96310263"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="96310263"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 15:03:40 -0700
X-CSE-ConnectionGUID: gcDkJjAwQ/yCxnscvKoYjw==
X-CSE-MsgGUID: tWVf2WLATcOIQyD1i537Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; 
   d="scan'208";a="261367311"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.248])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 15:03:36 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9BECC121C02;
	Tue, 21 Jul 2026 01:03:39 +0300 (EEST)
Date: Tue, 21 Jul 2026 01:03:39 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Tetsuya Nomura <tetsuya.nomura@soho-enterprise.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 2/2] media: i2c: Add driver for Sony IMX662 sensor
Message-ID: <al6bO_lg9C9Jgrt0@kekkonen.localdomain>
References: <20260312150437.1091195-1-eagle.alexander923@gmail.com>
 <20260312150437.1091195-3-eagle.alexander923@gmail.com>
 <CAPY8ntAf9TjgW-E6WeJuMdsHy8pV8-CvqQJriWEFpgLB-brD5A@mail.gmail.com>
 <178455866124.1426769.18237320419273419942@freya>
 <CAPY8ntCvB9ij=rMwwBmBDfe_gWQboX9Xbt0ZB6WPVyFvc2CLZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntCvB9ij=rMwwBmBDfe_gWQboX9Xbt0ZB6WPVyFvc2CLZw@mail.gmail.com>

Hi Dave, Jai,

On Mon, Jul 20, 2026 at 06:39:34PM +0100, Dave Stevenson wrote:
> > and implement
> > it using the common raw sensor model directly?
> >
> > I did it for IMX678 [1] on Sakari's suggestion [2]. The two sensors are
> > quite similar, so I'm happy to help in whatever way I can on getting this
> > working with the new model too :-)
> 
> Is this effectively saying that linux-media is closed to sensor
> drivers not adopting the common raw sensor model, even though AIUI
> that isn't ready yet? I can accept that for a period, but how long is
> it reasonable for that to be the case? A year?
> With all due respect to those involved, the series has been around so
> long in various guises that it's a case of I'll believe it when I see
> it merged.

I know... :-( Hopefully not as long as that.

I intend to send update at least to the pre-metadata series next week and
ideally the pre-metadata series could go to 7.3. I've got some bugs to fix
in the main series so that may take a little longer, after which there's
libcamera part to be implemented.

-- 
Regards,

Sakari Ailus
