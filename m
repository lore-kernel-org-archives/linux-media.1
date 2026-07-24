Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0486336B90C;
	Fri, 24 Jul 2026 18:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784919458; cv=none; b=smpyq0+37LwUCb4jQg5wnLKFiKgEBNxrqjR9B2VlCyt6GYtvXpshWipP5zvkyRQIGuogPMc9tJemR9IubdGkJAfFFlNvv56a6OZrHPhiPvfWkfgNZJpheQJj2rmrWydCJoyJZGpUWXn5xs6CMpSvv6zZ/W7SPXruhoqYgCVYaeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784919458; c=relaxed/simple;
	bh=1En3RPDMIB/14I8DRItwn5lmTiRaTJc/2qBBcRNvft8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=P2i7YZBwYfVdxsdlBOG8ytbIOGafnE0MgGeKXtaVGUYoidbxpijSoc/SfUO6qGc9FX/lthHqoy717Bhy3tj2ayh+Y3LJ9BmGM9ZMYMta9GztNBDj8bJD2kqtQNjzupxGqcu2UzRKr5gul9Bvtu1c9bBVd24nG79mRnS0u3I0qlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b/FZSJBY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b/FZSJBY"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:25d4:fa24:78d1:31:7a56])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B54B73B;
	Fri, 24 Jul 2026 20:56:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784919389;
	bh=1En3RPDMIB/14I8DRItwn5lmTiRaTJc/2qBBcRNvft8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=b/FZSJBYmTXBNI4xzYgx/wMzP4UWp+Qsvve3G7kAxVDshyQBv1oKxdmjvkOtPc2Ef
	 gTQpBTtODtW8IqicVUGuk5U+Nkd6FOGTjOXDMh+qHY1CKacwdrxuBBaY+x5OkfrIZl
	 CSYZQLxsaoIIXTGEiPhIf8qOEp7WzQFM4GRPPe48=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260724-mira220-v8-2-d1899ab64709@ideasonboard.com>
References: <20260724-mira220-v8-0-d1899ab64709@ideasonboard.com> <20260724-mira220-v8-2-d1899ab64709@ideasonboard.com>
Subject: Re: [PATCH v8 2/2] media: i2c: Add driver for AMS-OSRAM Mira220
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Philippe Baetens <philippebaetens@gmail.com>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sat, 25 Jul 2026 00:27:25 +0530
Message-ID: <178491944579.3026322.17711300671190246368@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Jacopo,

Thank you for the fixes!

Quoting Jacopo Mondi (2026-07-24 21:07:01)
> From: Philippe Baetens <philippebaetens@gmail.com>
>=20
> Add a V4L2 subdev driver for driver for the AMS-OSRAM Mira220 image
> sensor.
>=20
> Mira220 is a global shutter image sensor with a resolution of 1600x1400
> pixels.
>=20
> The driver implements support for mono and RGB 12, 10 and 8 bits
> formats. The output data-rate per lane is 1500Mbit/s, with a maximum
> frame rate up to 90 fps.
>=20
> Signed-off-by: Philippe Baetens <philippebaetens@gmail.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>=20

[...]

> +static int mira220_parse_endpoint(struct device *dev, struct mira220 *mi=
ra220)
> +{
> +       struct fwnode_handle *endpoint;
> +       struct v4l2_fwnode_endpoint ep_cfg =3D {
> +               .bus_type =3D V4L2_MBUS_CSI2_DPHY
> +       };
> +       int ret =3D 0;
> +
> +       endpoint =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, =
0, 0);
> +       if (!endpoint) {
> +               dev_err(dev, "Endpoint node not found\n");
> +               return -EINVAL;
> +       }
> +
> +       if (v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg)) {
> +               ret =3D -EINVAL;
> +               dev_err(dev, "Failed to parse endpoint\n");
> +               goto error_out;
> +       }
> +
> +       /* Non-continuous mode not implemented. */
> +       if (ep_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLO=
CK) {
> +               dev_warn(dev, "clock non-continuous mode not supported\n"=
);
> +               ret =3D -EINVAL;
> +               goto error_out;
> +       }
> +
> +       if (ep_cfg.nr_of_link_frequencies > ARRAY_SIZE(mira220_link_freqs=
)) {
> +               ret =3D -EINVAL;
> +               dev_err(dev, "Unsupported number of link_frequencies: %u\=
n",
> +                       ep_cfg.nr_of_link_frequencies);
> +               goto error_out;
> +       }
> +
> +       if (ep_cfg.link_frequencies[0] !=3D MIRA220_LINK_FREQ_750M) {

The LLM-bot says link_frequencies[0] might be invalid if DT omitted the
link-frequencies property, and I think that's a valid concern.

Any particular reason for not using the v4l2_link_freq_to_bitmap() helper I
had suggested? It can handles all of these cases and error msgs too.

With the edge case fixed (with or without the helper):

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

Thanks,
    Jai
> +               ret =3D -EINVAL;
> +               dev_err(dev, "Unsupported link_frequency: %llu\n",
> +                       ep_cfg.link_frequencies[0]);
> +               goto error_out;
> +       }
> +
> +       /* Check the number of MIPI CSI2 data lanes */
> +       if (ep_cfg.bus.mipi_csi2.num_data_lanes !=3D 1 &&
> +           ep_cfg.bus.mipi_csi2.num_data_lanes !=3D 2) {
> +               ret =3D -EINVAL;
> +               dev_err(dev, "%u data lanes are not supported\n",
> +                       ep_cfg.bus.mipi_csi2.num_data_lanes);
> +               goto error_out;
> +       }
> +
> +       mira220->lanes =3D ep_cfg.bus.mipi_csi2.num_data_lanes;
> +       mira220->row_length =3D MIRA220_ROW_LENGTH_MIN * (2 / mira220->la=
nes);
> +
> +error_out:
> +       v4l2_fwnode_endpoint_free(&ep_cfg);
> +       fwnode_handle_put(endpoint);
> +
> +       return ret;
> +}
> +
