Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5154D385516
	for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 09:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787389618; cv=none; b=KKepuewA+zquIpc7B8YSsbio5jVL1MosWjNpfbTqOhrF1TKHBJY+YELPol2pR80XtAFiFuAchE2T1tdrBLtmiAiucjnt8EavfphFNFhp8TGE4hEiY0v7rgyXrITu9aQVE5JJ71PABZXAIO5wW43iOlbxn1jFbZo4R13ceA+vUCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787389618; c=relaxed/simple;
	bh=q4589WEFe1hSmKFlywJdsJ/lnUIFjIUMU1bqTMNIsJE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fhc8JkCZOZQc9c/jhYxXDysHRxEnJ/yTRHe3GpcXh2eOxK5R35v9roB9kkwkFIgBPEtEUxbAV60mIV2ioF/JsvsOgpKdC23EUkXxOQZVqNjLt3T+VskYttohtzOqlZjpSNqt+JzGqi9aSsrWYSecRvaW2xh0ddDdjFSQqkU2CzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sDxONb0G; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sDxONb0G"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c169ae1cb26so582855666b.1
        for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 02:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787389615; x=1787994415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N8IEVUeW9Tq92JMJ6TAdUA1Txue5G40TVIlynfVTyXk=;
        b=sDxONb0G7lHz8aKZyVmPvttQ2hafzXMcVcfXDlI4ByVCgXM+mD2RcFlJGzcyQhVYF8
         ecfzQJLGhOnZu2ICTUVZIiBFhWNmxmMdsKfcMowy8m9J8ysyP/6xBFW391WxujtJGeWn
         00QPmj7u1mPGP3j8rMt/TyD8Mmjc/xUoWSRBJSavF7fSRgxqhITm+rVaD3zFO9IfvTDS
         BVajel5OpouMsZ1KZ/HUT1IiOtksnxA/4FwJopjuL7R4UGoK+WuK22GArBBSwobBJINc
         RH0VuhkaMxGavyl1MpghIhcadiVwd1RuATpouBCGFIxomy1wwzsTN35vHC7anBTXs7Aq
         I2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787389615; x=1787994415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8IEVUeW9Tq92JMJ6TAdUA1Txue5G40TVIlynfVTyXk=;
        b=JAYYMRuWYxVtSUEiQmNm5OJ69Eds5szH/BZvWSiqnP7lp6YHwu8IqNmfZBmcStU767
         PJr6ahkd5WiUnzWOLasurprY2efZqC8WKn6juIvvrNIur113ykMCdJMx5tB8rVPt7sly
         bEvaGOGKUnoLzIAV2jYJ3jDitNxj51K0PiLQ/GZyPgIBuEldQ6RS4lk5/vJBR11RkZo+
         Jq0xohZPytu9xLv6gcw8PN2N2rizu1DuQWg6HcEg/DxrJP2+N2h8n3tUmqzitTP8kO6R
         YdvcIqMBi5n9jTniZz7PhE9wN3PyXoQarMQ5lpIhfUYfRVhfIsQRmYVk9TM9BeUtEie4
         wFqg==
X-Forwarded-Encrypted: i=1; AHgh+RpeUNNisDiLTajAJBmnxWoUJgLyHi/vr+YCdEFkV7by8M0c13ZOCUyV/REn3S9mol0I+fKCHCCIWlr1Pg==@vger.kernel.org
X-Gm-Message-State: AFuF++ngWq8TOMISbEKprlY0JBOvS2jYyL9E5MnBMIAOPWk7vycmr7Pc
	RUNunBIsLFvLtm5p8RYfofVZyOegCI+fLHhJ89MKFgTPLBEvtd18bw0v
X-Gm-Gg: AR+sD13tafPo/1dp5Ba2Mp/Ek19MappAke3La3zxCkTqL4OjWKE73DL648DjxzwzUX2
	8XF7AJIvNdyxQAvJdYXppKqFweQoCgQ2H10uxfSCEgu3928E+sTYN88DboUB2yybY7OjZqU9a4y
	XKwqzlhBgbrj/s/G0nP7YpxEiKIH/cZe9ctOmJOocYKW9JnlC/hDB23i06rIKAtZqYpQz7Kv6gx
	l++1i7r9og9CU6HmDvcf3pAoFi8sJRAXYqx4H6pj8DbRZGR6dK569QqVJ8qx+MBzIn78i0cnlxr
	5BS/ZMTVq0UiXhgb1tGfJ6bsGRmuNtyn6B4HoXam/q743p/XfsexksxbzozMnil+xrX1XQRJmsb
	HGIQSz0kGLkfLM21HM4jqJ5XR4jXlNgI/yW0gWtd2aEk68rWqWbErbKNO3JX+NsaYDxgfC3wEuM
	9xsIlOfZL6drpVsADUbdyAWKOWBAMbgYWSUDdGpXpi735NXB1pjL4zFY0/+MfUl4cINp+NDEbhg
	82iLa2QgSUE4KdYf80T3FmJA6qGbEwzLNyS2Zk9BDnn25FXdguTDXjHgnaVeCxI3bzEGT0pKxEa
	IoLKQduvTu9fZUV1N0jEDPbVbdxxYzEBdcu+CRxtwAUYvMLj7MG0Hb86NkQVZKAj3qMarcAm1w=
	=
X-Received: by 2002:a17:906:fe0e:b0:c15:c323:36e5 with SMTP id a640c23a62f3a-c244d7194bfmr1531056466b.10.1787389615375;
        Sat, 22 Aug 2026 02:06:55 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a0f5-8c01-3de3-cd62-aa6f-2fb0.310.pool.telefonica.de. [2a02:3100:a0f5:8c01:3de3:cd62:aa6f:2fb0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff17df84sm14576816a12.31.2026.08.22.02.06.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 02:06:54 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: docs: fimc: Update module build options
Date: Sat, 22 Aug 2026 11:06:47 +0200
Message-Id: <20260822090647.98016-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 4af813108b88 ("[media] s5p-fimc: Add support for Exynos4x12
FIMC-LITE") turned VIDEO_SAMSUNG_S5P_FIMC into a menu and moved the
FIMC driver to the new VIDEO_S5P_FIMC option, but the build section
of fimc.rst still names the old symbol.

s5p-csis.ko has always been controlled separately by
VIDEO_S5P_MIPI_CSIS, so building FIMC as a module does not produce
both modules. Describe each module with its own option.

Fixes: 4af813108b88 ("[media] s5p-fimc: Add support for Exynos4x12 FIMC-LITE")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/media/fimc.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/media/fimc.rst b/Documentation/admin-guide/media/fimc.rst
index 267ef52fe387a..9827367097daf 100644
--- a/Documentation/admin-guide/media/fimc.rst
+++ b/Documentation/admin-guide/media/fimc.rst
@@ -148,6 +148,7 @@ or retrieve the information from /dev/media? with help of the media-ctl tool:
 7. Build
 --------
 
-If the driver is built as a loadable kernel module (CONFIG_VIDEO_SAMSUNG_S5P_FIMC=m)
-two modules are created (in addition to the core v4l2 modules): s5p-fimc.ko and
-optional s5p-csis.ko (MIPI-CSI receiver subdev).
+If the FIMC driver is built as a loadable kernel module
+(CONFIG_VIDEO_S5P_FIMC=m), it is named s5p-fimc.ko.  The optional
+MIPI-CSIS receiver is controlled separately by CONFIG_VIDEO_S5P_MIPI_CSIS
+and is named s5p-csis.ko when built as a module.
-- 
2.53.0

