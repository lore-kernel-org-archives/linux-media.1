Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0590133A032;
	Wed, 20 May 2026 07:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779262936; cv=none; b=Pj/wmKNjpBabX8BkNPpxxg65FDrIUe+UUCATb8x6Zc2z45bKyMWlmHukFw97m12xw2L+hFrO/0p1OBEDkspBjpvv+p5z9nAQtdSn0Pb6er/w508Z42vRl96DJchLyZGO77sbzTeuYD/ER/yE/8bQyrBJAoHX4L5589fKtzB1JAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779262936; c=relaxed/simple;
	bh=+6j/12T/uyCXOeH/G1xEYvJwsZuNRjrP3/Z+vFO7tQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYp5Lt37o6Sj6TCTF7oj/yn9QzfuBcwiIyoOi86vycAv5zI1eujJQfEqGR49d4kMxwiQVI5cPILBdud8lvp6Mcw38R0py4HE6Wv2KtSgm6/4R9LZwgii6q3w9d52Qw6NraE7s+AQ7WY2kRGm/Lms7fIMycaQ9LGhrgCx4YNVyww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WP0WNUni; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WP0WNUni"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779262934; x=1810798934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+6j/12T/uyCXOeH/G1xEYvJwsZuNRjrP3/Z+vFO7tQs=;
  b=WP0WNUni+V0XAzVhHznsgmUxOUqfjx0JCmU57KrLJ92QiwJkX7CJiVsr
   xlLCDb70gKd1c0DJxO8pHazVN6P56l0NvGdEg859RfrQ9y/00Fd6+IsTj
   BDdgECdnCLdAVL725N8s41Jyz9CsQzHYtUW/v2voYxfcqia7FzA1vQyrw
   /8VwaPZ5EreGL5LrXyhNX1PlQeo/0K2wL8Alu4Vtd869cHAOo1F9zepDU
   qpUbw3rz3eQaS3zoLRhMSjz1dpc0GSdqc2RrUSLfrsHl+XoQN9I7z/Q8/
   MAiUQrakgnsqULygcamodAwRyGTX8d3VJj8DiiojKtsuXFKLT95aFsqet
   Q==;
X-CSE-ConnectionGUID: 1EnRaEnOSeGTakg6kQmmSA==
X-CSE-MsgGUID: Jn1I4pmTQCuwKrVIbVnOVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="97583263"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="97583263"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 00:42:13 -0700
X-CSE-ConnectionGUID: 8y2cbZ6JT/yrMv6Zgp7rOw==
X-CSE-MsgGUID: ogvFp3V3SK+AXbUSyqY8jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="235800876"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.115])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 00:42:08 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8E8EF121C8A;
	Wed, 20 May 2026 10:42:05 +0300 (EEST)
Date: Wed, 20 May 2026 10:42:05 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com,
	mripard@kernel.org, y-abhilashchandra@ti.com, devarsht@ti.com,
	s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de,
	conor+dt@kernel.org, hverkuil-cisco@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, jai.luthra@ideasonboard.com,
	changhuang.liang@starfivetech.com, sjoerd@collabora.com,
	dan.carpenter@linaro.org, hverkuil+cisco@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v12 09/17] media: cadence: csi2rx: add get_frame_desc
 wrapper
Message-ID: <ag1lzfCfCZWok1E9@kekkonen.localdomain>
References: <20260313090701.646534-1-r-donadkar@ti.com>
 <20260313090701.646534-10-r-donadkar@ti.com>
 <agxP_eCovgSpdYnZ@kekkonen.localdomain>
 <429ae839-6669-4e2f-afee-56d36b19f92d@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <429ae839-6669-4e2f-afee-56d36b19f92d@ti.com>

Hi Rishikesh,

