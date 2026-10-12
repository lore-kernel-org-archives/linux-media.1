Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE5548CD78
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 14:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815742; cv=none; b=f0KFnI9fFRN30Hf0bQ1VZ8kbtqmzHbefW/l+qdoHAXamNoatPC8rcet+lYrfBSQIfBTV+F0r+Sn9jwmx4DJadDI3r4/G820q6nDjZwt3IhQnZVPfLzHtBTHdCYskrpYsLjfiIQKYi2cFolejBLQTowVTstSsLcCR2tI3R/aI1kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815742; c=relaxed/simple;
	bh=olHtY0sEO1s9tOBA/T+Hd7sa5yfIodktJQm/3oyRQyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jxiUxl3ddAJzUKdBENyhmDQOs9XElcAdX31EXoj7Fuv5IQ3/0IdNLgtShEgPLvpXHocfLVV9sxM7DtD9CGhA+7NNpqoX1WIFTevfwoR+IPTgOherEBLRD3JeAnFdYrsrIi0IeNlDe4+jIHOcBEGMfmrj+96x4X40H8OLRTUyc3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b8SLU4Xv; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b8SLU4Xv"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4207ac26so1909444f8f.0
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 07:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791815738; x=1792420538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+SY94Iu0xUCaLlywfcje8bRGgz8FcPm7pfqOfRX8wxI=;
        b=b8SLU4XvTTSPdbT/iFSpHZWXYhOUCCokJTLVjFkKVAQoewiYEM6/AbazBSgcHIzUhy
         A+ph5qjkz1n9t2Y5iEkuPfebDyUdfwgOoDMxDw3PqRgU8yoe1AiqTGKIAktFVwlnAxlp
         ISOBqOab1vt/GFWSOCuAuPPTO9lQCCO1PJGINkiEx/KvX/bcapsiTfAdyR2ctm0e5hOV
         0qkJJBKBzLbBzyS8MaEgXoLYOkJ7pZA46wMy7gOrT+pMHQHCPwIa6U/LR52uEv9os+Hi
         5gK2NKEwSrVZU5cNh0J3e14/hrbOihSFrloRow0JaFyQEc+LrL3i/3RflNAw/zIDaZHS
         JHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815738; x=1792420538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+SY94Iu0xUCaLlywfcje8bRGgz8FcPm7pfqOfRX8wxI=;
        b=oLIdiNLr66tz1Ay7n+JcgSJ9TAh2gxKWySFr7B8ZTX5D99z8jhHHBjWd88rlYBLR0c
         /JdOrM4xovLa4sJNQNf0mRgUW+Joaw9LPtioVveNM1ZstQYZbXY2GgGUZJlFoHW5u4mA
         PDDh3w7CRYNz/1tipDhmFlsTtSeTWmRAm1N6zdrNlDAJgPbMeVfYbCRi7ShARky1LFCm
         FKh0SBXNuXi8nGfdifi2yzTk+mD4OPT3t/fYiBr3g3wPvoPCRaag0oTd/1f1AyF6RVx3
         7y2BH09OMnkBOKRo9Fq9Z8E4zSBPm/9YhwaoD6E/VHIJqUaIy3na9VfVJSe50QaT8JnW
         vtJw==
X-Forwarded-Encrypted: i=1; AKwUvBxLiUyyT3RBJKUzCOZCdjuXLFx0P+4J4ehqXedc6oS8dpifoxUB5PO/cfiZ//4IP/atRnmDXMBwaiHDXg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLZaCUo43KPJ5fymY0QhUXZxcMJOsdV2WKX+dNP3SnrlTSEUHry
	68j2urGIxRheRtnlOQzBDDLJfeG9mdK8ahHQloP18o/gSj4KYgEfodgk
X-Gm-Gg: AYBFou0zwIBSYZtZUHisbvjCfDz0sGFM/FIzijTU1yBE9vALLZffALt6vC0XqGfjSOt
	a5BlxZ2GJ8aVMrHYh+iG5eGMw6W7V3GI7W5vK5vKopGbxQtbu/wgW7Dc+ojFaXkh0/371sdbouC
	kfbBy140uGMonqwbZAdIWp4nkKuOupA4BOk4mYuirqbnnLdLbbTZO3rax+ZdVhb/Nh+N4dIh+Kc
	MIyUhYp2ZwYAOdUKk/34sFmqt0wJDCJJL4XySUTFv8WU2az+ha8ZRyu6sdWkiE3BaimdLDYZujI
	i2aQTErDVi1CV9j3Fe9MdMenap1wKTNC15hsBSXz4AE9/jQGbu7qQRzthWA5HNxIzWPafUJLeNe
	bzrAk3umd3JrfWl/OT89+wCHGUrcZf4L8mcmQuHM4iIhtSZGvbPSqqQDcPAP0lRQcJn//gIbhlS
	y8MlTWkMajba5ouFdaRW1KYiF4KbJkTmlAcZr5ZQPoGJBlBHzuR+6JCBWBpCs4GnCy0fybPc9+C
	f7pYLBCcMQ1JC+dMpAmSS/OqvI47Vw3FXStBVnHfYYrr+VebT2JcoTNcQePGfejXmowuZz5/2XK
	ui1yxLTintnkNnSQqopEyM/LE+SZGGyew3r/kL5PM4q0+Lb4dQaxH/P7zlcydfHoTxeww5WwBq+
	CHkzxtMCJ0PTwBtL/xjx0rfvO2dpC5G1EdiKqx+5mJFYc78G0AiTE3w==
X-Received: by 2002:a05:6000:98d:b0:48c:4a62:9af7 with SMTP id ffacd0b85a97d-48dbaae9e03mr15467705f8f.28.1791815738106;
        Mon, 12 Oct 2026 07:35:38 -0700 (PDT)
Received: from localhost.localdomain (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm20899559f8f.9.2026.10.12.07.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:35:37 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] media: ipu-bridge: Add the GC5035 binning link frequency
Date: Mon, 12 Oct 2026 16:34:42 +0200
Message-ID: <20261012143443.34897-7-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012143443.34897-1-nicfio@gmail.com>
References: <20261009072733.39877-1-nicfio@gmail.com>
 <20261012143443.34897-1-nicfio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In its 2x2 binned mode the GC5035 uses a 175.2 MHz link frequency, set by
the PLL of the vendor register sequence for that mode. List it, so that
the driver can offer binning.

Assisted-by: claude-opus-5-5
Signed-off-by: Nicola Fiorillo <nicfio@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 851096d7d..3caa07529 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -60,7 +60,7 @@ static const u16 ipu6_ov5693_ncont_clk[] = {
 
 static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	/* GalaxyCore GC5035 */
-	IPU_SENSOR_CONFIG("GCTI5035", 1, 422400000),
+	IPU_SENSOR_CONFIG("GCTI5035", 2, 175200000, 422400000),
 	/* GalaxyCore GC8034 */
 	IPU_SENSOR_CONFIG("GCTI8034", 1, 268800000),
 	/* Himax HM1092 */
-- 
2.47.3

