Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686142;
	b=pWMWXSm/NnBkOMuQJtEIKaTkGn6H9I7IXOt98WNAsQP7EbvrDfUiLQEhjHYUHWHFfzYC
	 BVcXV9lzoVnGPF3Ac4VlWWCFKLa2UyH0KVfGeYJ53FkHHoCUFk/1Tox+uI+7cWssPGq6j
	 eHxKUcSJ3YISNxymalFgoL/vBVnnh1uxaWZUFthqaGewiJspDK5Yxeozzo+vQh1p0IDRo
	 DL0T8yjo9Ot72olMtl6l47Y+ICF2RmGgUGq0wgLeEHblG9RKP+s3wdKqC9yYzAGI4F9gO
	 soQQzQcnseBM0vvW2omIBBr4O3FYT7X6xHkvDSwnKmcbic9p6k0wzG2ivx1iYdhfZZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686142;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=0H8KRf2G1g9JLqHt8dAdhZnK30bPIxtEpediEO7EvrM=;
	b=SZ8lEJr0bVYFfdpgEJzneh+8C0Ajzh9ZODLoYAEWWsDDrct1rj4RyM/+CKGlKgcolvNR
	 Ub0BNLaSb1E5vkK9OPaelM6210N/DJjNcMzkAW1N0ZBWjNmfjtefvteB4qbWHWWzZPWt5
	 16TQH8ilz0I0ebJZIHUUgVyf8zMbAXsso/uv3Bx61TTdeAEYzMPyRh2jRtk4Weylo1iE6
	 Faxx3to5OLq+/kXtcmqu3j4i1TXg/XmiuZ5w7KtG6RZiNZMhA2Ilp4hlZVLLhubP83662
	 Uit3Lr3p245AB8i3t5sKKC+XT1cPYfLPVbED3bfFeq0hIHdviaBRveAjg7XCJR/t54g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=Pk4mo6+A;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=mcv1UNDM;
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DDD60A260C
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 19:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6DDD60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=Pk4mo6+A;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=mcv1UNDM
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 4B32EEC010F
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 14:55:41 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 14 Nov 2026 14:55:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794686141;
	 x=1794772541; bh=0H8KRf2G1g9JLqHt8dAdhZnK30bPIxtEpediEO7EvrM=; b=
	Pk4mo6+AHkkbIIqgHr9H/XX0WzprPa4qglHTx3VHGfCBTSZqYMzd956kLoqo5qSi
	iXEj3buBUp30jlgnocL6A5webP4VcOcksVjX1GhFenWEY7UzZY3xsUd6Hhi49G8i
	kShLJbGnsraLzbXo7FLvjlwNS2VorngsWvYv3nWnp2DBKfDivdSeXOTs3DYhSBHV
	MlH/CGSOWSzaxTRRnm9yqlB3SwHthHPJclJMQ1wstwABkgwZnYgk+D6jNn2McXUw
	NXs82LMMnvFva6XKGc+XLT4owhKaUTL3Oqw1XEYARURvjMiiKV9pOEkD2PhcoFAN
	Q1p1UX4gw8NsmgWzcJ4M+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794686141; x=
	1794772541; bh=0H8KRf2G1g9JLqHt8dAdhZnK30bPIxtEpediEO7EvrM=; b=m
	cv1UNDMGYeSl67v+64WkeJJ8EBvjIE705fFB0fBHwYyYBKfqLAVdRqY8lIAo+dlh
	goL3A60d6A08QOtSllFhtvmnEg1Y2cK4Kuuk0rwdzijqWxPvQcgL0fbR0DOkzI83
	I8lKhccSm0ObEXcdQ/hjXUhNzI7cyY0ff10GyeAYsK6Vnd/kcyIjKdUl4zEOgRsV
	8AlPRKhpMyvSzAsr8pO854umZwvcasDURbmhL3z6E0xiKKcmDt+5j/w/G9T1IeMK
	/oM9cbLL2IX/VcLNHnWFUs2dM7NmCVY0s48b+acBx0t+xxebQvFJnvqaBaC82Nl+
	NoSRQaaBHvLo7zXBWUSpA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794686141; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:TmqAzcZ8uVjoUVcgtav7INc1y1oEgGsGv4uw/dheRx+FdVO
	rNWftkr7Rb3dwZMcLCcktHHuCB/6RjdxHBSglAHRqKJ7HyRM8agqNzXdPPfGbLFY
	TizCdx8tPc5h2D62sjCRGOKJ3GZoInANb/ZeI2UqnVL24YGE5VCA8lMUCZ8AC2MC
	KzwDsmW4VYPuqKLLx50Fm0rbN7S+zZCMycAnQBr+vL3FfoqyZ6taEe8J28gFYgLl
	iwmM7OKdrs89tUH+zNItAUuRyyANPNzr0JMX7QJ2QO1IHolcizi835ihaP6WoOgt
	h7jHyVHeIVRbcC2GU4Tdh4kZLr5+E7kV2WIKHbw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:yjGo2zAiiKr4pBIUf4LW1KUeuaRUSwoCpMz9zWxvhWQ=:sVDx1e8+HoVhWQLIpwsc2Say5y0O/5MuGniHRR821bg=;
