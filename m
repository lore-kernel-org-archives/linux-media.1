Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795444645;
	b=3DsDBGFl+8Jf75OJ4G9LZN7Zmb5s5CCv//FYW1CKvwH8ADacALUkdDwd6RDIG1UUg6BZ
	 KOpwtxjVthms7F96v7dipMAS5aWNZTfbwYlWNKWc8aNnAzgK6g0yuv2TgophiRBi781P2
	 PuWJr/ZQoqruSiZQrp/M6sbZ3G9ppFjtnZZDLFjiZNdtL0Lj3ABVlRvJqvHkURrRzSHzM
	 JIwAb7v2e0NmPeWogHQgMQjX1aCPEPT6ZgUcTntQF0iW2s15Cyl0BV88l4QMdCHul9VVn
	 HgI+QyDPZ5pJUKeVv+26NhLi+POImZ3SQMql4tdlEAETcRWykXf4p3d5gxldncPBhog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444645;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:From:Subject:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hnYJCBiRfz7yllErcSmEBCv6f1PEOQS5KfWCrNNzX9U=;
	b=GMJ2zg2LZYkXEEXvdXAXvv4KcF1zrDqc4T9j3+hXBC2WdUmAiQnANpI3jDxk7eCrMn3C
	 Yu0b8cluGoh5vFCb2B5AvFBqVnz+O5lKPW7RUH7Aq9v15SPPS+1ivG9LFtyFd5OhNVL2k
	 pg8xqa3XAZTg6XV+XHaIXEbnd0G1MJsjUShImC096C/dWIiKhRlRJagsQzcCJlxII8mvZ
	 dMbJNs0KumEegFj3xHkBmTpEdXZ9ByzCEifEcgo5w/0Geaq7HjNg9QtSsayz3HWvtlWwA
	 cWQf58Y2D66WSXbh8Q/mPMLpjH/zII4aZVcmWTJ6QXF/ptadFL1mAIRnJsZtgp4bVZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=alPWYmgy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9510F606A33A;
	Mon, 23 Nov 2026 14:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9510F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=alPWYmgy
