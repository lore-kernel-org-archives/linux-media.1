Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5BE29A9E9;
	Sun,  1 Mar 2026 01:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329297; cv=none; b=mg64TyWZYD9ZyRf9eNeNe9pojdF4G3DMKFrxZmxbLjPqPGMR72WH4NVHax8Jp+wavCwxNDuEyBqNjLlb0ZvMz0/K05cqzvN0kJs1L9Xld3xZgfYoc9hxWJU9zpK7yWUqi9RVzECVCt8ExtPVBviIzC8GrP0tmge7+NQ5kx61BB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329297; c=relaxed/simple;
	bh=pBhVs9+Lcm0Omvzk/QJmtYsmls2+sBIhzgkRj715Og4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K24hfkIWZY2Lp3TkCmoRVLIlwznRjVMdw55qUtsIQOpXF5TfWa+H4Yf+7owA9RJy13mpjFxNExtbFhlb8A1WWwqMpPj1uh5xJ5hIYfVpUqKlhFCS5u5HK9NVAbjnJt1cJp9NGRhXZjSH/RnOTDIXRsjuv13byWJZFc72svI7NNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRxpzBs0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRxpzBs0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80840C19421;
	Sun,  1 Mar 2026 01:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329297;
	bh=pBhVs9+Lcm0Omvzk/QJmtYsmls2+sBIhzgkRj715Og4=;
	h=From:To:Cc:Subject:Date:From;
	b=KRxpzBs0vWrFXFg8Ntjhr3d85r12xzGAmM4GNOGfsae3cgy2uezevHCjeJkGdnuD2
	 RuSDh83p/JZieryRHcGLkxsE/N78DhSiO5P6v7kXqG6SNF3TBaZS5Wxbj/QkwWz5MP
	 J+47N8MokziOfxx1S3GrLx1YumYhjiBmm/peilZhTvL7kQxLmnp6GeH7onGHkyEZU2
	 8rPw60fc8MXGbmKcXXhz/SZBA9J1UguHNN/rFtCmUVBx4EdIoK2MxowwaK75piQ42I
	 S1s/91DNbCm2QjrrXsQl0CDJ2einCc5h5dwSOlQtuGmOLwYBe+huPpGsey1f2AqryS
	 l85547/d7sukw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: ccs: Avoid possible division by zero" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:41:35 -0500
Message-ID: <20260301014135.1703246-1-sashal@kernel.org>
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




