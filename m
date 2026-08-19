Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C850921CC59;
	Wed, 19 Aug 2026 12:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787143586; cv=none; b=gwp0aL76scHN7jtP/JEyhwAt8baMJQuyc9+gsm/mgOJA6+reD1kSVgLgUVzeX6NvSKWqgqkX1eey5hvQXx/YJS+K0oSyQ+gjVNzDDyadNjsR4T0Rfgpot669P9tPVstuGQ3Y3/ILSAXuxm+HzCWw7Eyi6nASLCDG2jDX91GQTXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787143586; c=relaxed/simple;
	bh=GhkXEFaq/NS7ZJS51N294NGsTsT3td9OqiJBMbrknKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ejpjsvr7gCcNEz0xvY4Bu+q7i8GZ+/RCjXeQlaoF+shR0+moay6JJiLX9WGa9pLXW3STBKFlxL5+3Cs7YgNl9PrJXCHGjjLakqNnBH3BCDym8ZrW/I9FDeuaXypaqkN0w7APGsrCs6OnbkTaVRnBPqTo/0P0S+KxWomcCpk4+Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=c60JtS49; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="c60JtS49"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=tUgb1cSpQmg48mQ4LeBUx+FaaJ2tUQcxNw47rzDBl0M=; b=c60JtS49PMHVt+c/VQa3RMOhX9
	JKyBgGVwi/gCexVHLprpOqe2nC4fd5r4AVyZ2bJeQRrsdS9yz5zjC8dqjXG3bDnn9ICBfrmfEuFFe
	d4DeLFRKOxoRWHlDCtXYC7mPwlAdiaL8gR3CVuPEq6VAdsI7FS4FG33eydwTBpc7RXNPSyBML/nA5
	d3hx4AGWwBOd4zClcdEpQBfTCT3x3jWSkvN4vq85KTbmdqAEas/djWDYFA3XQgvEednYBAjaMHFQg
	s28+3zbULNM4zJXO6ivQr/9rZkfLYJLaNd7o/yfgXdoy8o86c/jq28mwCtvqXyZVSvHS2yefvUyyA
	mayaMPOg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lucas Sinn <lucas.sinn@wolfvision.net>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 5/7] media: verisilicon: Add Rockchip VPU720 JPEG decoder
Date: Wed, 19 Aug 2026 14:46:10 +0200
Message-ID: <5715409.BjyWNHgNrj@diego>
In-Reply-To: <20260819-rk3588-jpegdec-v1-5-33d74cdf369c@pengutronix.de>
References:
 <20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de>
 <20260819-rk3588-jpegdec-v1-5-33d74cdf369c@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Am Mittwoch, 19. August 2026, 12:37:34 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Sascha Hauer:
