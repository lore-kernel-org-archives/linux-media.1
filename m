Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F023A7D9E;
	Mon, 27 Jul 2026 06:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785134828; cv=none; b=E93MAOsHhA2S1hID2JRXpRO++Ay2YuUZns1Dv0iRz1+0C1tS3y3REb0ivaBFPyYe25CzZxeU6glU8K8YbiJ4CRRvW8Sdyp0LpbNuFkuO6J1SMjUw+/eVR6gyNaOSCU1SeNTVw8i5jX4N478l7MplCJZ6Tox2Ft9jiVE8N9gLkxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785134828; c=relaxed/simple;
	bh=egrSHVv2XT0Y3bP773mgGT1ZLPKQAaidLxR+6y+JTqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VwNfw3uTEg4FAjNIgsq1VL1cThMaeGrTy8LCH4IJVEfhQwjgDsdG497j6xkrlZIFOQK0E6ogCSANMvdpKHVobDwheHmKpWALofcGhEOb7mdmu1gkLSY/abG8XZ52/4k+oJmQbS0YHL36zx+g5jDUttXUnMwOR9T6cdXnjIYxYl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K4cSDxQL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K4cSDxQL"
Received: from ideasonboard.com (mob-5-90-50-102.net.vodafone.it [5.90.50.102])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58F7F19C;
	Mon, 27 Jul 2026 08:45:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785134753;
	bh=egrSHVv2XT0Y3bP773mgGT1ZLPKQAaidLxR+6y+JTqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K4cSDxQLNkF2DmRZskgOq+Bnlv618kkgoyxQQw3k98c7sk2KxXWF/d9Xj1lT3FWba
	 90oGR8geq//UrDF6AnBNC7PM42LQL4B8Bl2gF3FaV0RjkyzwP6b0LxQpbesBn3KWDl
	 Y3esKB6mTsvdd2DL05+OKHNwpl0nTogB+ue18BbQ=
Date: Mon, 27 Jul 2026 08:46:53 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philippe Baetens <philippebaetens@gmail.com>, 
	Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] media: i2c: Add driver for AMS-OSRAM Mira220
Message-ID: <amb9dOkox3zqr85t@zed>
References: <20260724-mira220-v8-0-d1899ab64709@ideasonboard.com>
 <20260724-mira220-v8-2-d1899ab64709@ideasonboard.com>
 <178491944579.3026322.17711300671190246368@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178491944579.3026322.17711300671190246368@freya>

Hi Jai

On Sat, Jul 25, 2026 at 12:27:25AM +0530, Jai Luthra wrote:
> Hi Jacopo,
>
> Thank you for the fixes!
>
> Quoting Jacopo Mondi (2026-07-24 21:07:01)
> > From: Philippe Baetens <philippebaetens@gmail.com>
> >
> > Add a V4L2 subdev driver for driver for the AMS-OSRAM Mira220 image
> > sensor.
> >
> > Mira220 is a global shutter image sensor with a resolution of 1600x1400
> > pixels.
> >
> > The driver implements support for mono and RGB 12, 10 and 8 bits
> > formats. The output data-rate per lane is 1500Mbit/s, with a maximum
> > frame rate up to 90 fps.
> >
> > Signed-off-by: Philippe Baetens <philippebaetens@gmail.com>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
>
> [...]
>
> > +static int mira220_parse_endpoint(struct device *dev, struct mira220 *mira220)
> > +{
> > +       struct fwnode_handle *endpoint;
> > +       struct v4l2_fwnode_endpoint ep_cfg = {
> > +               .bus_type = V4L2_MBUS_CSI2_DPHY
> > +       };
> > +       int ret = 0;
> > +
> > +       endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> > +       if (!endpoint) {
> > +               dev_err(dev, "Endpoint node not found\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       if (v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg)) {
> > +               ret = -EINVAL;
> > +               dev_err(dev, "Failed to parse endpoint\n");
> > +               goto error_out;
> > +       }
> > +
> > +       /* Non-continuous mode not implemented. */
> > +       if (ep_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK) {
> > +               dev_warn(dev, "clock non-continuous mode not supported\n");
> > +               ret = -EINVAL;
> > +               goto error_out;
> > +       }
> > +
> > +       if (ep_cfg.nr_of_link_frequencies > ARRAY_SIZE(mira220_link_freqs)) {
> > +               ret = -EINVAL;
> > +               dev_err(dev, "Unsupported number of link_frequencies: %u\n",
> > +                       ep_cfg.nr_of_link_frequencies);
> > +               goto error_out;
> > +       }
> > +
> > +       if (ep_cfg.link_frequencies[0] != MIRA220_LINK_FREQ_750M) {
>
> The LLM-bot says link_frequencies[0] might be invalid if DT omitted the
> link-frequencies property, and I think that's a valid concern.

Yeah the bot is right, my bad

I thought the property was required by fw, but it's not.

>
> Any particular reason for not using the v4l2_link_freq_to_bitmap() helper I

I think I missed it from your previous comment, sorry :)

Now that I look at it, the function wants link_frequencies from fw

drivers/media/v4l2-core/v4l2-common.c-  if (!num_of_fw_link_freqs) {
drivers/media/v4l2-core/v4l2-common.c-          dev_err(dev, "no link frequencies in firmware\n");
drivers/media/v4l2-core/v4l2-common.c-          return -ENODATA;
drivers/media/v4l2-core/v4l2-common.c-  }

Should I:

- make link_frequencies required in bindings (something that doesn't
  seem that useful considering a single freq is supported)

- only call v4l2_link_freq_to_bitmap() if the property is specified ?

?

> had suggested? It can handles all of these cases and error msgs too.
>
> With the edge case fixed (with or without the helper):
>
> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

Thanks
  j

>
> Thanks,
>     Jai
> > +               ret = -EINVAL;
> > +               dev_err(dev, "Unsupported link_frequency: %llu\n",
> > +                       ep_cfg.link_frequencies[0]);
> > +               goto error_out;
> > +       }
> > +
> > +       /* Check the number of MIPI CSI2 data lanes */
> > +       if (ep_cfg.bus.mipi_csi2.num_data_lanes != 1 &&
> > +           ep_cfg.bus.mipi_csi2.num_data_lanes != 2) {
> > +               ret = -EINVAL;
> > +               dev_err(dev, "%u data lanes are not supported\n",
> > +                       ep_cfg.bus.mipi_csi2.num_data_lanes);
> > +               goto error_out;
> > +       }
> > +
> > +       mira220->lanes = ep_cfg.bus.mipi_csi2.num_data_lanes;
> > +       mira220->row_length = MIRA220_ROW_LENGTH_MIN * (2 / mira220->lanes);
> > +
> > +error_out:
> > +       v4l2_fwnode_endpoint_free(&ep_cfg);
> > +       fwnode_handle_put(endpoint);
> > +
> > +       return ret;
> > +}
> > +
