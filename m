Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994252;
	b=GgMuVf3eG3d56sIkhG7zTfRbIuV03UG9M2KyTRslx1Pz/cmlwFGqWgR0wO93O4G28meP
	 WaPcsnJAPeTR6xu3F8ZFkxHTbQs18FBqwGPh3AzdEM6dJTutTjcVynEaQwqBrg5qfbZk6
	 O8TZC9OtJJCslorK+INDmroN57zO1FGLuQZVVHjDGl83Lab/EKcMKIKgZNtOXBYzicOQz
	 vumD29RvWypNYvrRe0OzFCC44WOQl8Gff+vMnsOe/toNSaZ0IYyETMasOIvf/61WtvujP
	 whcovO4BbKZnLzvsy+UONNGSzCiYqcsKSsBSFsAsHIlVtOXiUYSB14tw1JE3O8TolYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yH+uT6HKFwSfsz9asBe1dm2/HfQO5A2IC9muIRzxhY8=;
	b=MwWIy7syHlTV73nUqihuW1yfx/MQ3Fk7HxCN4H/VBey0H8QIgNZ/O9AD8vvgWcIhwPnl
	 5i1HJRHsmoGcd3bqwH9BlNhallQmHvhfsN5h8XZpeY3A4gaPU+G2aqAimLDoit4+usXBJ
	 8gWcZhRHoshKI9IYwasswSrVYz6D9Dr+lyQWONEYX9ziO0qxEcwDZiWWG899bhwiJliK7
	 mWdk1vqCPQTA3Sz2B6RjZSLNC7q7EoK+4bpCZ42tGXhePMSXhatRvVEzGsTXMLvWM9LIa
	 8MThQb66yEu15jNTVkEob4ryvJ19vLq5kq4fNO2mWTqV5wwrPBTrjV+depXMlgOwP7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SuBIsyUE;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1A2606A329
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 19:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF1A2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SuBIsyUE
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e09aa5264so592124f8f.2
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 11:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793994250; x=1794599050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yH+uT6HKFwSfsz9asBe1dm2/HfQO5A2IC9muIRzxhY8=;
        b=SuBIsyUEJB2eLevaEPpigwz3HGG1GGAW+q+6ItQQaGvsu81Nu4zyJ4GANAI2lfw/z/
         sxAQ5461HvLZBkqWoqXBBJzSRPGkqwF84b4vOfs6CaINNDc+NEpgY7Iuprh4+essIRBZ
         nNG0dprqrRH4qhYz2wzF3gY4sdX2fTmHu4M+TKgZBOci1oYk2amaxLNreBi/rQygtk+h
         elop4XTHfWm8BJu5a/R7aNVmvLPLh9CFR4jMtDKS0PtM0Xa6jf21AOIN/0Uy/M589a5q
         hZDI3WlM+YmfYb4uOyGxsULBdL8G1qh8sLBXtH2738iyJF0fUUFGJ7knuVu4kfJSTomL
         rzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994250; x=1794599050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yH+uT6HKFwSfsz9asBe1dm2/HfQO5A2IC9muIRzxhY8=;
        b=0nRK96/0ACOPrPzFW8Y9b+s5/P/9sQf2iw9waznm0SAHohJ/ECtBDHZr7C/GQFzxGL
         3nOegb5idIvKvOj8gRzuT4lND+vMeWuG6GXLcq7jLR/2gU2gfAdaj+Jh5mUtaetbwUXO
         CRVY4yM0ghbhMQuVFlt0La+TV8U2LzMAULuKRSa9oiaalZVtVbKrNF96GTf0rAr27/HU
         rS1Q2AwztgZo2+c+04shyUHAks5RgI2rDsI6RKb0e950e9NDjXS+00StGA1Wkrt6xnyn
         gEqqesXhDUezrpJjkhVs9JG6T1JZXqZaGY8mbPrNnegJz6jNejxAnlIb0dFwTikfB+3H
         LH1w==
X-Forwarded-Encrypted: i=1; AKwUvBxpsdDVzEnTD0c2nEFTeuy4tnSWfW9xd9PUQo4SJrIKBqGwpX7Hw3X8JVJkUKma5wqBjAqysMFQYM/8ow==@vger.kernel.org
X-Gm-Message-State: APuU4Z8MvSnV+61S5gg6Wnt8zz8oQaC1xTMl6yXAriVbkDiuX0JkH2d4
	YbDKU03k73cc23tA7l+xtgbRKtpPrTcdVW05TdEGIXp3CLTahaf0l6Xw
