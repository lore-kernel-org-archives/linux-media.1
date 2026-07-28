Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B762F7AD2;
	Tue, 28 Jul 2026 07:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225102; cv=none; b=OD2bGfQmAvDvL2ouvEkK5J1e5MRbDRlHAx7EwiYJudKYaO8f/VenZmbyfgj0ulI0qK5m1w2rRB+4HrYQYicF90Nw+wZh06nMLqO2If2a4dWidbZeFpGOy5eBWOs0NNb21nMYfpdtST4ogLPENBVgNNhF3R8PyJbf17O59f3HY1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225102; c=relaxed/simple;
	bh=ZO7kS0DK/ASZUZTm2pVO7kocUyYynkyuY69qhlDjFzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnjCapcVK81QO81ENL1z9uKMQQjkNgbztqAO6gO0i3b4EnUWuMxW0k7TWJQ5BstyS5T0okuC//iwv6GdHPyFJ3QtQ5H85YwVO4wpLFHYJY7nmBmzajCOGvIIIdk0+Qzg3vgf5i3dw2/uWcA432GlWHZLTW17QqXXMqgT+6scq2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kqfPqttS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kqfPqttS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785225100; x=1816761100;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZO7kS0DK/ASZUZTm2pVO7kocUyYynkyuY69qhlDjFzE=;
  b=kqfPqttSjcNAnJonlyMPEXcPmC2OK0AUanXT26z6naKVO3LZ8bD0sRo7
   OQL/9p6HPjUaPdIdj/Hsk72YNTVFDDmyBXMKtzDAQwhwNE3mx/cCDOjl7
   5XrLNXXeoEvJdf226GmqPIVk5Nawj9apCxzADr9gdWNHLfp0O60OwpcJ/
   +I1fCc5CMEyCsBcUrYvb3tbQNnu1psd9hxPAERy7HkA3htY/Udg4TyUCt
   alsxc4hXOjo3/c1t9aFYPZFMfSJDRQnwmJU1pmz13UH3FLFfoRgwRGGjD
   lXIece0F0yr/jmL1532h/UqWeUJam36NGcR39vp5JeqCnW1wLJ5I55kht
   w==;
X-CSE-ConnectionGUID: O2wDB7TSS4yE+ueTLoLZDg==
X-CSE-MsgGUID: nWuaPTT6SXWx/lyNzMijNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="84780558"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="84780558"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 00:51:40 -0700
X-CSE-ConnectionGUID: uopeLVulR2uhwxZ8T1AiIQ==
X-CSE-MsgGUID: vOfcoOc3SzikrFS0Q272pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="297868687"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.69])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 00:51:37 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4AC59121BFD;
	Tue, 28 Jul 2026 10:51:37 +0300 (EEST)
Date: Tue, 28 Jul 2026 10:51:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Serin Yeh <serin.yeh@intel.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx471: Add line length PCK setting
Message-ID: <amhfibBuw6N0usWl@kekkonen.localdomain>
References: <20260728042013.23707-1-hpa@redhat.com>
 <178521646078.4139729.8353081240992310969@freya>
 <CAEth8oHn7MqqZ1hN5EYazdiVmHPm8TToo07KfR8f0Rikm59ztQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEth8oHn7MqqZ1hN5EYazdiVmHPm8TToo07KfR8f0Rikm59ztQ@mail.gmail.com>

Hi Kate,

On Tue, Jul 28, 2026 at 02:54:49PM +0800, Kate Hsuan wrote:
> Hi Jai,
> 
> Thank you for the review.
> 
> On Tue, Jul 28, 2026 at 1:27 PM Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> >
> > Hi Kate,
> >
> > Thank you for the patch.
> >
> > Quoting Kate Hsuan (2026-07-28 09:50:13)
> > > Add the line length PCK setting to the IMX471 driver. This parameter
> > > determines the horizontal line scan duration and is used for
> > > controlling the frame rate.
> > >
> > > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > > ---
> > >  drivers/media/i2c/imx471.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> > > index 6d358b11e96d..e661f5b78dcc 100644
> > > --- a/drivers/media/i2c/imx471.c
> > > +++ b/drivers/media/i2c/imx471.c
> > > @@ -91,6 +91,7 @@
> > >  #define IMX471_CSI_2_LANE_MODE                 1
> > >  #define IMX471_CSI_4_LANE_MODE                 3
> > >
> > > +#define IMX471_REG_LINE_LENGTH_PCK             CCI_REG16(0x0342)
> > >  #define IMX471_REG_X_ADD_STA                   CCI_REG16(0x0344)
> > >  #define IMX471_REG_Y_ADD_STA                   CCI_REG16(0x0346)
> > >  #define IMX471_REG_X_ADD_END                   CCI_REG16(0x0348)
> > > @@ -240,6 +241,7 @@ static const struct cci_reg_sequence mode_1928x1088_regs[] = {
> > >         { CCI_REG8(0x030d), 0x02 },
> > >         { CCI_REG8(0x030e), 0x00 },
> > >         { CCI_REG8(0x030f), 0x53 },
> > > +       { IMX471_REG_LINE_LENGTH_PCK, 5008 },
> >
> > This does not match the mode->llp value (2328) used for 1928x1088, any idea
> > why?
> 
> I tried to resolve the horizontal line pattern on the moving objects
> when the sensor runs with libcamera. (The image is better for 0.7.2
> and more horizontal noise for 0.7.1)
> https://bugzilla.redhat.com/show_bug.cgi?id=2502786
> I guess the horizontal line pattern can be mitigated by reducing the
> frame rate. (image is better but the issue still happens.) I'm trying
> to figure out if the root cause is in the driver or SoftISP.
> If this is not the right direction for the solution, this patch can be
> drop. I'll try another way to resolve it.

My guess is that there's something wrong with the sensor configuration if
there are obvious systematic image defects that don't exist on other
sensor, given the same SoftISP. Something to check indeed is the horizontal
blanking as you've already found out. Very likely the other parameters such
as vertical blanking could still be changed without affecting the issue.

> 
> >
> > Aside from the patch, I also see that the value for the PIXEL_RATE control
> > is derived using the link-frequency and output bit-depth.
> >
> > It is likely that the sensor's frame rate depends solely on the LLP and FLL
> > timing registers, so it should be possible to derive a constant pixel rate
> > value (for a given PLL configuration) that is independent of link-freq and
> > bit-depth.
> The datasheet mentioned the the link frequency determines the pixel
> rate so that is why pixel rate is based on link frequency.

The PIXEL_RATE control refers to the pixel read rate in the pixel array and
configurations where pixel rate on the CSI-2 bus differs from that are
possible on all but the most trivial sensors (typically VGA).

In this case the PLL configuration could be used to find the actual
PIXEL_RATE (on the pixel array) as Jai mentioned.

-- 
Regards,

Sakari Ailus