On Wed, May 20, 2026 at 12:14:34PM +0530, Rishikesh Donadkar wrote:
> 
> On 19/05/26 17:26, Sakari Ailus wrote:
> > Hi Rishikesh,
> 
> 
> Hi Sakari,
> 
> Thank you for the review !
> 
> > 
> > On Fri, Mar 13, 2026 at 02:36:53PM +0530, Rishikesh Donadkar wrote:
> > > From: Pratyush Yadav <p.yadav@ti.com>
> > > 
> > > J721E wrapper CSI2RX driver needs to get the frame descriptor from the
> > > source to find out info about virtual channel. This driver itself does
> > > not touch the routing or virtual channels in any way. So simply pass the
> > > descriptor through from the source.
> > > 
> > > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> > > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> > > ---
> > >   drivers/media/platform/cadence/cdns-csi2rx.c | 24 ++++++++++++++++++++
> > >   1 file changed, 24 insertions(+)
> > > 
> > > diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> > > index 2b25314ba6ab0..52ca940acd7d0 100644
> > > --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> > > +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> > > @@ -229,6 +229,21 @@ static const struct csi2rx_fmt *csi2rx_get_fmt_by_code(u32 code)
> > >   	return NULL;
> > >   }
> > > +static int csi2rx_get_frame_desc_from_source(struct csi2rx_priv *csi2rx,
> > > +					     struct v4l2_mbus_frame_desc *fd)
> > > +{
> > > +	struct media_pad *remote_pad;
> > > +
> > > +	remote_pad = media_entity_remote_source_pad_unique(&csi2rx->subdev.entity);
> > > +	if (!remote_pad) {
> > media_entity_remote_source_pad_unique() returns an error code on error,
> > never NULL.
> 
> 
> Will fix the error handling
> 
> 
> > 
> > Could you use you use v4l2_subdev_get_frame_desc_passthrough()
> 
> 
> Yes, v4l2_subdev_get_frame_desc_passthrough() can be directly used as
> .get_frame_desc helper, but will need the
> csi2rx_get_frame_desc_from_source() in ([PATCH 11/17] media: cadence:
> csi2rx: add multistream support) as we used the VCs in the fd to configure
> the IP.
> 
> 
> So, I will drop this patch and add csi2rx_get_frame_desc_from_source() with
> improved error handling in PATCH 11/17

It's fine as-is if you switch to v4l2_subdev_get_frame_desc_passthrough()
later on in the set (but please still fix error handling).

> 
> 
> Rishikesh
> 
> > 
> > > +		dev_err(csi2rx->dev, "No remote pad found for sink\n");
> > > +		return -ENODEV;
> > > +	}
> > > +
> > > +	return v4l2_subdev_call(csi2rx->source_subdev, pad, get_frame_desc,
> > > +				remote_pad->index, fd);
> > > +}
> > > +
> > >   static inline
> > >   struct csi2rx_priv *v4l2_subdev_to_csi2rx(struct v4l2_subdev *subdev)
> > >   {
> > > @@ -611,12 +626,21 @@ int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
> > >   }
> > >   EXPORT_SYMBOL_FOR_MODULES(cdns_csi2rx_negotiate_ppc, "j721e-csi2rx");
> > > +static int csi2rx_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
> > > +				 struct v4l2_mbus_frame_desc *fd)
> > > +{
> > > +	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
> > > +
> > > +	return csi2rx_get_frame_desc_from_source(csi2rx, fd);
> > > +}
> > > +
> > >   static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
> > >   	.enum_mbus_code	= csi2rx_enum_mbus_code,
> > >   	.get_fmt	= v4l2_subdev_get_fmt,
> > >   	.set_fmt	= csi2rx_set_fmt,
> > >   	.enable_streams         = csi2rx_enable_streams,
> > >   	.disable_streams        = csi2rx_disable_streams,
> > > +	.get_frame_desc	= csi2rx_get_frame_desc,
> > >   };
> > >   static const struct v4l2_subdev_core_ops csi2rx_core_ops = {

-- 
Regards,

Sakari Ailus
