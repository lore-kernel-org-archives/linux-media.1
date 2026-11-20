Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795186707;
	b=4txtP9+nppWEFBg6icLXknMD23YHsxqyAmU0VbJfMw/3A5qK7/SSrWTXl0zDYi0B21ym
	 hIOULO3zcjQ1TJEZKkAjJDh2hmrbqgy+gp4oQ7pSpYziLeAGSRCDC18OYmxQTKyF7HHj6
	 PweUIORfPgukYNy3WkIGBkHbDJRJ6gLuYKLOInvRCC2RHAJ5QlcP82SQlof3EiHN+Wbpr
	 r1+DrxZcboOXzz/cjVWkyfHv31+XIzb4ARFtHBzed1jhYPVM/tgu1Do3PXvanMiHypx7Y
	 lyPnqkVn1NZGIuTCa6jyL6OtPrvF1S93YU9TxdF2OzOny6lr6Zyr0DYp7V8vsk98isg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186707;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=5+8+PCatxhc212qaC9fk/69TxnY1y/1Ej9oycITfY3M=;
	b=cBnBYiUa7cAw9NeTxzPQPk9BOd4N/WAp12/D2mniUOOWjiDRnnBhl4gbwvF8ZXaU4O7g
	 iwXvgoiMwF5d4Kgs68vnSsCBhJ0Fp68fbfqKGBsBNDKqK3YOkK+0GiN5B43Qu1tBVrK74
	 2ePtpI0jl0JPGEUHM1UHInkjQ9YlBXz+HtAq8sHSRiMoOgXFjGj8a8cgSI0PpZPLJbnzF
	 4y907ydCy+iJiKgg4EmR9CmPSr/IiAEvPYiC2lwlfuwZUKIYB5sOQRXtWQujSeHJyFnuq
	 Qhf+BjZNY5AXxh67dd8pN7InC2+3HtT3/cONRnieYXkqx7OzJ9RL4dbXaad8YQMFCfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=EuCkDGCE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE0C60A2621;
	Fri, 20 Nov 2026 14:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FE0C60A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=EuCkDGCE
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5718D205B49;
	Fri, 20 Nov 2026 15:58:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795186699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5+8+PCatxhc212qaC9fk/69TxnY1y/1Ej9oycITfY3M=;
	b=EuCkDGCERQpkfaXW/vmeFKszC2e1LdXYEVrJ/ifIZQBftVTRNFx6a3Omtex8JopTq2PqMn
	aMga9AUbYIwKT4wzGWLL533C1BUh0YaoIOB/wwGqbFHTzocHHWr+TI58SWQx1QtFigoba2
	80XxR7BGJAZwMHNu+XmtSjHXdUSwOP/NBWzQJZBwjXSEm6DZPAk5pTMNEVXpx0076qS3et
	cOxG7y0uU6KQ89xGlYgkLn6Twsh6yHGrnLACjRpFxGLby4a/vn5HcYmdoh2Fkvs0W3XXvj
	JL/dOYIfK5i73ToXwYuqT+HeO7GJ0B+k1xalgiaKzk7N+5k+mYp0yv7kQX/XxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795186699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5+8+PCatxhc212qaC9fk/69TxnY1y/1Ej9oycITfY3M=;
	b=eQrzGiIXL5PuVXKPxCoTGShT9cs5vBv3iQr74DGy0BLmguq1wBiLZYP0W0tcKFGZJUAv6v
	U+aJ4ZcACtnTwL4QqBbAtbhEmhbqyJ28/yObIgIRhlBWhnyYkdBzl+L4zq60ySiaMN/0O4
	p5gBh78L0MCBhIxwgYtRTCtVEVAJ5bK2sfUP/rX2gqE2wXql69pF3Qvz16UZF+QolMvRm4
	b2leAf6fgkAey9PayGKwIKLS2vUM8c1tHgIN1wWleT2vHVkHomzTU0sAi59JjJ73WopFhk
	zH+0GBquNWPwUQrEZIy/jKAzKydJ5ei/VTCvjD0q4MF8VN7QlQbvNnYRVaR91Q==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795186699; a=rsa-sha256;
	cv=none;
	b=YKfOJsgq2y1cai9XDJk9qr39CUzi47u1xIisc+9ifmLVpKWWjMUI8POU0HsaxBLLnw7ew5
	Y3d2TSCUir/gm+BOfVL6nAsorBim56htwrNTmaNCLKkHS6OGTN+3QPIe21tUQw2ePOE3dw
	mRGowlxex0A5czPRA9tE0Xp/1v6hb4OZvmGMGOu5U+tA5b70wikvXA/VxPISlF+UotGJjy
	KxkAHLN7BpqCoG3L9ltVYLR0fnGxGNqk0sBEFgqwaXuYSKOlc8MKhBp143PkTyf6dAHqYd
	edQ+RVxPyWHUy1+IhVoy6rPOustE6oY0q4ix8TPr5qrzncfdn+WPb2E0EyuXLQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <266c9fe4a9aca943c2c2be39a7dc0f3bea2df362.camel@pengutronix.de>
