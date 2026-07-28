Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD543175A8A
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 00:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785197776; cv=none; b=itxoeInOm5vswlGlh+XBJI6HysAR28WTLNlAxSKCYhISzsS3Nncqh+yJfcNZagbyaQSzO8IJ4LqmohytyxfJpfLrIaTRHhRDwC+8orVG+X0TmJbBAPbU2SOeUosghC7IVEX3bE8YLbqDMAiFZGXkrc1Yw0+9rR/KI5tjzGLYd+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785197776; c=relaxed/simple;
	bh=9yo7oQrKPLRlMrthYw+pO7x0jHae0Vj5AYr8R8OfkZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rBthw1T6IxUtSLi2drHbimMcxw5ES6kx8MbqQ437529IiqObH//x2BOZZYnchxhjTvFjmLMbiZP07C1V8PsFHkv7DX12EVZjmeQgv4PLVNpMn9Xo5ToA8dFENiKKOMsHSupeByqSDjVRr6NUsvFWDOzF+1YJ//+f0xUzbkb52HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7Sydo/q; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7Sydo/q"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ccae46de39so4924545ad.3
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 17:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785197774; x=1785802574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rf2C74uNnPKCuHC6/DlLKvpy+zpKmy0yi6JZQYXqMV4=;
        b=e7Sydo/qOo+P6VnfB1xAmMio3wKs017k9PDoKqA1FtvexwoeDrlbYy3iqTmELHcwzZ
         7QCRCOAvWjJsykwYos7X6d3mvx9Skb3pUJvUBMGojgnX+JyRNZeTHa6JaXiUS9x+9L3y
         gcIsioQ0oTqCrMBwHhiI1xQExDsqWzPWNZQF7WRticuf7C4M3XAFp2X3HLgqo337FR9K
         OhmbejQfNDdu78AKzfAuJMDS4itkzlX+uZKDOq4XuRqwhapRr/7Xb+6fnrEt32YCTojo
         47Df/xfyOd40HFJsK6jGlh2lHu5m/qgd/1PTbG9gyK2/R0YoghSHr1OqMv++Y/9Xnr/b
         6SvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785197774; x=1785802574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rf2C74uNnPKCuHC6/DlLKvpy+zpKmy0yi6JZQYXqMV4=;
        b=CrEen2K5BkHvsBIifDe8l9Qa2gpnZHhHLYAvYOvIHqF2K46nWw7iL9oqQ6EuP8TOb/
         K/bA00F+HIqxiwlhDJ5br781IqoK7J1NIx5qWexZz8//EXadFQib67bw3dG30agZAZAy
         3pcybDg0VS4UpI2pYkS9NCl/SIq1Rqz6Ha4Hg52yi7GVZhce79QC8k0L0ud384FKxe/0
         7CG036YjwDE84XYUVBk6RIU5yEuVuYxbfTg8IDjojc7quOm+sQViyUogv6MTZs3ZrkIS
         T3WmA8XI0N1UzE+EP3D467dDQmtTm0hTzL2rkcMookBlSWtrutrBPOnM7+9KzYgcUI++
         9wYw==
X-Forwarded-Encrypted: i=1; AHgh+RriferK+u3oCljDYxYquPziEZ4winmrJt0LzFCK5bxFUGa+GCV7YUacKj0phnANmEcjrwagGrJ1BmKWyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl4a6gA5ivxxzewVe+glb5ZYyn/QkxN4Mczvt115Iz9Dw+fI0O
	jAVspD6+mxQEqNjRDqAi/Dbo8YDwVfdgq1oh+FTR3F5Ycuon8u8COSXy
