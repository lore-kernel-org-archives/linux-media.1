Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE213DB65A;
	Mon, 27 Jul 2026 07:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138473; cv=none; b=cakTjlMz1tHYuURPoSomPPUrd5TgEnzewk7moodraSwuhQw0MWckemDO+T0GQClxy2Q5LqZeybJomaSSzIMsdRQhNrzsw9Xay/01hiRQgXT/sJcojmhwsEtai21bofjvWVRDFpIPB6dQfXyUQ74eP9aLPmHwA4dqf6RvO3sFbQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138473; c=relaxed/simple;
	bh=IXpGypVWOstFZiejZvLlxlFm+N9EHX3/vkdqgGEC5rI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3ax0Jn/3vXo1KHeT2/CJu669/TzcqZAF84IJ4ryK0k6iULdfjnzlUW6nFEsjGF3SIA9wymu43a8t6iWAXHFAH9wGDSQBp+0cPbpCSRjaS5STUMqJWtm6v4aDrByDOQouZ7FvLqRa+4i2sJPDf/9VEv89SRe5nJQHw9JQHue7sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Gnm2gBdB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Gnm2gBdB"
Received: from ideasonboard.com (mob-5-90-50-102.net.vodafone.it [5.90.50.102])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 581DC3A4;
	Mon, 27 Jul 2026 09:46:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785138406;
	bh=IXpGypVWOstFZiejZvLlxlFm+N9EHX3/vkdqgGEC5rI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gnm2gBdBl9k7LHKiIkKzM3NEMsWN9UbgCtKYMnqnYMi98ke5dCnd/EkVUmxiFi+/o
	 GE5ciotuo2wergpmFfK/wb3wc4vvhrd75TVMOASSXVCOIAXcQfx4OIfHjHaTuGNDoD
	 H1BQol9QS/AWyfGEtL3uCoSHrx8y3peqxajxzvrs=
Date: Mon, 27 Jul 2026 09:47:46 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philippe Baetens <philippebaetens@gmail.com>, 
	Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] media: i2c: Add driver for AMS-OSRAM Mira220
Message-ID: <amcMe7kKaR8jqfNS@zed>
References: <20260724-mira220-v8-0-d1899ab64709@ideasonboard.com>
 <20260724-mira220-v8-2-d1899ab64709@ideasonboard.com>
 <178491944579.3026322.17711300671190246368@freya>
 <amb9dOkox3zqr85t@zed>
 <178513820492.506511.7934025901057482473@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178513820492.506511.7934025901057482473@freya>

Hi Jai

On Mon, Jul 27, 2026 at 01:13:24PM +0530, Jai Luthra wrote:
> Hi Jacopo,
>
> Quoting Jacopo Mondi (2026-07-27 12:16:53)
> > Hi Jai
> >
> > On Sat, Jul 25, 2026 at 12:27:25AM +0530, Jai Luthra wrote:
> > > Hi Jacopo,
> > >
> > > Thank you for the fixes!
> > >
> > > Quoting Jacopo Mondi (2026-07-24 21:07:01)
> > > > From: Philippe Baetens <philippebaetens@gmail.com>
> > > >
> > > > Add a V4L2 subdev driver for driver for the AMS-OSRAM Mira220 image
> > > > sensor.
> > > >
> > > > Mira220 is a global shutter image sensor with a resolution of 1600x1400
> > > > pixels.
> > > >
> > > > The driver implements support for mono and RGB 12, 10 and 8 bits
> > > > formats. The output data-rate per lane is 1500Mbit/s, with a maximum
> > > > frame rate up to 90 fps.
> > > >
> > > > Signed-off-by: Philippe Baetens <philippebaetens@gmail.com>
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > >
> > >
> > > [...]
> > >
> > > > +static int mira220_parse_endpoint(struct device *dev, struct mira220 *mira220)
> > > > +{
> > > > +       struct fwnode_handle *endpoint;
> > > > +       struct v4l2_fwnode_endpoint ep_cfg = {
> > > > +               .bus_type = V4L2_MBUS_CSI2_DPHY
> > > > +       };
> > > > +       int ret = 0;
> > > > +
> > > > +       endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> > > > +       if (!endpoint) {
> > > > +               dev_err(dev, "Endpoint node not found\n");
> > > > +               return -EINVAL;
> > > > +       }
> > > > +
> > > > +       if (v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg)) {
> > > > +               ret = -EINVAL;
> > > > +               dev_err(dev, "Failed to parse endpoint\n");
> > > > +               goto error_out;
> > > > +       }
> > > > +
> > > > +       /* Non-continuous mode not implemented. */
> > > > +       if (ep_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK) {
> > > > +               dev_warn(dev, "clock non-continuous mode not supported\n");
> > > > +               ret = -EINVAL;
> > > > +               goto error_out;
> > > > +       }
> > > > +
> > > > +       if (ep_cfg.nr_of_link_frequencies > ARRAY_SIZE(mira220_link_freqs)) {
> > > > +               ret = -EINVAL;
> > > > +               dev_err(dev, "Unsupported number of link_frequencies: %u\n",
> > > > +                       ep_cfg.nr_of_link_frequencies);
> > > > +               goto error_out;
> > > > +       }
> > > > +
> > > > +       if (ep_cfg.link_frequencies[0] != MIRA220_LINK_FREQ_750M) {
> > >
> > > The LLM-bot says link_frequencies[0] might be invalid if DT omitted the
> > > link-frequencies property, and I think that's a valid concern.
> >
> > Yeah the bot is right, my bad
> >
> > I thought the property was required by fw, but it's not.
> >
> > >
> > > Any particular reason for not using the v4l2_link_freq_to_bitmap() helper I
> >
> > I think I missed it from your previous comment, sorry :)
> >
> > Now that I look at it, the function wants link_frequencies from fw
> >
> > drivers/media/v4l2-core/v4l2-common.c-  if (!num_of_fw_link_freqs) {
> > drivers/media/v4l2-core/v4l2-common.c-          dev_err(dev, "no link frequencies in firmware\n");
> > drivers/media/v4l2-core/v4l2-common.c-          return -ENODATA;
> > drivers/media/v4l2-core/v4l2-common.c-  }
> >
>
> Ah thanks for checking, I missed that requirement for using the helper.
>
> > Should I:
> >
> > - make link_frequencies required in bindings (something that doesn't
> >   seem that useful considering a single freq is supported)
> >
>
> I have a slight preference towards this option.
>
> Many receiver drivers use v4l2_get_link_freq() to configure the PHY, so
> even a single freq in the endpoint is useful. Plus it would keep the driver
> logic simple too.

Note that the driver registers V4L2_CID_LINK_FREQUENCY regardless of
the presence of the dts property.

I can make it required if it's simpler.

>
> Thanks,
>     Jai
>
> > - only call v4l2_link_freq_to_bitmap() if the property is specified ?
> >
> > ?
> >
> > > had suggested? It can handles all of these cases and error msgs too.
> > >
> > > With the edge case fixed (with or without the helper):
> > >
> > > Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> >
> > Thanks
> >   j
> >
> > >
> > > Thanks,
> > >     Jai
