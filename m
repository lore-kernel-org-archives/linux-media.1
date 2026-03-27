Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E7F24B28;
	Fri, 27 Mar 2026 22:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.119.170.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774652284; cv=none; b=Yk+D+2KcBJVD216QqojslxrrL1itKRKENK5bs3CXFFy2fwzv8vaYCGSUoPXmFMinREZWk2JLqI9B/e60V5xhkqMUzpec/slF6DO49PZ2OhsF0JBhL/LhWf6HiuOv1cp2Q53kes5/tXe95luo5oUq6VVvou3yXyryR5zZMFgbZuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774652284; c=relaxed/simple;
	bh=4QMN4An1vCNL2IbU8C/NxUx2K/1XUH/OCoivldx1TWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BcbYtLwZJwlzRSn8+rj1ld7A5jkO0iVHrLYO/dxTzoxJNQgEh+aKTh8IdSmK+3pVdnuIyjsh+me33WIxhKGFNABIuoBziGvKYSG0W3QijGcausTnTJWtWw3VMKawKriy3PM7jbUExJikmCyc+MwDnnCM+H/xJUXX3NCY6jdthXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=r4to/nIS; arc=none smtp.client-ip=185.119.170.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="r4to/nIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crapouillou.net;
	s=mail; t=1774652279;
	bh=4QMN4An1vCNL2IbU8C/NxUx2K/1XUH/OCoivldx1TWw=;
	h=From:To:Cc:Subject:Date:From;
	b=r4to/nISCFh3/ff9pxzN2XI4fsO3mOQCQPMHzCOjoLzRW1ugVNx0B3dpszxRTJpv9
	 ZvEt/lFacSU8JrrUY6TaPG1AN9UeKeFBMronRkwWwNsT4I7I1FxMKyUcNQUa1FgQJf
	 t9X0wQQeiFnFycKwgNucNmph+JshLaz0eNk6I7h0=
From: Paul Cercueil <paul@crapouillou.net>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2] media: v4l2-common: Always register clock with device-specific name
Date: Fri, 27 Mar 2026 23:57:50 +0100
Message-ID: <20260327225750.607033-1-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If we need to register a dummy fixed-frequency clock, always register it
using a device-specific name.

This supports the use case where a system has two of the same sensor,
meaning two instances of the same driver, which previously both tried
(and failed) to create a clock with the same name.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: include requested clock id in fixed clock name

 drivers/media/v4l2-core/v4l2-common.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 554c591e1113..f32263ba96c4 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -792,14 +792,11 @@ struct clk *__devm_v4l2_sensor_clk_get(struct device *dev, const char *id,
 	if (ret)
 		return ERR_PTR(ret == -EINVAL ? -EPROBE_DEFER : ret);
 
-	if (!id) {
-		clk_id = kasprintf(GFP_KERNEL, "clk-%s", dev_name(dev));
-		if (!clk_id)
-			return ERR_PTR(-ENOMEM);
-		id = clk_id;
-	}
+	clk_id = kasprintf(GFP_KERNEL, "clk-%s-%s", dev_name(dev), id);
+	if (!clk_id)
+		return ERR_PTR(-ENOMEM);
 
-	clk_hw = devm_clk_hw_register_fixed_rate(dev, id, NULL, 0, rate);
+	clk_hw = devm_clk_hw_register_fixed_rate(dev, clk_id, NULL, 0, rate);
 	if (IS_ERR(clk_hw))
 		return ERR_CAST(clk_hw);
 
-- 
2.53.0

