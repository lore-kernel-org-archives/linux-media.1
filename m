Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196434;
	b=bh0wrnka9lD66urJ1hyjN2Si4DZC1RPAkN6Zqxe9gar1sjf/xbyUjyvKvNWZUuccVXCp
	 3MWfVuXlaye2RWcjXrwSzEpfNLVk0t01h/qvZUszgpJyJOp32DFWCF1fnkhkMFqtZO4Fl
	 Jb7MxHTh+9bNm0ugOBYplk3baQMDhswPuPmO8qYK95zy2kUfo1A51mcwTkdCHRzobw3Ff
	 y312KtFVmuRDjUqETlhsDxE9bQZwKFkZys6DnqKBvnoKrcc7ydXbCrDgIv91AkLhS1nNP
	 TUYmCtmfRKVKHkzMiP/Ro13wqp/FWKI5Y1O06t28+zpPdbkQQ1jMOMPFFG337Bns3zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mAqhAwYtTGGUt9HsaNHp93GmUA0b3RGVILqFHkMc3dc=;
	b=WZhUJly6fb/UzBbesaI9TVWJ812u0JbCgEfKTqDyrFXosjhM75208OUJ+EbWlTO6p8e7
	 s4i6WcuM/VywyZgTTqsTdncW705+4lin2lUNJDthAk06km805prjD70YdGB0ITxW3kipw
	 uIqRUS93M78BvGax3/mVur08PBEpqnThxgk4H++HnyFc/iI6La5MkTTxDwG08TiejpnF6
	 WoVYzKtXhunTxbTSK4N69wpWcHF6Yha2ZWU6hSIw7ttf+AjoJHlcY59ayWN+QX+cDAcvY
	 SdGtohfcHtQJ0OPr0H4jPByQ7a9Yjb+ESU196OXrcnNjhSgepiPkaBUD9cyxlbpl72A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aBURvjdg;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AD160A2618
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 17:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28AD160A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aBURvjdg
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53639b8903bso14417881cf.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 09:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196427; x=1795801227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAqhAwYtTGGUt9HsaNHp93GmUA0b3RGVILqFHkMc3dc=;
        b=aBURvjdgxtLl5qAXgNdjYWSJnP66qnq8B2tblPLUXp88tUYLeqNR+SLJeCHnh2nghb
         aTPmeT7jUar3P086sAi4sgLvFaRZcRvXDyRVX5ClNXV1Mg7gbBTOJbUvFBCwe/nLJ0oS
         COtMCuYSY8Ej/OrWv5rabABWXky7gZzf0IyHlOU2+y3EsRkKcVsYcDs4cI3V0ilO+3gv
         2t0CntRIr/Ikh+R08aOf4B5Y5sk6QeTU37eTl1XFQD/d9hukV/pZoavqBHYCkquiW7l7
         Spxtogf8d/rH0ZpKrubJDKhDCIiosnQ1cel5U9eRRKgGAs5OyRYWBNUzpwFkBzl9DGxl
         PVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196427; x=1795801227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mAqhAwYtTGGUt9HsaNHp93GmUA0b3RGVILqFHkMc3dc=;
        b=Tq/S4oG8GPVVnffesgI7w+02t/9dbTlY+LUKjTbfFZbqHn+wADiiBx/d1Jql6nn/H/
         rTin4l+DzZ335t8Vzr8iV4magY/3V7gOkHXX5alxZ+Vrv4Kh198BjH+gok9h0VtoegjD
         SbRDlqoRv+1XMA6s1cAdwnft6DxjurqG/u+cRxcaVHk8QmHLcfDlX3Bz6WJUdRqoU+7P
         NH6nLrQ0jbmwXPF7/no0BeN4NVkpD9sYboexfeesqgPdoAzd/ZVJdQm8d7vTZDz0Iebd
         KDkI5Gnx0gSz8JlvYWB26uEAGgxE1+CPOaYIG4hY4wvUu6Sj2hjwL+Z0SdTAnSX8MiUj
         mexw==
X-Forwarded-Encrypted: i=1; AL+hErHt/zi6Wc3nyxrSXZEasBQiH9Hb4iWyE++/4CMJzUSWlEACCXMCJwIWG87fdkzqymO1empZa0YjuJ8YQw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/oZrGlb4Ae9BMNNPQqu3+ijLvB9Ta5FTjhRYViWCAIPuu6Adsx
	MwOb0PDZeN3ClAwb3+947e3BLzaUgbUMcHCl421o1FbTgXMU3lR7/umQ
