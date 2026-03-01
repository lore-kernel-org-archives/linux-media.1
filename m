Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B8F2F3C19;
	Sun,  1 Mar 2026 02:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330407; cv=none; b=Dn4p6Ey4xk/38KKjJSKw5YwBJatqAENzGdg4+yt25My6/dhFnLHn3t22fjsAgcALTuiTp8yMc2HsVvYNwjbxhx7mm+feGAw1PhHZFOoKcrl0wSlnSO1bY99M2ZUmvOYA9RlmZUsxQ2AMOU0JXFS71rdRWRhTBWCB/0mZlLaiID4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330407; c=relaxed/simple;
	bh=pK7vpeKQ2abUr9umubfrKkTo/T7YH+letk8RTq0Ua1k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zh9WdrXbEZBixX7OFxDDT/J4XTD2X1GVlNazhwoRG7limsQhKSdAMIx0RRxSA1VrI8DysgoKM+Kd9ZwN3hbkOIMTYsSWMb6+Dx6MzVIpsmCYjSU5Rm3i+sWt/jx1rJoSIWRru+nIvh9G+L443LsOCwoa3FuL3RpnFLtriHra/sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mlm8Yzx6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mlm8Yzx6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C07CC19421;
	Sun,  1 Mar 2026 02:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330407;
	bh=pK7vpeKQ2abUr9umubfrKkTo/T7YH+letk8RTq0Ua1k=;
	h=From:To:Cc:Subject:Date:From;
	b=Mlm8Yzx6++I7LBeqQis9Iu2pTZpC9sXhcd7w274CcggXYCIcYy84bekvA0dlWPEEa
	 6niJxDf4lnZK2uBiIfR2Xs/Yiv/s/hmS3KeH/2l5RT6xjKNWlsaTKtYFX7NfL7/fmk
	 0k/GPVJ/U0pnuWM/jmpuYiEtRYad00v1TaWcsUs6nLjvldNMWeO9QVPXap82myURXy
	 DmEHzhhU145jydoMdoXkCfLlugLzndwrPqSPfbbLhkGpQf4LsmqPaHolNqrC0OXZyN
	 yUTJfTY2R14AIrWhNbACIGy4li9GyPyolJVg12egE1nwL9NsKPonFl7MIhM4gpRzEK
	 vyOzQvEwcxPyg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: ccs: Avoid possible division by zero" failed to apply to 5.10-stable tree
Date: Sat, 28 Feb 2026 21:00:05 -0500
Message-ID: <20260301020005.1726056-1-sashal@kernel.org>
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

The patch below does not apply to the 5.10-stable tree.
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