X-Gm-Gg: AR+sD13Tb33WRdsXKM8GoLwETESrJe8hyJCZKRLQLJTaKkWwC8xn8tBcyu1aZI7ITaI
	hAIkiGiHo3gXbtjCn1BN29VqWoSCln1xHYetPgGNjBnnSR9++j0X9UdxnTeXFBgwau+nZgL80UG
	TBsKKu7y5trLl2n0PXd2FzlYzYRNi+XpKMeQfISHugxeLsSu5xlo7aEO74GjUyG2lhA0/E65Ynj
	zlsKTd4KppOgyEh28tUoK62ow5OCRM0RmgvM14r2rOyw69WAx4HGFzhz/GSZaJnOUY0M1JsrJaD
	TXD39ItSB20gYTdHoy1/jOPJMoHLnqKDm6jsFvh1RdbRXnJLDSw0Wfn6eAHm4bA9JWrDftJ5YHk
	sH8TWpHcMv/UlOsdKqunzjeDnMW6ogTd3GaDfZmHoFdTE/dXA+8PYr9rlVFNKU4d7okD8zf4pYK
	StYwjWHFJviajlOeR0VSGeSp+U1y5pU9bzAvc=
X-Received: by 2002:a17:903:4587:b0:2ca:ecf6:9105 with SMTP id d9443c01a7336-2d015aded11mr952495ad.1.1785197774210;
        Mon, 27 Jul 2026 17:16:14 -0700 (PDT)
Received: from FAIZEL-KB.. ([2001:569:5b64:e100:37da:2f8a:5b33:6b68])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2cfde5e2a78sm43408555ad.26.2026.07.27.17.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 17:16:13 -0700 (PDT)
From: Faizel K B <faizel.kb@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Faizel K B <faizel.kb@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] media: vimc: sensor: fix pixel_rate type to resolve do_div() warning
Date: Mon, 27 Jul 2026 17:15:45 -0700
Message-ID: <20260728001545.331638-1-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vsensor->pixel_rate->val is a plain s32 field. Declaring the local
"pixel_rate" variable as u64 misrepresented its actual range and made
do_div()'s divisor look wider than the 32-bit division it actually
performs, which is exactly what the do_div() coccinelle check warns.
Revert pixel_rate back to its original s32 type to match
vsensor->pixel_rate->val, resolving the warning correctly.

Fixes: ec1e620b2454 ("media: vimc: sensor: Add pixel_rate,vblank and hblank configuration")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604191731.10nxGZ92-lkp@intel.com/
Link: https://lore.kernel.org/lkml/CANiDSCs9s03DUjKwcPgDtZt2QJ4i0FGwab4zpEP+wCawagSC2Q@mail.gmail.com/
Signed-off-by: Faizel K B <faizel.kb@gmail.com>
---
 drivers/media/test-drivers/vimc/vimc-sensor.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index 83dcc9d61ee0..7cb544fdfddb 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -97,18 +97,14 @@ static void vimc_sensor_update_frame_timing(struct v4l2_subdev *sd,
 {
 	struct vimc_sensor_device *vsensor =
 		container_of(sd, struct vimc_sensor_device, sd);
-	u64 pixel_rate = vsensor->pixel_rate->val;
+	u32 pixel_rate = vsensor->pixel_rate->val;
 	u32 hts = width + vsensor->hblank->val;
 	u32 vts = height + vsensor->vblank->val;
 	u64 total_pixels = (u64)hts * vts;
 	u64 frame_interval_ns;
 
-	/* Sanity check, pixel rate is fixed and fits in 32 bits. */
-	if (WARN_ON(pixel_rate >= 0x100000000))
-		return;
-
 	frame_interval_ns = total_pixels * NSEC_PER_SEC;
-	do_div(frame_interval_ns, (u32)pixel_rate);
+	do_div(frame_interval_ns, pixel_rate);
 	vsensor->hw.fps_jiffies = nsecs_to_jiffies(frame_interval_ns);
 	if (vsensor->hw.fps_jiffies == 0)
 		vsensor->hw.fps_jiffies = 1;

base-commit: a52e6f7923c17a672135b485ffd96fbd72f46267
-- 
2.43.0

