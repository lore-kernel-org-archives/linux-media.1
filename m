Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D9C411FB9
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 13:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158133; cv=none; b=nyKBk/5LBaRsHZsMEtqMF9uhoiwhBO1dlbO83xsBIzJ8K9pR533tyard3q93MiMv7LvZiPFIpHkSKtcu1DG3TEPj8FsTxO1Qmjsb3nRzuGusAc/nx/+vXin9vKbiMXl9YSSWLRaWB3C54wWQG71UB4JqDlgUlVuDitbR/I51mPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158133; c=relaxed/simple;
	bh=EloZ5+H4eZqwMfb+uxLTCE0wYzDLClZ8jeWjbf/fUUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lRTflYxg/5F/6b+wzN6WjCHZYTon3eJCg/QL62z+BxWq0IGFePeOgZwSJEMqkmhiDdNxBkx2535wkENV6EIAH8qRG3dkK5dyKkZGGtp02BltEWP3rrG05itOwvHN5xvNcrNh+HjTcrAn6xCHShvARPxlBNiSou0ll5PKCsjpbkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSQOhccI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSQOhccI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E44C1F00A3A;
	Mon, 27 Jul 2026 13:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785158132;
	bh=skJ+L+nfQtX3pYvGaFIMx8t+pQN6iuVu8hEPRTBL8aw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZSQOhccI+vzmy7aAXmpHim9XV5aH5NN/Cq5gKG46Vdy9haO9L9ajx5OyisPqB+x1w
	 kOvG+LlocvNDSjvZ+xeTuhaRl3HCXe+Nn9I26+eW7rnEXpQYG/nWxVAhj+wUv1FfTa
	 989w0xLFuvyR9J7q8Pt0vy2KzyclohJbyLaJeNlMFPnMk5A9Ulpo1PKEF/P4B1bTJ+
	 vCccAgZtfUDnCTL98ML1H+S9KSiZ7KTobvBIjTfU92BbYrgK9K2ZNkZnUl9dEX3txf
	 6cVN/7I0IXtKLUyS6BVPTdDUHEFBjG3T8KfeOX2Fgh8YfI96nPDnV2Jzs8S9hdrWBc
	 GnFJ5drZH8Bdw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCHv2 13/19] media: renesas: rzv2h-cru: use vb2_video_unregister_device
Date: Mon, 27 Jul 2026 15:13:00 +0200
Message-ID: <c59a1c9e24a751307294a6ba445d354aad51c818.1785157986.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1785157986.git.hverkuil+cisco@kernel.org>
References: <cover.1785157986.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vb2_queue_release() function should not be called directly from a
driver. Leave that to the helper functions.

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

