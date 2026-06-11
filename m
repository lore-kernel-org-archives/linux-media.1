Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675273101C8;
	Thu, 11 Jun 2026 08:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166253; cv=none; b=AZsf56fRmoAOjPpG+hiKW1DStoohn0TUtl267Wt1mZHVeBlAY2S3cRMX3bIBHWaStRDTtbrB+zFi8k8TTRKvcraEv8GatuVvdrgn43EYGxMis2GsMw9Fy4Pagxpmo81kwbHSeAXGfxbqHh7lALSKNziJm/+5WdlKrVxAuSnGitc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166253; c=relaxed/simple;
	bh=/uL/Z6viEf7LoWHzyzrIuO4VnhS21AaHozLE6cqacAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzO9KWv0jw5S7dV+IbGBoFnWNV5vI+/HQHi69cWpF8/yhlaSA5sxwDpDcnWlcQeZ3DyZVZkg7ivxs7r0SdUA9UlTJFDhFrI4QnvQ7yb2+mP2IZzf2AAVG3yTdw6doESaCrPVtdu9hAt2diBJTOIGodS/tSLUKC5qYFz1V963sQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pmq7m7fF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pmq7m7fF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781166251; x=1812702251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/uL/Z6viEf7LoWHzyzrIuO4VnhS21AaHozLE6cqacAg=;
  b=Pmq7m7fFDjWoO+KTBbpWnKr3JvAT6Y0VJBNENvPdU8pz6Kq2oyFiT9B1
   POITQRXKt+ndzuYpXbFCA+rKmcKeG02CUDBOIO/R0YiKgfA4pKgDiCmTB
   LaT7BHDj1xO8bbsx2viQcY0GdbIHMKFeNINEPxlzja4MGviIwkeWRLfoX
   VitFwUXTrUnS7vvkM7lyg8X5CP8DVvHs3SM1/X6VaKeU4CGCGV2QbUfHz
   6RF5Jc99GFe55wTg6Bm5EsYB+L86HbO5GNj2apzdRuf1DjUOfLVlMNB+q
   tlt7RviSQoNpmlYOFcov4aK2NCrphTgqQubLTG5aZl5Wseq3vBXQNkxzp
   g==;
X-CSE-ConnectionGUID: nEluAgIuQD6wqZB7XS5jjQ==
X-CSE-MsgGUID: FiXVqAXzS9GJjYMxDRa6qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81953270"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="81953270"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:24:11 -0700
X-CSE-ConnectionGUID: zic59zJ2S6WzBVmIKYB6kA==
X-CSE-MsgGUID: H52OM4+PTU+HlDvKsfJPHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="240074013"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:24:08 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 27CC7121C36;
	Thu, 11 Jun 2026 11:24:05 +0300 (EEST)
Date: Thu, 11 Jun 2026 11:24:05 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: Mark Pearson <mpearson@squebb.ca>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Serin Yeh <serin.yeh@intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Damjan Georgievski <gdamjan@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] media: ipu-bridge: Add DMI information of Lenovo
 X9 to the image upside-down list
Message-ID: <aipwpTo5JCiAACVp@kekkonen.localdomain>
References: <20260609124926.1038981-1-hpa@redhat.com>
 <20260609124926.1038981-2-hpa@redhat.com>
 <aineK26VD67Fmibd@kekkonen.localdomain>
 <CAEth8oEv3iAQ1P9=rYddeBRX2qrjZiysUA_JfFp8pUAoJXbGLQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEth8oEv3iAQ1P9=rYddeBRX2qrjZiysUA_JfFp8pUAoJXbGLQ@mail.gmail.com>

Hi Kate,

On Thu, Jun 11, 2026 at 03:25:46PM +0800, Kate Hsuan wrote:
> Hi Sakari and Mark,
> 
> On Thu, Jun 11, 2026 at 5:59 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Kate,
> >
> > I know several people have given you different advices but...
> >
> > On Tue, Jun 09, 2026 at 08:49:24PM +0800, Kate Hsuan wrote:
> > > The Lenovo X9 has an upside-down-mounted Sony IMX471 sensor so the image
> > > was displayed upside-down. Add the DMI information of Lenovo X9 to
> > > resolve the issue.
> > >
> > > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > > ---
> > >  drivers/media/pci/intel/ipu-bridge.c | 32 ++++++++++++++++++++++++++++
> > >  1 file changed, 32 insertions(+)
> > >
> > > diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> > > index fc6608e33de4..9e24aaceecdf 100644
> > > --- a/drivers/media/pci/intel/ipu-bridge.c
> > > +++ b/drivers/media/pci/intel/ipu-bridge.c
> > > @@ -134,6 +134,38 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
> > >               },
> > >               .driver_data = "OVTI02C1",
> > >       },
> > > +     {
> > > +             /* Lenovo X9-14 */
> > > +             .matches = {
> > > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > +                     DMI_MATCH(DMI_BOARD_NAME, "21QA"),
> > > +             },
> > > +             .driver_data = "SONY471A",
> > > +     },
> > > +     {
> > > +             /* Lenovo X9-14 */
> >
> > How are the two X9-14's different? It'd be good to have some comment here
> > which model this actually is: the board name is only available (typically
> > at least) in DMI.
> 
> According to the datasheet of X9-14 and 15. Lenovo offers 2 screen
> sizes (14-inch and 15-inch) and 2 CPU types (Core Ultra 5 and 7).

Is the CPU SKU the difference here? If so, can you add that to the comment?

> They may ship customised firmware for a specific purpose with a random
> DMI_PRODUCT_VERSION.
> So, using the DMI_BOARD_NAME prefix to identify the laptop SKU is
> safer and easier.
> 
> I think DMI_MATCH(DMI_BOARD_NAME, "21Q") covers all X9 but I don't
> know the side effect :(
> They may propose a new model with a different MIPI camera or HID.

Indeed. Is the BOARD_NAME guaranteed to be unique by Lenovo? I think I'd
use DMI_EXACT_MATCH(), too.

> 
> >
> > > +             .matches = {
> > > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > +                     DMI_MATCH(DMI_BOARD_NAME, "21QB"),
> > > +             },
> > > +             .driver_data = "SONY471A",
> > > +     },
> > > +     {
> > > +             /* Lenovo X9-15 */
> > > +             .matches = {
> > > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > +                     DMI_MATCH(DMI_BOARD_NAME, "21Q6"),
> > > +             },
> > > +             .driver_data = "SONY471A",
> > > +     },
> > > +     {
> > > +             /* Lenovo X9-15 */
> > > +             .matches = {
> > > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > +                     DMI_MATCH(DMI_BOARD_NAME, "21Q7"),
> > > +             },
> > > +             .driver_data = "SONY471A",
> > > +     },
> > >       {} /* Terminating entry */
> > >  };
> > >
> >

-- 
Kind regards,

Sakari Ailus
