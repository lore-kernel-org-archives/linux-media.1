Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62523B5310
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276707; cv=none; b=uVCirQD24hvpD+5PAJRyYZe6QvLJtw5D3r8WET0kw4N85ggYMyACV+NFF5Wnob5aQ21MT4lhwmsZFjGWEQ04qj70Ykzsopk+KskE2VOyuixXDU+ap/JmgcZAC4V1tSSDpiL9G6WxHiFaH8U8yYQ/o2DbqvZOKX7s4nmijPN3qzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276707; c=relaxed/simple;
	bh=ug7fm16F3Xf/YmzKbkYS+9RocgTNQJj3gljHu0/gwqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LBdktlZ6ZqmLiZ/VP8T1hrEomlg4UL0fOiUDr3kW8bM50Ui51LKs98GwVw2ShDs7nclByID87Gqn2wg2vmf4aZLnTa/BmVnNUjobjg4ZLRxHSJ04Cl2i5vzAHGnN+8e6rnmJBK7SGcP/+w9w7fznvL3FloVxVU1p12Eq+EzUYgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MF2V2K2R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MF2V2K2R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969A81F000E9;
	Fri, 17 Jul 2026 08:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276706;
	bh=go+w51MsVLBsRn8sFHc1otxmie8y0F2MOPax1F2/cBY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MF2V2K2REx0HmzhMkPrQh30/ZJAyUe3U4/0F52g9RLVVNrCDrgJQFxWNcErTRhzuB
	 i1UTneMDl38IjSyxZ8z8xedBI2fl1AVX9+SGtYX/ghWOmiHdU/h0WyP83w8nCENuAh
	 eHuf/ImR9IGArpYd5+fCVlrK/GAdwWCR7OLLVd4Kb07OLI5ST4CSkayDBvOQOdUfL4
	 gookMN4U0LcrgkTHT3Jn+pTgt3FhgUZrVDjW5dZzbMqbUFQXsxchokJFAsfJzVLbgU
	 Zd3ATjYMa/K9crlBIB7GavrODxwB75hOp5eHVkK9l+sUhwN87v7nJ6lN8WTJXsdkRv
	 IdaLdTsYct8bw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 01/19] media: videobuf2-v4l2.h: improve vb2_queue_release() documentation
Date: Fri, 17 Jul 2026 10:19:24 +0200
Message-ID: <52873a20d9ea4b9d8e4f5be815c07d7ff8dea629.1784276382.git.hverkuil+cisco@kernel.org>
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

