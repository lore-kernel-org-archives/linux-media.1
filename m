Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C103437C93A
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 13:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774098787; cv=none; b=GobjgsEM9shqX3xd9erSdvSbHlnPDg5xeEmPVF5lmECNvzeOf8dKxFenZMAcXC4lcXPyYAMu4Diy/Tl/tEYk103pSr6CqRO98CGgZdHjhQPqxtRHyk8g8+uwOYkXIa4h39zHLGfwUmXKBRNlZ+Hjlb9kKDwf7mAm+Fc0L3N8eeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774098787; c=relaxed/simple;
	bh=XCNqqyh87Kly70H6sujbdS2tPQXNb5tJjEy3opU1vkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G35NuP6zCeW+fYLcKlh4dNA99kPd22+QWgm33LcUOb6BmGtCzPWM5TBlVded5g/i5MHWP8cWoEPLZx3XnIsNurQ3XO06eJDAabITZfT/2PldxnKimnMrsU7asAu5goM7HxoFe/BzbHjt2LOrrQzZPUgG6iQvQl2sX0TSdBrTlbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdBeeZwk; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdBeeZwk"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-824c9da9928so2897781b3a.3
        for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 06:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774098786; x=1774703586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GtCnn+XGQnhaTcOtbdLAx0qlU0NBtVLiSxgKFKna5i4=;
        b=BdBeeZwkgVPmm8RD9D5AZ/dSa5j+jpqytWpuKaNU40aeGI9Wafzc55zWdNmyloxsTt
         1+W8+KykukRElTgFs+kK41A6SN/606BhCHzJnXM++ss8rKLU8slEpfRnGRaa+ZC+weuQ
         N9lBaHae1MWmcq5swYhP5Q/WYAB1xTQsWCLnKo1t1sS/xi2h/Q7fut7RniZiuHqXdiZb
         zmHLdZGLbfN+gP7Rh1FoHrW5roXJ5BHjZtbIMkbjPf+gwUhk247KMZjN01t4Fj7Fm90k
         Fb2/MCoVJuYPSJYFf972LWXHVTiZcpp7yvbxcNwSkri0tTjOsIyx04u21TmYS5LVkhAm
         crKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774098786; x=1774703586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GtCnn+XGQnhaTcOtbdLAx0qlU0NBtVLiSxgKFKna5i4=;
        b=GG0QDNqPpD4iPr7+sXtWe2s3UU8RABCd5P9fi6qyStHHn1Q/WD0BL/SHQav5s/renQ
         c8bjJvWwYRK0UdPRqI3VnJ41j8TG3YCUtdg/se/dUGGXXWfmJm10avqpFD03tgE5ul43
         IiWiW2idzJr14EUZiEWlvTDm/DnrC0xofdPBCFjk2WnS1d/wQb9EgQDU9RkhxF3JlB/c
         UabfRydt+cT5nl5uIqsWrlvrbm/spellHAKsnFRhouwrLWq2CCKAAWcqpNa7hgruRfPe
         Scs2LtqMLKpnPPcrqVmw5HKxYE2fs6W/fxgVnntalAuLWu3DJKbMADrZFp850mRrdTJs
         5cUg==
X-Gm-Message-State: AOJu0YxxrZHWCpSF9Jv0Izy+pb/2yBZ9nypjFXTmOHyk6rlE8dIiutLI
	Md0wSXstUDYmF0fvFHBc663A9brI1VffN5Lq1uSdPrk7n9rw1qEUoF+X
