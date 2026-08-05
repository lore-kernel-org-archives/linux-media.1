Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576432F7EFF
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 13:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938207; cv=none; b=RZIpCsSAdFTTOQ7lCA7myqTpNudLgQXT4tjcQrqfpzz9BIvHJ59KfuZk/AtV+FVXvnlbU4/txd0B+0Z4w/GxFB8c7tLQ+xDuVlzwURO2gQAp8fc3PiRQx5uzKtBz4ZolIYPtNt58vhXhmDinGx/LTjdYGyxte5/ng1jbx4dyCc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938207; c=relaxed/simple;
	bh=y4ReOv3/p2ZVUWLYVVuEtoSDpxFdCV6+NIAGilgmais=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JpAkIniOf1h7V8BLQcZqtwJzVnOOhAddkRKWLiGv2ES0umF9ZRVcjhtO8uviCPgRGFWOYNKyKI3kRL5VBX6w6hk7KboRGgSQgNfxaHaVet3KzUPo8Ly39F4qmamJnTHigNt3JQuVYNSlCPoSnNwCJme29m1Xh9uFOKs+WGZvq/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ns5LMZv+; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ns5LMZv+"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-848479c9bd5so940015b3a.3
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 06:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785938205; x=1786543005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=geCpgKFpv4eJyLP95gigsbi88GQYWiUgu3zzK9iLvoI=;
        b=Ns5LMZv+Ky06mKVrM1w017gT8VGFiUzgf5LQ1BPNBr+St4gDltwssTGkEhjSidXJjP
         1afAvO/ycbMazVBO/MBeZRh2ROgQm1Ja3h3z+Rr+aG56nuYNbwbj+Md39yYv2MNPsXrf
         /t/KLgU1vGUo1m428TGKlSxnzv13BpmSh6TpwhqK3JyOqt/6Kkn5L3bBdSraRlpn8hIU
         BOFH2LMfbmUCXJWPkPoAm6oRuNcmHRkGeXx9PnD3+Be9k/Rk/pAsxppw3NRpoRDfrGKb
         vFP3jPj/3o4YIX0w+FX/2KbXrYApSXDIigNE0ypTZRaKKjUa+oBgkTrJHJzKTsLLNNhD
         8zCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785938205; x=1786543005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=geCpgKFpv4eJyLP95gigsbi88GQYWiUgu3zzK9iLvoI=;
        b=fbZVRoWjP+/2Lruh1mtn7rWiHdqw4ZpuaLXSAJH1D1kgYxxgIGNajBrA7DueUMkdtm
         iiv14vp73hJPt9hX5OvFw/aER6CotdG0DQSTXPlNqpjgtVIQ6YEgz8cBTSe5Q5A+AhuO
         YiTKUU/e2/+RZR9TqMMpaZXzwfi2IhIYhutVBJQj6JmcZOBV5/Gg8NVB337IQGuSVFth
         wnA3mzubti88et8Z7XNw729K9ZNUwMfV/G8cyf+in3q3mbIT0GRJFYTIFGTnGPAIaT1j
         x5TKkPz/O+qf+aSlpfqiq3C/YfS2PlOCFCOgHBNbVcf+em3TlNSYvmlMaBseDop7CM5g
         DnoQ==
X-Forwarded-Encrypted: i=1; AHgh+Rok1AVz1zfhCHSJrq7hEB6enSI1kf4kvNTvdVHY2q2PPzhT0P31ab2VUKXt3SBnabnDsU7OP4eNgxxs4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOs0eVkHn0DpL0mSrq17j0KnQbYBuxkddEtDdBDhG9WNslnFaU
	LMx4KpR1Ecxrou/XWz45I0IWhTs5RUAvGnKiJyMwv9JaLzGUZFUrPwY4
X-Gm-Gg: AR+sD12FCCYilBWfHz+L692aRpmF7ebsw+wDreji9f6hySIyeN9+sG/EESXzGOB0e0S
	vI/jT15YoXFjYCuVDMoEBsY8fu97Fi4UfKK3nOl/XEvc0Na/W3s4C+G+8UhpC+2bmV0qkx9XRp9
	03Vc9E4sCQhadf934Yjynau6Vs0SoiT5TeTPMaaj5zTwrK8ho2qArnRlaAwkwu6MBeS6ng14TpI
	OgX2zCZM6KU5Kkx5zCZJqPk8C31eYa5VaAu/JXmVjBNouBNYDq5FEjV7mExuDq6Q4S9NZ7EVbf4
	jdda3InTtJ/FoulWmJ06bxZE1gtAfdbkVI8oHOlYS+myFTE3sQLKDNN9AQ0wMzL8I1G5GupkxUN
	r0sqHQUqLNDBT+PcxUm5eH4doabtjnaXVPaPv0nHeEgr5E7bhbYBzp9yCs9qom3l+YSJgW0V3gM
	XK0wGYyLI1bpZdh+BhBlsgpTDnJKzl+MRgw/vNAAulDvLMLSiH/+2GDsIyClFeGn3Ehg==
X-Received: by 2002:a05:6a21:178b:b0:3c3:fb32:a004 with SMTP id adf61e73a8af0-3cb85fac065mr8961897637.34.1785938204660;
        Wed, 05 Aug 2026 06:56:44 -0700 (PDT)
Received: from ahmi-PC.. ([2401:4900:88f5:5e4b:e580:68e3:78da:9f5d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673be4dsm22066935eec.16.2026.08.05.06.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:56:44 -0700 (PDT)
From: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: michael.riesch@collabora.com,
	jacopo.mondi@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Narasimharao Vadlamudi <ahmisaranrao@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] media: i2c: imx415: Return test pattern write errors
Date: Wed,  5 Aug 2026 19:26:34 +0530
Message-ID: <20260805135635.56556-1-ahmisaranrao@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx415_set_testpattern() accumulates failures from cci_write(), but drops
the value and always returns success. Return the accumulated error so V4L2
reports failures to userspace.

Fixes: d5df1c7f3f83 ("media: i2c: imx415: Convert to new CCI register access helpers")
Cc: stable@vger.kernel.org
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
---
 drivers/media/i2c/imx415.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index 0b424c17e880..f5cd79da512c 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -686,7 +686,7 @@ static int imx415_set_testpattern(struct imx415 *sensor, int val)
 		cci_write(sensor->regmap, IMX415_DIG_CLP_MODE, 0x01, &ret);
 		cci_write(sensor->regmap, IMX415_WRJ_OPEN, 0x01, &ret);
 	}
-	return 0;
+	return ret;
 }
 
 static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
-- 
2.43.0

