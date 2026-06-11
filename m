Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35903F9F38;
	Thu, 11 Jun 2026 12:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781181880; cv=none; b=mvtJbKIE6QiJbuKQK+w39FB0m3s3I7qFaWN8T6go5k5cIgr8Wj69O7CvDUqGsJFCTMr9r/UeE4AVA2Vgii54sqMInHeLhAU/i3AkWnVkHWAdFanZE2jp+oOvTCImwNlJKmNRbCNhuWZk7ZaWhN5pa+NhIxk0j0utpVDRMxqx0Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781181880; c=relaxed/simple;
	bh=ImGupneTW5tLJ2ECIXpPq9btuXkRkdqOQib8LLSCMJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfUu4eP0lBwbx4YJkPlwxUIqBJ0/Q4qcVs4N7XsLBeAETbzdWf+mRSk+wOyyK64XuhWcVItKszuB+2doo70R1Xq4NYHPN6PfqcKL4x4B5fFrBnTgZ6HeTApEncgsppURov8FxWfffxRLDh3qAhN3Kx5bRMZQeSLwxiPj3CtfcRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SDjxwm7d; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SDjxwm7d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781181879; x=1812717879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ImGupneTW5tLJ2ECIXpPq9btuXkRkdqOQib8LLSCMJM=;
  b=SDjxwm7dCDuKxpG9tHQrK5a58M25mxYv2kYdBfkJjcO7ZLFg4Ml+Z0dn
   AynXX6v+zpzn3pMiuDDXkNMY+PedjZeJat4o+kPqHHp63ngCh0EvLd7KO
   RXcZ1m0c70bFgwb3j17+bwNLCF5UDTFBhlLaYvMiVFCkVdycEXenjsezq
   zYlXCg794x+aLCuDHYuIimQ3/Yz1YUcCKhaHTNHziLYobWbTYk/lyjdy8
   +JB4JwKQUQPXt+P37ivj8XYlIK2aXLDiEyJenF6StqeqZ40wf0Luws3gX
   Z4oFbRbdS75gFG0qHu8Dimi67K6NokOsHsNI7y0ORijgCGiQOFqgyyAtG
   g==;
X-CSE-ConnectionGUID: 4oLerzj5RimBqvbdFuAQVQ==
X-CSE-MsgGUID: p1S1x20zQv+LPGol01pBLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81998382"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="81998382"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 05:44:39 -0700
X-CSE-ConnectionGUID: FjApv2BkSKm2IlDWcz/MKg==
X-CSE-MsgGUID: WnuwZkinRlaLug+gU635hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="240125430"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 05:44:36 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id BBDD6121C39;
	Thu, 11 Jun 2026 15:44:32 +0300 (EEST)
Date: Thu, 11 Jun 2026 15:44:32 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Damjan Georgievski <gdamjan@gmail.com>
Cc: Kate Hsuan <hpa@redhat.com>, Mark Pearson <mpearson@squebb.ca>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Serin Yeh <serin.yeh@intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] media: ipu-bridge: Add DMI information of Lenovo
 X9 to the image upside-down list
Message-ID: <aiqtsFbFR9SZSDeL@kekkonen.localdomain>
References: <20260609124926.1038981-1-hpa@redhat.com>
 <20260609124926.1038981-2-hpa@redhat.com>
 <aineK26VD67Fmibd@kekkonen.localdomain>
 <CAEth8oEv3iAQ1P9=rYddeBRX2qrjZiysUA_JfFp8pUAoJXbGLQ@mail.gmail.com>
 <aipwpTo5JCiAACVp@kekkonen.localdomain>
 <CAEk1YH41bJSoJdjYMj2ZJp5+WF6DpZhBrwkNKaC1HbPvwDV3GA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEk1YH41bJSoJdjYMj2ZJp5+WF6DpZhBrwkNKaC1HbPvwDV3GA@mail.gmail.com>

Hi Damjan,

On Thu, Jun 11, 2026 at 11:41:19AM +0200, Damjan Georgievski wrote:
> On Thu, 11 Jun 2026 at 10:24, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Kate,
> >
> > On Thu, Jun 11, 2026 at 03:25:46PM +0800, Kate Hsuan wrote:
> > > Hi Sakari and Mark,
> > >
> > > On Thu, Jun 11, 2026 at 5:59 AM Sakari Ailus
> > > <sakari.ailus@linux.intel.com> wrote:
> > > >
> > > > Hi Kate,
> > > >
> > > > I know several people have given you different advices but...
> > > >
> > > > On Tue, Jun 09, 2026 at 08:49:24PM +0800, Kate Hsuan wrote:
> > > > > The Lenovo X9 has an upside-down-mounted Sony IMX471 sensor so the image
> > > > > was displayed upside-down. Add the DMI information of Lenovo X9 to
> > > > > resolve the issue.
> > > > >
> > > > > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > > > > ---
> > > > >  drivers/media/pci/intel/ipu-bridge.c | 32 ++++++++++++++++++++++++++++
> > > > >  1 file changed, 32 insertions(+)
> > > > >
> > > > > diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> > > > > index fc6608e33de4..9e24aaceecdf 100644
> > > > > --- a/drivers/media/pci/intel/ipu-bridge.c
> > > > > +++ b/drivers/media/pci/intel/ipu-bridge.c
> > > > > @@ -134,6 +134,38 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
> > > > >               },
> > > > >               .driver_data = "OVTI02C1",
> > > > >       },
> > > > > +     {
> > > > > +             /* Lenovo X9-14 */
> > > > > +             .matches = {
> > > > > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > > > +                     DMI_MATCH(DMI_BOARD_NAME, "21QA"),
> > > > > +             },
> > > > > +             .driver_data = "SONY471A",
> > > > > +     },
> > > > > +     {
> > > > > +             /* Lenovo X9-14 */
> > > >
> > > > How are the two X9-14's different? It'd be good to have some comment here
> > > > which model this actually is: the board name is only available (typically
> > > > at least) in DMI.
> > >
> > > According to the datasheet of X9-14 and 15. Lenovo offers 2 screen
> > > sizes (14-inch and 15-inch) and 2 CPU types (Core Ultra 5 and 7).
> >
> > Is the CPU SKU the difference here? If so, can you add that to the comment?
> >
> > > They may ship customised firmware for a specific purpose with a random
> > > DMI_PRODUCT_VERSION.
> > > So, using the DMI_BOARD_NAME prefix to identify the laptop SKU is
> > > safer and easier.
> > >
> > > I think DMI_MATCH(DMI_BOARD_NAME, "21Q") covers all X9 but I don't
> > > know the side effect :(
> > > They may propose a new model with a different MIPI camera or HID.
> >
> > Indeed. Is the BOARD_NAME guaranteed to be unique by Lenovo? I think I'd
> > use DMI_EXACT_MATCH(), too.
> 
> The full board_name is 21QA0048RM (on mine), so 21QA is just the prefix.
> The lenovo support site only requires this prefix to get you to the
> support page for the laptops and they refer to it as "Type 21QA".
> 
> Is there DMI_MATCH_PREFIX, for these (if not all) Thinkpads it might
> make the most sense ?

DMI_MATCH() only matches for prefix whereas DMI_EXACT_MATCH() requires an
exact match.

-- 
Sakari Ailus
