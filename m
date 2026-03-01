Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976D42D9484;
	Sun,  1 Mar 2026 01:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329299; cv=none; b=HBQvfZZHoa0m76guEDUkaHDqR8Fl97EZAygrWbx9Lcgv8dhd5Oz0wcl+zr3L2g2y7PA7/1tmOEgfd5lvUACcOm9kTQvijGvKi8SkOPRs6rsnm+OdZDKEBoX2DmxfPISP1eJZbPYR3Emr7x6MtGmfDAY6RYsuPAjnNVXxW2lym9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329299; c=relaxed/simple;
	bh=TjK96KVMnWT4QXd4EnwpEaJFRh0NLRfbkfOtGhlGLRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HVQ/dq4wredWfuw6Mehwhri9VRZmgKeJ4WSGMOKe2i8MO6SQ0jR1ait0ciMIKQT9nSEkMwkMGPWrAnROGBRs0BFWNRqXnsC9EZRdmC0/rp71o/6zK8dfAr84bCYHD3cxL4/bWKus2az0ouhLkgZRlT6WPMhDWVIlHj549oMzoDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEckp6yd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEckp6yd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BEFC19421;
	Sun,  1 Mar 2026 01:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329299;
	bh=TjK96KVMnWT4QXd4EnwpEaJFRh0NLRfbkfOtGhlGLRQ=;
	h=From:To:Cc:Subject:Date:From;
	b=MEckp6ydKJwd1p8tbjogP81ylEOqpLCj56UNmcruv0o++LyP+tlmrYuTQyTJKMX7u
	 BAaY+fnRSmOiUN5Q+1D+flWOuhTy8Pt9fBKKkFPj/6OINbBw3Ic2eKNW0RqRouamqL
	 3kvrYlqrvicpwYPlqCsie7XKtg+I3oQJZUkDvsPmfzpGF0/EBPUEIZ2J/U0M/qkQLV
	 gmMfMG44GlgGo538A3h8Q896TbOSeqtNj3nnoyzlmtgl8zWVUVj+KusIBdESoIp0Ct
	 SQ9dzlv1etNXJ8YmZz+BRcjWTHpj6qj7XTjAQbnELM+Cb/vjPntfg0pqbuEeNztN0o
	 kAINYP/CJ7yBw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	xiaolei.wang@windriver.com
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov5647: use our own mutex for the ctrl lock" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:41:37 -0500
Message-ID: <20260301014137.1703297-1-sashal@kernel.org>
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

From 973e42fd5d2b397bff34f0c249014902dbf65912 Mon Sep 17 00:00:00 2001
From: Xiaolei Wang <xiaolei.wang@windriver.com>
Date: Fri, 5 Dec 2025 15:19:18 +0800
Subject: [PATCH] media: i2c: ov5647: use our own mutex for the ctrl lock

__v4l2_ctrl_handler_setup() and __v4l2_ctrl_modify_range() contains an
assertion to verify that the v4l2_ctrl_handler::lock is held, as it should
only be called when the lock has already been acquired. Therefore use our
own mutex for the ctrl lock, otherwise a warning will be reported.

Fixes: 4974c2f19fd8 ("media: ov5647: Support gain, exposure and AWB controls")
Cc: stable@vger.kernel.org
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
[Sakari Ailus: Fix a minor conflict.]
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ov5647.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 1041732104fa7..6285e234962e0 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1248,6 +1248,8 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 
 	v4l2_ctrl_handler_init(&sensor->ctrls, 14);
 
+	sensor->ctrls.lock = &sensor->lock;
+
 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
 
-- 
2.51.0




