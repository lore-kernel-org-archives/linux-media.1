Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A562B4C6EFF
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 17:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783530550; cv=none; b=QQbWqLvGxFFAt8qFzv/8QKt/ms1HPPuo2lEPPrrdC12eLSlT0668x3ID3KMnvpYjmpDDNYshC1t3UuP/3ru5fzjlp09UNBklgz/wQ5NgSDBiXWdsT6RGCL61qDhn56mbUfY852uKLEw3PBW3f+/efG7lOGxzliM+UlngcOU5KSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783530550; c=relaxed/simple;
	bh=XvaR4zQkJbPVsPM6S3CFh1bYu/lHd9yVEwd/EDiiGlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a3ztrwjvb1uNX/y1dzNe4uX+jXakufDrudw9C5+mbgXLjxgVZ1CsSD78QDBf1JqkXEz3XdErKsxfW6JZgu2lJZr8QED/YuLpYP9yf9Jy91Z/NE2aGDmFR9f+RcwDVgv5WWmDv+SMDKKNy3/LG4ZjuBKJOksucs71b5B5YzSgWlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+yVW0+r; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+yVW0+r"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso1089748b3a.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 10:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783530546; x=1784135346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MvsR049SJ/U5yXRq6BtVkf3/azE0HgRjOrdKEiw2JL4=;
        b=C+yVW0+rEIyUW4VtKRCplFI2W8SoIRwnp187OEuh/sCtUZEvxaq2kcYTvDpMSyp4q/
         5KUHgen5OLiCg8/JrTMJTbijUTVVU9Fr9Wu4/85zoOx0KpFzFt5uvMmWevlzhH7aKX6L
         8FPdhxXo8/zj8NjD3C7bCUqc1C9ZrexBaq49GfuughFsB5QKU4+G3SKhe1T6M8tCJ1Vx
         1FaSjeM0yIiiAxgJBEuU/trhl+jCFFN8O/mAbEpqRNW4T5/Csj+h4KdtFdj87lt8JGRI
         P8I9KEnxyhNAyLShqJvpBNHEPzYh2OuZI/o4PBvymuYSpxbnA8/SQOXuh9hs/oPgZS22
         bgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783530546; x=1784135346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MvsR049SJ/U5yXRq6BtVkf3/azE0HgRjOrdKEiw2JL4=;
        b=CgEVdZJa1fO/5Y+nfuV+hc5+tqX6eTiCFef2siy8OfP6evnyOL5wCfpn4svweC+Cw4
         zkRrQAqUE9ORoHv3i7q2Yhfb6ooM+LgcTajKks3BLif6+Tbb8SUv1W0QXorvdYaBsCUI
         K+VPP/qJWQOFxXfl1KX39gkUUvroQ5/RkmxqGYP2Mc61OX/77cuCmMfhloM2ytmvc5Wk
         8d1kSWhnTlQjITbuK6nCwZubZv2u2szQ20Wi5XhUYoY00DH114rd5PAj0hhWatQxs9lC
         76L3y9MlHX6sTgUjZogWTEY8Wh5Fcz1Fj1oXPLNL2HvoFPkL8Bk20RHSzeYT9hatONnS
         VTMw==
X-Forwarded-Encrypted: i=1; AHgh+RqqtgAZe0rPmBqXDMPwWalvNAVrqWQ9Gr9CuxmPasjma8H+40l6hftaWxuflII8/7g8HTf6gm3po7AVzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7H4P+vuCHUMNXP7jEK2elTJhlVV2QmtuAuyGXOJdPVz9TN5mD
	E/DYYHr4chfWRwDogohX/JO+OFKW/7jfPB5oBg2Mv0NTqDXScJdpkpm8
X-Gm-Gg: AfdE7clbbMYaCnHrlQ7Jtr4Z+sI+zKaL1SZqR08P9q1o27j8wvgQ5NHEe6QuizZy4kx
	U4MNlgjpdV8Arri05E02P/TfaJfQD9tVua9rm6QBQl/DxczQUkOPixxXOF7h4SnNAexM5WvTAY8
	uN4RzB2oE8/H0tzzy2dDDIkKsWch+FGXpAqOJx9FHw7rAmAoBgmB4J+0lwADuQW9PB11Mm4sKK+
	Aw744Tkc1H3j/h5jZ9RRnAcUlOGzEA3A+tk99mK+FpBUOoGgmXTMNFyyPV3vhqx6EVfr4oKwAWa
	3Rmyioy2OfbdZeR12D45bnb7aJKch1zi9/8wmey8S1mSt40RPBp8DIEXqMTzrZyriifpwxBb9Bx
	exc93PZOEVhxurNWFPlPqYb9RiAg3lGalcnBxfHYzgfYvEJw1fGJ01zaPYhR8QAuVJJDUyIJ3Cu
	r5/JhnEKXEvDa8YXnVVbGsJLQyRdT5AVSFrtSfnPF+mPDKIvKZ0V/aFg==
X-Received: by 2002:a05:6a20:7490:b0:3a0:b781:4c78 with SMTP id adf61e73a8af0-3c0bc903417mr3943651637.15.1783530546451;
        Wed, 08 Jul 2026 10:09:06 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm26602154c88.7.2026.07.08.10.09.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 10:09:06 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v5 3/4] media: renesas: rcar-core: Add missing media_entity_cleanup()
Date: Wed,  8 Jul 2026 22:38:47 +0530
Message-ID: <20260708170843.55076-9-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260708170843.55076-6-birenpandya@gmail.com>
References: <20260708170843.55076-6-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe error path and remove function fail to call
media_entity_cleanup() upon teardown.

While currently a no-op, calling media_entity_cleanup()
is an API requirement for entities initialized with
media_entity_pads_init()
to prevent memory leaks.

Add a dedicated error_entity label so the cleanup is only invoked when
media_entity_pads_init() has actually succeeded. This ensures that the
teardown logic properly mirrors initialization.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index c8d564aa1eba8..5bae8eb0ee19b 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1211,7 +1211,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 	ret = rvin_create_controls(vin);
 	if (ret < 0)
-		goto err_id;
+		goto err_entity;
 
 	switch (vin->info->model) {
 	case RCAR_GEN3:
@@ -1246,6 +1246,8 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 err_ctrl:
 	rvin_free_controls(vin);
+err_entity:
+	media_entity_cleanup(&vin->vdev.entity);
 err_id:
 	rvin_id_put(vin);
 err_dma:
@@ -1270,6 +1272,7 @@ static void rcar_vin_remove(struct platform_device *pdev)
 	rvin_group_put(vin);
 
 	rvin_free_controls(vin);
+	media_entity_cleanup(&vin->vdev.entity);
 
 	rvin_id_put(vin);
 
-- 
2.50.1 (Apple Git-155)

