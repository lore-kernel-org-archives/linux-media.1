Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFE5369D5B
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 15:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783436616; cv=none; b=d4RTYjP2B4mO0YgDMrMWZdSW3WvqMlS87whuTUD1/Zj/pbSk/32yavQJuzQ0W6Rl1a2HkLSqxDJTs60ghB8BIQeedvksYawRIEwG/YQRnI8SYNKs73aStqqkLoXBbJMU1a6DwQsWFPettvE8kYRrujgK8txHctxuF4Ej141w74k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783436616; c=relaxed/simple;
	bh=WIvJ/zjcMo6mUW9sI3RPnc0QUrY+/Xv0ltvp3NGiIxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PV8KydhWLMabLQebTcdj84VbKqjuCKO3cZ3nJVxm6ubBQeXwRA8f8GR7V0RVFFVql1J3xSBtT87n1h8vH77Ntx9WeLghmdrjz069OMCjnuifNldK4P5TEeZ8WgQnubvU0RfsMBET+SxYIqHlza/A1GrtcGoTqooaB1ZDXUo8pKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bwvco/+D; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bwvco/+D"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so842035b3a.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 08:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783436614; x=1784041414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Yuz6fHmdCtAYz8Y8qNJQTbNofhSYgvmngc/Kl/kwUc=;
        b=Bwvco/+DxxmC+3h8w55uzrDiGcY2VeklYoVuJMFbvSPQa3nSbAwpWGRAJWVZPQAGhQ
         BCJILZ2LM8K7PAs9/TeVNj/F2+JgGuo85nnYtrATTFhL5Fk1mNhE2YVvU3CiInOvrT6k
         /a/nkO6sF1Y3Fc9/E2/Gi6cRSdlnsnTHiw83KyLu7eibMQ/aQNgLMvn48HbmdCZwDSfy
         M/SEyBXsW4yn0tBX64pE+fNRi9HvOZgaNAUyN/3YyXpwOJyTMf8LHj6cn1Gf4aBAKjwn
         cO4XTddiAic8bUP6brh6GjepZWexBUJjnpYru7XHtXcIhDUCIZZOtMHCVgEC1H8HvnvL
         xgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783436614; x=1784041414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Yuz6fHmdCtAYz8Y8qNJQTbNofhSYgvmngc/Kl/kwUc=;
        b=ggatUG3a6mhSsDCHVdHq47LtNPBtBY5MIWnuGkvAz234t1mLsK71NNEy0Owi8b0EdB
         sxBQ/R5iYjRVI15bttVfpsHyyrukjKb0SPP0GS5ca6xuS13AxgEkdxxvocHjQX3ZLDTh
         LnfHtXD6xsWk2DeaI/Pq0aBLCOif8xLg/7YiLGKYMg3bJPJmP/RMDpgf1iFkYe1uPx56
         0tjtYm75NpJfxY4KTudENJt4sS1ajmAVsQXFgV16O3rCtzUNxtsF6UXlODVF9f+Oklq4
         zQeVA9GfNxD+1QU6jTWUCoQAwz7IZs81Qs5sHG7YSNjUhAG78sGrFisV5v6HqWWCww/C
         3XOQ==
X-Forwarded-Encrypted: i=1; AHgh+RpK8Q2zc2jQvy+Xp5Mkm9wAIJeCxeVK5cbvWXq4HTmhcIoT8m41T5Eb1SJSNdulVe/TAme5L6UuKH6AUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxww8Ml7xfBCqzKniuXuN6cNlZzjf03N45OI762FebCxjThQPES
	SclxjXEGBfuLr5Ue5NPjRuURpfgAwM4gWiCXwcmYl9T1P5pBeYHXQtuh
