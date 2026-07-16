Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569AD2F290B;
	Thu, 16 Jul 2026 08:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784189565; cv=none; b=JHj0TqcebLrr+Ow6fsHTmbNV2Dqj+fZX+JXr50sCmjvQX7DxHB3EJYraCVTHtar9bA8jv+/MFh4Ak/EhHOHqOpZvPFrfpwvQ8h/AceBlrFtWj/78cdwV9YUIsgN0BeiwX0/oPPLcWwkk2Jha2UIjCd5mtEFiwThJ+UsQ77tcpJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784189565; c=relaxed/simple;
	bh=LivpDofR2GjShcPPFrnyQZM3szTo6R+sA8u1Jcpn8wY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=abHYbF0jUZdvk0wHSNLb7gf7lQw3pTyEwubBSa+uO2PxRaIEnPcpOOEX/FUNPPPVtUxeD7KlqkBVlVSMuvmme1ucihKVepOrWvq8RRmWSvek/cJxNelVOsiIoEQIQ/tGvgFTop2CPKe/s2qtqooUFnSkmHy0onf2e84VZ1fDTRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LQHH1nmt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LQHH1nmt"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D0D0229;
	Thu, 16 Jul 2026 10:11:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784189506;
	bh=LivpDofR2GjShcPPFrnyQZM3szTo6R+sA8u1Jcpn8wY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LQHH1nmtYI3m171IeP6v/ILfO8ETUOn0iLZ4BWAK30ug19JQPVHbGaZvK0nT6pdAr
	 c8DunkCH7YcqNv97HeTnYRHhwRxCdZY81oJe1aRRWvtxcr6D77ENgTgpTLPqUCGfhv
	 mzg+LjoIyHhkfebwp/+eIoJeSqwA1SHji5ohotyo=
Date: Thu, 16 Jul 2026 11:12:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Eugen Hristev <ehristev@kernel.org>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@redhat.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Scott Branden <sbranden@broadcom.com>, linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: bcm2835-unicam: Fix pipeline wrong validation for
 unpacked formats
Message-ID: <20260716081240.GA1837346@killaraus.ideasonboard.com>
References: <20260520-bcmpi-v1-1-41d80125a7b9@kernel.org>
 <178046930079.1525445.16102733967737177325@freya>
 <bb075afb-56bf-4cea-9732-f2613feb88d1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bb075afb-56bf-4cea-9732-f2613feb88d1@kernel.org>

On Thu, Jul 16, 2026 at 10:22:03AM +0300, Eugen Hristev wrote:
> On 6/3/26 09:48, Jai Luthra wrote:
> > Quoting Eugen Hristev (2026-05-20 21:07:00)
> >> The commit
> >> 08f9794d9b79 ("media: bcm2835-unicam: Fix RGB format / mbus code association")
> >> introduced a check to see whether the format requested is the same as the
> >> fourcc in the format list.
> >>
> >> However, this breaks the case when userspace requested an unpacked fourcc,
> >> e.g. RG10.
> >>
> >> Unicam can work with or without unpacking pixels, e.g. pRAA or RG10, depending
> >> on what userspace requests.
> >> In the unpacking case, a dedicated register is being set.
> >>
> >> If the userspace requests pRAA, this works, because the check validates the
> >> pipeline:
> >>
> >> v4l2-ctl -d /dev/video0 --set-fmt-video=width=3280,height=2464,pixelformat=pRAA \
> >>  --stream-mmap --stream-count=1 --stream-to=frame.raw
> >>
> >> but, with
> >> v4l2-ctl -d /dev/video0 --set-fmt-video=width=3280,height=2464,pixelformat=RG10 \
> >> --stream-mmap --stream-count=1 --stream-to=frame.raw
> >>
> >> unicam complains at validation level:
> >>
> >> image: format mismatch: 0x300f <=> RG10 little-endian (0x30314752)
> >>
> >> This should work, because MEDIA_BUS_FMT_SRGGB10_1X10 can be packed into either
> >> RG10 or pRAA depending on the packing register.
> >>
> >> To fix this, modified the condition check to also allow in the case when
> >> requested format (fmt->pixelformat) is equal to fmtinfo->unpacked_fourcc.
> >>
> >> Fixes: 08f9794d9b79 ("media: bcm2835-unicam: Fix RGB format / mbus code association")
> >> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
> >> ---
> >>  drivers/media/platform/broadcom/bcm2835-unicam.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> >> index 8d28ba0b59a3..cc7627e9a51a 100644
> >> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> >> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> >> @@ -2158,7 +2158,8 @@ static int unicam_video_link_validate(struct media_link *link)
> >>                  * In order to allow the applications using the old behaviour to
> >>                  * run, let's accept the old combination, but warn about it.
> >>                  */
> >> -               if (fmtinfo->fourcc != fmt->pixelformat) {
> >> +               if (fmt->pixelformat != fmtinfo->fourcc &&
> >> +                   fmt->pixelformat != fmtinfo->unpacked_fourcc) {
> >>                         if ((fmt->pixelformat == V4L2_PIX_FMT_BGR24 &&
> >>                              format->code == MEDIA_BUS_FMT_BGR888_1X24) ||
> >>                             (fmt->pixelformat == V4L2_PIX_FMT_RGB24 &&
> >>
> > 
> > Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > 
> 
> Hi Sakari,
> 
> I saw you taking some of the patches on unicam, this one is the most
> important as all unpacked formats are basically broken for a very long
> time (months) and the patch is pending for quite some time.
> 
> This should also go in stable as some older versions also affected.

The commit message should include

Cc: stable@vger.kernel.org

after the Fixes: tag. Sakari can likely add that when applying.

> >> ---
> >> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> >> change-id: 20260520-bcmpi-2c4850314e21

-- 
Regards,

Laurent Pinchart