X-Gm-Gg: AYBFou0GMBVC3knaMqBY8ERhlfd4BkQVue+sFOAPe+efqd62HlNHUrUreOWLHTGyOcq
	CzNgXLQCqWbcbvDLdRDnZl3fMwYhqIp3Um91YN82hw7biBnLroB0nO9UWnARvZS69x5Q8gWGfas
	XcuWpz6J/bmyYFGiy9PCTsCBolQ9pknEWka+y4w0NAOb71KgCo1708OMTJq1KPlxvabb50h8Wsh
	slk44/Hi/8j0A8AcSlr9FIQXW8aQJH5fHtjXY61tJ+tAwMdoFmviIuk384f6/40blsisKnbLV40
	EP15rdIHVOwEx6SPP6qDieI5NOCRmNZwVwsbLOryQBFt1ChP0dwz7QO7fT4SBlds7PCi/Fim+L5
	05jWYHnsrJ1U1h1QBMvVtvk6yOlbFJRFVL0uxCg97Q/gVSKp5bes6kU2MciAvtJcWE9rwC729mg
	aSHZJHcTOXr7viHmVUxrFUBG0o5w1qdgY33IZYGCPws/awo43oTvEUSodqBoOWb1ETnqf+5ybEQ
	ysPlZfU50i1Ha4ur/MaTuMZVL/WlISlFLn4H3WTDoOE7mfDvoFhOveEyaqOiNpkGLzyhoBKRewD
	3tP+YYJQmERmofHjrzbmczZH817PDVItImvHl8lrnPtJAoSGD5VYMA==
X-Received: by 2002:a05:600c:46c8:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4b6dea69526mr63988215e9.7.1793994250067;
        Fri, 06 Nov 2026 11:44:10 -0800 (PST)
Received: from localhost.localdomain ([87.13.215.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc628dsm5512894f8f.48.2026.11.06.11.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:44:09 -0800 (PST)
From: Francesco Giandinoto <testata.nucleare13@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Francesco Giandinoto <testata.nucleare13@gmail.com>
Subject: [PATCH] staging: media: ipu3: Fix alignment issues and remove an unnecessary blank line in ipu3-v4l2.c
Date: Fri,  6 Nov 2026 20:42:26 +0100
Message-ID: <20261106194226.8233-1-testata.nucleare13@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Fix alignment issues and remove an unnecessary blank line before a closing
brace in ipu3-v4l2.c, as reported by checkpatch.pl.
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 61fdefe78..e9b2ce2b4 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -248,7 +248,7 @@ static int imgu_subdev_set_selection(struct v4l2_subdev *sd,
 	struct v4l2_rect *rect;
 
 	dev_dbg(&imgu->pci_dev->dev,
-		 "set subdev %u sel which %u target 0x%4x rect [%ux%u]",
+		"set subdev %u sel which %u target 0x%4x rect [%ux%u]",
 		 imgu_sd->pipe, sel->which, sel->target,
 		 sel->r.width, sel->r.height);
 
@@ -291,7 +291,7 @@ static int imgu_link_setup(struct media_entity *entity,
 	WARN_ON(pad >= IMGU_NODE_NUM);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u pad %u is %s", pipe, pad,
-		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
+		str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	imgu_pipe = &imgu->imgu_pipe[pipe];
 	imgu_pipe->nodes[pad].enabled = flags & MEDIA_LNK_FL_ENABLED;
@@ -306,7 +306,7 @@ static int imgu_link_setup(struct media_entity *entity,
 		__clear_bit(pipe, imgu->css.enabled_pipes);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u is %s", pipe,
-		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
+		str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	return 0;
 }
@@ -753,7 +753,6 @@ static int imgu_fmt(struct imgu_device *imgu, unsigned int pipe, int node,
 		} else {
 			fmts[i] = &imgu_pipe->nodes[inode].vdev_fmt.fmt.pix_mp;
 		}
-
 	}
 
 	if (!try) {
-- 
2.56.0