X-Gm-Gg: AfdE7cmuFU3685ID6wJjMMpBrTW/QTUIiW8Gei/WhKtwQoxFkXIQthS9wvUJaW58hUr
	pu8uwZJVFoGMr6VmGXBTGr/QjtOWPqGi/4pOji7xsz93gNKUyITpU4ohAt+EKbpDQCDAcYVn5FL
	PDWUvts6g6XUkyeRFJfihtVKK6KdfnK0gRg6bn1BruN5ASTVCK99ddT9enkHElfL0R4GRXOraqL
	1feE3/qsf51XwxNa9TVpZXJT3BOP7t7nZxt5juFqbR+JGsnKC19x6ZO6k9sE5+O+x4yAV08CUQy
	5Oc65YAqnM1BLWloDOGBJjo+DrMeQFBDxD+o5f9C07es7GsQL1Lb2qKRdkJ7i4RS4FwZLrsOmgW
	GcDayJYl+/jvADIGdOJmu3yqF3PmvKBQ8KebXrJXOC2VqR6luhgwRwBqEkg9tuKNZon75xBxnlI
	Ce21KsEaiWJXn1zPSKgWTuuvkU7dRScedeqMe+GP02SszX
X-Received: by 2002:a05:6a00:844:b0:847:e2e4:a36b with SMTP id d2e1a72fcca58-8482f4ba9fcmr2733557b3a.19.1783436613808;
        Tue, 07 Jul 2026 08:03:33 -0700 (PDT)
Received: from Alvin.tail8ccd9a.ts.net ([49.216.173.166])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6dd3bd3sm5604773b3a.58.2026.07.07.08.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:03:33 -0700 (PDT)
From: Hao-Qun Huang <alvinhuang0603@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hao-Qun Huang <alvinhuang0603@gmail.com>
Subject: [PATCH] staging: media: tegra-video: fix of_node_put() on VIP parse errors
Date: Tue,  7 Jul 2026 23:03:26 +0800
Message-ID: <20260707150326.554689-1-alvinhuang0603@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_vip_channel_of_parse() initializes np from dev->of_node without
taking a reference, but its error paths drop one through the
err_node_put label. This underflows the refcount of the VIP device's
OF node when endpoint parsing fails on a malformed device tree.

The only reference the function takes on np is the success-path
of_node_get() stored in vip->chan.of_node, and that one is already
released by the tegra_vip_init() error path and by tegra_vip_exit().

Return errors directly instead of jumping to the bogus cleanup label.

Fixes: e740d199cf0f ("staging: media: tegra-video: add support for Tegra20 parallel input")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>
---
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index 9ff1f1750a15..5fba11e31e1d 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -126,7 +126,7 @@ static int tegra_vip_channel_of_parse(struct tegra_vip *vip)
 	if (!ep) {
 		err = -EINVAL;
 		dev_err_probe(dev, err, "%pOF: error getting endpoint node\n", np);
-		goto err_node_put;
+		return err;
 	}
 
 	fwh = of_fwnode_handle(ep);
@@ -134,14 +134,14 @@ static int tegra_vip_channel_of_parse(struct tegra_vip *vip)
 	of_node_put(ep);
 	if (err) {
 		dev_err_probe(dev, err, "%pOF: failed to parse v4l2 endpoint\n", np);
-		goto err_node_put;
+		return err;
 	}
 
 	num_pads = of_graph_get_endpoint_count(np);
 	if (num_pads != TEGRA_VIP_PADS_NUM) {
 		err = -EINVAL;
 		dev_err_probe(dev, err, "%pOF: need 2 pads, got %d\n", np, num_pads);
-		goto err_node_put;
+		return err;
 	}
 
 	vip->chan.of_node = of_node_get(np);
@@ -149,10 +149,6 @@ static int tegra_vip_channel_of_parse(struct tegra_vip *vip)
 	vip->chan.pads[TEGRA_VIP_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 
 	return 0;
-
-err_node_put:
-	of_node_put(np);
-	return err;
 }
 
 static int tegra_vip_channel_init(struct tegra_vip *vip)
