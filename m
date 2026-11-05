Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793921021;
	b=UZe1SeGErJVsY2QUZ5xgaR4JDa2Z0jHSjsA/09dQPevfCvS9dJORC/fRH3KDKfpwuZd/
	 Sf42a6OjN+hWDI9FwME5UAt/Bs01GIaKAIH2fZ8gyBJ0OCEXTyrizjoNQqgkUhFZrR5Ys
	 eBxiM4nNKBpY0SvottZoj3YJOTL6L8fbqn7H9/CkdM1q3j7BWTQvZcUtEjICmGC6R9S1E
	 yalqueoo9tZPLvhKSJqpnUjRK8qOW6pWcNK9VSGd97JiNsArKhPJFfQUbgltGKa7+Nd1n
	 ZWWg7j8U0CgSxl/MPIzKR1AlZU/ZXUxegOHf8cgu/gfsDkoIzBgH8vGGE7IlIBfb1aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793921021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0qFTCorgq4hyV4vVhWj25+4lzr8cjg0FBjQeaIcgYqM=;
	b=CeAD9zK/NTm7khzs0aRTUO0Oso5iywZw9icsJdrXOu/AvPU46T7OJxq5N8o7kYjQNwri
	 yTgvToLZyKJjOWc7dgFgkSbIOa9qGwyrVZHaFbCEAMZ2UKU9jEYAx3b2Y3NqRX5ZOkD+R
	 fck9kxg9a3i7mUa5m5UCK+VYNE0qbu3sW14eszdtX71vENIV9F/3p2iKoDT+lU6dtfAy/
	 NZ+aGoWM81SHy4LNpX3eLJlMqwyDNjaiIoSuFNRx0a74xm+JBIeqtdShzlZXJ485M6XIg
	 AEU1EFoZ3mCvMzXOqWikIfOo+VGj/Cjs02L3g9sV6FaAphXngZcTKkjsAzAWVIbtkNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sX8Tbkcj;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0AE606D80C
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 23:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D0AE606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sX8Tbkcj
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ad0c2e71ebso13838a91.2
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 15:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793921020; x=1794525820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qFTCorgq4hyV4vVhWj25+4lzr8cjg0FBjQeaIcgYqM=;
        b=sX8TbkcjIbg5pBG9QmdTkyQoFAcjyDPvqz0SpIxx26QWz4ibtoohYmn5J1gFhH2wxu
         jqkrGnIlsOORzCokFtv0Ra421QgmjEr9rbWJUSLchco5bMiGFMtClfkr0MrA/6GR7BY9
         YoPhTft8t+ttP8tR3M7eaqDZRBhNhVxCfW/HP3kmDNh1GtwjRlUA4Dl3KngWJSKjorO/
         /bgdRWjzMXjTuu8DuK56L1Apq9OgQVlfby4Q2YiH1Lnr2zCPU0gSFA4rhvlMcy7i5D+C
         SHCKD4wakUHIHUXYxDVpx7P4mzIwq/SPsFw71MPC918jUG9WPCA+eIjwKnWWmSjhOvRJ
         tx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793921020; x=1794525820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0qFTCorgq4hyV4vVhWj25+4lzr8cjg0FBjQeaIcgYqM=;
        b=Hrkw5F0vzglBrfTCjRz0Du+y68jWD6z0UT3PwCOfRUI7yzVvqe59Y0OxP5/DV/7PT2
         +8zzVdWUsmI3a0p2y0Z3ZyxnZK1NqmK4lf4fFjgSJvq2UdwMEFQqby/XY+gTxOmqpMwn
         sh7QJ/cSRPpNElOcLrHYkiz+QW+7DG2qmR3VaHkCHYROLwCgaXGxGRbsSta2hShDwwgs
         5/HJFPgvR5c462KivovWd2qagzAKv3r8CoUdcJo3mlW1v+acqHvju5e3dwIsdTGc7AlD
         exsjCN/16HjPhfvZEnrtkrNQ5+u7I7ql58sArEmnGInWp2kY+ZFFadddOJ5VjtR7QM35
         gDEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwI07Df4YMtnUB+FacR+BrySLWag4AdeizIt6FcsiftVKk+I7DSaNL6afHl842Ltq+hJsZWVKZSWPvXqg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+5YYb6++GtoC4wsuon07xV+2Ql/OWWeEQgDK5nT3naZd+v+T2u
	3YF2WVuYdby7ku+3KaumwbKfvNj0bS6Rbal89ydyvyqL6ePUumkjOvZJ
