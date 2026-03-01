Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAE62EB5A6;
	Sun,  1 Mar 2026 01:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329799; cv=none; b=KB0NnOkG8L83sx1ymuKJiBjxg0IH3abbXoqHoBG4ejZzTCNB1KqDeWaL5wHivOyKKaE18kYYe7L3gPHvVynUs4r7bjNNkFAG7HHARuQA5TZ/a709uA7pbOPqSqqS9/SiCP1uo+bPm1lXHS6yTLt9pzFj6KAN2q+0lpcXsNVWFGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329799; c=relaxed/simple;
	bh=Ce/O+wxnLbQ4hL3kN+V2LOiUyLZGGCBESQQ73j/JStE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=syhjoXDDzekNGtIHZRC10LPTqeEkUXhlpJdVGoAnyxI6JFHjTGfb6WN9WJJkOi3F8LSfJYmxUrvTn2UpAJ6K16YooMykzNZmP1+QC4UIOiNpR52meG4DmxVDZvCci0e9G+w4OYTTo4CieK8vIq5vzqWuDuiREvOTDXHSA4K9yYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m/Nw0tlE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m/Nw0tlE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E8EC19421;
	Sun,  1 Mar 2026 01:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329799;
	bh=Ce/O+wxnLbQ4hL3kN+V2LOiUyLZGGCBESQQ73j/JStE=;
	h=From:To:Cc:Subject:Date:From;
	b=m/Nw0tlEIDVKlQbA8DahBBizNHYsDy1PdERZZFGWLp85QL6mrXRjucjPYPkGTCort
	 okMA4e3c8B4Qruw567nTYluIQ1HPkJR3Zq+a2SdWia4FtI8sTP0t4z79XkQCnEboQf
	 jECvfQ6osiLcc1ji2RupjfVlXu9kh8k10+Mw0BpWjbU2m+2XEvW8z4ep6Xigl2r1xs
	 c/t3Kx1BofTq2IH1zS4+DM/h08mbWJ1J6b14VIs993e2pHjWVBHdHEidNGJZU1hcc3
	 EwjHgdDHgh8MyswPadwE5HnXsrNI6vI+ZUHvWkOjuc8fNW/dLs7lllDvdkOxSvKLHc
	 aBtwmV51P3gdg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: ccs: Avoid possible division by zero" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:49:57 -0500
Message-ID: <20260301014957.1715364-1-sashal@kernel.org>
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

From 679f0b7b6a409750a25754c8833e268e5fdde742 Mon Sep 17 00:00:00 2001
From: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Tue, 25 Nov 2025 00:24:48 +0200
Subject: [PATCH] media: ccs: Avoid possible division by zero

Calculating maximum M for scaler configuration involves dividing by
MIN_X_OUTPUT_SIZE limit register's value. Albeit the value is presumably
non-zero, the driver was missing the check it in fact was. Fix this.

Reported-by: Josh Poimboeuf <jpoimboe@kernel.org>
Closes: https://lore.kernel.org/all/ahukd6b3wonye3zgtptvwzvrxldcruazs2exfvll6etjhmcxyj@vq3eh6pd375b/
Fixes: ccfc97bdb5ae ("[media] smiapp: Add driver")
Cc: stable@vger.kernel.org # for 5.15 and later
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org> # build
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ccs/ccs-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index f8523140784c7..dadff8c506794 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2346,7 +2346,7 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
 		* CCS_LIM(sensor, SCALER_N_MIN) / sel->r.height;
 	max_m = crops[CCS_PAD_SINK]->width
 		* CCS_LIM(sensor, SCALER_N_MIN)
-		/ CCS_LIM(sensor, MIN_X_OUTPUT_SIZE);
+		/ (CCS_LIM(sensor, MIN_X_OUTPUT_SIZE) ?: 1);
 
 	a = clamp(a, CCS_LIM(sensor, SCALER_M_MIN),
 		  CCS_LIM(sensor, SCALER_M_MAX));
-- 
2.51.0




