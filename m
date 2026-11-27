Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795811419;
	b=eDCY4YaXpLFHNGq1ayt5WU4QK3ZgvC3yV4M9SUSG+zmw09KG+vCXwbrZYq7uxRdwYOZg
	 f7k7uHxkD/+B+ho/tvxra8csNtiSYk//1XnJbpNUyBwcHPWf3/t0ccmzCVrsqmv+NkCeu
	 35abvNNZMTFdhqi5sw/bCNWcIjZDnDnCOwkgEyM7qF6R4qu61A6+cvzPdlRO6/EAtQ1fE
	 Ch51wYaqYc7lCYp4/NT51Rn+GHPKFECbgExqcEgEtp+lUbs9U//ULFYqaLqU0vhpComIt
	 PvhvteYkEGOI5EMihLG7sJrDjzSfuPGQVGowZcSX/d0YZH/0MChMiuwR70TMG+nGF/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811419;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=pPc+i/x6DYbrMCfxvFpTZHdn6g20qy7xJ7gAP1DWm8Q=;
	b=vqix15simLNPtinp1m2GXPmEe5goHC8vCzfl5aTJNkwyE0lBmLa5Icw+f8FiPi+zbVXN
	 VpasKGxmpuh+wg4QVVu4W8Arf1jIUPycf6bHRPov/LWPJxFG6UHInIyP2jmbeVQwwkNqb
	 copInaVs91P7abP9yubtdwQquo/QreHFHxvs58C+Gu9sdinisC5lP+r0mOP1aQxiQGxhU
	 6PtA39OPLJAK/3wa1aXir8sEvXxw1rRuzHk4IjKJpZKs3En//NpBUTNFyBUZVcmkSJpkV
	 1TquCDe6OwuH/0GYwqr3G8cgL9PKkRY+s+3nj+v/BaL0LUQw2qpZv/DgpW5YWhLuwyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LOP2Nr1o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457FC606A331;
	Fri, 27 Nov 2026 20:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LOP2Nr1o
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795811418;
	b=OMWaxTxmR8PS+2UF4Xl/vYjnd15sy8YqIcAS6Z9Cfe1+HRCnzwRLiyvVuADZrZxrWCDr
	 yudfZNJkKffnXYxqau133l3OLMVClrmnGJXwAR37Z7w07/nrSQcxeSRm3D0jYAKXfxovh
	 JZEGES+5xGauyp9yBOvCVhn9K4Y5ABdVBFf8hdQnP+TnJV2k55yoHkUix714qEdUcZ9Xi
	 I0y6aqBgm79KSTlkedoC5GtRgttVVshfAZp6e5vouuwvR8FhAkZ10yub2M47819+D43+/
	 ilo8IWRWMr+3jKrc1zqFUJlIPhoql4OKKv0CIoqZoDN9bR+dogPaLBsz/7LNc0yQcnA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795811418;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=pPc+i/x6DYbrMCfxvFpTZHdn6g20qy7xJ7gAP1DWm8Q=;
	b=P+hh485K9JM5Fkg6DxZ7KdFoV2GGUX1LSXuVSXTeupBx2IuYRx3L1BLgqPcHcAgezguL
	 /gG+atxm5P4Mf5LnZ8nnv0t/XYkUozQitDArXKFZm5IW13+JG47XBFrDmQCecTVkRA1NJ
	 yS4szuRkfxU4fXaAUwFnTpA5uw+pVIXWcAw914U7lqD7f7WoBpOK7RFuTxgEi/VADmfDO
	 ckMb4DtpF3FsgdytI1Xz3s23sGNDk1h/05xKt3PvHhTMKDhuk/8M5mvYa1ghrf/VQ4Dp1
	 SAsKp6xyXf2dK8O/T/50embUIqrTIwjrru2pNEDvnix/ywv1ZN0lR0MCllkziVM4GPA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8F461F00897;
	Fri, 27 Nov 2026 20:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795811418;
	bh=pPc+i/x6DYbrMCfxvFpTZHdn6g20qy7xJ7gAP1DWm8Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=LOP2Nr1om5br3gb4h62UmXqsZRBdmOFuhihRZJXyQMUevcyQE4tNLw2RGG0ARsyG+
	 6RJldWjcR8KTgYiyN0jde+j4Qz5Lzj3vSNdlyzwDYLmwifY1wmk1KtR5YZ951T6WzP
	 bVV7UBJEO1mCg2cMK+DvAGoWqE3mSbpwtuk8y4cgl9npp9D00DBl6Pjewg13aoOXqR
	 gSPClYrEM9iyENbd7WR2HDCgQaf0Xn8OXL1sF8n3+40cDgADgkyq0WUfrCIx6o4IlU
	 oPU8O8Kpg55WsUgmFrG+adaP8ifE8oZRp9f2ApNrrRy40sy9Vg/zWAIHjWqPmpcZAH
	 O8cvYLVzZG6Xg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 44E144DDBD;
	Fri, 27 Nov 2026 20:30:13 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 21:30:13 +0100
Subject: [PATCH 1/4] media: i2c: ov7251: wait for software reset settle in
 power-on
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
Message-Id: <20261127-ov7251-strobe-ncont-v1-1-cefa8c6c020b@gmail.com>
References: <20261127-ov7251-strobe-ncont-v1-0-cefa8c6c020b@gmail.com>
In-Reply-To: <20261127-ov7251-strobe-ncont-v1-0-cefa8c6c020b@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jacopo Mondi <jacopo@jmondi.org>, Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795811412; l=990;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=C+8lmuISbwzysaK9qU8l6di4Xw5u0AVciao8qKMN3LA=;
 b=HPtJUOnuhfsDgAFbXWAgHnbjkJU84yThp3NDuhihxnFHjXQiq2d+nFcFs3q5sTXo4tDa+PHmJ
 QVOC/d9aW5gB94y3CHnk+GLm7uBSycyZYFlbM5gMFIF22xg5FWXSRlF
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

ov7251_global_init_setting[] issues a software reset (0x0103 = 0x01) as
part of ov7251_set_power_on(), after which callers immediately issue
further I2C register accesses. Give the sensor 5-10 ms to settle after
global initialization to prevent intermittent I2C errors on rapid power
cycles.

Fixes: d30bb512da3d ("media: Add a driver for the ov7251 camera sensor")
Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 drivers/media/i2c/ov7251.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 5b03343a0350c926a34a391af6a338ddf6c3e0bd..77ac60fad62209eda0444015196e52564a0e947d 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -941,7 +941,9 @@ static int ov7251_set_power_on(struct device *dev)
 		return ret;
 	}
 
-	return ret;
+	usleep_range(5000, 10000);
+
+	return 0;
 }
 
 static int ov7251_set_power_off(struct device *dev)

-- 
2.47.3


