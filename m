Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795518834;
	b=DsX2Ubmm8N1CziDF0RGxOQp1qoLbB8+u0UMi3rYnmfRd5GdDqwPWZXp/WktUQNuQ5hsi
	 5sCXmSBb8JXd37DVMLxHjvgEH2RcZTnGI5r9gu6hNQEeU1aJt+iYM7qa+Ph5B96WV/VO7
	 dxYm34xh5RKIsYtSS8lR4h0w0zNUlr8+iG4bM9R74cLX6RhTpUhsnUIPdgGjGWpgWX2ta
	 0TJWghQwP/X9woUkMDSXGlJ2L808WT+zDwMhc4Q6WsiLqLQrX9uWQRWYRNsiyCpYEVoh1
	 o5Z/RT8D6ogjiuilve1mdrRukOfbsofe2PjTxH0QWiRPXc0OxgLgka5nyiN9TK3AmYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518834;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=MfEQmLzVnzqI7m2lqYo1pqWM0gl9CNYWa4Ac9CFFWv0=;
	b=u1q25hPDMMXScPiqCpN0NgmiTH9YGGlznmLgDCOISdkh+4IMDCX82R8cAYAEHuxfnFqI
	 1sjQbD7od4oQz/mz9duV3hCLS1bPjisi/6oF3qkF2KL6svdv3IH8Wuqsv8i3tV3SrxEnC
	 rsNrHung02Dt4asoTyProrrqK8fCP+UCIoynVxKHleBa/p5sqj3vHt5RS4dFhDuNh+HeG
	 1Ax4le5UDg+vtkuziD8f11j4fzVSF6zGoPady1txAzaJM4Sm2XTBGrX8S4mqB6uYbbjXe
	 NJ3n3HTPEGDepPG79B/wUVYUJ9axqAbKDnjvs6bazMRPS+EFJQuJvn4dz+oBYiduHXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=IWeCNZmq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0A1606A321;
	Tue, 24 Nov 2026 11:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D0A1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=IWeCNZmq
ARC-Seal: i=1; a=rsa-sha256; t=1795518805; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eK0eepmqMSvkf0GrfHITGMe6DFi+wIskbqnl+WtZxASLA3m0M7sIvu1/qIgk0aitoGxq0CP8hx8wMFMTC3RAllXiOLwV0RY38vV/PiBCJWX4L2H8JjRACJCkIxvD/Tmz8L1uC22jMjzoAMAB9xgx1FBl7troUdR2P5sTwdFKt1U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795518805; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MfEQmLzVnzqI7m2lqYo1pqWM0gl9CNYWa4Ac9CFFWv0=; 
	b=iyyzGtg/n9yQu1mTuaS1BKHxt/iHhNmKLfMWVnehyJ25wJq74aGyyimL9iU2qn+YHphD7oQ4fTXJn2we+7W/5aFJEJYAh743B1VlrZ9DCHw1BItwF/ossMrt6PvHPeLaq7lOf7Z/mdKGE3AbbxM27m2Vrf24AcpJ/xheRH3uI4w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=IWeCNZmqsKypm3Ta5dHIg3W+tiosmzZ7SCWOmMH3kEju94TutVQcDYWOkETSEeiOg8ZDuf8tch2LxQTe+DH8CwuJWWQhdrw1u8D1ZUqtrLjS+PRPy+Qm1VVJt8AujTWhDmCBU5EQBlx+/03KwjKIikxkPNDj7jf27oyzO/yfqDE=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=MfEQmLzVnzqI7m2lqYo1pqWM0gl9CNYWa4Ac9CFFWv0=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795518803574849.9086752465729;
	Tue, 24 Nov 2026 03:13:23 -0800 (PST)
Message-ID: <5f21a764-41f3-4515-871d-64e83bb44f89@collabora.com>
Date: Tue, 24 Nov 2026 12:13:20 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: rockchip: rkcif: Honour the requested
 bytesperline
To: Faizel K B <faizel.kb@gmail.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, libcamera-devel@lists.libcamera.org,
 Robert Mader <robert.mader@collabora.com>
References: <20261118203134.315591-1-faizel.kb@gmail.com>
 <20261118203134.315591-3-faizel.kb@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261118203134.315591-3-faizel.kb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Faizel,