Subject: Re: [PATCH v7 2/4] media: rockchip: Add JPEG decoder driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>, Lucas Sinn	
 <lucas.sinn@wolfvision.net>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley	 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 15:58:19 +0100
In-Reply-To: <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
	 <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Do, 2026-10-22 at 13:06 +0200, Sascha Hauer wrote:
> Add a driver for the JPEG hardware decoder Rockchip integrates into a
> number of its SoCs.  Downstream it is known as the VDPU720, which is the
> name the register definitions carry here.
>=20
> Exposes one V4L2 M2M device implementing the stateful decoder interface:
> JPEG input -> NV12 output, or GREY for a grayscale frame.  The frame
> header is parsed on the CPU when a coded buffer is queued.  The first
> buffer queued while the capture queue is stopped sets the capture format
> and raises V4L2_EVENT_SOURCE_CHANGE, so userspace learns the frame size
> without parsing the bitstream itself.  V4L2_DEC_CMD_STOP drains.
>=20
> Dynamic resolution change is supported, and has to be for GStreamer:
> without V4L2_FMT_FLAG_DYN_RESOLUTION its v4l2videodec does not wait for
> the initial source change and later takes the pending event for one in
> the middle of the stream, with the flag it relies on the driver to
> follow a change.  A frame that decodes to another size or pixel format
> than the one queued before it is marked when it is queued.  The decoder
> stops in front of it, reports the change, returns an empty LAST capture
> buffer and resumes once userspace has restarted the capture queue or
> sent V4L2_DEC_CMD_START.  The capture format is only ever changed from
> an ioctl while no job can run.
>=20
> Hardware requirements:
> - a DMA side buffer with Q-tables (zigzag->raster), Huffman mincode and
>   value tables, rebuilt from the frame header on every run
> - a two-phase IRQ clear sequence, which some revisions require.  It is
>   done unconditionally, see rkjpegd-vdpu720-regs.h
> - 16-byte stream alignment with a start-byte offset
> - MCU-aligned PIC_H (e.g. 1080p YUV420 needs 1088, not 1080)
> - FILL_DOWN_E on every NV12 conversion, the output chroma is vertically
>   subsampled so the hardware completes the bottom of the picture
> - DRI (restart interval) support when present
>=20
> Every address register is a single 32 bit one with no high order
> companion anywhere in the map, so the DMA masks are capped accordingly.
> That is no constraint in practice: the block sits behind the Rockchip
> IOMMU, whose address space is 32 bit wide by construction, and memory
> above 4GB is reached through it.
>=20
> A coded buffer that ends before the frame does is left to the hardware:
> BUF_EMPTY is enabled for every job and fails it.  A capture buffer
> smaller than the negotiated format fails the job too.  A failed frame
> comes back with the ERROR flag and its full payload.  The CPU never
> touches a capture buffer, so that queue has no kernel mapping.
>=20
> A job that ends in error, or leaves the block unparked, is followed by an
> in-block soft reset, and so is a job the watchdog has to end.  The
> interrupt handler decodes the error status registers into a readable
> diagnostic.
>=20
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  MAINTAINERS                                        |    1 +
>  drivers/media/platform/rockchip/Kconfig            |    1 +
>  drivers/media/platform/rockchip/Makefile           |    1 +
>  drivers/media/platform/rockchip/rkjpegd/Kconfig    |   16 +
>  drivers/media/platform/rockchip/rkjpegd/Makefile   |    4 +
>  .../rockchip/rkjpegd/rkjpegd-vdpu720-regs.h        |  235 +++
>  drivers/media/platform/rockchip/rkjpegd/rkjpegd.c  | 2222 ++++++++++++++=
++++++
>  7 files changed, 2480 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f47f614dc6857..26a5101a6d76d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23721,6 +23721,7 @@ L:	linux-media@vger.kernel.org
>  L:	linux-rockchip@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml
> +F:	drivers/media/platform/rockchip/rkjpegd/
> =20
>  ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
>  M:	Daniel Golle <daniel@makrotopia.org>
> diff --git a/drivers/media/platform/rockchip/Kconfig b/drivers/media/plat=
form/rockchip/Kconfig
> index ba401d32f01ba..53d28eb89e472 100644
> --- a/drivers/media/platform/rockchip/Kconfig
> +++ b/drivers/media/platform/rockchip/Kconfig
> @@ -5,4 +5,5 @@ comment "Rockchip media platform drivers"
>  source "drivers/media/platform/rockchip/rga/Kconfig"
>  source "drivers/media/platform/rockchip/rkcif/Kconfig"
>  source "drivers/media/platform/rockchip/rkisp1/Kconfig"
> +source "drivers/media/platform/rockchip/rkjpegd/Kconfig"
>  source "drivers/media/platform/rockchip/rkvdec/Kconfig"
> diff --git a/drivers/media/platform/rockchip/Makefile b/drivers/media/pla=
tform/rockchip/Makefile
> index 0e0b2cbbd4bd2..c256c51ced269 100644
> --- a/drivers/media/platform/rockchip/Makefile
> +++ b/drivers/media/platform/rockchip/Makefile
> @@ -2,4 +2,5 @@
>  obj-y +=3D rga/
>  obj-y +=3D rkcif/
>  obj-y +=3D rkisp1/
> +obj-y +=3D rkjpegd/
>  obj-y +=3D rkvdec/
> diff --git a/drivers/media/platform/rockchip/rkjpegd/Kconfig b/drivers/me=
dia/platform/rockchip/rkjpegd/Kconfig
> new file mode 100644
> index 0000000000000..4c269d4a6654e
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkjpegd/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0
> +config VIDEO_ROCKCHIP_JPEGD
> +	tristate "Rockchip JPEG decoder driver"
> +	depends on V4L_MEM2MEM_DRIVERS
> +	depends on ARCH_ROCKCHIP || COMPILE_TEST
> +	depends on VIDEO_DEV
> +	depends on PM
> +	select V4L2_JPEG_HELPER
> +	select V4L2_MEM2MEM_DEV
> +	select VIDEOBUF2_DMA_CONTIG
> +	help
> +	  Support for the VDPU720 JPEG decoder found on Rockchip SoCs such
> +	  as the RK3568 and RK3588, decoding JPEG and MJPEG frames to NV12,
> +	  or to GREY for grayscale frames.
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called rockchip-jpegd.
> diff --git a/drivers/media/platform/rockchip/rkjpegd/Makefile b/drivers/m=
edia/platform/rockchip/rkjpegd/Makefile
> new file mode 100644
> index 0000000000000..0acf2e6ac6785
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkjpegd/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_VIDEO_ROCKCHIP_JPEGD) +=3D rockchip-jpegd.o
> +
> +rockchip-jpegd-y +=3D rkjpegd.o
> diff --git a/drivers/media/platform/rockchip/rkjpegd/rkjpegd-vdpu720-regs=
.h b/drivers/media/platform/rockchip/rkjpegd/rkjpegd-vdpu720-regs.h
> new file mode 100644
> index 0000000000000..eca01174804d6
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkjpegd/rkjpegd-vdpu720-regs.h
> @@ -0,0 +1,235 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip VPU720 JPEG decoder register definitions
> + *
> + * Derived from downstream Rockchip MPP HAL (hal_jpegd_rkv_reg.h).
> + * Copyright (C) 2020 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2026 WolfVision GmbH
> + */
> +#ifndef RKJPEGD_VDPU720_REGS_H_
> +#define RKJPEGD_VDPU720_REGS_H_
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/align.h>
> +#include <linux/types.h>
> +
> +#define VDPU720_REG_VERSION		0x000
> +#define VDPU720_PROD_NUM		GENMASK(31, 16)
> +#define VDPU720_BIT_DEPTH		BIT(8)
> +
> +#define VDPU720_REG_INT			0x004
> +#define VDPU720_DEC_E			BIT(0)
> +#define VDPU720_IRQ_DIS			BIT(1)
> +#define VDPU720_TIMEOUT_E		BIT(2)
> +#define VDPU720_BUF_EMPTY_E		BIT(3)
> +#define VDPU720_BUF_EMPTY_RELOAD	BIT(4)
> +#define VDPU720_SOFT_RST_EN		BIT(5)
> +#define VDPU720_IRQ_RAW			BIT(6)
> +#define VDPU720_WAIT_RESET_E		BIT(7)
> +#define VDPU720_IRQ			BIT(8)
> +#define VDPU720_DEC_RDY			BIT(9)
> +#define VDPU720_BUS_ERR			BIT(10)
> +#define VDPU720_DEC_ERR			BIT(11)
> +#define VDPU720_TIMEOUT			BIT(12)
> +#define VDPU720_BUF_EMPTY		BIT(13)
> +#define VDPU720_SOFT_RST_RDY		BIT(14)
> +
> +/* Error status bits used to decide whether a hardware reset is needed *=
/
> +#define VDPU720_ERR_MASK		(VDPU720_BUS_ERR | VDPU720_DEC_ERR | \
> +					 VDPU720_TIMEOUT | VDPU720_BUF_EMPTY)
> +
> +/*
> + * VPU720 IRQ clear mask.
> + *
> + * Some revisions require a two-step IRQ acknowledgment before checking
> + * VDPU720_IRQ_RAW: write the status back with only the enable and contr=
ol
> + * bits kept, then write 0 to fully clear.  The downstream BSP computes =
the
> + * first value as
> + *
> + *   clr =3D (~(0x00fe7f40 & status)) & (0xff0180bf & status)
> + *
> + * The two masks are complements, so that is status & 0xff0180bf: bits 0=
-5,
> + * 7, 15, 16 and 24-31 are kept, IRQ_RAW and the status bits 8-14 droppe=
d.
> + *
> + * It is applied unconditionally here.  The BSP gates it on the revision=
 in
> + * VDPU720_REG_VERSION matching 0xdb1f0006 exactly, and the RK3588 repor=
ts
> + * 0xdb1f0005, so it is not needed on that part.  The extra write is
> + * harmless there and saves a revision check that would need silicon we =
do
> + * not have to validate.
> + */
> +#define VDPU720_IRQ_CLR_KEEP		0xff0180bf
> +
> +#define VDPU720_REG_SYS			0x008
> +#define VDPU720_FORCE_SOFTRST		BIT(17)	/* set when dec_e=3D0 before soft=
-reset */
> +#define VDPU720_FILL_DOWN_E		BIT(24)	/* fill bottom padding rows */
> +#define VDPU720_FILL_RIGHT_E		BIT(25)
> +#define VDPU720_OUT_SEQ			BIT(26)	/* 0=3Draster, 1=3Dtile */
> +#define VDPU720_YUV_OUT_FMT		GENMASK(29, 27)
> +#define VDPU720_YUV_OUT_FMT_NATIVE	0	/* no format conversion */