Received: from [127.0.0.1] (unknown [IPv6:2a02:560:5c0a:3200:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 784592020DC;
	Mon, 23 Nov 2026 15:37:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795444638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hnYJCBiRfz7yllErcSmEBCv6f1PEOQS5KfWCrNNzX9U=;
	b=alPWYmgyip7ZtXwDQnfvGEFHT2Vf4GgtfehdO2x9jpPrZarvupKfolT6gdVOR7x/jMbvbx
	l1g/ljk6KDsWPZSK4OdZsm7iyPL865uOgd5AgHGnxou8clgdNIJFULRWuikVEycxFH2a6O
	G3kqr+X/5MTBlPP1jKphwJmFDzMVKy1tG54wY2L/3XfJI1Kfd0v49EsILrbVysVuAOw/u9
	o/GebSmw3jzvQkUUsGv+YnlU/u4g8oIYrazFl5waNrmMAylMMLasdrmQnzNshf1ZxH0QN6
	w7jkALJ8F3i+LbW6jywT/AG/5ourWOhFnXcipmNRb8JRq/epUXZr2neNRnZypA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795444638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hnYJCBiRfz7yllErcSmEBCv6f1PEOQS5KfWCrNNzX9U=;
	b=I/WTdnfLS/bKcKqhFAyV+yXnfcHSLyA2CeYu+0oJW3SFN6iZ7hhvDYL9v+6G7qi72AVGHv
	cEmMnesQPScLxXt8KCpqzG4kzlh/uBRk/tV8GwmiQkBMuRpzwjtrJ9Zoc/GsRn5lAF29D0
	3RVANz8+Hjn7pY9xwKhiJcbJ1ojuHMOTBMEMYeTia6JQZ+dtAgTwFU/8GaSTk6c3CYjjw+
	YMQR0ugR/BEFu6m0KY4gS0NUjMlpKUkE2M+PTbTtf7yN/BErVLCaE8+8rPZygsli+jdbSI
	JFE54AvvhJeoL2pHj13cH2uzk76GiaIEblxd8KHCB/FQpcyTz1UQ+xD77Lz/lw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795444638; a=rsa-sha256;
	cv=none;
	b=VyrsRtnBpkODZmAdxfMV+MoBNy3FPDmMTbrBEk0s5rZRo7/E1zC5LVRKwhyZcFAY9qYTr6
	ggZNrY83tSAsakpMOzvnXRgDUgrWBZdSg94bzHJ3qJNpickakNtgBoKNxfe1rJTqClrVcP
	W8RwQuvdOTTSd7Q/NWY1jLJiMazCNN4JY6RWVkCQ1gCNYqBPqtymk8TBFsRufaVEhYhjky
	Y38VwMpcRLGyyB+A4nOctuFqz9tOjNmW6GQxi85/Hla7IBz6XV1TbBONUBO0BxongDQEIO
	5nI8bcQ+wFluw3yxNs1Q077yjYvy+Vjid/us9cXw/5PLDDSs0q0mi75u97EWdA==
Message-ID: <20c75d45-0b9b-4465-83aa-3ef24b90309b@pengutronix.de>
From: "Sascha Hauer" <s.hauer@pengutronix.de>
Subject: Re: [PATCH v7 2/4] media: rockchip: Add JPEG decoder driver
To: "Philipp Zabel" <p.zabel@pengutronix.de>
Cc: "Sascha Hauer" <s.hauer@pengutronix.de>, "Lucas Sinn" <lucas.sinn@wolfvision.net>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <266c9fe4a9aca943c2c2be39a7dc0f3bea2df362.camel@pengutronix.de>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
 <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
 <266c9fe4a9aca943c2c2be39a7dc0f3bea2df362.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 14:37:17 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list

On 2026-11-20 15:58, Philipp Zabel wrote:
> > +
> > +/* Error status bits used to decide whether a hardware reset is needed=
 */
> > +#define VDPU720_ERR_MASK		(VDPU720_BUS_ERR | VDPU720_DEC_ERR | \
> > +					 VDPU720_TIMEOUT | VDPU720_BUF_EMPTY)
> > +
> > +/*
> > + * VPU720 IRQ clear mask.
> > + *
> > + * Some revisions require a two-step IRQ acknowledgment before checking
> > + * VDPU720_IRQ_RAW: write the status back with only the enable and con=
trol
> > + * bits kept, then write 0 to fully clear.  The downstream BSP compute=
s the
> > + * first value as
> > + *
> > + *   clr =3D (~(0x00fe7f40 & status)) & (0xff0180bf & status)
> > + *
> > + * The two masks are complements, so that is status & 0xff0180bf: bits=
 0-5,
> > + * 7, 15, 16 and 24-31 are kept, IRQ_RAW and the status bits 8-14 drop=
ped.
> > + *
> > + * It is applied unconditionally here.  The BSP gates it on the revisi=
on in
> > + * VDPU720_REG_VERSION matching 0xdb1f0006 exactly, and the RK3588 rep=
orts
> > + * 0xdb1f0005, so it is not needed on that part.  The extra write is
> > + * harmless there and saves a revision check that would need silicon w=
e do
> > + * not have to validate.
> > + */
> > +#define VDPU720_IRQ_CLR_KEEP		0xff0180bf
> > +
> > +#define VDPU720_REG_SYS			0x008
> > +#define VDPU720_FORCE_SOFTRST		BIT(17)	/* set when dec_e=3D0 before so=
ft-reset */
> > +#define VDPU720_FILL_DOWN_E		BIT(24)	/* fill bottom padding rows */
> > +#define VDPU720_FILL_RIGHT_E		BIT(25)
> > +#define VDPU720_OUT_SEQ			BIT(26)	/* 0=3Draster, 1=3Dtile */
> > +#define VDPU720_YUV_OUT_FMT		GENMASK(29, 27)
> > +#define VDPU720_YUV_OUT_FMT_NATIVE	0	/* no format conversion */
>=20
> This is never used.

It will be in v8 due to adding NV16 support ;)

>=20
> > +#define VDPU720_YUV_OUT_FMT_NV12	3	/* output as NV12 */
> > +
> > +#define VDPU720_REG_PIC_SIZE		0x00c
> > +#define VDPU720_PIC_W_M1		GENMASK(15, 0)
> > +#define VDPU720_PIC_H_M1		GENMASK(31, 16)
> > +
> > +#define VDPU720_REG_PIC_FMT		0x010
> > +#define VDPU720_JPEG_MODE		GENMASK(2, 0)
> > +#define VDPU720_JPEG_MODE_YUV400	0
> > +#define VDPU720_JPEG_MODE_YUV411	1
> > +#define VDPU720_JPEG_MODE_YUV420	2
> > +#define VDPU720_JPEG_MODE_YUV422	3
> > +#define VDPU720_JPEG_MODE_YUV440	4
> > +#define VDPU720_JPEG_MODE_YUV444	5
>=20
> So the driver can decode 4:4:4 JPEGs but always subsamples and outputs
> them as 4:2:0 (NV12)?