Thanks for the patch.

On 11/18/26 21:31, Faizel K B wrote:
> The DMA uses bytesperline as the line stride, which must be a multiple
> of 8 bytes, but v4l2_fill_pixfmt_mp() doesn't align it. Any larger
> bytesperline requested by userspace is also replaced with the minimum.
> 
> Align bytesperline to 8 bytes and honour the largest value requested
> for any plane, up to the limit of the line width register. The Y and
> UV planes share the same line width. On the DVP, program the line width
> from bytesperline, keeping the current value as the minimum.
> 
> This allows DMA-BUF importers that need a larger stride alignment to
> use the buffers directly.
> 
> Signed-off-by: Faizel K B <faizel.kb@gmail.com>
> ---
>  .../rockchip/rkcif/rkcif-capture-dvp.c        |  4 ++
>  .../rockchip/rkcif/rkcif-capture-mipi.c       |  3 ++
>  .../platform/rockchip/rkcif/rkcif-common.h    |  1 +
>  .../platform/rockchip/rkcif/rkcif-stream.c    | 48 ++++++++++++++++++-
>  4 files changed, 54 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
> index dbaf7636aeeb..64a37d6877e2 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
> @@ -20,6 +20,8 @@
>  #include "rkcif-regs.h"
>  #include "rkcif-stream.h"
>  
> +#define RKCIF_DVP_MAX_BYTESPERLINE 0x7ff8 /* VIR_LINE_WIDTH: 15 bits */
> +
>  static const struct rkcif_output_fmt dvp_out_fmts[] = {
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV16,
> @@ -689,6 +691,7 @@ static int rkcif_dvp_start_streaming(struct rkcif_stream *stream)
>  	val = stream->pix.width;
>  	if (active_in_fmt->fmt_type == RKCIF_FMT_TYPE_RAW)
>  		val = stream->pix.width * 2;
> +	val = max(val, stream->pix.plane_fmt[0].bytesperline);
>  	rkcif_dvp_write(rkcif, RKCIF_DVP_VIR_LINE_WIDTH, val);
>  
>  	val = RKCIF_XY_COORD(stream->pix.width, stream->pix.height);
> @@ -827,6 +830,7 @@ int rkcif_dvp_register(struct rkcif_device *rkcif)
>  		stream->interface = interface;
>  		stream->out_fmts = rkcif->match_data->dvp->out_fmts;
>  		stream->out_fmts_num = rkcif->match_data->dvp->out_fmts_num;
> +		stream->max_bytesperline = RKCIF_DVP_MAX_BYTESPERLINE;
>  		stream->queue_buffer = rkcif_dvp_queue_buffer;
>  		stream->start_streaming = rkcif_dvp_start_streaming;
>  		stream->stop_streaming = rkcif_dvp_stop_streaming;
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> index 53e62d059764..d5eaedd2c43b 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> @@ -24,6 +24,8 @@
>  #include "rkcif-regs.h"
>  #include "rkcif-stream.h"
>  
> +#define RKCIF_MIPI_MAX_BYTESPERLINE 0xffff8 /* VLW: 20 bits */
> +
>  #define RK3568_MIPI_CTRL0_HIGH_ALIGN  BIT(31)
>  #define RK3568_MIPI_CTRL0_UV_SWAP_EN  BIT(7)
>  #define RK3568_MIPI_CTRL0_COMPACT_EN  BIT(6)
> @@ -1026,6 +1028,7 @@ int rkcif_mipi_register(struct rkcif_device *rkcif)
>  			stream->interface = interface;
>  			stream->out_fmts = mipi_out_fmts;
>  			stream->out_fmts_num = ARRAY_SIZE(mipi_out_fmts);
> +			stream->max_bytesperline = RKCIF_MIPI_MAX_BYTESPERLINE;
>  			stream->queue_buffer = rkcif_mipi_queue_buffer;
>  			stream->start_streaming = rkcif_mipi_start_streaming;
>  			stream->stop_streaming = rkcif_mipi_stop_streaming;
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> index 08a213438d34..63e5a221cd73 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> @@ -145,6 +145,7 @@ struct rkcif_stream {
>  	struct rkcif_interface *interface;
>  	const struct rkcif_output_fmt *out_fmts;
>  	unsigned int out_fmts_num;
> +	u32 max_bytesperline;
>  
>  	/* in ping-pong mode, two buffers can be provided to the HW */
>  	struct rkcif_buffer *buffers[2];
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> index b117ba57bc75..f700b40ab099 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -23,6 +23,7 @@
>  #define CIF_MIN_HEIGHT	 64
>  #define CIF_MAX_WIDTH	 8192
>  #define CIF_MAX_HEIGHT	 8192
> +#define CIF_BYTESPERLINE_ALIGN 8
>  
>  static inline struct rkcif_buffer *to_rkcif_buffer(struct vb2_v4l2_buffer *vb)
>  {
> @@ -334,20 +335,63 @@ static const struct vb2_ops rkcif_stream_vb2_ops = {
>  	.stop_streaming = rkcif_stream_stop_streaming,
>  };
>  
> +static u32 rkcif_stream_plane_lines(const struct v4l2_format_info *info,
> +				    unsigned int plane, u32 height)
> +{
> +	return plane ? DIV_ROUND_UP(height, info->vdiv) : height;
> +}

Is this the same as v4l2_format_plane_height? And if yes, would it make
sense to reuse this one (of course it must be made public for that)?

> +
> +static void rkcif_stream_set_bytesperline(struct rkcif_stream *stream,
> +					  struct v4l2_pix_format_mplane *pix,
> +					  u32 req_bpl)
> +{
> +	const struct v4l2_format_info *info = v4l2_format_info(pix->pixelformat);
> +	u32 bpl = pix->plane_fmt[0].bytesperline;
> +	u32 total_lines = 0, max_bpl;
> +	unsigned int i;
> +
> +	for (i = 0; i < info->comp_planes; i++)
> +		total_lines += rkcif_stream_plane_lines(info, i, pix->height);

Just to be on the same page: What exactly are you doing here?

> +
> +	max_bpl = min(stream->max_bytesperline,
> +		      ALIGN_DOWN(U32_MAX / total_lines, CIF_BYTESPERLINE_ALIGN));
> +	if (req_bpl > bpl && req_bpl <= max_bpl)
> +		bpl = ALIGN(req_bpl, CIF_BYTESPERLINE_ALIGN);
> +
> +	/* The Y and UV planes share the same line width. */
> +	if (info->mem_planes == 1) {
> +		pix->plane_fmt[0].bytesperline = bpl;
> +		pix->plane_fmt[0].sizeimage = bpl * total_lines;
> +	} else {
> +		for (i = 0; i < info->mem_planes; i++) {
> +			pix->plane_fmt[i].bytesperline = bpl;
> +			pix->plane_fmt[i].sizeimage =
> +				bpl * rkcif_stream_plane_lines(info, i,
> +							       pix->height);

v4l2_format_plane_size?

> +		}
> +	}
> +}
> +
>  static int rkcif_stream_fill_format(struct rkcif_stream *stream,
>  				    struct v4l2_pix_format_mplane *pix)
>  {
>  	const struct rkcif_output_fmt *fmt;
> -	u32 height, width;
> +	u32 height, width, req_bpl = 0;
> +	unsigned int i;
>  	int ret;
>  
>  	fmt = rkcif_stream_find_output_fmt(stream, true, pix->pixelformat);
>  	height = clamp_t(u32, pix->height, CIF_MIN_HEIGHT, CIF_MAX_HEIGHT);
>  	width = clamp_t(u32, pix->width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
> -	ret = v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);
> +	for (i = 0; i < pix->num_planes; i++)
> +		req_bpl = max(req_bpl, pix->plane_fmt[i].bytesperline);
> +	ret = v4l2_fill_pixfmt_mp_aligned(pix, fmt->fourcc, width, height,
> +					  CIF_BYTESPERLINE_ALIGN);
>  	if (ret)
>  		return ret;
>  
> +	rkcif_stream_set_bytesperline(stream, pix, req_bpl);

Wouldn't calling v4l2_fill_pixfmt_mp_aligned(pix, fmt->fourcc, width,
height, req_bpl) do the trick?

In summary: I think this is a common problem, so there should be a
common solution. Reuse helpers, or extend them if required.

Best regards,
Michael

> +
>  	pix->field = V4L2_FIELD_NONE;
>  
>  	return 0;