X-Gm-Gg: AYBFou1CniNcxvjUMjhqlew37Kkk1Sj2uuN6DcY7Sc2+Em4OJfKq7LYOSFZvcgMOPlA
	HjWTiPMIPcEz10kLslYOkU4SSYOqUCF1dt04BZMkR2mAsxLBSil4IzIEFbmAmXD8WyzzvoQgsr/
	AoqIVI0awvvJyq6L4ihmzzZ+hv2sX5CHw+saXn8ek0gLmkYI5C7U4xgmBMOj3PccFVwivioby3N
	0u2A/M7YtJDAlVq0dV9akyr8StyI0HTguNdfGgrO1u8TmtvQzWCiIfsH7CKjijWf95VFYgUJlhx
	nT9mZcfOEvecal0Fww+Art1w6WvP2R51b89GlYF7ToKD8qpbyBeuqVjr6CwPXbAtSFnAMd7j+7o
	dE51aXNCkf0e0Suq+dByyVewsokuuVFJq6Xghf487mxMEE3Q9S82RNGnWQUqYVrh/Oh3rwI5GZd
	BmIoArhNWT86573ZkNqc//4b5LX9zWB1g2u8HE5E6Fw9Re0yLRC3NJp+TtfQeIE25EqLu8KQmlD
	W07IZyTsIv7sua8ZVUtDqQbRy9jDvFLXdsSM1zC3SHKEkmIy55Cd1xMFaD9GdDA5RPiDKE/pero
	6WsA8+qcGaUCED1VtA6SfXjN1AucZMFB04B8asjcu4EBp+bq3PmFjKhw3PZmNg==
X-Received: by 2002:a17:90b:1e4f:b0:3ac:9c37:9422 with SMTP id 98e67ed59e1d1-3b0db62690dmr1018448a91.2.1793921019958;
        Thu, 05 Nov 2026 15:23:39 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:5b64:e100:f564:53e0:ae9d:9600])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm5317297a91.3.2026.11.05.15.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:23:39 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	libcamera-devel@lists.libcamera.org,
	Robert Mader <robert.mader@collabora.com>,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH 2/2] media: rockchip: rkcif: Honour the requested bytesperline on MIPI
Date: Thu,  5 Nov 2026 16:23:10 -0700
Message-ID: <20261105232310.385463-3-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105232310.385463-1-faizel.kb@gmail.com>
References: <20261105232310.385463-1-faizel.kb@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MIPI DMA uses bytesperline as the line stride, which must be a
multiple of 8 bytes, but v4l2_fill_pixfmt_mp() doesn't align it.
Any larger bytesperline requested by userspace is also replaced with
the minimum.

Align bytesperline to 8 bytes and honour a larger requested value, up
to the limit of the line width register. This allows DMA-BUF importers
that need a larger stride alignment to use the buffers directly.

Signed-off-by: Faizel K B <faizel.kb@gmail.com>
---
 .../platform/rockchip/rkcif/rkcif-stream.c    | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
index f2a24832a8cf..e50f20e40f7a 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
@@ -23,6 +23,7 @@
 #define CIF_MIN_HEIGHT	 64
 #define CIF_MAX_WIDTH	 8192
 #define CIF_MAX_HEIGHT	 8192
+#define CIF_MAX_BYTESPERLINE 0xffff8 /* VLW: 20 bits, 8-byte aligned */
 
 static inline struct rkcif_buffer *to_rkcif_buffer(struct vb2_v4l2_buffer *vb)
 {
@@ -334,20 +335,39 @@ static const struct vb2_ops rkcif_stream_vb2_ops = {
 	.stop_streaming = rkcif_stream_stop_streaming,
 };
 
+static void rkcif_stream_set_bytesperline(struct v4l2_pix_format_mplane *pix,
+					  u32 req_bpl)
+{
+	u32 min_bpl = ALIGN(pix->plane_fmt[0].bytesperline, 8);
+	u32 max_bpl = min_t(u32, CIF_MAX_BYTESPERLINE,
+			    ALIGN_DOWN(U32_MAX / pix->height, 8));
+	u32 bpl = min_bpl;
+
+	if (req_bpl > min_bpl && req_bpl <= max_bpl)
+		bpl = ALIGN(req_bpl, 8);
+
+	pix->plane_fmt[0].bytesperline = bpl;
+	pix->plane_fmt[0].sizeimage = bpl * pix->height;
+}
+
 static int rkcif_stream_fill_format(struct rkcif_stream *stream,
 				    struct v4l2_pix_format_mplane *pix)
 {
 	const struct rkcif_output_fmt *fmt;
-	u32 height, width;
+	u32 height, width, req_bpl;
 	int ret;
 
 	fmt = rkcif_stream_find_output_fmt(stream, true, pix->pixelformat);
 	height = clamp_t(u32, pix->height, CIF_MIN_HEIGHT, CIF_MAX_HEIGHT);
 	width = clamp_t(u32, pix->width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
+	req_bpl = pix->plane_fmt[0].bytesperline;
 	ret = v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);
 	if (ret)
 		return ret;
 
+	if (stream->interface->type == RKCIF_IF_MIPI)
+		rkcif_stream_set_bytesperline(pix, req_bpl);
+
 	pix->field = V4L2_FIELD_NONE;
 
 	return 0;
-- 
2.43.0

