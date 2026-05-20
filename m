Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13503537F7
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 20:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779308863; cv=none; b=jKV4yvNAv3UYgyXYxSLOs+FyRkxt6QU0v92XB8dkTENZHjpkeTTYVjrsVwm6jcM/u+2d0ZYjWC2mLXhDgtR6gQZELav/2piz3+kZu8JcP2+kA28N+JyCyCzMAc0yvhmxHnHFyM0NPsg9ksKPTWGsUqWZK20q4/cKW7WbmHhMBLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779308863; c=relaxed/simple;
	bh=nNp3h7fzC+P+gB108HvnMusXH/HXgD5he2h2CbgBgCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h3efwnOz1ro3Z0tNxLJybNupeaTTUDirGXXwIKoHcyt8LdWUjykeay5fHuL5Z7fEB3YYuNWSM2k0XoN2YEiIby5178Ensi9o1NomOqeN1kYQp1dY4ZS7FMWNyN4UUTELNXavkBMLdy2LIffF2YeNpSHMuyxQco4Mpw6cCA8kGDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vhHPv1TL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vhHPv1TL"
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:42d6:38fa:3bdf:70df])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9980B874;
	Wed, 20 May 2026 22:27:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779308845;
	bh=nNp3h7fzC+P+gB108HvnMusXH/HXgD5he2h2CbgBgCI=;
	h=From:To:Cc:Subject:Date:From;
	b=vhHPv1TLiYfQtwqJZMM3+pNrAwuemXpRWtb+RH8N/S/oDK9nra6KMh2gsB7e+HjRC
	 U+MJGQUvKjM5en1v2N9PhagZYyyGD2lGXAP9zM+160uL3Z0BpLr2sYxHBx195+7lNN
	 qi8ZTItJArr3ggjO5xLs28jwVZU67U2wC8kCxbDE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Guoniu Zhou <guoniu.zhou@nxp.com>,
	Frank Li <frank.li@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	imx@lists.linux.dev
Subject: [PATCH] media: nxp: imx8-isi: Drop unneeded downscaling factor clamping
Date: Wed, 20 May 2026 22:27:38 +0200
Message-ID: <20260520202738.86782-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The total scaling factor including bi-linear downscaling and decimation
is clamped to 16. The bilinear factor calculation therefore produceds
values guaranteed not to exceed the maximum factor of 2.0. The clamping
is unneeded, drop it.

Note that the ISI_DOWNSCALE_THRESHOLD value of 0x4000 is incorrect, as
that would be a factor of 4.0. This was inconsequential given that the
computed factor never exceeded 0x2000.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index 16b20ea2d1db..e07eebae9e2b 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -11,8 +11,6 @@
 #include "imx8-isi-core.h"
 #include "imx8-isi-regs.h"
 
-#define	ISI_DOWNSCALE_THRESHOLD		0x4000
-
 static inline u32 mxc_isi_read(struct mxc_isi_pipe *pipe, u32 reg)
 {
 	return readl(pipe->regs + reg);
@@ -118,8 +116,7 @@ static u32 mxc_isi_channel_scaling_ratio(unsigned int from, unsigned int to,
 	 * output (input / scale_factor) rounds up to exactly the desired
 	 * output.
 	 */
-	return min_t(u32, DIV_ROUND_UP(from * 0x1000, to * *dec),
-		     ISI_DOWNSCALE_THRESHOLD);
+	return DIV_ROUND_UP(from * 0x1000, to * *dec);
 }
 
 static void mxc_isi_channel_set_scaling(struct mxc_isi_pipe *pipe,

base-commit: d97d13c24d7893abcfb80d38630ce74daaa1434c
prerequisite-patch-id: 2d7379698fb55fe2345d604dfb73914f91705a5a
-- 
Regards,

Laurent Pinchart

