Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0792F3DC856
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276728; cv=none; b=ip0O+HSO0ESbqQZIae6vilTlbVKriV3EX0XEiY+bqfvexCDu1wz6Cag9x8H+JCWhYdGt2EPx7cDbLQp/1j4qndKeahHT/gHupe6OUqVmVC/m0o6VSwGjRDF9s5pId2drq8UbCZoDho4vYmVmC4ezmFRVq1qAdPZ0CM2gWWfAxUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276728; c=relaxed/simple;
	bh=ATSDvsIIUVGgwcTKqKx+xt12tyu4r8QItLXnZXNdurM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kRqCeM/Agfw3TTch6nhA3IAHWnjMOtpXPhgXcovT9A9y+eAIARQ3SsvEtqeiqoxCoHiJKcKBjk00QAxs+EXNWMVDoSrfNgFruGnZK3YRdpLMzAhyUeNeRccR6TpRqQT21qUzibgjHJ51VAxO3sjjdIq4sPPc4siWjqgfE81bO7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nl4nnU52; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nl4nnU52"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470481F00A3A;
	Fri, 17 Jul 2026 08:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276726;
	bh=82Kgv6BDyp+68ZXLA3p+GYNjt1OEtxYvve+f+0hS0BI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Nl4nnU52KATUePwMti6BIr3l1d2uGlTs0/r8dyQwEemZ58FIbFRolOXpvPnx3kJMR
	 qunCP+f+MXnbiNQu/0WoheS52RHeiepkfKI/CYCKXRlByzj5NRm/nGj/fWOBdDbU5M
	 C/cK3x4FdnAijFSuAcqRiMCo/ta5bwUvyX8180w1FBouBHOErCOFs39/N6fQPwQEjy
	 IG29dtcdT64p0DPBpFFQdT/jIbReZ5Kzn7kAy4Hh20LlOEPPSfraHefydrgvOdLdsf
	 6rcYg4IrG9UzKslt65T0hn36aRP1iPD7+iwvWJR0ypKks/ywCs5ymNhhBdkOzKnxIK
	 fLTNEK+2SeCiA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 13/19] media: renesas: rzv2h-cru: use vb2_video_unregister_device
Date: Fri, 17 Jul 2026 10:19:36 +0200
Message-ID: <eee08ca4982b830caf2e0e2851c23b940834f2f9.1784276382.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1784276382.git.hverkuil+cisco@kernel.org>
References: <cover.1784276382.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use vb2_video_unregister_device instead of video_unregister_device:
this ensures vb2_queue_release is called internally at the right
time.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 5185a547461d..2f5ab1e4707e 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -1091,7 +1091,7 @@ static void rzg2l_cru_v4l2_init(struct rzg2l_cru_dev *cru)
 void rzg2l_cru_video_unregister(struct rzg2l_cru_dev *cru)
 {
 	media_device_unregister(&cru->mdev);
-	video_unregister_device(&cru->vdev);
+	vb2_video_unregister_device(&cru->vdev);
 }
 
 int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru)
@@ -1118,7 +1118,7 @@ int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru)
 
 	ret = media_device_register(&cru->mdev);
 	if (ret) {
-		video_unregister_device(&cru->vdev);
+		vb2_video_unregister_device(&cru->vdev);
 		return ret;
 	}
 
-- 
2.53.0

