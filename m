Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9652440D58B
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 13:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158115; cv=none; b=piENh7RsbInLkyBIija51cXSNOxW2JpxwwXWmqDaWxoOf6+cOiIWtW68PTKiPglkNcS6ee+GVj9TbNi+Ej7DaAgfsorIx/aw5huULLctNbV2WcnRBxuGjajsUk1D1H5mYLVAd4i3urJismkSm28S2tpVJ7Ha++azyXTmuCVJ4IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158115; c=relaxed/simple;
	bh=ug7fm16F3Xf/YmzKbkYS+9RocgTNQJj3gljHu0/gwqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cQTNmVRxQ+dCIoRmexEZN2ekhXqFaHBzaSltHSfFFDZMoNPAFjZKU65EoDVgGHfJQxwVfGWWYpsaaCSupP9Ixny7Rwo+lGFiY1jZN4xNNitET4STpn5IWvwv7CfvdGBQKRGdJ6rYoMA7B8Mioizr167/12K3QDNxj996MMWj8Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dUj5YdvW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dUj5YdvW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 626B81F00A3A;
	Mon, 27 Jul 2026 13:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785158114;
	bh=go+w51MsVLBsRn8sFHc1otxmie8y0F2MOPax1F2/cBY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dUj5YdvWX8gGqDfQHj4ZF6bZVJaOO1RGkP73hyf6wu13vOVDC0LmPMu9VM6sXrkAw
	 LPdm8zl7LO41uXtLF6QEwaEOKfbs+JGtbXnBBjQDC0xRUz4WjM36kLwJElvPV6hREB
	 /2Q9mvMDmPwE2rbkRAVnycIb89yWkgUR606MFylI/4K8z3IU1LKeAs5IS/UhagT4oX
	 G0YbWvt7VeeVrxmaUdetFr9Kifp3hZvWSwtjwMSKxQoP7efqAlfyicEYRYrj4x1G4W
	 CXa+R9U2nlpXg6eqbTMiLCvORwLHNywOXDSbo+ZlPSFdu+jHTI6Y/FwkEHLUoVxJzp
	 GxmS5zLAmIMOg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 01/19] media: videobuf2-v4l2.h: improve vb2_queue_release() documentation
Date: Mon, 27 Jul 2026 15:12:48 +0200
Message-ID: <2f5dbdb1230ea9a8630e347e80a14504d795c904.1785157986.git.hverkuil+cisco@kernel.org>
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

Drivers should normally never call vb2_queue_release() directly.
Document this.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 include/media/videobuf2-v4l2.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
index d51e10c10fc0..bbdb171df969 100644
--- a/include/media/videobuf2-v4l2.h
+++ b/include/media/videobuf2-v4l2.h
@@ -265,6 +265,10 @@ int __must_check vb2_queue_init_name(struct vb2_queue *q, const char *name);
  * This function stops streaming and performs necessary clean ups, including
  * freeing video buffer memory. The driver is responsible for freeing
  * the vb2_queue structure itself.
+ *
+ * There is normally no reason for drivers to call this function directly,
+ * instead call (_)vb2_fop_release(), vb2_video_unregister_device() or
+ * v4l2_m2m_ctx_release().
  */
 void vb2_queue_release(struct vb2_queue *q);
 
-- 
2.53.0

