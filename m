Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583D51A3165;
	Sun,  1 Mar 2026 01:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329290; cv=none; b=jMovD/m7jqJx++Sef/rLAY+VylyZbjHFQ6iT06sLYPyyNN3p+vn8cHlSAkJ/fobeo21snu9mSDy5Im0DHrbqjYYeQ08Ss5jRn92eaBhBaXB/vaRqqYr/gl5TNd+AdKVecXJb75Zk4JVvQWY1ZziIyGZw9a31XQDl9ee/CkQf4ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329290; c=relaxed/simple;
	bh=96yRSaF9VHjC8ZGch+wbWWXSUjP/bb9bdfmtSyb74s0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pZh51TUx+0tFCy7Zr+RHh6k3GArK7S7Id1+TpG8TpowRVgt8gAr+igshIxRJW6BqiL0NJyNjtr181oZ/bVa8+Lhxy986DvTtXghEhKn3tPR4Et6nyy1hcFPweg716TdjqFHGLL+SR8yO5DbTKQaJvB9EdwkibYGHuTxdzjeWAGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BPetwoQh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BPetwoQh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303C8C19421;
	Sun,  1 Mar 2026 01:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329289;
	bh=96yRSaF9VHjC8ZGch+wbWWXSUjP/bb9bdfmtSyb74s0=;
	h=From:To:Cc:Subject:Date:From;
	b=BPetwoQhFKo9F+RffcgrNLwe3G57rPHo/X6vycHwn/8bcro3DPYXw4+ElKuP659ww
	 okJvje0nHGliQO9dFIO2OIP4Pne0kxmYz032Wqx2Wh/1vo/SE3EXnL/bNRVr1W3UGj
	 D0H+gyFJH0P5/uJ4VNPlRx63teepfj1S2DPKPp/NbijQS/IQWLN2ppSdfIibsYe4Bn
	 oR/0uCpZ7AidTDzFlV/NxwvKP1MdzlABSWzm0OEoJynvRAe3VpHzGzAhIulW5ASUPO
	 oC4vg+zYTJ9oF9ayCZwWd53PwYB2FjRUWQH5tN+JJGd8FVbRX8sObN2CN1U5lwuFsB
	 lJOQ+dQFSLsaA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	david.plowman@raspberrypi.com
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov5647: Correct pixel array offset" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:41:27 -0500
Message-ID: <20260301014128.1703096-1-sashal@kernel.org>
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

The patch below does not apply to the 6.1-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From a4e62e597f21bb37db0ad13aca486094e9188167 Mon Sep 17 00:00:00 2001
From: David Plowman <david.plowman@raspberrypi.com>
Date: Mon, 22 Dec 2025 13:45:26 +0530
Subject: [PATCH] media: i2c: ov5647: Correct pixel array offset

The top offset in the pixel array is actually 6 (see page 3-1 of the
OV5647 data sheet).

Fixes: 14f70a3232aa ("media: ov5647: Add support for get_selection()")
Cc: stable@vger.kernel.org
Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ov5647.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index f9fac858dc7ba..d9e300406f58e 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -69,7 +69,7 @@
 #define OV5647_NATIVE_HEIGHT		1956U
 
 #define OV5647_PIXEL_ARRAY_LEFT		16U
-#define OV5647_PIXEL_ARRAY_TOP		16U
+#define OV5647_PIXEL_ARRAY_TOP		6U
 #define OV5647_PIXEL_ARRAY_WIDTH	2592U
 #define OV5647_PIXEL_ARRAY_HEIGHT	1944U
 
-- 
2.51.0