This is never used.

> +#define VDPU720_YUV_OUT_FMT_NV12	3	/* output as NV12 */
> +
> +#define VDPU720_REG_PIC_SIZE		0x00c
> +#define VDPU720_PIC_W_M1		GENMASK(15, 0)
> +#define VDPU720_PIC_H_M1		GENMASK(31, 16)
> +
> +#define VDPU720_REG_PIC_FMT		0x010
> +#define VDPU720_JPEG_MODE		GENMASK(2, 0)
> +#define VDPU720_JPEG_MODE_YUV400	0
> +#define VDPU720_JPEG_MODE_YUV411	1
> +#define VDPU720_JPEG_MODE_YUV420	2
> +#define VDPU720_JPEG_MODE_YUV422	3
> +#define VDPU720_JPEG_MODE_YUV440	4
> +#define VDPU720_JPEG_MODE_YUV444	5

So the driver can decode 4:4:4 JPEGs but always subsamples and outputs
them as 4:2:0 (NV12)?

> +#define VDPU720_PIX_DEPTH		GENMASK(6, 4)
> +#define VDPU720_PIX_DEPTH_8		0
> +#define VDPU720_PIX_DEPTH_12		1
> +/* qtables_sel: number of Q-table sets (0..3) */
> +#define VDPU720_QTBL_SEL		GENMASK(9, 8)
> +/* htables_sel: number of H-table sets (0..3) */
> +#define VDPU720_HTBL_SEL		GENMASK(13, 12)
> +/* dri_e: restart interval enable */
> +#define VDPU720_DRI_E			BIT(15)
> +/* dri_mcu_num_m1: restart interval MCU count minus 1 */
> +#define VDPU720_DRI_MCU_M1		GENMASK(31, 16)
> +
> +#define VDPU720_REG_HOR_STRIDE		0x014
> +#define VDPU720_Y_HOR_STRIDE		GENMASK(15, 0)
> +#define VDPU720_UV_HOR_STRIDE		GENMASK(31, 16)
> +
> +#define VDPU720_REG_Y_VSTRIDE		0x018
> +#define VDPU720_Y_VSTRIDE		GENMASK(31, 4)
> +
> +#define VDPU720_REG_TBL_LEN		0x01c
> +#define VDPU720_QTBL_LEN		GENMASK(4, 0)
> +#define VDPU720_HTBL_MINCODE_LEN	GENMASK(12, 8)
> +#define VDPU720_HTBL_VALUE_LEN		GENMASK(21, 16)
> +/* bit 16 of the Y horizontal stride, low 16 bits live in REG5 */
> +#define VDPU720_Y_HOR_STRIDE_H		BIT(24)
> +
> +#define VDPU720_REG_STRM_LEN		0x020
> +#define VDPU720_STRM_START_BYTE		GENMASK(3, 0)
> +#define VDPU720_STRM_LEN		GENMASK(31, 4)
> +
> +#define VDPU720_REG_QTBL_BASE		0x024	/* Q-table side buffer,   64-byte a=
ligned */
> +#define VDPU720_REG_HTBL_MINCODE	0x028	/* H-mincode table,       64-byte=
 aligned */