X-Gm-Gg: AYBFou26Yp8Kq4BVMOv6lVqRm0RtGgvIcCjdGupkpXsO5y3ApfLe9bLwo49IKAlohsr
	rSkykgHMe1HPqorlQQF26Pnyy/oVUioZYbQsaz/wmN77P9m+gS3fYH2FtEJoUSTZ8IinArHbGeU
	BFScv6j4bCaCZBxZYoZsWaLu7i+40Bz/ubQLyvWjYsJnip6ucEY+mDxqtx4MC6CWd/0BPXn6fsG
	wqcVz6Tq4f2kDsK5VRdXOQekfBjwrplgVK4y1VaWDGHzcAE8THFtRFfFZgWX4Gx0fOMmV8ZNzdJ
	c0yUnd+6gfXAh7HpCiuQuQff6yBs2FomOsvy57FJpP/lfF0MzgUepYu8ToXHNqNmAyEwnt/axUW
	GYj/krzIHvw3H/TW+Iv+rwY+dM1Al9s5VRydwuCIqUYI2RRmyCQQylh+btGRkerRBk4Q+4H6MR7
	sg+4vv9EwuqikV8UJOHiVFrlOHOM3r1um+hMnrOc2P6MVsFxHQ4RZcWrL5opfBi5FXzw1Z+LjzB
	s/U6gIKRaknePFZYsJXzjLW20+aqc/F7VR8X/h7RIZb2SZ/AtK0gq+0jBgXj51UeCUks2KghkJa
	MXUroj2ZMKO/7LBu2hrwm1sn+kwTSVAcsTxcHtpVpef2W1RHuOVu3lYd1uVycBIR5gONWOeuG/j
	3gusbH5VvObl3C4XVQTD6tZk4ErjyRY2zFI/10goUJLbTw+7WOIOybY0NxG9dwtUJfb5unJnsLM
	Wigs/op9G3fVYiMZaDAsroiUJpbGBJrIDE6jprXLVH11c9+Z+RE2z1LVkGjhpLOG9WKXI4E/KKx
	RZ3rlUXWThq49SO3FSzLcvHEBygmz1FXFpfF4Uj87Q5WA==
X-Received: by 2002:a05:622a:1808:b0:535:a5f7:d596 with SMTP id d75a77b69052e-55d6fd36ed3mr78926921cf.37.1795196427043;
        Fri, 20 Nov 2026 09:40:27 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:d420:4621:169f:8773])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8b6sm28110831cf.28.2026.11.20.09.40.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 09:40:26 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Allan Siriani <allan@fatecpompeia.edu.br>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] media: qcom: camss: x1e80100: Use the lite clocks for the lite CSIDs
Date: Fri, 20 Nov 2026 12:40:24 -0500
Message-ID: <bf48f3c809f33c060e2944e5896f8a5a93fd78ea.1795196107.git.jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1795196107.git.jesse.casco@gmail.com>
References: <cover.1795196107.git.jesse.casco@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X1E80100 CSID_LITE0 and CSID_LITE1 resources list the full CSID
clocks, "csid" and "csid_csiphy_rx", instead of "vfe_lite_csid" and
"vfe_lite_cphy_rx", which the binding provides for them. The lite CSIDs
then run with their own CSI-2 receiver unclocked: their registers can be
read and they raise the reset interrupt, but they never report RX, RDI
or buffer-done interrupts, so no frame arrives.

Use the lite clocks, with the vfe_lite_csid rates the IFE_LITE entries
already use.

Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
---
 drivers/media/platform/qcom/camss/camss.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index f8e5cf9f3..7d9622097 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4287,13 +4287,13 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 	{
 		.regulators = {},
 		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
-			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
+			   "cpas_fast_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx" },
 		.clock_rate = { { 0 },
 				{ 0 },
 				{ 64000000, 80000000 },
 				{ 80000000,  100000000, 200000000,
 				  300000000, 400000000 },
-				{ 300000000, 400000000, 480000000 },
+				{ 266666667, 400000000, 480000000 },
 				{ 300000000, 400000000, 480000000 }, },
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
@@ -4308,13 +4308,13 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 	{
 		.regulators = {},
 		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
-			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
+			   "cpas_fast_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx" },
 		.clock_rate = { { 0 },
 				{ 0 },
 				{ 64000000, 80000000 },
 				{ 80000000,  100000000, 200000000,
 				  300000000, 400000000 },
-				{ 300000000, 400000000, 480000000 },
+				{ 266666667, 400000000, 480000000 },
 				{ 300000000, 400000000, 480000000 }, },
 
 		.reg = { "csid_lite1" },
-- 
2.56.1

