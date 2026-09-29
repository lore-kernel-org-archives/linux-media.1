Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AB734B1A5
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 09:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674134; cv=none; b=cTHK2QBEGO3yGdJI8MnAdeEYmAPLfjEhDZKcP5Xa2Qsd8rONFrAtzNXtw7DeRBvbFhEfk2MWKZt71ceOE3ZEBqx+/iyikkfU1h9EXY28zhFJQIhCPyLmKhWuHYijKXd3sIGrZdXsjQNuDsR5gAAEax7IK1MdhG+JcwSHVfbEqFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674134; c=relaxed/simple;
	bh=nwYtLAhnmbrGjBGv6GSjt3m/Fi9B5PcJQQlfDeJWysw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VFj99kxhnVLnNz6R6bjwsr8qszm+bw3CQeTBPre4CWGWuM/ZK9hIOjOz4R5QWqfoHFTgp9WptyKMYOyC1gVZWE2W5bgcnKgtI5k0HzAYnh+6wzAw8bEebviYPQCEgH+KibbDDYIZ4VbmUjP0DfB1QYWsvalENWurRs+Gh90UvqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ik2qnq2M; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ik2qnq2M"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b76694fb7aso645423e87.0
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 02:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790674127; x=1791278927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sRLBtxUbLFcLi1O7YY0Vg1lrhetJe87BpP5hyxgIAws=;
        b=ik2qnq2MMje2h2C8E91fWO2kOiQBteMKS91ZPN1UDksacQTjCalAjpB3TY1OzP2yxy
         AXqjUrwuT0WZ3K7QPoSSJMiLgJq73o+m8Ur0Za/ecXS5mDqRvnWldG26WMQ0ODdO9PyL
         OlexUl4H9m4XvXe0QrPOBsgDyEmCIsTH53D/pFFNLOomZEPY9KhHsvBo39/V21qrKWKN
         Wo8ik3XEcMJqXbpqpiYWt5Ik3jEXmqGECT0FmoLFFVFzqrktBknFbTTq8kJ+NIZ+vCMj
         QEOINd+KkJrtpLX4Y5bSVknFelK3pISBvS45XqRec0IhMSzv1bivwX0GKmqw/2xjZyXd
         aJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674127; x=1791278927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sRLBtxUbLFcLi1O7YY0Vg1lrhetJe87BpP5hyxgIAws=;
        b=qnNH2cANLssFwWrvQXTLv4tgjznsEWndsdxqudgIbYeOJlhqUZr+PjXSxZT8KV28CT
         nZ+mu9iGbq63pRa9uhx2GZkY9fWh55JSGz1LP1w/5pUA5kCYFswyyybdPq2ADnJ8uy2x
         0pfYvopuSle8ndE/oKgfgV0jam3k5SdT97MFrVknKwb3GzFpAHzAdRbZUZiD96nvk96e
         jgazAgpARHu1Z3BxGMxS9KscMYzOZgf3YB9ITfaGySLcZ7bpchTbV8xJeI7rNUJuF5za
         tdOafAyIpCFO4eZVU4Pvg7ew+1DQo4OluyKaL0AD4buFBMEcYjY6ugtmSpEPJu0C9KwQ
         pE5g==
X-Forwarded-Encrypted: i=1; AKwUvBxwWgq24JMNvJq0h7z4Pm197BKuBTMaWckPNk/k4R/W5tQ7qwwgtmN+NDoBvb93089L9iTgvR4+4Q6Rsw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJn0Bbxvq8ORqTdtwhJiasTTQA6Cj1IcZGhvInbRnEnfUlDTRFY
	R17ALzqmVgclY1lXA5kCxxw/DSXfBnmwOqc5ID/zlpET3BJ+Zw7z9Ld2
X-Gm-Gg: AYBFou1oKIx0D3QMAZpgYCgoryTjA/IiCvvRqc1aWYZxBHvqCzc9GMeEW4lvCNxjnNP
	4HR8/wXKikBmJITvMaTxYLYI0epxOIkXkbrVyQB0L53emNMQHBxlFevzdGuCojY/ttH9kDfO5MM
	/bFqbukRAENx1kYikXn3yFpv3g9ZGrYyr0q6Fb9nk0syV4jxqPZCjpbm5dq5tlWc7kcz9AS4hF6
	UVpL8oceTbNJ1hXXnxO+ET1XuAriywrYDfGJzAaiAkVs8ZrCCuQ6SfZLCEBa7P7r9kzdR3DUqQb
	KPad5eph1n0wRwaiW/S9Ebguda89xJ3drB2LfKl1QUiGFExBsf9JcpgP8uJjCf2kT3/vzXy50LZ
	hkDwAzdjbtKI8UdZiwaq+ZGS/ygv9cbpX9Nadc6D2qYwLuyj4AKZ0J5QXwcY5upftNK0Oz0URAw
	0u19A7uQ8PItNuJvqtTuhjeFw0HN5tSn7ye6Y8e4CR/F7980Vy3ly5BCerTbUq2nKbuUMuNCIhB
	1fyCfobnA59
X-Received: by 2002:a05:6512:2386:b0:5b8:f430:b617 with SMTP id 2adb3069b0e04-5ba2e6b132fmr607252e87.45.1790674127261;
        Tue, 29 Sep 2026 02:28:47 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([169.40.47.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb0bb2sm1216403e87.37.2026.09.29.02.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:28:46 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH v2 4/4] media: i2c: vd55g1: Add ACPI support
Date: Tue, 29 Sep 2026 12:27:01 +0300
Message-ID: <20260929092700.1776966-6-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929092700.1776966-1-koreev.r@gmail.com>
References: <20260929092700.1776966-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an ACPI match table with the TBE20A1 HID that Lenovo uses for the
VD55G1, with the same match data as the st,vd55g1 compatible.

Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
---
 drivers/media/i2c/vd55g1.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 8043eaa50..e3939bb9b 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -2081,6 +2081,12 @@ static const struct of_device_id vd55g1_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, vd55g1_dt_ids);
 
+static const struct acpi_device_id vd55g1_acpi_ids[] = {
+	{ .id = "TBE20A1", .driver_data = (kernel_ulong_t)&vd55g1_versions[0] },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(acpi, vd55g1_acpi_ids);
+
 static const struct dev_pm_ops vd55g1_pm_ops = {
 	SET_RUNTIME_PM_OPS(vd55g1_power_off, vd55g1_power_on, NULL)
 };
@@ -2089,6 +2095,7 @@ static struct i2c_driver vd55g1_i2c_driver = {
 	.driver = {
 		.name  = "vd55g1",
 		.of_match_table = vd55g1_dt_ids,
+		.acpi_match_table = vd55g1_acpi_ids,
 		.pm = &vd55g1_pm_ops,
 	},
 	.probe = vd55g1_probe,
-- 
2.55.0

