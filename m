Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502474418CB;
	Wed, 19 Aug 2026 09:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787132060; cv=none; b=eh1IXyqTG9Qwsg+yB7OZVsgJ4ERN/xImhC8vTaXi9wYFxQNW8uDdwEgIcSBRaMZQQj8Y0F6gKvnH+U9MMRrq8e+4Av7l4NtrM9jie09hC/7A2qToBr1n7NK8X3Z0R8+R+0TSjmJWVqOcFSL3lAik8qcmReBlWCybLID1f31WNRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787132060; c=relaxed/simple;
	bh=ld/4/QnBGBQShYsW/9GMry2SjuBvX2PdmUJM3GUPKh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TntHhfmM/OhnUkTCseeikO0figR9MvleLwFftf0aKV15WlffYcIoTuNGVSft7yhGHHfFCgDFgnQI5E/Y35+dFf1EGH7TT997H5Utta18XdN9Oo20h2K0ur7A4fxQvTCl6qSp5RRbGIfLFDFQc/vKu/Df39qtJjyi3Wv9VtH59xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W/LVEYpQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W/LVEYpQ"
Received: from ideasonboard.com (mob-109-113-29-237.net.vodafone.it [109.113.29.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC795BE1;
	Wed, 19 Aug 2026 11:32:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787131975;
	bh=ld/4/QnBGBQShYsW/9GMry2SjuBvX2PdmUJM3GUPKh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W/LVEYpQoMc381+QLFY5+cVpYDDjhCdfKzAkgmV2VBW+V20VOp6PsaYE77bicJWJg
	 NJIIeQX1TuNm0jAMJwGgQ7XU07jfvcI/2AEC8n86sUojEteDxaBNt2h0kgkFyu6Jzt
	 WFoicKlihEkLEtFPVwX294R5CKDA5MVDOtd/02C4=
Date: Wed, 19 Aug 2026 11:34:08 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Lachlan Michael <lachlan.michael@sony.com>, devicetree@vger.kernel.org, 
	hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, kieran.bingham@ideasonboard.com, 
	Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com, Tim.Bird@sony.com, 
	Kazumi.A.Sato@sony.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: Add Sony IMX908 image sensor driver
Message-ID: <aoV3zV1jDB2j9b5j@zed>
References: <20260806070934.21764-1-lachlan.michael@sony.com>
 <20260806070934.21764-3-lachlan.michael@sony.com>
 <178608558219.4139729.1786136799159384307@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178608558219.4139729.1786136799159384307@freya>

Hello, one tiny addition

On Fri, Aug 07, 2026 at 12:23:02PM +0530, Jai Luthra wrote:
> Hi Lachlan,
>
> Thank you for the patch!
>
> The driver is mostly in good shape, except a few small things and requests
> for information that Sony is in the best position to help us with.
>
> Quoting Lachlan Michael (2026-08-06 12:39:34)
> > The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor
> > with a MIPI CSI-2 output interface, configurable as either 2 or 4
> > data lanes.
> >
> > Add a V4L2 sub-device driver for the sensor. The driver supports
> > RAW10 and RAW12 output formats, exposure and analogue gain controls,
> > horizontal and vertical flipping, horizontal and vertical blanking
> > controls, window cropping and test pattern generation.
> >
> > HDR modes and RAW16 output are not currently supported.
> >
> > Signed-off-by: Lachlan Michael <lachlan.michael@sony.com>
> > ---
> > Changes in v2:
> > - Treat the pixel rate as a fixed sensor property (594 MHz, 8 px/clock),

[snip]

> > +static int imx908_init_controls(struct imx908 *imx)
> > +{
> > +       struct v4l2_ctrl_handler *hdl = &imx->ctrls.handler;
> > +       struct v4l2_fwnode_device_properties props;
> > +       struct v4l2_ctrl *link_freq_ctl;
> > +       int ret;
> > +
> > +       ret = v4l2_ctrl_handler_init(hdl, 11);
> > +       if (ret)
> > +               return ret;
> > +
> > +       imx->ctrls.pixel_rate = v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops,
> > +                                                 V4L2_CID_PIXEL_RATE,
> > +                                                 IMX908_PIXEL_RATE,
> > +                                                 IMX908_PIXEL_RATE, 1,
> > +                                                 IMX908_PIXEL_RATE);
> > +       if (imx->ctrls.pixel_rate)
> > +               imx->ctrls.pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>
> Not needed, PIXEL_RATE is marked as RO by the control framework
>
> > +
> > +       link_freq_ctl = v4l2_ctrl_new_int_menu(hdl, &imx908_ctrl_ops,
> > +                                              V4L2_CID_LINK_FREQ,
> > +                                              ARRAY_SIZE(imx908_link_freqs) - 1,
> > +                                              imx->link_freq_idx,
> > +                                              imx908_link_freqs);
> > +
> > +       if (link_freq_ctl)
> > +               link_freq_ctl->flags |= V4L2_CTRL_FLAG_READ_ONLY;

Read-only controls should have their control ops set to NULL, so that
.s_ctrl is never called for them.

See as an example:
892ac5e6cd1f ("media: imx355: Use NULL ctrl_ops for HBLANK as it is a read-only control")

Thanks
  j