> +#define VDPU720_REG_HTBL_VALUE		0x02c	/* H-value table,         64-byte =
aligned */
> +#define VDPU720_REG_STRM_BASE		0x030	/* JPEG entropy stream,   16-byte a=
ligned */
> +#define VDPU720_REG_OUT_BASE		0x034	/* NV12 output buffer,    64-byte al=
igned */
> +
> +#define VDPU720_REG_STRM_ERR		0x038
> +#define VDPU720_ERROR_PRC_MODE		BIT(0)
> +#define VDPU720_STRM_FFFF_ERR_MODE	GENMASK(6, 5)
> +#define VDPU720_STRM_OTHER_MODE		GENMASK(8, 7)
> +/* Recommended default: accept errors, skip 0xFFFF, skip unknown markers=
 */
> +#define VDPU720_STRM_ERR_DFLT		(VDPU720_ERROR_PRC_MODE | \
> +					 FIELD_PREP_CONST(VDPU720_STRM_FFFF_ERR_MODE, 2) | \
> +					 FIELD_PREP_CONST(VDPU720_STRM_OTHER_MODE, 2))
> +
> +#define VDPU720_REG_CLK_GATE		0x040
> +#define VDPU720_CLK_GATE_ALL		0xff
> +
> +#define VDPU720_REG_PERF_CTRL		0x078
> +#define VDPU720_PERF_WORK_E		BIT(0)
> +#define VDPU720_PERF_CLR_E		BIT(1)
> +#define VDPU720_PERF_CNT_TYPE		BIT(3)
> +#define VDPU720_PERF_RD_LAT_ID		GENMASK(7, 4)
> +
> +#define VDPU720_REG_AXI_CFG		0x07c
> +#define VDPU720_ADDR_ALIGN_TYPE		GENMASK(1, 0)
> +#define VDPU720_AR_CNT_ID_TYPE		BIT(2)	/* 1 =3D count sw_ar_count_id onl=
y */
> +#define VDPU720_AW_CNT_ID_TYPE		BIT(3)	/* 1 =3D count sw_aw_count_id onl=
y */
> +#define VDPU720_AR_COUNT_ID		GENMASK(7, 4)
> +#define VDPU720_AW_COUNT_ID		GENMASK(11, 8)
> +#define VDPU720_RD_TOTAL_BYTES_MODE	BIT(12)	/* 1 =3D count sw_ar_count_i=
d bytes only */
> +
> +#define VDPU720_REG_DBG_MCU_POS		0x080
> +#define VDPU720_DBG_MCU_POS_X		GENMASK(15, 0)	/* column in MCU units */
> +#define VDPU720_DBG_MCU_POS_Y		GENMASK(31, 16)	/* row in MCU units */
> +
> +#define VDPU720_REG_DBG_ERROR		0x084
> +#define VDPU720_DERR_DRI_SEQ		BIT(0)	/* DRI not at expected sequence */
> +#define VDPU720_DERR_STREAM_R0		BIT(1)	/* special marker 0 detected */
> +#define VDPU720_DERR_STREAM_R1		BIT(2)	/* special marker 1 detected */
> +#define VDPU720_DERR_STREAM_FFFF	BIT(3)	/* 0xFFFF sequence in stream */
> +#define VDPU720_DERR_OTHER_MARK		BIT(4)	/* unknown JPEG marker */
> +#define VDPU720_DERR_MCU_CNT_L		BIT(8)	/* restart mark arrived too early=
 */