X-ME-Sender: <xms:vbz4aqI4sQXhp0brStQjlUXXgY2G_LIggPuLcqFHCmZg7MrNgjyU_w>
    <xme:vbz4au30WGRCMc9kcZClvOy0RuPhAQVm1W-7AD9ZBVK-gnr740utBuBpqd8UAkK6l
    o33TCECU1R2q3mrurU9_fy6zgjvk8QyzB9Lr4qzgQB3KLjkLN9ZZgixxA>
X-ME-Received: <xmr:vbz4aukZV3BF3TUcYYAZzdReR6wpsBSXqDeTCBRPIDJy-9UMoOQu5siNka4QhS-N7GuhSA6StKu8glVf8eTedevHr-6Oyds>
X-ME-Proxy-Cause: dmFkZTEfcippBG/v6bQO3P6y4QGADFamSyzZtbQMlJTx5yCYRelA1MauDCb2Ukp/l5QFE/
    E5N89alzkzlsjcNDfFy9rQXOERZsNFghLkWyVLL6U1wn28NmMpDqHp87qhAJpMRCBSpO+2
    yNEB4C8YrNOMYQ1MUj9+03cGl9aZrHDD1Hrgq+31wRdq6Sls6foeyu6NORV96z1DhaBYhV
    N2cYLPXsj+2W+HufRD3ZkUgr+V704uOshUyC2GwFIwndKbazYJiIkjaTdoCGXt8FounUDR
    L1o5V4nQOYVo76ZhPFMuKfhfc9ihZYOcbbYvjTqQD7e3/cjy+XVcjB9dlRdmWhzhfj3EOv
    GNAE8mX3xbmaGeZGh+HYcgrfZjK61w7SDNbpYwseGtpDxdRHmYbJc5gyqclygwuF9xrOrd
    OsvOIumAX12G70NsH22TmyM9a+pqLsW2knQkigv5C6L/VEY6bNhT21e+TiGx3s5DcGcmwm
    m21djAIomInpNAgLkr623MELz8nETjWnJ7sCupcf2T72UZikeOj5Pgek7l2Cqq9WqDa1RC
    yMypmNqPMzr1Ki7lQKUzpv+/vhJPITrehZevdpTUss4q/aNgyx33ItENjd78z6J6Zn0d3s
    PkEanUIOrE4rPbvRihABDtRqED66+RwqTsZZD8Sm6Y81UhCmxpcLR9ncc30A
X-ME-Proxy: <xmx:vbz4aphR76QsTMmZKHpvJENb4pEt1g8XG1VxOYR51Jbd1a2gFGoX1Q>
    <xmx:vbz4alSbywwemmMsnCz4x2QDsgvwCBDp_wGpcfhOU1QbVtq7OT71Iw>
    <xmx:vbz4aj_iLpo53mCrMnNbN_QRE5PGev40orTopmONYc39Mlt9Rpnl4g>
    <xmx:vbz4auN2uRjrXABa2iSKBBKSxcrCjLVzs6xbZovaG_pMDUlDAJYU5w>
    <xmx:vbz4ah27FlM8Oohwh4jQSPSMws5WDyHrnJQBiQdQ7h4hujQBIfl1Jjou>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Nov 2026 14:55:40 -0500 (EST)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date: Sat, 14 Nov 2026 20:55:19 +0100
