Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0308D424669;
	Thu, 16 Jul 2026 14:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784210479; cv=none; b=NJOIr9G2UklE/bamq45iMERnTJZ7nd95D1qtyC7l6+WBexA4f2jrKyu2+E2GQRcwNeqzySSOpPSiCiFFM36e2k+JBCMTYODZmGsXDEJIsgKqz02yxvVwX5JuLRlVmEAxMv9JsSbSBEoBe4H/Mgk6mdbqpI3/9kUSVe4xHxli2RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784210479; c=relaxed/simple;
	bh=fZhUW9XbwDK//Y1wiW7eA4BY6zVO9reTPYfY6CVKMT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z8qTj0FtKfr8les7VNgFNI40hZg37b5aPLFsKycCkzPu62WwDM2x6vHewTs2qBpzAS2s1oxMQJPB+NvXCyen7Q/89dYcfKKFYwgCuD3Pyhj/Wf7Q6KieqoQ4vn7PdZ52xotp2UX0lX51/3VBCvgmYtQRapoHJWeOsFAIUEclmls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MpXJyrvr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpXJyrvr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784210477; x=1815746477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fZhUW9XbwDK//Y1wiW7eA4BY6zVO9reTPYfY6CVKMT0=;
  b=MpXJyrvrHBD4dmlVEVFuLD6Ad8nmSgfMpHKiYE2rIxeazS0P4Q/uwVaZ
   OCqRbtG34d/Z4kR/FXP2igJu85XqjTYG8kb+0NEp0dpiFME4mfTo3KsAu
   nTRw785or/Jqe+fXq38U4w6CiD8MB77Gbpt7wmIQeVIWws728LKfyxM5u
   MOsw1fe2v5D397UlgRhUw1gi2gYvw5SxLTDjhYbjNXshusHwspKAAH7/3
   7obVDGA2WUZn/Nxl1zc6BouujaMGW0IoJmId8qC5iocaGq951N94g2Of6
   nFKmNI6HQzYI5138MyqmOv0HQ6FjGaNZhEU3c+FJphLQmhzTfxUDavDnA
   Q==;
X-CSE-ConnectionGUID: KutNZ6d/TFuvoH5JddILUQ==
X-CSE-MsgGUID: jBmVD6dqQienBfhUY+GQ+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="85068762"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="85068762"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 07:01:16 -0700
X-CSE-ConnectionGUID: yz2UQmBLQa2MP5rEv1qZhA==
X-CSE-MsgGUID: kq1w6wdbReqCE7VLsKPc1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="255369631"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.85])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 07:01:13 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5630811F7EE;
	Thu, 16 Jul 2026 17:01:12 +0300 (EEST)
Date: Thu, 16 Jul 2026 17:01:12 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Eugen Hristev <ehristev@kernel.org>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@redhat.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: bcm2835-unicam: Fix pipeline wrong validation for
 unpacked formats
Message-ID: <aljkKMRvv18mw_lP@kekkonen.localdomain>
References: <20260520-bcmpi-v1-1-41d80125a7b9@kernel.org>
 <178046930079.1525445.16102733967737177325@freya>
 <bb075afb-56bf-4cea-9732-f2613feb88d1@kernel.org>
 <20260716081240.GA1837346@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716081240.GA1837346@killaraus.ideasonboard.com>

On Thu, Jul 16, 2026 at 11:12:40AM +0300, Laurent Pinchart wrote:
> On Thu, Jul 16, 2026 at 10:22:03AM +0300, Eugen Hristev wrote:
> > On 6/3/26 09:48, Jai Luthra wrote:
> > > Quoting Eugen Hristev (2026-05-20 21:07:00)
> > >> The commit
> > >> 08f9794d9b79 ("media: bcm2835-unicam: Fix RGB format / mbus code association")
> > >> introduced a check to see whether the format requested is the same as the
> > >> fourcc in the format list.
> > >>
> > >> However, this breaks the case when userspace requested an unpacked fourcc,
> > >> e.g. RG10.
> > >>
> > >> Unicam can work with or without unpacking pixels, e.g. pRAA or RG10, depending
> > >> on what userspace requests.
> > >> In the unpacking case, a dedicated register is being set.
> > >>
> > >> If the userspace requests pRAA, this works, because the check validates the
> > >> pipeline:
> > >>
> > >> v4l2-ctl -d /dev/video0 --set-fmt-video=width=3280,height=2464,pixelformat=pRAA \
> > >>  --stream-mmap --stream-count=1 --stream-to=frame.raw
> > >>
> > >> but, with
> > >> v4l2-ctl -d /dev/video0 --set-fmt-video=width=3280,height=2464,pixelformat=RG10 \
> > >> --stream-mmap --stream-count=1 --stream-to=frame.raw
> > >>
> > >> unicam complains at validation level:
> > >>
> > >> image: format mismatch: 0x300f <=> RG10 little-endian (0x30314752)
> > >>
> > >> This should work, because MEDIA_BUS_FMT_SRGGB10_1X10 can be packed into either
> > >> RG10 or pRAA depending on the packing register.
> > >>
> > >> To fix this, modified the condition check to also allow in the case when
> > >> requested format (fmt->pixelformat) is equal to fmtinfo->unpacked_fourcc.
> > >>
> > >> Fixes: 08f9794d9b79 ("media: bcm2835-unicam: Fix RGB format / mbus code association")
> > >> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
> > >> ---
> > >>  drivers/media/platform/broadcom/bcm2835-unicam.c | 3 ++-
> > >>  1 file changed, 2 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > >> index 8d28ba0b59a3..cc7627e9a51a 100644
> > >> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > >> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > >> @@ -2158,7 +2158,8 @@ static int unicam_video_link_validate(struct media_link *link)
> > >>                  * In order to allow the applications using the old behaviour to
> > >>                  * run, let's accept the old combination, but warn about it.
> > >>                  */
> > >> -               if (fmtinfo->fourcc != fmt->pixelformat) {
> > >> +               if (fmt->pixelformat != fmtinfo->fourcc &&
> > >> +                   fmt->pixelformat != fmtinfo->unpacked_fourcc) {
> > >>                         if ((fmt->pixelformat == V4L2_PIX_FMT_BGR24 &&
> > >>                              format->code == MEDIA_BUS_FMT_BGR888_1X24) ||
> > >>                             (fmt->pixelformat == V4L2_PIX_FMT_RGB24 &&
> > >>
> > > 
> > > Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > 
> > 
> > Hi Sakari,
> > 
> > I saw you taking some of the patches on unicam, this one is the most
> > important as all unpacked formats are basically broken for a very long
> > time (months) and the patch is pending for quite some time.
> > 
> > This should also go in stable as some older versions also affected.
> 
> The commit message should include
> 
> Cc: stable@vger.kernel.org
> 
> after the Fixes: tag. Sakari can likely add that when applying.

Yes. I expect to pick the patch later this week.

-- 
Sakari Ailus