X-Gm-Gg: ATEYQzx69+2uZcHX1Bn/il7tjXEbQM7rdXbfx3/KjQMgh8KG+PDJiV/CzX3lVWGYnPI
	3m3KvPstaaPDFSAzKUsr5iDhi7tUKYDemNYGXpCUNleETaXilJnrXPxnDibRch8TZSZegQEWuIt
	DP//Klc4WLYKHcVcgOyz01uoxL/SnC57h1KYm1DCrbdjbbwGF3q1OOJVBKd4M0NBiX61DnZoPQS
	R7SYKTTgY+ImSIjo2X/IuQxboD+q0Q1//8Q2HXtwbC/W8SxCAs6BpX204eQZg3iEJxe7zkwIVtm
	+YQVqWv83BNDYdTISNQeNpLiw9nl9PjiOEblYKlx/ex5uKWilluKzl7zpX7mZdV7bd8cJKRGSRD
	3LkeNrBJHencL3mFMcTsMEp72eINA4b8wPFxEma7Ng67Nm3JPpfGqLI4d0NLBLYQwpVmutNiLaZ
	bjdjGjD6B36gIUW5TOiTFe+TuhC0P078u91ykc
X-Received: by 2002:a05:6a00:230a:b0:829:8a84:b9fc with SMTP id d2e1a72fcca58-82a8c247dfdmr4710830b3a.8.1774098785986;
        Sat, 21 Mar 2026 06:13:05 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040db767sm5000809b3a.51.2026.03.21.06.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 06:13:05 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 21 Mar 2026 21:12:54 +0800
Subject: [PATCH v2 1/3] media: ti: vpe: Fix fwnode_handle leak in
 vip_probe_complete()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260321-vip-v2-1-d502c1954817@gmail.com>
References: <20260321-vip-v2-0-d502c1954817@gmail.com>
In-Reply-To: <20260321-vip-v2-0-d502c1954817@gmail.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dale Farnsworth <dale@farnsworth.org>, Benoit Parrot <bparrot@ti.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Sukrut Bellary <sbellary@baylibre.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774098779; l=1901;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=XCNqqyh87Kly70H6sujbdS2tPQXNb5tJjEy3opU1vkU=;
 b=5g2ESZGMyyViAi1vN4AcflT55JV1iBiyWJpV3haue90raHopH+DJUPw1CAnscAO79jDYSBX7R
 25tIMYYB3iAAAfG2Urd3r4arnxuu1n+3v/01X2WMHEKmPgNPG9y7Rix
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

In vip_probe_complete(), the fwnode_handle reference is not released
if the loop continues via the default switch case or if alloc_port()
fails. This results in a reference count leak.

Switch to using the __free(fwnode_handle) cleanup attribute to ensure
the reference is automatically released when the handle goes out of
scope.

Fixes: fc2873aa4a21 ("media: ti: vpe: Add the VIP driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/media/platform/ti/vpe/vip.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
index a4b616a5ece7..4fe9e059313b 100644
--- a/drivers/media/platform/ti/vpe/vip.c
+++ b/drivers/media/platform/ti/vpe/vip.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
@@ -3389,7 +3390,6 @@ static int vip_probe_complete(struct platform_device *pdev)
 	struct vip_port *port;
 	struct vip_dev *dev;
 	struct device_node *parent = pdev->dev.of_node;
-	struct fwnode_handle *ep = NULL;
 	unsigned int syscon_args[5];
 	int ret, i, slice_id, port_id, p;
 
@@ -3411,8 +3411,8 @@ static int vip_probe_complete(struct platform_device *pdev)
 		ctrl->syscon_bit_field[i] = syscon_args[i + 1];
 
 	for (p = 0; p < (VIP_NUM_PORTS * VIP_NUM_SLICES); p++) {
-		ep = fwnode_graph_get_next_endpoint_by_regs(of_fwnode_handle(parent),
-							    p, 0);
+		struct fwnode_handle *ep __free(fwnode_handle) =
+			fwnode_graph_get_next_endpoint_by_regs(of_fwnode_handle(parent), p, 0);
 		if (!ep)
 			continue;
 
@@ -3447,7 +3447,6 @@ static int vip_probe_complete(struct platform_device *pdev)
 		port = dev->ports[port_id];
 
 		vip_register_subdev_notify(port, ep);
-		fwnode_handle_put(ep);
 	}
 	return 0;
 }

-- 
2.43.0

