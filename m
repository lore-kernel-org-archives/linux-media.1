Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DC02DB7B5;
	Sun,  1 Mar 2026 01:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329792; cv=none; b=ibdKDAvQDRylDX60Wei8izo13SpyZB2iUWs2nqigQnHDALiAZY3RDtEEyDUABAsGEfLNf3aBZDl4Njuk76D0xV8sP4Awwul03O13z7lcxcE6SFS0fg43g5oaR3OcgYexPwUoXiZBn/YvtJPptVv8rClbiHwYeduE5Huyo0zApac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329792; c=relaxed/simple;
	bh=RvDQrnIU7xkRiIYFb/kswFcvDgSpbMv8Hx3psLjHrlg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c/r41fH7TTj7x+Tj19jHCiUx14+h8VPk5D9gdUBFAT0RvTG0UxgDq5r0BWk67/iEBr3IOicAGrhix5nIt62qTPtI1v/aEYaTbSvEBAPpyPKg+Ijtfj1CbTCZiIJFotl+uvXhi0fH1bWXhxCS9P+hcQ/fVEHhGWCpH9UPd66CQgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VcQfyQtp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VcQfyQtp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B50C19421;
	Sun,  1 Mar 2026 01:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329791;
	bh=RvDQrnIU7xkRiIYFb/kswFcvDgSpbMv8Hx3psLjHrlg=;
	h=From:To:Cc:Subject:Date:From;
	b=VcQfyQtpa8BL1tYG7QmsyJOlMDyVC00f3/vaJW7niVULBABJkjyIatlcKB4u2Z4Te
	 Elpij0yojym8n4wkTdgKWTRg9PlKZ4iQn5ZQAcC6FhzjATmjMNWiPDh+2RaR42OnlZ
	 QCQWNUlpGUU8xSfLl1iwMxf2E22U70Lgn2edm4Mn7MAGFugiWGm2y4JoP5tJgjdHbW
	 2MYeo6m1d5cHjef1VIE1vIhd5sprPmlXDobLXjQR9yF0VzflL+j92ve9jrhC5+rDvZ
	 D6lizi4rnb799FY02pa2YFyQ2Cukf/L9Impl3qKRGPQQzeRKZ3l4fi+633TXGXIQOI
	 4bQEOQvS8Ts0g==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	jai.luthra@ideasonboard.com
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov5647: Fix PIXEL_RATE value for VGA mode" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:49:49 -0500
Message-ID: <20260301014950.1714906-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From c063632b494b02e891442d10f17e37b7fcfab9b3 Mon Sep 17 00:00:00 2001
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 22 Dec 2025 13:45:29 +0530
Subject: [PATCH] media: i2c: ov5647: Fix PIXEL_RATE value for VGA mode

The pixel rate for VGA (640x480) mode is configured in the mode's table
to be 58.333 MPix/s instead of 55 MPix/s, so fix it.

Fixes: 911f4516ee2b ("media: ov5647: Support V4L2_CID_PIXEL_RATE")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/CAPY8ntA2TCf9FuB6Nk%2BOn%2By6N_PMuYPAOAr3Yx8YESwe4skWvw@mail.gmail.com/
Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ov5647.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index c0f1121b025e5..bf5b0bd8d6acb 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -582,7 +582,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 			.width		= 2560,
 			.height		= 1920,
 		},
-		.pixel_rate	= 55000000,
+		.pixel_rate	= 58333000,
 		.hts		= 1852,
 		.vts		= 0x1f8,
 		.reg_list	= ov5647_640x480_10bpp,
-- 
2.51.0