For simplicity, yes. I added NV16 support for 4:2:2 sampling for the
next round, as that's a common format for webcams. I'll leave 4:4:4
to NV24 for a later exercise.

> > +#include <media/v4l2-jpeg.h>
> > +#include <media/v4l2-mem2mem.h>
> > +#include <media/videobuf2-core.h>
> > +#include <media/videobuf2-dma-contig.h>
> > +
> > +#include "rkjpegd-vdpu720-regs.h"
> > +
> > +#define RKJPEGD_NAME "rockchip-jpegd"
> > +
> > +/*
> > + * The reference manual gives 48x48 to 65536x65536, and a frame header=
 cannot
> > + * describe more than 65535.  The coded format steps in RKJPEGD_CODED_=
STEP.
> > + * Beyond that only the decoded frame has to fit a 32 bit sizeimage, s=
ee
> > + * rkjpegd_raw_fits().
> > + */
> > +#define RKJPEGD_MIN_WIDTH	48
> > +#define RKJPEGD_MIN_HEIGHT	48
> > +#define RKJPEGD_MAX_SIZE	65528
>=20
> This seems inconsistent. Why not MIN_SIZE or MAX_WIDTH/HEIGHT?

Ok, will change to RKJPEGD_MIN_SIZE

>=20
>=20
> [...]
> > +/* The capture format and crop a frame decodes to. */
> > +static void rkjpegd_fill_hdr_fmt(struct v4l2_pix_format_mplane *pix_mp,
> > +				 struct v4l2_rect *crop,
> > +				 const struct v4l2_jpeg_header *hdr)
> > +{
> > +	rkjpegd_fill_raw_fmt(pix_mp, rkjpegd_raw_pixelformat(hdr),
> > +			     ALIGN(hdr->frame.width, RKJPEGD_RAW_STEP),
> > +			     ALIGN(hdr->frame.height, RKJPEGD_RAW_STEP));
>=20
> Aligning to 16 is safe, but for e.g. grayscale (or YUV 4:4:4) I'd
> expect aligning to 8 to be enough (see vdpu720_mcu_width/height()).

The width has to stay at 16 pixel alignment, as the hardware takes its
stride in units of 16 pixels.

For the height I'd say we have to play around with the FILL_DOWN_E bit.
When set, the reference manual says: "Fill picture height to multiple of
16 pixels". Right now we always have this bit set, same as the Rockchip
driver does. I'd rather leave this up for a later exercise to dig deeper
into that.

>=20
> > +	crop->left =3D 0;
> > +	crop->top =3D 0;
> > +	crop->width =3D hdr->frame.width;
> > +	crop->height =3D hdr->frame.height;
> > +}
> > +
> [...]
> > +/*
> > + * The capture format as userspace sees it.  Once the decoder stopped =
at a
> > + * format change, that is the one of the frame it stopped in front of.
> > + */
> > +static void rkjpegd_get_cap_fmt(struct rkjpegd_ctx *ctx,
> > +				struct v4l2_pix_format_mplane *pix_mp,
> > +				struct v4l2_rect *crop)
> > +{
> > +	struct vb2_v4l2_buffer *src;
> > +
> > +	if (READ_ONCE(ctx->stopped_at_change)) {
>=20
> Why does TRY_FMT depend on decoder state?

The format is dictated by the JPEG stream. It depends on the decoder
state to support a midstream format change. When stopped at a format
change we have to report the new format, otherwise the current format.

>=20
> > +		src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> > +		rkjpegd_fill_hdr_fmt(pix_mp, crop,
> > +				     &vb2_to_rkjpegd_src_buf(&src->vb2_buf)->header);
> > +		return;
> > +	}
> > +
> > +	*pix_mp =3D ctx->dst_fmt;
> > +	*crop =3D ctx->crop;
> > +}
> [...]
> > +static int rkjpegd_enum_framesizes(struct file *file, void *priv,
> > +				   struct v4l2_frmsizeenum *fsize)
> > +{
> > +	/* The decoded format follows the bitstream, nothing to enumerate. */
> > +	if (fsize->pixel_format =3D=3D V4L2_PIX_FMT_NV12 ||
> > +	    fsize->pixel_format =3D=3D V4L2_PIX_FMT_GREY)
> > +		return -ENOTTY;
> > +
> > +	if (fsize->pixel_format !=3D V4L2_PIX_FMT_JPEG)
> > +		return -EINVAL;
> > +
> > +	if (fsize->index)
> > +		return -EINVAL;
> > +
> > +	fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> > +	fsize->stepwise.min_width =3D RKJPEGD_MIN_WIDTH;
> > +	fsize->stepwise.max_width =3D RKJPEGD_MAX_SIZE;
> > +	fsize->stepwise.step_width =3D RKJPEGD_CODED_STEP;
> > +	fsize->stepwise.min_height =3D RKJPEGD_MIN_HEIGHT;
> > +	fsize->stepwise.max_height =3D RKJPEGD_MAX_SIZE;
> > +	fsize->stepwise.step_height =3D RKJPEGD_CODED_STEP;
>=20
> This is the coded size. I'd expect this to be continuous. You just have
> to make sure that the decoded buffer is properly aligned and set the
> PADDED selection rectangle accordingly.

Oh, yes. That can indeed be continuous. Will change.

> > +
> [...]
> > +
> > +	rkjpegd_irq_done(jpegd, state);
>=20
> Why is this hidden in a separate function call?

Likely historic reasons. I'll inline the code here.

>=20
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static void rkjpegd_watchdog(struct work_struct *work)
> > +{
> > +	struct rkjpegd_dev *jpegd =3D container_of(to_delayed_work(work),
> > +						 struct rkjpegd_dev,
> > +						 watchdog_work);
> > +	/* Only armed while a job runs, so there is always a context. */
> > +	struct rkjpegd_ctx *ctx =3D v4l2_m2m_get_curr_priv(jpegd->m2m_dev);
> > +
> > +	dev_err(jpegd->dev, "frame processing timed out\n");
> > +
> > +	rkjpegd_vdpu720_reset(ctx);
> > +	rkjpegd_job_finish(ctx, VB2_BUF_STATE_ERROR);
> > +}
> [...]
> > +static int rkjpegd_buf_out_validate(struct vb2_buffer *vb)
> > +{
> > +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> > +
> > +	vbuf->field =3D V4L2_FIELD_NONE;
>=20
> Hmm, "drivers can use this to validate userspace-provided information".
> Is this really validation?
>
> It seems a lot of drivers have exactly the same function:
>=20
>   vpu_vb2_buf_out_validate()
>   cedrus_buf_out_validate()
>   mdp_m2m_buf_out_validate()
>   vb2ops_venc_buf_out_validate()
>   tegra_buf_out_validate()
>   dw100_buf_out_validate()
>   mxc_jpeg_buf_out_validate()
>   rkvdec_buf_out_validate()
>   hantro_buf_out_validate()
>   vicodec_buf_out_validate()
>   visl_buf_out_validate()
>=20
> At least e5010_buf_out_validate() and
> dma2d_buf_out_validate() warn or fail, respectively, if the field value
> is invalid.
>=20
> Is overwriting field to NONE what this callback was designed for, and
> if so, does this warrant a common helper?

1f2f510753be ("media: vivid: add buf_out_validate callback") which Hans
upstreamed along with the patch adding the buf_out_validate hook
suggests it's really for validation rather than normalisation.

However, buf_out contains the coded stream. The field order has no
meaning in a coded stream, which is why I think that most decoder
drivers just normalize to a sane value.

Yes, this sounds an opportunity to add a generic helper function. If
that's desired I would add one as a separate series though.

>=20
> > +
> > +	return 0;
> > +}
> >=20
> [...]
> > +
> > +static int rkjpegd_resume(struct device *dev)
> > +{
> > +	struct rkjpegd_dev *jpegd =3D dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret =3D pm_runtime_force_resume(dev);
>=20
> I'd expect this to not call v4l2_m2m_resume() if runtime PM resume
> failed.

Yes. Will change to return early when it fails.

Regards,
  Sascha


--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