> +#define VDPU720_DERR_MCU_CNT_M		BIT(9)	/* restart mark arrived too late =
*/
> +#define VDPU720_DERR_EOI_NO_END		BIT(10)	/* EOI before frame complete */
> +#define VDPU720_DERR_END_NO_EOI		BIT(11)	/* frame complete without EOI *=
/
> +#define VDPU720_DERR_OVERFLOW		BIT(12)	/* Huffman coefficient overflow *=
/
> +#define VDPU720_DERR_HUFF_EMPTY		BIT(13)	/* bitstream empty before EOI *=
/
> +#define VDPU720_DERR_FLAGS		GENMASK(13, 0)	/* all of the above */
> +#define VDPU720_DERR_FIRST_IDX		GENMASK(19, 16)	/* index of first error =
*/
> +
> +#define VDPU720_REG_PERF_RD_MAX_LAT	0x088	/* peak read latency (clock cy=
cles) */
> +#define VDPU720_REG_PERF_RD_LAT_SAMP	0x08c	/* read transactions above la=
t threshold */
> +#define VDPU720_REG_PERF_RD_LAT_ACC	0x090	/* accumulated read latency su=
m */
> +#define VDPU720_REG_PERF_RD_BYTES	0x094	/* total AXI read bytes this fra=
me */
> +#define VDPU720_REG_PERF_WR_BYTES	0x098	/* total AXI write bytes this fr=
ame */
> +
> +#define VDPU720_REG_PERF_CYCLES		0x09c
> +
> +/*
> + * Side-buffer layout for Q-tables and Huffman tables
> + *
> + * The VPU720 JPEG decoder reads quantisation tables and Huffman
> + * tables from a contiguous DMA buffer with the following layout:
> + *
> + *   [0,         QTBL_SIZE):    Q-table data (u16, raster-scan order)
> + *   [HMINCODE_OFF, +HMIN_SZ):  Huffman mincode table
> + *   [HVALUE_OFF,  +HVAL_SZ):   Huffman value table
> + *
> + * The Q-tables are per component, one entry each
> + */
> +#define VDPU720_NB_COMPONENTS		3
> +#define VDPU720_QTBL_ENTRIES		64	/* 64 coefficients per table */
> +#define VDPU720_QTBL_COMP_SIZE		(VDPU720_QTBL_ENTRIES * sizeof(u16))
> +#define VDPU720_QTBL_SIZE		(VDPU720_QTBL_COMP_SIZE * VDPU720_NB_COMPONEN=
TS)
> +
> +/*
> + * The Huffman tables are not per component and there is no per componen=
t
> + * selector register, so the mapping is fixed: the first set is used for=
 the
> + * luma component and the second one for both chroma components.  A gray=
scale
> + * frame only needs the first.
> + *
> + * HTBL_SEL has a third setting, and the downstream HAL sizes the table
> + * buffer for three sets, but it only ever fills the third with a copy o=
f the
> + * second.  Whether that set is used for the second chroma component is
> + * unknown, so it is not used here.
> + */
> +#define VDPU720_NB_HTBL_SETS		2
> +
> +/*
> + * Per-set mincode layout: 16 DC mincodes + 8 DC accaddr pairs +
> + * 16 AC mincodes + 8 AC accaddr pairs =3D 48 u16 =3D 96 bytes
> + */
> +#define VDPU720_HMINCODE_SET_SIZE	(48 * sizeof(u16))
> +#define VDPU720_HMINCODE_SIZE		(VDPU720_HMINCODE_SET_SIZE * VDPU720_NB_H=
TBL_SETS)
> +#define VDPU720_HMINCODE_OFF		VDPU720_QTBL_SIZE
> +
> +/* Per-set value layout: 16 DC values + 176 AC values =3D 192 bytes */
> +#define VDPU720_HVALUE_SET_SIZE		192
> +#define VDPU720_HVALUE_SIZE		(VDPU720_HVALUE_SET_SIZE * VDPU720_NB_HTBL_=
SETS)
> +#define VDPU720_HVALUE_OFF		(VDPU720_HMINCODE_OFF + \
> +					 ALIGN(VDPU720_HMINCODE_SIZE, 64))
> +
> +#define VDPU720_TABLE_BUF_SIZE		(VDPU720_HVALUE_OFF + VDPU720_HVALUE_SIZ=
E)
> +
> +/*
> + * The three table length registers count 16 byte units, minus one.  Der=
ive
> + * them from the sizes above so that what is programmed always matches w=
hat
> + * the driver writes into the side buffer.
> + */
> +#define VDPU720_TBL_LEN_UNIT		16
> +#define VDPU720_TBL_LEN(bytes)		((bytes) / VDPU720_TBL_LEN_UNIT - 1)
> +
> +/*
> + * Huffman value sub-layout per set (192 bytes total):
> + *   bytes [0..15]:   DC code values (up to 12 valid entries)
> + *   bytes [16..191]: AC code values (up to 162 valid entries)
> + */
> +#define VDPU720_DC_VALUES_MAX		16
> +#define VDPU720_AC_VALUES_MAX		176	/* 12*16 - 16 */
> +
> +#endif /* RKJPEGD_VDPU720_REGS_H_ */
> diff --git a/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c b/drivers/=
media/platform/rockchip/rkjpegd/rkjpegd.c
> new file mode 100644
> index 0000000000000..b33141c33ec38
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkjpegd/rkjpegd.c
> @@ -0,0 +1,2222 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip JPEG decoder driver
> + *
> + * The register programming is ported from the Rockchip MPP HAL
> + * (hal_jpegd_rkv.c / hal_jpegd_vpu7xx_com.c) and the downstream
> + * mpp_jpgdec.c kernel driver.
> + *
> + * Copyright (C) 2020 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2026 WolfVision GmbH
> + *   Author: Lucas Sinn <lucas.sinn@wolfvision.net>
> + * Copyright (C) 2026 Pengutronix, Sascha Hauer <s.hauer@pengutronix.de>
> + */
> +
> +#include <linux/align.h>
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/clk.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/kref.h>
> +#include <linux/log2.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +#include <linux/videodev2.h>
> +#include <linux/workqueue.h>
> +
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fh.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-jpeg.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/videobuf2-core.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "rkjpegd-vdpu720-regs.h"
> +
> +#define RKJPEGD_NAME "rockchip-jpegd"
> +
> +/*
> + * The reference manual gives 48x48 to 65536x65536, and a frame header c=
annot
> + * describe more than 65535.  The coded format steps in RKJPEGD_CODED_ST=
EP.
> + * Beyond that only the decoded frame has to fit a 32 bit sizeimage, see
> + * rkjpegd_raw_fits().
> + */
> +#define RKJPEGD_MIN_WIDTH	48
> +#define RKJPEGD_MIN_HEIGHT	48
> +#define RKJPEGD_MAX_SIZE	65528