> From: Lucas Sinn <lucas.sinn@wolfvision.net>
>=20
> Add support for the Rockchip VPU720 JPEG hardware decoder on RK3588
> to the verisilicon hantro driver.
>=20
> Hardware requirements:
> - CPU-side JPEG header parsing via v4l2_jpeg_parse_header()
> - DMA side buffer with Q-tables (zigzag->raster), Huffman mincode
>   and value tables
> - VPU720-specific two-phase IRQ clear sequence
> - 16-byte stream alignment with start-byte offset
> - MCU-aligned PIC_H (e.g. 1080p YUV420 needs 1088, not 1080)
> - FILL_DOWN_E on every NV12 conversion, the output chroma is vertically
>   subsampled so the hardware completes the bottom of the picture
> - DRI (restart interval) support when present
>=20
> Implementation adds:
> - HANTRO_JPEG_DECODER codec and HANTRO_MODE_JPEG_DEC mode
> - struct hantro_jpeg_dec_hw_ctx holding the Q/H table side buffer,
>   which is rebuilt from the frame header on every run
> - src_needs_kmap and dst_needs_kmap flags for vb2_plane_vaddr() without
>   DMA_ATTR_NO_KERNEL_MAPPING
> - a neutral chroma plane written by the driver for a grayscale frame.
>   The output format converter has no YUV400 path, so the hardware writes
>   the luma plane and leaves the chroma alone, which comes out green
> - rockchip_vpu720_jpeg_dec_run() for parse/fill/program/kick
> - rejection of a frame that carries no EOI marker, which is what a
>   source buffer too small for the frame looks like
> - rejection of a frame larger than the negotiated capture format,
>   whose dimensions would otherwise be programmed against strides
>   taken from that format
> - IRQ handler with detailed error diagnostics (REG32/33:
>   MCU position, error flags) and soft-reset
> - AXI perf counter setup (REG30)
>=20
> Exposes one V4L2 M2M device: JPEG input -> NV12 output.
>=20
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Lucas Sinn <lucas.sinn@wolfvision.net>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/media/platform/verisilicon/Makefile        |   1 +
>  drivers/media/platform/verisilicon/hantro.h        |  17 +
>  drivers/media/platform/verisilicon/hantro_drv.c    |  17 +-
>  drivers/media/platform/verisilicon/hantro_hw.h     |  17 +
>  drivers/media/platform/verisilicon/hantro_v4l2.c   |  38 +-
>  .../verisilicon/rockchip_vpu720_hw_jpeg_dec.c      | 962 +++++++++++++++=
++++++
>  .../platform/verisilicon/rockchip_vpu720_regs.h    | 261 ++++++
>  .../media/platform/verisilicon/rockchip_vpu_hw.c   |  80 ++
>  8 files changed, 1385 insertions(+), 8 deletions(-)
>=20

> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/=
platform/verisilicon/hantro.h
> index 0353de154a1ec..00e0f5981cca3 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -39,6 +39,7 @@ struct hantro_postproc_ops;
>  #define HANTRO_HEVC_DECODER	BIT(19)
>  #define HANTRO_VP9_DECODER	BIT(20)
>  #define HANTRO_AV1_DECODER	BIT(21)
> +#define HANTRO_JPEG_DECODER	BIT(22)
>  #define HANTRO_DECODERS		0xffff0000
> =20
>  /**
> @@ -102,6 +103,19 @@ struct hantro_variant {
>  	unsigned int double_buffer : 1;
>  	unsigned int legacy_regs : 1;
>  	unsigned int late_postproc : 1;
> +	/*
> +	 * src_needs_kmap: when set, the source queue will be allocated with
> +	 * a kernel virtual address so the driver can CPU-parse the bitstream
> +	 * (e.g. for JPEG header parsing).
> +	 */

there is already a struct documentation present, so there is
=2D no need to put that huge comment here, this can be shortened
=2D the actual field-documentation is missing

probably true for more places


