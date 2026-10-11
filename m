Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1763612FE
	for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 19:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748613; cv=none; b=Nuk8fFUIMXJNg6zpWpWkwXLCsJlLPACVxiqKW+lKzApHu++5+9/lKO0WFsrrHqDHRZPpFkjOD7Kt/9Y1iSAW/0Flee6cZ/8Uzton57YLhGmDFqumlSQJMDarU5wS3OpAUWZX3A6Z5jjk7mJ1BjARC2/ifZKgFaBhCA1L5AcHiRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748613; c=relaxed/simple;
	bh=epmQuNnUwuWrARF6TFO83/KSZ5JczeyOambMq4x8/Gk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=RfsSgh+me3xt6xvYfvUHpMYUsT/cpiyU1Do4b8bL6hWEq9jETox/7sBUO5Vn2a2jrzULpJPJ4gCzCaFDL11rTbnw3gMOHsgTQoFCzCufFaF7p/8+VK7uB1qHPi5K4xFCX7bA5O3WyznEh20BGMUhRPTdTMhb5vHjy0x1EngNWm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P//eD9Me; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P//eD9Me"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-917997ab0d9so18854966d6.3
        for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 12:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748610; x=1792353410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHHZH59qV3EnqbOQ3vYmK0JHZ+tuhXSFnyosgBQqvFQ=;
        b=P//eD9Meh3ty9Is3pKnToxFWm/iKMBeWxKZ+l42qbdqTIDlN3/D27rVHaOwAzRSsP2
         jncL7ekJOnEnN8F089stkcbIC1xCf6cIKUiLLvmHO/yPpw5C1NyWFrgFgc+6qhLK7FDs
         7fiujLTQICiN0lTsY/VVakWfp17SY0gUaolUMNi+kYYDyYlB9VwZWObA/ZjiCGn6+vuG
         SA0+WFkDhHPIcFt9cCxJ0Qxm4Z0kODwkidaYRsDNscYJOLQLPaQQEx19XXFXacz6xcew
         /xHJml0nqdHteecqC/uu5U4cgQp/yttjELV46eeurQIOHSyqwFm5R5w4svhJXSLOwOf4
         l6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748610; x=1792353410;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iHHZH59qV3EnqbOQ3vYmK0JHZ+tuhXSFnyosgBQqvFQ=;
        b=Ff/CE1iS6AC+1wgwDVObj3G4X4euilvz2hQ89L9oMWm2luMznV+kidIJPFyd1ItgiF
         mSV3qlGkAWmRHEXIPciwr1ezYQiakjQW/Eo+vanjEaDYP4Mz/wiLT79HKOQQELcphPsq
         2YQxirZLZDBdaWCBwoBiCtsnC8pQvMkKBOP6ih+HOEohuJWnStoTNzStpkuO8Y7ldHji
         jDWhghb1BGU+XAVacHOSwoSoaeMyJpNQXNfMqlMUXvKl5J8qmOX0IbPQ8LGBGUjRISHR
         pa0NwquwzAdPnAu86adKxfOw99fENoDxFwUH8Vma/Fbzpmm5TCqTdJiNxkD/PLjB2JfY
         OrLw==
X-Forwarded-Encrypted: i=1; AKwUvByEtZXwqh7GFVimRMO2oBsKhjecF/aHQedmvYUSML7ywjVILrCYlhPs47Uahf41D6hRlSOGnesRCicuUg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJV/KKTLxf7QtEwHJODvptBvO8UumiUSEShV6xDrcQcanOt2Hpc
	Lr2OvZVn12Ij0ZrIwNQvOMn3R0CuVvc/DlGHa1afM/yOBQa1oDiQfcY=
X-Gm-Gg: AYBFou0Wpsjin8daroJ/cqHqT1sC0MwKk3u7LauJOfhi1kAYqcCnzCybaqpr8aUI4wY
	+ukP+2xAVmRxW3zMh2X4DWPXbXNeVMpByGrufjJo6Nw8HDlx9wxtGLR+s7VNYEmdYT3R3QiIhp7
	A3kv3VChfiiwyYEynw3w7507pNltSVLxYKAACHd/Pl8Scz7/R6zEx932gpYCdwwCUX4ONMfKwwC
	bTdyB07KZ47fw3KaC/tqXf2ONL3ZTOlgdaWWAoKcsiobqDhLn9y+Gh0yW6FvGFv4QZZKZWtqXod
	t425jd2ffM9yfDzPic84Xto3NAqLYtALFx9A7zU+Ot4FWqWdEP1UFe2obDFwzK9AUXYNShmW2Es
	3ze6pXtR36QFr4wigfXAMExzCoPCCW9R4U6Hefop/qyDY0iTRa+BWlAuxzEVWJE1t8AAfqNHkPn
	l33sWPt3RNT2CcGXZOIcazV9q6BaP6tWspQfnSoSI/15N3ODvtibYARWwfSQfk0xYn5Sv9Ohs6f
	AwcJSHoZOORacJkoEIrcs9Ff1jBzLoDXhV0nheuwCDaJmabr1PzrueQaj82Bx4dKXhgT1FnJXwv
	X1anJVpkLrXePS/Bpck6g9s/c01B8tCARA+zd4A=
X-Received: by 2002:a05:6214:498e:b0:91b:5d3b:4acc with SMTP id 6a1803df08f44-91b5d3b4e26mr149047996d6.53.1791748610213;
        Sun, 11 Oct 2026 12:56:50 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550dfb6csm77651326d6.45.2026.10.11.12.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:56:49 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Eddie James <eajames@linux.ibm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: aspeed: disable resolution work before removing the device
Date: Sun, 11 Oct 2026 15:56:45 -0400
Message-ID: <179174852932.3.2170255507797724902.G64@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A resolution-change interrupt schedules res_work. The worker enables the
video engine clocks, initializes registers and detects the resolution.
It can also queue a V4L2 event or restart frame capture. The remove path
shuts down the engine and releases resources without cancelling or
waiting for this work, so the worker can undo the shutdown or access
resources after they have been released.

Disable and drain res_work before turning the engine off. This cancels
pending work, waits for a running worker and prevents the IRQ handler
from queuing the work again. Keep the clocks and IRQ handler available
during the wait because resolution detection can wait for an IRQ.

This issue was found by static analysis.

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC, W=1 (arm64). No runtime testing.

 drivers/media/platform/aspeed/aspeed-video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index a292275..4274b90 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -2360,6 +2360,7 @@ static void aspeed_video_remove(struct platform_device *pdev)
 	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
 	struct aspeed_video *video = to_aspeed_video(v4l2_dev);
 
+	disable_delayed_work_sync(&video->res_work);
 	aspeed_video_off(video);
 
 	aspeed_video_debugfs_remove(video);
