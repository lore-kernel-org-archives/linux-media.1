Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AA93E867A;
	Thu, 11 Jun 2026 12:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781181782; cv=none; b=YtvVzJ6fW6vPKL+IRlYKcX4VvdnooKOCuzGkhCcs2nIEjISClOsgSuqcuNgY4RSDC/C25Rh7HCfZ/ZSpoQVIBLRD3qK2u0ovd7OibHlOt/9jE4RTcwpNtW/LXjOvBKKsfvpT7rLIdVSwaq1saUwvDyYXyjWmjewEgObNweHfUJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781181782; c=relaxed/simple;
	bh=ghrEJ5fTqOYUKlb7JDJpDUt7J5JTLMQ20AF8BjY+0AM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2gEh0w1AP1uk0+Fevo2wXcORlAUaCKSy6QwXYewlAIx43tyh0lOhdY1m/Wb5s5pZP+LXCW9fGkyS9EOoisqX5tSIK//R/22u8KG0xr5kWzKyhffwkOQEYstpPwEcRHyqo3m4cWp6FHp05ysfthPrUGAEyxG7ROJ6heaKW18ICc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=agjFEwyF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="agjFEwyF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781181781; x=1812717781;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ghrEJ5fTqOYUKlb7JDJpDUt7J5JTLMQ20AF8BjY+0AM=;
  b=agjFEwyF/VxJ7Lao7ULDXzv9pTH774l074DU+JRuekXYxMh9ZwewP1qD
   QiauK/N9gaItQH6Cwpe/KA63YVDJS0bBBzkDOFU5uFCkdoz3T4yUxZQSF
   2EEJcft4jQJtjo9AeVBnZemQJqwZTJoxfJEKQAY9p6tY30rCDSHS4M9sa
   BmcZmgaVEbiWiDzgVhNpuj3Dhzcz3NG0WN9txe8Vt+gQoiIj3JIgBcU8O
   xcnZwAKPzOeVMZWm/fGz+5TtCHSx/12rpgZPttayX4PgLO/LY+v4wuyHC
   qUiXLm/nQqchoeGIgmK07nC3GTFBZRZGOWx7mTv7B1EJxT0QUim9U1Q20
   g==;
X-CSE-ConnectionGUID: 03eGh6jMTQKb2A0XEINTIg==
X-CSE-MsgGUID: bbm586AaRp2s8qejjnWfZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81998256"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="81998256"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 05:43:00 -0700
X-CSE-ConnectionGUID: 9BCM1+6VSXCMTkBeuN56ww==
X-CSE-MsgGUID: nyW566T3S7yOulFXfBWsHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="240125094"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 05:42:57 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 87DFE121C39;
	Thu, 11 Jun 2026 15:42:53 +0300 (EEST)
Date: Thu, 11 Jun 2026 15:42:53 +0300
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
Message-ID: <aiqtTeomxAeeXqgO@kekkonen.localdomain>
References: <20260609124926.1038981-1-hpa@redhat.com>
 <20260609124926.1038981-2-hpa@redhat.com>
 <aineK26VD67Fmibd@kekkonen.localdomain>
 <CAEth8oEv3iAQ1P9=rYddeBRX2qrjZiysUA_JfFp8pUAoJXbGLQ@mail.gmail.com>
 <aipwpTo5JCiAACVp@kekkonen.localdomain>
 <CAEth8oGzP-_hv2KF_wqxwjdp0tQn=0o9pUokO1HkR21eXnkvBQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEth8oGzP-_hv2KF_wqxwjdp0tQn=0o9pUokO1HkR21eXnkvBQ@mail.gmail.com>

Hi Kate,

On Thu, Jun 11, 2026 at 05:42:04PM +0800, Kate Hsuan wrote:
> Hi Sakari,
> 
> On Thu, Jun 11, 2026 at 4:24 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
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
> I looked into the datasheet and it is hard to describe the difference
> between 21QA and 21QB (X9-14) or 21Q6 and 21Q7 (X9-15).

Ack.

> The 21QA and 21QB cover many kinds of configurations.

I think it'd be good to say that in a comment, too.

Some Lenovo models have UVC webcams, too, and often it's hard to tell which
laptop has which camera. :-(

> 
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
> The board name is a 10-character string, and the first four characters
> are used to identify the SKU, called "machine type". For example, my
> X9 is 21QBZCK... so DMI_MATCH() matches the first 4 characters (21QB)
> to identify that it is a X9-14.

Ack.

-- 
Kind regards,

Sakari Ailus
