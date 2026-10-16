Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF3E3AB262
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 11:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792150710; cv=none; b=llVzZwrGzZInlPVT11KN5jvRm6mXWsaC7mYG16N8oUSTfghk70AMRw1TUQc2kgplsxyl07MxhhgbjbX2XDKQRizOnNG3dDqJGRBcLcOQqz6CjkLGM9/e88Eklxcxi8bfPU8mrr/IPltHz0DEPC3l+/KRzDTLQyxS+3qJ0X2DL7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792150710; c=relaxed/simple;
	bh=l1Yvh7rzxmJFQNQ6JrhSj6hapxpZPGneRByCd1HbvAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s+5FRJnMxVgyS3eRFZaoMvwqDAJz+OZXuckKxy2UaG060ieuJDl/TR672V8rf841xkq1IMzphdyuJT1QAZYG0onSBDk9Srqtn9ZVp3RWgvPGBTjFCqddKHnJXEQBWiwMDpD4TSbI+vVsriN9ajs4vI5JEx3tJV+gpYZGnX+nGJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhJtSbS+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhJtSbS+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1d484b4a9so772535e9.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 04:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792150707; x=1792755507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hgmnL8mkzlZYj6mWZA/tchnETE3V3TFCY3ed+26L7nQ=;
        b=RhJtSbS+kM+F2NztMz/JJngdKV+1f5l0MDg+QB8ZXkosudqBxi9Y3XE1HVmDI8Q0LI
         MCEzFKzLL+f+kTzvaXjARrdK7fzkVdDdA8RmsRuy4VvGMcQUrc5dIjNBgbp8368ln1gm
         bdrfY2Kr9hi3/tW085yu3va19ysODWpTYboZcdjpsCnx4VGGAd6umx8uqzDK9UCKalbr
         y+6BNBlPk0XyzDIRSDef10u3kCHubWwhCgg+U3Lky1DxYbyGeLH2hTQeZtKjwMp8hZWl
         Vz6qwcYWji2wY+98JVLrDIdKrYEEzTZxvqyOJdOq3viD5TymPqzyHjv7t4Y0wfoy1kB6
         wYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792150707; x=1792755507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hgmnL8mkzlZYj6mWZA/tchnETE3V3TFCY3ed+26L7nQ=;
        b=vxtN3bco9WqW4IpUvB5Y0IyL6n/lMzEPUCoQGWgeobMT7l7FZS4Om99Bnl8oRAiyLC
         Gd/+g/n/SIorYRlGwBe25uG7RJk3a6cMkCyMeUDp7nqM7t6QSXqlHQPTKpc2cjzQBOKX
         WIQvC4SuMDda5UQrGJtEUOQzr56jpApfFo9rg/RZ/EAGkxn6yOlqPbT9mlE9qyJTpxRk
         IA3qwmhbnyv7oZ6Hx3D5pr4/aWV9OUdZ6D8M9ulx1p1+KCay4dOPtr81Hzil+VTFyACj
         vpWi/efDtF2QLNhGmNrlp//pgQ//1nmplK0L/s1x24ocBbI1kkoxTpKi2YxGRB2q6Q/S
         /JcA==
X-Gm-Message-State: AFq9FYK2EqNzpnd18f2FTGPOxx67g7fawq7usya5XTylevAvxUKklzsh
	MI0fo1syd7OXahAk3u1EtOVNK/cjxetgUynJYO2XdryrjrLYlf8xg39d9iJ1oqRS8AA=
X-Gm-Gg: AYBFou25BTmWZkmnfVDtqaZeRyyNwxK4XjThP6weLohlzKTmVxQMvBdYmkKB9qoUR25
	AQFdDICFxtSkHmofbjWca8Imr5a4CCfzRSM7LjIbIgYZdT+t6/h8ei1RPvIkA/Nl/z8vKaJayNJ
	Hh7+z0qwfcK7Wv9bgK52sznbSwiU689G+3oyzxygiix/zyDHlyAF+eQNnswc6hFyUx4PE59pn3W
	97sUAZ7gQ+9JlXxQM9/KTv+PL9XRlJ7N2rB0N4+rzN9bgy+YtBGvHWrNpSssZLKL4Fd23+0wplp
	DlbqJMqxqr0qtk9w2rEbWa9dpkN4DW92eP4mXD1quxKG0slPE8a/8Ot2Yfou9QymBJIx3wh5YhE
	tfrIf6cVXbnCWDRLULI6o26EwdI1+is4rNDZeSbrtnWXxQtN/aTKi/z2yYoZ3UFzoEJECgxMklM
	hr8AAvzm05/4nze1Xa5C5jGQ29dak8bO2q6ETwe79dCf8aZ//aJde6w1dmbaQ58ldKZPL2f953i
	CXdG9Cp4b6afIGdk+2eo31lb0My7MTUFZKwmCsrLEf22wuSqyusQ0YdvA==
X-Received: by 2002:a05:600c:8184:b0:49f:ffd0:4039 with SMTP id 5b1f17b1804b1-4a18e4f2221mr418624145e9.32.1792150706893;
        Fri, 16 Oct 2026 04:38:26 -0700 (PDT)
Received: from thinkpad ([2.176.196.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33ad3fsm36169855e9.5.2026.10.16.04.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:38:26 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v1 3/3] media: sun6i-csi: bridge: Remove duplicate mbus format entries
Date: Fri, 16 Oct 2026 15:08:46 +0330
Message-Id: <20261016113846.8602-4-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016113846.8602-1-arash.golgol@gmail.com>
References: <20261016113846.8602-1-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver reports MEDIA_BUS_FMT_UYVY8_2X8 and
MEDIA_BUS_FMT_UYVY8_1X16 twice when enumerating supported media bus
codes.

Remove the duplicated entries from sun6i_csi_bridge_formats[].

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.c      | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
index f9ee94fc1293..0331b55f489a 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -93,12 +93,6 @@ static const struct sun6i_csi_bridge_format sun6i_csi_bridge_formats[] = {
 		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
 		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
 	},
-	{
-		.mbus_code		= MEDIA_BUS_FMT_UYVY8_2X8,
-		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
-		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
-		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
-	},
 	{
 		.mbus_code		= MEDIA_BUS_FMT_VYUY8_2X8,
 		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
@@ -123,12 +117,6 @@ static const struct sun6i_csi_bridge_format sun6i_csi_bridge_formats[] = {
 		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
 		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
 	},
-	{
-		.mbus_code		= MEDIA_BUS_FMT_UYVY8_1X16,
-		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
-		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
-		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
-	},
 	{
 		.mbus_code		= MEDIA_BUS_FMT_VYUY8_1X16,
 		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
-- 
2.34.1

