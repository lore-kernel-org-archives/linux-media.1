Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795712469;
	b=1Oq5yPiJlj620xC6diz0ed938keM4Pk/6ilTWJAx+t5WUWoJHcXUM6N6lEdaTxRUjtH5
	 zK1crWuvvonriSEBSCG7urtznD77Hh/5AMmUChbwOlUo8S+2od6Q9CKdFJ7XNcZ5Nx5Gx
	 ybv9wAi+r0oQ0FrhYmiPMqFf0H1v4rFiPTA/HsSkIsfLEcIScHyIdIulCE/VOV34IPV4h
	 quwqRja3jKYQ0JbYb4BwaNu1ZBOSq6z08uQ20G8lkDqCldlLknxINM4jSYtNAyvgwafI+
	 nl6uW6SVEU9RB48BfE/txoGKYhuRTh6tiKsdDFW5EDrm7Ch11mha48A5nc54kBgXo8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712469;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Y7oQXXW4iOeWRPRZ9YEQsiDsKsFyaejYKJ2MzAPKYmQ=;
	b=tC/v7CE4xFc9yrQMUWdQm+hl3q5Zr8DqV4c406x694wb6BpTzvowgmVyAnm2vYjtw/Zh
	 HClnCdNmEUV03LO2qm/1TBVDWHTIOwyHBajIKbhihoX44f/lpZ1bn3ZxnwjsfVWR4GpMu
	 9Fv6w+RhwejYPSNESIxetAdyF5UuOP6aq365FdkQRSrzMFNcgL9Wl4qtEI6e7+cOGuER4
	 cevwnIYNgqv49naQmHb4jEONFE/I5pcx67qcCV94zW+e7AtqPSP1PNYQqrBI5Z2/7QPgm
	 lj4b9TAWtougOTHq/pANGPTRc9S4xMQMZGV+44NjxHEb+ZmzmzwvqOg3t3BBV8KXc4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NDc5j65+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD66E606A323;
	Thu, 26 Nov 2026 17:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NDc5j65+
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795712469;
	b=2SziPIWIqOibrpz25GyDtt8J86WfM6YTqq36j2pyfjOP4loNBjTCoqxq8UbXf6pXJcCs
	 qaxhwu8HF3vCjr9qbBkJEavIoxUdmxFWq8s5Q74vrUjhTvTa+lLd1hmez8WKWGCDASBEd
	 Y5kOR4pep+qC9s5mhszesrxrDU+r4+frMxmH2ktcuYn5ENiVN1PiiVINo1vC4ekdJR//v
	 199wmAJUnBByjc4AQ77iCKk6+gSxP3mk+ZfE2rB3yt6tZiqeVYz9npPzZbFVL940807rG
	 jeK/SZyZ6Q1jW5YBQhmUNJ/oHmFIBkWXWK9TUKt2dnDABvAfTV5UBGFvbl3HnUf2NwA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795712469;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Y7oQXXW4iOeWRPRZ9YEQsiDsKsFyaejYKJ2MzAPKYmQ=;
	b=KOtvYkBPiTIKOI5eSVi2qxFVuJczRy3YdYGZZ73DIV2OvxPa8Wwh9czww4fjGhSyrIwt
	 gPk5+8tWl/cGV78o9U7fl1VuQbG14KtA1hiHi9GyucHp+fbraWoOL3HBJ5lKpm9T0j/Kl
	 Xq8Wlm/Oqn9YOOpD8wbjVs0ymxxme8zxAlDLpIntxM5MVSBgcmNJqdmLXeBx9qGbSBE5h
	 GCAz4/XXX5QoOsVvbPzDPg8+Doi8ahvIGhiLU6s4mhw8d3KX4TnYNXjnUCk3ks7EAHXBI
	 Om8IvSp8RYgwoU+BScgrKStiMTBa5N2DA/vAh+pBZl6YJ2dGZdxP+KzCHVVOEqxA/TQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 24AD91F000CA;
	Thu, 26 Nov 2026 17:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795712469;
	bh=Y7oQXXW4iOeWRPRZ9YEQsiDsKsFyaejYKJ2MzAPKYmQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NDc5j65+nEjemCyKYfH0rrA9xI/Bq+NWgdmS/dYceovP6v3lD62rGVhbLBzLGukdV
	 tU0urMWEhGZGtfwCVZD4DOlgddTRFZuG6WRgY0GX91r0Lj0OvDKuP8qmy922QOWOqx
	 3kzimmymjx1tnIebmJDKuohPDNyRiMAcuCqZBK79AI5o6tAx2BEHX18OK1R1x2JCKX
	 ke73t9G0iTeRFLV2Gr/QIFEAoKXxu7cUGLTdFbN6OFLeATyznY8VU8WjdFoa/RRy5i
	 jKIO+3yPWobQrpEt8kHpItwilnSfTZmwaSexBR+uezJMbKrXDBtnDqKHXdp1MgvxzA
	 HjRp2+e+znosw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A18984D753;
	Thu, 26 Nov 2026 17:00:53 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 17:00:55 +0000
Subject: [PATCH v3 3/5] media: verisilicon: Report fixed JPEG colorimetry
 on the encoder
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
Message-Id: <20261126-hantro-jpeg-enc-fixes-v3-3-07357d84a64b@gmail.com>
References: <20261126-hantro-jpeg-enc-fixes-v3-0-07357d84a64b@gmail.com>
In-Reply-To: <20261126-hantro-jpeg-enc-fixes-v3-0-07357d84a64b@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Sergei Khomenkov <shomenkow@gmail.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795712452; l=1351;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=jQGwq2ezjyS5OLBIC3b8uIm11FWRMfbVW9fV1IdCb0w=;
 b=tXEbeaN9I4IMEXcW5M9uBtrdJN/78BRij3bVNmt+vhPG1Y8YDzU02itwWpfXoS77yLI3qnVC7
 h8ni9TI72ioBXwrC5F5TOvUG3Xr/Urp2ELusDrnmCcWyM+PARNHxnGn
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The JPEG encoder accepts any colorimetry and reports
V4L2_COLORSPACE_JPEG on the raw queue, which v4l2-compliance rejects:

  fail: v4l2-test-formats.cpp(892): fmt_raw.g_colorspace() != V4L2_COLORSPACE_SRGB

JPEG colorimetry is fixed and the hardware does not convert, so report
sRGB with full range BT.601 Y'CbCr on both queues.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 88b1cf66b713..b91c0ef9b6a3 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -396,6 +396,14 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 			pix_mp->width * pix_mp->height * fmt->max_depth;
 	}
 
+	if (ctx->is_encoder && vpu_fmt->codec_mode == HANTRO_MODE_JPEG_ENC) {
+		/* JPEG colorimetry is fixed; the hardware does not convert. */
+		pix_mp->colorspace = V4L2_COLORSPACE_SRGB;
+		pix_mp->ycbcr_enc = V4L2_YCBCR_ENC_601;
+		pix_mp->xfer_func = V4L2_XFER_FUNC_SRGB;
+		pix_mp->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	}
+
 	return 0;
 }
 

-- 
2.55.0