> +	unsigned int src_needs_kmap : 1;
> +	/*
> +	 * dst_needs_kmap: when set, the capture queue will be allocated with
> +	 * a kernel virtual address so the driver can write the parts of a
> +	 * frame the hardware does not produce (e.g. the chroma plane of a
> +	 * grayscale JPEG).
> +	 */
> +	unsigned int dst_needs_kmap : 1;
>  	const struct of_device_id *shared_devices;
>  };
> =20
> @@ -115,6 +129,7 @@ struct hantro_variant {
>   * @HANTRO_MODE_HEVC_DEC: HEVC decoder.
>   * @HANTRO_MODE_VP9_DEC: VP9 decoder.
>   * @HANTRO_MODE_AV1_DEC: AV1 decoder
> + * @HANTRO_MODE_JPEG_DEC: VPU720 JPEG decoder

here it worked correctly, it seems.

>   */
>  enum hantro_codec_mode {
>  	HANTRO_MODE_NONE =3D -1,
> @@ -125,6 +140,7 @@ enum hantro_codec_mode {
>  	HANTRO_MODE_HEVC_DEC,
>  	HANTRO_MODE_VP9_DEC,
>  	HANTRO_MODE_AV1_DEC,
> +	HANTRO_MODE_JPEG_DEC,
>  };
> =20
>  /*
> @@ -276,6 +292,7 @@ struct hantro_ctx {
>  		struct hantro_hevc_dec_hw_ctx hevc_dec;
>  		struct hantro_vp9_dec_hw_ctx vp9_dec;
>  		struct hantro_av1_dec_hw_ctx av1_dec;
> +		struct hantro_jpeg_dec_hw_ctx jpeg_dec;

here the documentation for the new field is missing completely

>  	};
>  };
> =20

> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu720_hw_jpeg_d=
ec.c b/drivers/media/platform/verisilicon/rockchip_vpu720_hw_jpeg_dec.c
> new file mode 100644
> index 0000000000000..81fd79911d694
> --- /dev/null
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu720_hw_jpeg_dec.c
> @@ -0,0 +1,962 @@

> +	/*
> +	 * REG2: system config =E2=80=93 always output NV12.
> +	 *
> +	 * FILL_DOWN_E belongs to the NV12 conversion rather than to a
> +	 * particular pair of heights: the output chroma is vertically
> +	 * subsampled, so the hardware has to complete the bottom of the
> +	 * picture.  Two cases need it:
> +	 *
> +	 *  a) jpeg_height is not on an MCU boundary (e.g. YUV420 1080p:
> +	 *     jpeg_height=3D1080, jpeg_height_aligned=3D1088, buf_height=3D108=
8).
> +	 *     The VPU720 needs FILL_DOWN_E to complete the last MCU row's
> +	 *     chroma reconstruction.  Without it the bottom rows are corrupt
> +	 *     even though PIC_H is already set to the MCU-aligned height.
> +	 *
> +	 *  b) MCU-aligned height < buf_height (e.g. YUV422 1080p: mcu_h=3D8,
> +	 *     jpeg_height_aligned=3D1080, buf_height=3D1088).  The hardware fi=
lls
> +	 *     rows 1080..1087 by repeating the last valid row.
> +	 *
> +	 * A height that is a multiple of 16 leaves nothing to fill, but the
> +	 * bit is set there as well: the reference driver enables it for every
> +	 * NV12 conversion, whatever the picture and buffer heights are.
> +	 *
> +	 * FILL_RIGHT_E does the same for the right hand edge, but there it
> +	 * depends on the mode.  The decoder writes whole MCUs, so the last
> +	 * MCU column ends at ALIGN(jpeg_width, mcu_width) while the buffer is
> +	 * 16 pixel aligned.  Only the 8 pixel MCU widths can stop short of
> +	 * that and need the columns in between filled; a 16 or 32 pixel MCU
> +	 * already reaches at least as far.  The reference driver arrives at
> +	 * the same set through a per mode test on (width & 0xf) <=3D 8.
> +	 */
> +	reg =3D FIELD_PREP(VDPU720_YUV_OUT_FMT, VDPU720_YUV_OUT_FMT_NV12) |
> +	      VDPU720_FILL_DOWN_E;
> +	if (ALIGN(jpeg_width, mcu_width) < ALIGN(jpeg_width, 16))
> +		reg |=3D VDPU720_FILL_RIGHT_E;
> +	vdpu_write_relaxed(vpu, reg, VDPU720_REG_SYS);
> +
> +	/*
> +	 * --- REG3: picture dimensions ---

can we have one consistent comment style please?

> +	 *
> +	 * PIC_W stays at the raw header width while PIC_H is rounded up to
> +	 * the MCU boundary.  Rounding the width up the same way is not safe:
> +	 * mcu_width reaches 32 for YUV411, so ALIGN(jpeg_width, mcu_width)
> +	 * can land beyond the 16 pixel aligned buffer width and point the
> +	 * decoder past the end of a row.  FILL_RIGHT_E above covers the cases
> +	 * where the MCU column stops short instead.  The reference driver
> +	 * programs the raw width here too.
> +	 */
> +	vdpu_write_relaxed(vpu,
> +			   FIELD_PREP(VDPU720_PIC_W_M1, jpeg_width - 1) |
> +			   FIELD_PREP(VDPU720_PIC_H_M1, jpeg_height_aligned - 1),
> +			   VDPU720_REG_PIC_SIZE);
> +

[...]

> +/*
> + * vdpu720_fill_chroma - write neutral chroma for a grayscale frame.
> + *
> + * The output format converter has no YUV400 path: VDPU720_YUV_OUT_FMT_N=
V12
> + * only covers the subsampled colour modes, and for a single component f=
rame
> + * the hardware writes the luma plane and leaves the chroma plane untouc=
hed.
> + *
> + * Fill the plane here, before the hardware is started: once the decode =
is
> + * running the interrupt can complete the job and hand the buffer to
> + * userspace at any time.
> + */
> +static int vdpu720_fill_chroma(struct hantro_ctx *ctx,
> +			       struct vb2_v4l2_buffer *dst_buf)

[...]

> +/**
> + * rockchip_vpu720_jpeg_dec_init() - allocate the per-context DMA side b=
uffer
> + * @ctx:	context to allocate the Q/Huffman table buffer for
> + *
> + * Return: 0 on success, -ENOMEM if the buffer could not be allocated.
> + */

again comment style ( "/**", also the ctx line could use a blank line above=
 it)
Seemingly one function before this the LLM did get it right?

Same applies for repeats below.

> +int rockchip_vpu720_jpeg_dec_init(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu =3D ctx->dev;
> +	struct hantro_jpeg_dec_hw_ctx *jpeg_ctx =3D jpeg_dec_ctx(ctx);
> +
> +	jpeg_ctx->table_base.size =3D VDPU720_TABLE_BUF_SIZE;
> +	jpeg_ctx->table_base.cpu  =3D
> +		dma_alloc_noncoherent(vpu->dev,
> +				      jpeg_ctx->table_base.size,
> +				      &jpeg_ctx->table_base.dma,
> +				      DMA_TO_DEVICE, GFP_KERNEL);
> +	if (!jpeg_ctx->table_base.cpu)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +

[...]

> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu720_regs.h b/=
drivers/media/platform/verisilicon/rockchip_vpu720_regs.h
> new file mode 100644
> index 0000000000000..cae9052126be1
> --- /dev/null
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu720_regs.h
> @@ -0,0 +1,261 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip VPU720 JPEG decoder register definitions
> + *
> + * Derived from downstream Rockchip MPP HAL (hal_jpegd_rkv_reg.h).
> + * Copyright (C) 2020 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2026 WolfVision GmbH
> + */
> +#ifndef ROCKCHIP_VPU720_REGS_H_
> +#define ROCKCHIP_VPU720_REGS_H_
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/align.h>
> +#include <linux/types.h>
> +
> +/* ------------------------------------------------------------------ */
> +/* Register byte offsets from dec_base                                 */
> +/* ------------------------------------------------------------------ */

less dashed lines maybe? ;-)

> +
> +/* REG0: IP version / product ID */

no need the same information when the register naming is obvious.
Same for the below registers

> +#define VDPU720_REG_VERSION		0x000
> +#define VDPU720_PROD_NUM		GENMASK(31, 16)
> +#define VDPU720_BIT_DEPTH		BIT(8)
> +
> +/* REG1: Interrupt control and status */
> +#define VDPU720_REG_INT			0x004

[...]

> +/* ------------------------------------------------------------------ */
> +/* Side-buffer layout for Q-tables and Huffman tables                  */
> +/*                                                                     */
> +/* The VPU720 JPEG decoder reads quantisation tables and Huffman       */
> +/* tables from a contiguous DMA buffer with the following layout:      */
> +/*                                                                     */
> +/*   [0,         QTBL_SIZE):    Q-table data (u16, raster-scan order) */
> +/*   [HMINCODE_OFF, +HMIN_SZ):  Huffman mincode table                 */
> +/*   [HVALUE_OFF,  +HVAL_SZ):   Huffman value table                   */
> +/* ------------------------------------------------------------------ */
> +/* The Q-tables are per component, one entry each */

again, the comment style is very strange

[...]

> @@ -816,3 +831,68 @@ const struct hantro_variant rk3588_vpu981_variant =
=3D {
>  	.clk_names =3D rk3588_vpu981_vpu_clk_names,
>  	.num_clocks =3D ARRAY_SIZE(rk3588_vpu981_vpu_clk_names)
>  };
> +
> +/* ------------------------------------------------------------------ */
> +/* RK3588 VPU720 JPEG decoder                                          */
> +/* ------------------------------------------------------------------ */
> +
> +/*
> + * Capture format: NV12.  The JPEG codec entry is listed last.
> + */
> +static const struct hantro_fmt rk3588_vpu720_dec_fmts[] =3D {
> +	{
> +		.fourcc    =3D V4L2_PIX_FMT_NV12,
> +		.codec_mode =3D HANTRO_MODE_NONE,
> +		.frmsize   =3D {
> +			.min_width  =3D FMT_MIN_WIDTH,
> +			.max_width  =3D VPU720_JPEGD_MAX_SIZE,
> +			.step_width =3D MB_DIM,
> +			.min_height =3D FMT_MIN_HEIGHT,
> +			.max_height =3D VPU720_JPEGD_MAX_SIZE,
> +			.step_height =3D MB_DIM,
> +		},
> +	},
> +	{
> +		.fourcc    =3D V4L2_PIX_FMT_JPEG,
> +		.codec_mode =3D HANTRO_MODE_JPEG_DEC,
> +		.max_depth  =3D 2,
> +		.frmsize   =3D {
> +			.min_width  =3D FMT_MIN_WIDTH,
> +			.max_width  =3D VPU720_JPEGD_MAX_SIZE,
> +			.step_width =3D VPU720_JPEGD_STEP,
> +			.min_height =3D FMT_MIN_HEIGHT,
> +			.max_height =3D VPU720_JPEGD_MAX_SIZE,
> +			.step_height =3D VPU720_JPEGD_STEP,
> +		},
> +	},
> +};
> +
> +static const struct hantro_codec_ops rk3588_vpu720_codec_ops[] =3D {
> +	[HANTRO_MODE_JPEG_DEC] =3D {
> +		.run   =3D rockchip_vpu720_jpeg_dec_run,
> +		.reset =3D rockchip_vpu720_reset,
> +		.init  =3D rockchip_vpu720_jpeg_dec_init,
> +		.exit  =3D rockchip_vpu720_jpeg_dec_exit,
> +	},
> +};
> +
> +static const struct hantro_irq rk3588_vpu720_irqs[] =3D {
> +	{ "vdpu", rockchip_vpu720_irq },
> +};
> +
> +static const char * const rk3588_vpu720_clk_names[] =3D {
> +	"aclk", "hclk",
> +};
> +
> +const struct hantro_variant rk3588_vpu720_variant =3D {
> +	.dec_fmts     =3D rk3588_vpu720_dec_fmts,
> +	.num_dec_fmts =3D ARRAY_SIZE(rk3588_vpu720_dec_fmts),
> +	.codec        =3D HANTRO_JPEG_DECODER,
> +	.codec_ops    =3D rk3588_vpu720_codec_ops,
> +	.irqs         =3D rk3588_vpu720_irqs,
> +	.num_irqs     =3D ARRAY_SIZE(rk3588_vpu720_irqs),
> +	.clk_names    =3D rk3588_vpu720_clk_names,
> +	.num_clocks   =3D ARRAY_SIZE(rk3588_vpu720_clk_names),
> +	.src_needs_kmap =3D 1,
> +	.dst_needs_kmap =3D 1,
> +};

could you move the individual parts to the correct places in the file?
All the other variants are clustered together, with their specific
fmt, etc definitions being in other clusters above that.


Heiko