Subject: [PATCH v2 4/4] media: rcar-isp: ispcore: Add NV12M support
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261114-v4l2-add-nv12-v2-4-a3f5ecfd48d6@ragnatech.se>
References: <20261114-v4l2-add-nv12-v2-0-a3f5ecfd48d6@ragnatech.se>
In-Reply-To: <20261114-v4l2-add-nv12-v2-0-a3f5ecfd48d6@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Jai Luthra <jai.luthra+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>, 
 Yusuke Goda <yusuke.goda.sx@renesas.com>, 
 Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6681;
 i=niklas.soderlund+renesas@ragnatech.se; h=from:subject:message-id;
 bh=sVDx1e8+HoVhWQLIpwsc2Say5y0O/5MuGniHRR821bg=;
 b=owEBbQKS/ZANAwAKAQm0/3kE+U0kAcsmYgBq+Lyxg/tjaPiTOROAmYJc/cmxB09ostxIh/IDx
 8MXevaLH92JAjMEAAEKAB0WIQRwy9J0OLNPX3a0+3gJtP95BPlNJAUCavi8sQAKCRAJtP95BPlN
 JI+OD/9xphmIDAAWFUyFAGNdS2UcwVKvXDnrrwcHgm/GHs1de1rHCc41wR0NDHGn02XNQ/LvkPb
 HNMOt+hLkXTc/fCWjZu/vhBOvdUkxzBWfmGLsfrwbYbxqryMB9sqvzgpg0/HBz1mSopQpS8cNpS
 4zvgcXQ353fhZyeJ1BKUk2PCCDyhYNVLBOSWgD1x9wAqZmXdg84aaxq7o5hKvE59edlTYPBU+vk
 f2ZoGvAuJwabflWD9zh26FO6UjEPPp5tQHjP73QNHig0KHZOeQXzzXhlReVhjsxVcv2HiZrb2xc
 GqkNIL0qI2Uzrz33M2OgP/gstOhADUOjFtAKv+lo/NhXJwR50BtHYYlMFoZy5CJk9+z83PASB+/
 bPp5wzWOE1NSA4jHjkdbJk+FiKuJrJtDiHoz2JKPuiLi635vnPTQLraiKLb5fpeX4sLAcpgl0hH
 5GXO7ooj/uStVuSnj9XzVowCjh4gap6i2EkvfLWOUa4ZHi0prVPGdT9icCYiKbi1MtMzB2CQgqF
 8FdDpa5AhDZBV5G2Fw8MiYC7HXdWT1En9rMyaEq62TDQGi0J4uxDopvJkK46jDc3rHOmko7ME6P
 /hJKxNLJn2x886neJmFdqhXP0rUpHIjOhOyoqHAjXxbDvJrPL19mq3HpKt0gvAxng+fmgYMnUhI
 2wtfHpB1VCA1WtQ==
X-Developer-Key: i=niklas.soderlund+renesas@ragnatech.se; a=openpgp;
 fpr=9976695FE98693307BF360A2F1591ABD9588DA5F

It is possible to support NV12M output by only outputting the CbCr plane
from even or odd lines. Enabling support for it is straightforward but
one snag around how the DMA-engine works.

When the DMA-engine is configured to only output CbCr data from odd or
even lines it still outputs blanks pixels to the buffer for the line
where no data is taken.

To work around this and still produce valid NV12 frames the device needs
to be configured so all blank pixels written to the buffer are part of
the line padding. In addition to also keeping the same number of padding
bytes as the Y plane.

The DMA-engine is able to do this as we can set different strides for
the two planes and haw two DMA-engine lines (one with data + some
padding and one with only padding) make up a single correctly formatted
NV12 CbCr line.

For readers comparing the DMA configuration with the datasheet this
driver takes the CbCr data from even lines, compared to odd lines in the
datasheet example. The reason for this is that if odd lines are used the
first even line adds half a NV12 line of padding at the start of the
CbCr plane. To counter this the CbCr plane would need a padding line at
the start of the plane which is not supported, or we would need to set
the plane start address half a line before the buffer actually starts
and potentially corrupt memory as we write blank bytes outside our
buffer.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-isp/core-io.c | 39 +++++++++++++++++++++-
 drivers/media/platform/renesas/rcar-isp/core.c    | 40 +++++++++++++++++++++++
 2 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core-io.c b/drivers/media/platform/renesas/rcar-isp/core-io.c
