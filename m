Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023192;
	b=3eJQDhH51JiyUEqNBrwF7Ioz8BAm9PDcG62xQCADgskqrJRGsTNASuLcvZOp9j67MnSw
	 UxfFkeBc7rK6qQC+BB0GSIcQVx3B/1jFLMCqusv2hk2TfoSi4YH6XHKj3Qdg60BPdIOk7
	 xQbVP6YODQvYwC66k/t+VjmE1AqZAivqbcZqnFccOWdRqevOEb8OfCmz7fNXuqZUDvlMO
	 xxroKgM+0MMZOoiliRnkg4rBsgflKrBSaXz8zVBMbnSPjfF30VCPLeNPiDiyAc9VQ4Td5
	 0zKN6zLgD5cwvb54igaeWhHKrPsvKXBTn/TI6s+vRfMVAiPcg5aRb5An2W/EXduW1mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023192;
	h=DMARC-Filter:Received:DKIM-Signature:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:In-Reply-To:References:Subject:From:Cc:To:
	 Date:Message-ID:User-Agent;
	bh=a/lyCJQdRve1tbsoR8RKcutalG9QBdrs3OjhI/MIc7M=;
	b=JyL5LW6yugaYkN8Sk5DYx7X59DtXXimPcCIJ+r8ZzBHwWYAmQX+9PaI3us+s+XaMt/tN
	 YEUuU5ztKsPT0zoLDCZj1RayRkA88fIzEmlvsnq6Nta8LLQ0n4K35z+IMj0DaxROV4CFQ
	 F0AG2MUGT9JY/naQ8TsDJ99iH0kxMTTGOgtDMA6md7ByoBHg+k5la1sKhYsmligdxLutF
	 dHY145+adRu/WpS9T5bwGewKq5fdeH2BCYKdHZefdPPJ1VlAj4LQjnBaOUaSaGQm5V8d0
	 Cr9n7GuBuxVf2XJy9xs9ebQHjAI2mFVJwHtz7HycKNDotegi+QQidPSPA9rN+bhvBqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=UvsMN39A;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26B2606A32A;
	Wed, 18 Nov 2026 17:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E26B2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=UvsMN39A
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 661D5270;
	Wed, 18 Nov 2026 18:30:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795023033;
	bh=kudhAj0IuoHyw+UdwKzgpyxC28M9LV4mqZXkQiOmDlw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UvsMN39AxilyRRaSXbHZPXLjNoVKqxq9WMwcJl7ZarDO+oNUHOOtn3n3xnoR2FjEZ
	 Dm2yUnJwbPbMpjxgimpG5OL7ghKctSjVK+cjZ39AGzVdVYeiIvwR/GwM87S7aFRvX+
	 IgF6EM6I+ttSJbgktDbenSEUfDgJ3Kl+xLsY/qyo=
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <avsIXOBDRYvwINiI@valkosipuli.retiisi.eu>
References: <20261112-b4-vchiq-isp-v6-0-711b48378367@ideasonboard.com> <20261112-b4-vchiq-isp-v6-4-711b48378367@ideasonboard.com> <avsIXOBDRYvwINiI@valkosipuli.retiisi.eu>
Subject: Re: [PATCH v6 4/5] media: platform: broadcom: Add bcm2835-isp driver
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, Paul Elder <paul.elder@ideasonboard.com>, Hans Verkuil <hans@jjverkuil.nl>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Date: Wed, 18 Nov 2026 23:02:56 +0530
Message-ID: <179502317689.4071753.17481325815212926138@freya>
User-Agent: alot/0.13.dev199+g9722e8483

Hi Sakari,

Thank you for the review.

