Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F50459AD7
	for <linux-media@vger.kernel.org>; Tue,  4 Aug 2026 11:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842156; cv=none; b=bzJXJQVFVkPlhSAwyZVZH2gfeD4bMf1zYXpINPYmGeoQvQFw0ONBShKg3VbEaIjOJ52zqdq8Gr64PgA3fT8cZS66oNu+Zm320/mhuSH//Qd33RL3GCu8uWcDcxDlp/zntcXg+pDxySgWAigdvRBIKOyJoxqtqPmLVXAdzOGn8VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842156; c=relaxed/simple;
	bh=IUwU/nLGHeCRsSHhulF9+tBrCHQUzPIiNTn1o7uFxQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DgGKj1JLfO4GJmCFMarPOW3q9ETcVizw1mo2a5Uv6IHNugt4Uddklc+zLXxsbne2vUgpbMTHPPsMzQF6q/YNvDGUkUtzzmTd7/D7QVFE9cXhP06U9PCH5e4hhF7MZNJtTFMQvE1QY9CVE/eL2J25mFxCPWQ/OUDXLYQj+oNn5DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kcnYFcBq; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcnYFcBq"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so3016144a91.2
        for <linux-media@vger.kernel.org>; Tue, 04 Aug 2026 04:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785842154; x=1786446954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GFND/opO8GqY6sjWo2/QuYyoYB46IVuPSxGS5+qnPKw=;
        b=kcnYFcBqGpZN8Q5mfP/00OBNkIjW/UyZQm46eCUtExNWtc/VLaQCvqL2Ahbk2HlIPT
         Ga2B+Wy+hZE2IW/4JDrrq+8ir/LLUf4RIe59f/xu0h+fprzFEnamoNukHrtsCXwB1VjL
         lhSsMzufyQv2R+2ZakBQTaDUdzfx75yoiik3IgrjSy/ki2SUJ2HfFZIK4hIJXbAgb5Bj
         PqEDt4eT5NWtQLqUarSWPXbRUbzfRpl56mI50DFXfwrhg/yG+YxM37Uo072APCEU9tha
         yOS6HX6Hd1mdkyuFD7h2yEPeqbRylDciKTm36XoMd+ikokbF7t1UCnKfKUojnSjs4nUJ
         SFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785842154; x=1786446954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFND/opO8GqY6sjWo2/QuYyoYB46IVuPSxGS5+qnPKw=;
        b=K+qYhBakChhzgzPWxjkVb828VhZm8gaPUOILng91VK96cLZsi3bD+8gkIXizr2xcDR
         Tr88AaVofS81y7x5UxtelVaPi+IQ1IZL2ff2XDVTbaUZr2R5N6WCI7TjxSUdYYTWKCCc
         Qce+2/FLUdzr7oE36v+A99vInf/Nu3fS4xluP9Z5xYD1ax96Ku3TnCMw0tliQq7xi9os
         Dr3twYAZSamNR4xUle5QxPUgyZUYxTY2UfuLcPzX2rixGcC+HAuFQWv7+xukdamSJbbz
         Sgl2h6OzzD3O7zpM7erCvLfCBAxhE5uSRntLKjsX0EOyDhsww6Pl6WLA/05fO4GoRFHC
         tTjA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2VkiUZ44TmebdAW4CMn86IotY8uLj6qrRuaG2a/VXo7GbdlBkcyA/3yr8i24FTS7kumJPPb1o7LvHRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7xBu+t6orpHOcj+kge465wYDZ3Rh6ZWLdDojwnoVCP75CO/ax
	JeYDL3TFjYJtfKcw12jqUB/o+2tzHKRZeLNAWBzrNMGEYv6DCbZN+c/O
X-Gm-Gg: AR+sD11MVXFNqn6LKYrmqQwbF06zOD78IVaeH/6cj0XA9U/QO/3oxqFoYNg4s9Dhyr1
	cBGIJV9LdISrw9T8Dvc560azqyo53WwpzD6HQBMCTd1WtO3tIsv4V1dAoDjhCfae3Pt70r7qosz
	ZBuJhh7svuk0GOvykPtLMJLpXb8I27X/9lbladiYRQhuP0zeFynQHPUa+gS08BnCdjzpcYSOeiN
	/GkveGkrHcPyMSPbmPvIzwAL2nc1FP/yLPSrAqJzKZGFmHdRrrb0ZAG5fsTtC5K0F9dfP8ggqXe
	wesXt2rQLu6twx7ncTUWIw+8eDEmBDvFIyf76wkNxhVqYTvD2OTrQJP1i7bs6W+e4uxdpPCdmec
	jEfBeKzQkCD4/FHaLcoZwCCKKg0IzHeuPd7YOnUlDh+PVserBPRi1SlCwjccSke2UeV1sq3jAlv
	FfJlwtxcEubDMraGNAzuu6NtXeZCIgIsa+93Ky7r1IG5M6JB7xQnDEQyvK3zdAiqxFJFrX96pK+
	Sr05EU=
X-Received: by 2002:a17:90b:1dc3:b0:38e:673:5d18 with SMTP id 98e67ed59e1d1-38fbc555340mr12128687a91.36.1785842154278;
        Tue, 04 Aug 2026 04:15:54 -0700 (PDT)
Received: from Vicious.localdomain ([103.37.82.147])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b0c61sm4200044eec.6.2026.08.04.04.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:15:53 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH v3] staging: media: ipu3: remove unnecessary parentheses from return
Date: Tue,  4 Aug 2026 11:15:38 +0000
Message-ID: <20260804111538.22300-1-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux kernel coding style specifies that return is not a function
and therefore parentheses are not required.

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
Changes in v3:
- Formatted as a standalone patch (removed 3/3 series numbering).

 drivers/staging/media/ipu3/ipu3-css.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 8063401246f..84fc98dd352 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -1400,7 +1400,7 @@ bool imgu_css_pipe_queue_empty(struct imgu_css *css, unsigned int pipe)
 		if (!list_empty(&css_pipe->queue[q].bufs))
 			break;
 	spin_unlock(&css_pipe->qlock);
-	return (q == IPU3_CSS_QUEUES);
+	return q == IPU3_CSS_QUEUES;
 }
 
 bool imgu_css_queue_empty(struct imgu_css *css)
-- 
2.51.0.windows.1