index 1c63194f6455..d3b302c5b66e 100644
--- a/drivers/media/platform/renesas/rcar-isp/core-io.c
+++ b/drivers/media/platform/renesas/rcar-isp/core-io.c
@@ -768,6 +768,39 @@ static void risp_io_capture_try_format(struct rcar_isp_core_io *io,
 	pix->xfer_func = V4L2_XFER_FUNC_SRGB;
 
 	switch (pix->pixelformat) {
+	case V4L2_PIX_FMT_NV12M:
+		pix->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+		pix->num_planes = 2;
+		/*
+		 * The DMA-engine still outputs pixels for the height lines of
+		 * the CrCb plane. To produce a NV12 frame we must ensure all
+		 * these blank pixels are in the padding area of the frame.
+		 *
+		 * To do this the stride of the CrCb plane need to be half that
+		 * of the Y plane. The first "DMA-engine line" will write the
+		 * CrCb data + some blank padding, while the second "DMA-engine
+		 * line" will only write blank padding bytes. Two "DMA-engine
+		 * lines" will then create one correct NV12 line in the CrCb
+		 * plane.
+		 *
+		 * All frame data also needs to fits in the first half of the
+		 * line. The strict DMA flush settings used already ensures
+		 * this is always the case.
+		 *
+		 * Finally the NV12 stride of the Y and CrCb plane must be the
+		 * same and the R-Car ISP needs the hardware stride to be 256
+		 * byte aligned. By align the Y plane lines to 512 bytes the
+		 * CrCb planes hardware stride is always aligned with 256 when
+		 * cut in half.
+		 */
+		pix->plane_fmt[0].bytesperline =
+			ALIGN(risp_io_capture_bytesperline(pix->width, 1), 512);
+		pix->plane_fmt[0].sizeimage = pix->plane_fmt[0].bytesperline * pix->height;
+		/* Both planes must have the same length. */
+		pix->plane_fmt[1].bytesperline = pix->plane_fmt[0].bytesperline;
+		/* The CrCb plane is half height of the Y plane. */
+		pix->plane_fmt[1].sizeimage = pix->plane_fmt[1].bytesperline * pix->height / 2;
+		break;
 	case V4L2_PIX_FMT_NV16M:
 		pix->quantization = V4L2_QUANTIZATION_LIM_RANGE;
 		pix->num_planes = 2;
@@ -794,9 +827,12 @@ static int risp_io_capture_enum_fmt(struct file *file, void *priv,
 
 	switch (f->index) {
 	case 0:
-		f->pixelformat = V4L2_PIX_FMT_NV16M;
+		f->pixelformat = V4L2_PIX_FMT_NV12M;
 		break;
 	case 1:
+		f->pixelformat = V4L2_PIX_FMT_NV16M;
+		break;
+	case 2:
 		f->pixelformat = V4L2_PIX_FMT_XBGR32;
 		break;
 	default:
@@ -854,6 +890,7 @@ static int risp_io_capture_enum_framesizes(struct file *file, void *fh,
 		return -EINVAL;
 
 	switch (fsize->pixel_format) {
+	case V4L2_PIX_FMT_NV12M:
 	case V4L2_PIX_FMT_NV16M:
 	case V4L2_PIX_FMT_XBGR32:
 		break;
diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
index 5cd21134a2d7..76be90e78420 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -341,6 +341,45 @@ static int risp_core_config_output(struct rcar_isp_core *core,
 	/* For all frame capture slots. */
 	for (unsigned int frame = 0; frame < 4; frame++) {
 		switch (pix->pixelformat) {
+		case V4L2_PIX_FMT_NV12M:
+			risp_core_write(core,
+					ISPCORE_DMA_IMAGE_FRAME_MODE(index, frame),
+					1);
+			risp_core_write(core,
+					ISPCORE_DMA_IMAGE_FRAME_PIXEL_POSITION(index, frame),
+					0 << 24 | 0 << 16 | 4 << 8 | 16 << 0);
+			risp_core_write(core,
+					ISPCORE_DMA_IMAGE_FRAME_PIXEL_BITWIDTH_MINUS1(index, frame),
+					0 << 24 | 0 << 16 | 7 << 8 | 7 << 0);
+			/*
+			 * Pick CrCb data from even lines.
+			 *
+			 * The datasheet suggest taking the odd lines but that
+			 * would require padding at the start of the buffer to
+			 * create valid NV12 frame, or start writing outside the
+			 * buffer potentially corrupting memory.
+			 */
+			risp_core_write(core,
+					ISPCORE_DMA_IMAGE_FRAME_PIXEL_BPP(index, frame),
+					0 << 28 | 0 << 24 |
+					0 << 20 | 0 << 16 |
+					1 << 12 | 0 << 8 |
+					3 << 4  | 0 << 0);
+
+			risp_core_write(core,
+					ISPCORE_DMA_IMAGE_FRAME_STRIDE_COMP0(index, frame),
+					pix->plane_fmt[0].bytesperline);
+			/*
+			 * Stride of CrCb plane needs be cut in half as the
+			 * DMA-engine writes blank pixels for the lines not
+			 * processed.
+			 *
+			 * See risp_io_capture_try_format() for details.
+			 */
+			risp_core_write(core,
+					ISPCORE_DMA_IMAGE_FRAME_STRIDE_COMP1(index, frame),
+					pix->plane_fmt[1].bytesperline / 2);
+			break;
 		case V4L2_PIX_FMT_NV16M:
 			risp_core_write(core,
 					ISPCORE_DMA_IMAGE_FRAME_MODE(index, frame),
@@ -436,6 +475,7 @@ static u32 risp_core_pix2bus(const struct rcar_isp_core_io *io)
 		return MEDIA_BUS_FMT_SRGGB12_1X12;
 	case V4L2_PIX_FMT_XBGR32:
 		return MEDIA_BUS_FMT_RGB888_1X24;
+	case V4L2_PIX_FMT_NV12M:
 	case V4L2_PIX_FMT_NV16M:
 		return MEDIA_BUS_FMT_YUYV12_1X24;
 	default:

-- 
2.55.0