Quoting Sakari Ailus (2026-11-16 19:12:52)
> Hi Jai, Naush,
>=20
> On Thu, Nov 12, 2026 at 04:56:32PM +0530, Jai Luthra wrote:
> > diff --git a/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-fm=
ts.h b/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-fmts.h
> > new file mode 100644
> > index 000000000000..6f3333d33c4f
> > --- /dev/null
> > +++ b/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-fmts.h
> > @@ -0,0 +1,558 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Broadcom BCM2835 ISP driver
> > + *
> > + * Copyright =C2=A9 2019-2026 Raspberry Pi (Trading) Ltd.
> > + *
> > + * Author: Naushir Patuck (naush@raspberrypi.com)
> > + *
> > + */
> > +
> > +#ifndef BCM2835_ISP_FMTS
> > +#define BCM2835_ISP_FMTS
> > +
> > +#include <linux/videodev2.h>
> > +#include <linux/raspberrypi/mmal-encodings.h>
> > +
> > +struct bcm2835_isp_fmt {
> > +     u32 fourcc;
> > +     int depth;
> > +     int bytesperline_align;
> > +     u32 mmal_fmt;
> > +     int size_multiplier_x2;
> > +     u32 colorspace_mask;
> > +     enum v4l2_colorspace colorspace_default;
> > +     unsigned int step_size;
> > +};
> > +
> > +#define V4L2_COLORSPACE_MASK(colorspace) BIT(colorspace)
>=20
> The V4L2 prefix shouldn't be used for declaring macros in drivers. Please
> use a driver specific prefix instead.
>=20

Will fix.

[...]

> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int bcm2835_isp_mmal_buf_cleanup(struct mmal_buffer *mmal_buf)
> > +{
> > +     mmal_vchi_buffer_cleanup(mmal_buf);
> > +
> > +     if (mmal_buf->dma_buf) {
> > +             dma_buf_put(mmal_buf->dma_buf);
> > +             mmal_buf->dma_buf =3D NULL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int bcm2835_isp_node_queue_setup(struct vb2_queue *q,
> > +                                     unsigned int *nbuffers,
> > +                                     unsigned int *nplanes,
> > +                                     unsigned int sizes[],
> > +                                     struct device *alloc_devs[])
> > +{
> > +     struct bcm2835_isp_node *node =3D vb2_get_drv_priv(q);
> > +     unsigned int size;
> > +
> > +     if (setup_mmal_port(node))
> > +             return -EINVAL;
> > +
> > +     size =3D node->q_data.sizeimage;
> > +     if (size =3D=3D 0) {
> > +             v4l2_info(&node_get_dev(node)->v4l2_dev,
> > +                       "%s: Image size unset in queue_setup for node %=
s[%d]\n",
> > +                       __func__, node->name, node->id);
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (*nplanes)
> > +             return sizes[0] < size ? -EINVAL : 0;
> > +
> > +     *nplanes =3D 1;
> > +     sizes[0] =3D size;
> > +
> > +     node->port->current_buffer.size =3D size;
> > +
> > +     if (*nbuffers < node->port->minimum_buffer.num)
> > +             *nbuffers =3D node->port->minimum_buffer.num;
> > +
> > +     node->port->current_buffer.num =3D *nbuffers;
> > +
> > +     v4l2_dbg(2, debug, &node_get_dev(node)->v4l2_dev,
> > +              "%s: Image size %u, nbuffers %u for node %s[%d]\n",
> > +              __func__, sizes[0], *nbuffers, node->name, node->id);
> > +     return 0;
> > +}
> > +
> > +static int bcm2835_isp_buf_init(struct vb2_buffer *vb)
> > +{
> > +     struct bcm2835_isp_node *node =3D vb2_get_drv_priv(vb->vb2_queue);
> > +     struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> > +     struct bcm2835_isp_buffer *buf =3D
> > +             to_bcm2835_isp_buffer(to_vb2_v4l2_buffer(vb));
> > +
> > +     v4l2_dbg(3, debug, &dev->v4l2_dev, "%s: vb %p\n", __func__, vb);
> > +
> > +     buf->mmal.buffer =3D vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
> > +     buf->mmal.buffer_size =3D vb2_plane_size(&buf->vb.vb2_buf, 0);
> > +     mmal_vchi_buffer_init(dev->mmal_instance, &buf->mmal);
> > +     return 0;
> > +}
> > +
> > +static int bcm2835_isp_buf_prepare(struct vb2_buffer *vb)
> > +{
> > +     struct bcm2835_isp_node *node =3D vb2_get_drv_priv(vb->vb2_queue);
> > +     struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> > +     struct vb2_v4l2_buffer *vb2 =3D to_vb2_v4l2_buffer(vb);
> > +     struct bcm2835_isp_buffer *buf =3D to_bcm2835_isp_buffer(vb2);
> > +     struct dma_buf *dma_buf;
> > +     int ret =3D 0;
> > +
> > +     v4l2_dbg(3, debug, &dev->v4l2_dev, "%s: type: %d ptr %p\n",
> > +              __func__, vb->vb2_queue->type, vb);
>=20
> Is this still appropriate after development time?
>=20

I don't think so, I'll drop this and other ones at v4l2_dbg level 3.

[...]

Ack on rest of the comments for prints as well.

> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-=
core/v4l2-ioctl.c
> > index 17ba1ae70735..1449de2b64b5 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1490,6 +1490,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc =
*fmt)
> >       case V4L2_META_FMT_GENERIC_CSI2_16:     descr =3D "8-bit Generic =
Meta, 16b CSI-2"; break;
> >       case V4L2_META_FMT_GENERIC_CSI2_20:     descr =3D "8-bit Generic =
Meta, 20b CSI-2"; break;
> >       case V4L2_META_FMT_GENERIC_CSI2_24:     descr =3D "8-bit Generic =
Meta, 24b CSI-2"; break;
> > +     case V4L2_META_FMT_BCM2835_ISP_STATS: descr =3D "BCM2835 ISP Imag=
e Statistics"; break;
> > +     case V4L2_META_FMT_BCM2835_ISP_PARAMS: descr =3D "BCM2835 ISP Con=
fig Parameters"; break;
>=20
> What's the status of the documentation for these? Do we have something
> beyond the headers?
>=20

These are documented in metafmt-bcm2835-isp.rst, which in turn refers to
v4l2-isp.rst, and also refers to the actual parameter and stats structures
defined in the bcm2835-isp.h.

I'll add an actual C code example for reading AWB stats, as that seems to
be missing right now, even though it's straightforward.

[...]

> > +/**
> > + * struct bcm2835_isp_params_digital_gain - Digital gain parameters bl=
ock
> > + *
> > + * @header: Block header (type =3D BCM2835_ISP_PARAM_BLOCK_DIGITAL_GAI=
N)
> > + * @digital_gain: Digital gain configuration
> > + */
> > +struct bcm2835_isp_params_digital_gain {
> > +     struct v4l2_isp_params_block_header header;
> > +     struct bcm2835_isp_digital_gain digital_gain;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * define BCM2835_ISP_PARAMS_MAX_SIZE - Maximum size of all ISP parame=
ters
>=20
> How about adding a build-time check to the driver the size remains
> unchanged? There are quite a few different fields there.
>=20
> I might do the same for the statistics.
>=20
> This can be all fixed on top though and doesn't affect the UAPI.
>=20

I'll add a static_assert() for both in the next revision.

> > + *
> > + * This defines the maximum size needed to accommodate all possible pa=
rameter
> > + * blocks in a single buffer. Drivers use this to allocate appropriate=
ly
> > + * sized buffers.
> > + */
> > +#define BCM2835_ISP_PARAMS_MAX_SIZE                                  \
> > +     (sizeof(struct bcm2835_isp_params_black_level) +                \
> > +      sizeof(struct bcm2835_isp_params_geq) +                        \
> > +      sizeof(struct bcm2835_isp_params_gamma) +                      \
> > +      sizeof(struct bcm2835_isp_params_denoise) +                    \
> > +      sizeof(struct bcm2835_isp_params_sharpen) +                    \
> > +      sizeof(struct bcm2835_isp_params_dpc) +                        \
> > +      sizeof(struct bcm2835_isp_params_cdn) +                        \
> > +      sizeof(struct bcm2835_isp_params_cc_matrix) +                  \
> > +      sizeof(struct bcm2835_isp_params_lens_shading) +               \
> > +      sizeof(struct bcm2835_isp_params_awb_gains) +                  \
> > +      sizeof(struct bcm2835_isp_params_digital_gain))
> > +
> >=20
>=20
> --=20
> Regards,
>=20
> Sakari Ailus

Thanks,
Jai
