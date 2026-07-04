Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58C5301471
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 20:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783196121; cv=none; b=P+LWGCwoX3TK5PFm4K7AiHkwOQS0I8zD+JsqtP0OF90wTRBpVowHU06D51opznEQTCqJxPRpSBmVoVoprM95Bo+WH01nwihTG29rvvP5Yi0JOFIFeeBmZiHEZVOp+7jVFiot5FS30I4l8uqAAknZ5Vv12zH3LBptxTeLxDN7pbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783196121; c=relaxed/simple;
	bh=0JRk+d2LpJKV3BQZ420No6tFZDOzeY0N6zRr9YnAA14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oYU0NHz0YjLuWZmeWL0/vow8bkzrOGUeB08263MtuqaOVQBxqDX6ZWwBqe6D5SiqmpzykQqJ9N7WFoKzIbdW869bxbA9EWVBaKdbcfJJHAM92F9SOCgtGTIReVNOsvcZmbGJeKxtHQmEqSFfufSS/IjtustL1l/3NdsR7Rpk9Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hbu8YL9y; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hbu8YL9y"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-381216921aaso1557251a91.1
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 13:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783196120; x=1783800920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0sHvkZhuGKPit0f3TXdP2d62dGPnBf4J3Peajwi+Rw=;
        b=Hbu8YL9yt4bSDfT7Xtat+ztnQx1LV2+re0qxPifV2auELdLjUqzMVKq/z0ok5l3c0i
         DYPh4zjdlr1WTmbzWhyAqMgVNDo2ofRNy6XHHcCjvT8I586NSfdKzpzLCsw7xyBu0k6o
         Sxo+HYXNOPLcchZLYiE9AmxkUFqxj0Psucv6snzN0SDl2vPp9SJFpG7L/tTMdWhpm9iZ
         Suwm5fwcmoGqagchUIjmIZcCcrkaNxm7loctQx0XDMtY57jmxNW1dGi16tJVxZFqIJKl
         9uq184AvS0w46nKQhj0Iqq1kN6q5eABmtxa5RbbPZD6oc2CIXhpglOH9yReQyHkhHWGM
         xPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783196120; x=1783800920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b0sHvkZhuGKPit0f3TXdP2d62dGPnBf4J3Peajwi+Rw=;
        b=GsZkUGBZaEPhQFeVZt3RBKagZvTqpXR6PRHMLzNpKBvoFR5YlmTWEHeZF0crhTO893
         PuFLYu9bdAFQs5AXGfBTcQG9dorB1OXwFcWK5D1y2EX0mPx4WRQjy5bLXKhQHgOh7j25
         XlW+yi3aR2OlVWqPYtzjcpf9a9tkl38lkxSmc9SHr9xFCPeSa3Oasu1h91Pu1kDhpf3t
         xyD7fd31EQMIghsrCBC5ZCu6apLPB2mXZwl5px8HVPpu8dwYoAVn1PjhZrJgcTdKWrC8
         eKaFv+jybYVkUTSY09FFFBxzJLzAAo+JALqs64ivjYx7mltGN+92iwa5jAisLIScM9Gp
         dv4g==
X-Gm-Message-State: AOJu0YyyMwG7vX+8xhG9WA9JOMLAaJ38XVh2xyw1tU2WEfmbvu/IBcaK
	hn4gPyS4khaeYoBNhd+q66ITfCRgP1IL54JxPaIuU4UhiYQnFHMab5JX0L4Ru1gN
X-Gm-Gg: AfdE7cnB2KaWbgyeIoVvrNrDfROrvB9F/l0v25feujo2yyZpiFOt6ysjy9HArhDMycn
	a8utRvj1+V9MICmtb9IWwteaKH1uVpK1Qwbf/MgJZq+nPCN+y4R2AF/2/kKxTdCMRc3ptkF7eje
	KtmCIkiwm4GARAY6mwPWFds4I9lFWAqQiJu6mTA2BIgLAobhctsBe+WubUhXcd1hsGH6FR1Rlp7
	8e7rd7Rsh/JLSKof4n3pQWLI7Aa3Wvp5oThZtNvgGC4YbMzjF/W8VAi2aeFjfV0d+yyACnxobOj
	nORUkn29ZU6yQ2Q/ux1ifoopd83vnTW0FIAKOHf5FD1OVZQUTsXxdOehKiBuxazdKy/pYLscF1I
	v/uOPxO9JRCS7CdqFJSt5q5SdtqwP1EAb/3Kf9C5qhHV6wXbc/t8EO7SnZJLSCbo77Xp6jz0Ipi
	IxZ7ntibjNYUDEujCibB2hySKq6tSxLjLbQYvFJYN51Ss=
X-Received: by 2002:a17:90b:4a46:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-3829ef0092dmr4578458a91.18.1783196119898;
        Sat, 04 Jul 2026 13:15:19 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ffdd292b0sm6341930eec.2.2026.07.04.13.15.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 04 Jul 2026 13:15:19 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v4 1/4] media: renesas: rcar-csi2: Add missing media_entity_cleanup()
Date: Sun,  5 Jul 2026 01:45:08 +0530
Message-ID: <20260704201506.82524-7-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260704201506.82524-6-birenpandya@gmail.com>
References: <20260704201506.82524-6-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe error paths and remove function are missing calls to
media_entity_cleanup(). Add them.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 7305cc4a04cb1..f9c818b0faf7e 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -2631,6 +2631,7 @@ static int rcsi2_probe(struct platform_device *pdev)
 	v4l2_subdev_cleanup(&priv->subdev);
 error_pm_runtime:
 	pm_runtime_disable(&pdev->dev);
+	media_entity_cleanup(&priv->subdev.entity);
 error_async:
 	v4l2_async_nf_unregister(&priv->notifier);
 	v4l2_async_nf_cleanup(&priv->notifier);
@@ -2646,6 +2647,7 @@ static void rcsi2_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&priv->notifier);
 	v4l2_async_unregister_subdev(&priv->subdev);
 	v4l2_subdev_cleanup(&priv->subdev);
+	media_entity_cleanup(&priv->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)