This seems inconsistent. Why not MIN_SIZE or MAX_WIDTH/HEIGHT?


[...]
> +/* The capture format and crop a frame decodes to. */
> +static void rkjpegd_fill_hdr_fmt(struct v4l2_pix_format_mplane *pix_mp,
> +				 struct v4l2_rect *crop,
> +				 const struct v4l2_jpeg_header *hdr)
> +{
> +	rkjpegd_fill_raw_fmt(pix_mp, rkjpegd_raw_pixelformat(hdr),
> +			     ALIGN(hdr->frame.width, RKJPEGD_RAW_STEP),
> +			     ALIGN(hdr->frame.height, RKJPEGD_RAW_STEP));

Aligning to 16 is safe, but for e.g. grayscale (or YUV 4:4:4) I'd
expect aligning to 8 to be enough (see vdpu720_mcu_width/height()).

> +	crop->left =3D 0;
> +	crop->top =3D 0;
> +	crop->width =3D hdr->frame.width;
> +	crop->height =3D hdr->frame.height;
> +}
> +
[...]
> +/*
> + * The capture format as userspace sees it.  Once the decoder stopped at=
 a
> + * format change, that is the one of the frame it stopped in front of.
> + */
> +static void rkjpegd_get_cap_fmt(struct rkjpegd_ctx *ctx,
> +				struct v4l2_pix_format_mplane *pix_mp,
> +				struct v4l2_rect *crop)
> +{
> +	struct vb2_v4l2_buffer *src;
> +
> +	if (READ_ONCE(ctx->stopped_at_change)) {

Why does TRY_FMT depend on decoder state?

> +		src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +		rkjpegd_fill_hdr_fmt(pix_mp, crop,
> +				     &vb2_to_rkjpegd_src_buf(&src->vb2_buf)->header);
> +		return;
> +	}
> +
> +	*pix_mp =3D ctx->dst_fmt;
> +	*crop =3D ctx->crop;
> +}
[...]
> +static int rkjpegd_enum_framesizes(struct file *file, void *priv,
> +				   struct v4l2_frmsizeenum *fsize)
> +{
> +	/* The decoded format follows the bitstream, nothing to enumerate. */
> +	if (fsize->pixel_format =3D=3D V4L2_PIX_FMT_NV12 ||
> +	    fsize->pixel_format =3D=3D V4L2_PIX_FMT_GREY)
> +		return -ENOTTY;
> +
> +	if (fsize->pixel_format !=3D V4L2_PIX_FMT_JPEG)
> +		return -EINVAL;
> +
> +	if (fsize->index)
> +		return -EINVAL;
> +
> +	fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> +	fsize->stepwise.min_width =3D RKJPEGD_MIN_WIDTH;
> +	fsize->stepwise.max_width =3D RKJPEGD_MAX_SIZE;
> +	fsize->stepwise.step_width =3D RKJPEGD_CODED_STEP;
> +	fsize->stepwise.min_height =3D RKJPEGD_MIN_HEIGHT;
> +	fsize->stepwise.max_height =3D RKJPEGD_MAX_SIZE;
> +	fsize->stepwise.step_height =3D RKJPEGD_CODED_STEP;

This is the coded size. I'd expect this to be continuous. You just have
to make sure that the decoded buffer is properly aligned and set the
PADDED selection rectangle accordingly.

[...]
> +/*
> + * The block is not free-running: it only raises an interrupt for a job =
that
> + * rkjpegd_vdpu720_run() started, and that job holds a runtime PM refere=
nce
> + * until it is finished.  The registers are always clocked here.
> + */
> +static irqreturn_t rkjpegd_vdpu720_irq(int irq, void *dev_id)
> +{
> +	struct rkjpegd_dev *jpegd =3D dev_id;
> +	enum vb2_buffer_state state;
> +	u32 status;
> +
> +	status =3D rkjpegd_read(jpegd, VDPU720_REG_INT);
> +
> +	/* First phase of the IRQ clear, see VDPU720_IRQ_CLR_KEEP. */
> +	rkjpegd_write(jpegd, status & VDPU720_IRQ_CLR_KEEP, VDPU720_REG_INT);
> +
> +	if (!(status & VDPU720_IRQ_RAW))
> +		return IRQ_NONE;
> +
> +	rkjpegd_write(jpegd, 0, VDPU720_REG_INT);
> +
> +	state =3D (status & VDPU720_ERR_MASK) ?
> +		VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
> +
> +	/*
> +	 * A block that did not park itself wedges on the next frame, and a
> +	 * clean frame can leave it unparked too, as SOFT_RST_RDY shows.  The
> +	 * reset sleeps, so leave it to rkjpegd_vdpu720_run().  The next job
> +	 * is only started after job_spinlock has released this one, which
> +	 * orders the store.
> +	 */
> +	if (state =3D=3D VB2_BUF_STATE_ERROR || !(status & VDPU720_SOFT_RST_RDY=
))
> +		jpegd->needs_reset =3D true;
> +
[...]
> +
> +	rkjpegd_irq_done(jpegd, state);

Why is this hidden in a separate function call?

> +	return IRQ_HANDLED;
> +}
> +
> +static void rkjpegd_watchdog(struct work_struct *work)
> +{
> +	struct rkjpegd_dev *jpegd =3D container_of(to_delayed_work(work),
> +						 struct rkjpegd_dev,
> +						 watchdog_work);
> +	/* Only armed while a job runs, so there is always a context. */
> +	struct rkjpegd_ctx *ctx =3D v4l2_m2m_get_curr_priv(jpegd->m2m_dev);
> +
> +	dev_err(jpegd->dev, "frame processing timed out\n");
> +
> +	rkjpegd_vdpu720_reset(ctx);
> +	rkjpegd_job_finish(ctx, VB2_BUF_STATE_ERROR);
> +}
[...]
> +static int rkjpegd_buf_out_validate(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +
> +	vbuf->field =3D V4L2_FIELD_NONE;

Hmm, "drivers can use this to validate userspace-provided information".
Is this really validation?

It seems a lot of drivers have exactly the same function:

  vpu_vb2_buf_out_validate()
  cedrus_buf_out_validate()
  mdp_m2m_buf_out_validate()
  vb2ops_venc_buf_out_validate()
  tegra_buf_out_validate()
  dw100_buf_out_validate()
  mxc_jpeg_buf_out_validate()
  rkvdec_buf_out_validate()
  hantro_buf_out_validate()
  vicodec_buf_out_validate()
  visl_buf_out_validate()

At least e5010_buf_out_validate() and
dma2d_buf_out_validate() warn or fail, respectively, if the field value
is invalid.

Is overwriting field to NONE what this callback was designed for, and
if so, does this warrant a common helper?

> +
> +	return 0;
> +}
>=20
[...]
> +
> +static int rkjpegd_resume(struct device *dev)
> +{
> +	struct rkjpegd_dev *jpegd =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D pm_runtime_force_resume(dev);

I'd expect this to not call v4l2_m2m_resume() if runtime PM resume
failed.

> +	v4l2_m2m_resume(jpegd->m2m_dev);
> +
> +	return ret;
> +}

regards
Philipp
