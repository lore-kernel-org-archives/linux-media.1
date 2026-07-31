Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4AF246762
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 12:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785502553; cv=none; b=Z7usgYk24xWhmEYRIEpttWEaye7pfC/IS/fcOa2HtH1dUPgnHjXxY66dgir7BJNdYNAUMqxQgtey8W6w6syzQNFp6GREJJTc8NlzRp2buI8Bdthc6FkAGvO7hgkbRlCQ4WiPP19JMG9iT3cF3SwppDQ7e7nPn0wpKD2IStuPE0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785502553; c=relaxed/simple;
	bh=Vy/xxsu07a+RzvXUAFm5BKVjHO8gES2Oy+eDy1kDoQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xcs9STT0mguuMkBbZ5buVVelYwiLvFPeFuU8vUL5rGH2fyLFkogLilbonD3IOr68jbNhfX4DAoUJ8+lgE+HhFrvhWtqeTuxJwXJbI5QNji9HvLTq//RsHhyaa0Uq5p94xOPiumiWWmPIuc9DU5JJgPdRJrv+IkoB8m/eCucxiMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITfMsx4N; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITfMsx4N"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d004f135b1so9485455ad.3
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 05:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785502552; x=1786107352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sj6Ckv5iD9HLK/c7N60xodU3sNZOHZjF0NQQRaKqqos=;
        b=ITfMsx4Nsdro8HhnleTIALSPViKHIIhRQrPWyHBDznraN3eGf7zIBNoFUy5xlb0STH
         mn8jnxTnX6yhfqmQaNLfmbxCdbU2dbGyXp0PpBqbmYREKNLVTNO4Tkwrpu8rMm0oobV+
         FkU7PEPHda7R+J8Ge2S00yYOZAFhiuy7flWWYTcPLFl4FmOMOfse31ZNUJBKZZp8hCoD
         m+VGzwoHZfeMBpHTXERkHqfTf5MMj4KbrYX0fq7Rmrfbja6RP2jn/h3t9dFCq4yoXQxz
         ym/bkNMf1MAmCpU1qbJnaNjKBRc7ELGaBbzExJedXmDQITqV+AvVxolvnOnLQvPfPNvO
         rbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785502552; x=1786107352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sj6Ckv5iD9HLK/c7N60xodU3sNZOHZjF0NQQRaKqqos=;
        b=XwTx/3xXNXzEwEmcQ7VVjHrryq/5d0v5bLqlb9w/nUx5LeHiCWlUyGtWdJmWo6HXsM
         un/LodFWt70UoSD/j0LXkI3+QDcVOElHGuoMP7F7VHYhRinL/2vOfECinkfpa3eHzYXC
         DmsexU/ONdAFpTmqZrDtDzI47nOoQGPIPgihlvloodU72GXj4fSp+vYKJS8ALmQnIJBI
         hpiC/tk05YYdvXmqfQRruKNs+I1QSv4O2+0h4sMcKT/9UlAcoVWRhwmb0UV2sMgInZTV
         dSqv5lp8N8TfCzS8ZJr1r6AjfAXTOBWtZzATjrAJD1dvP7DspQ42FMAQN1Ajg3qmk3BU
         BSGg==
X-Gm-Message-State: AOJu0YzQialxQdvDcR0w2n4WouueQyT2Y9v5cEMqu9DEEo/Vy1Yw0Rcg
	J8ckstSz1fmate1e5ci7Eyz0bGNc66hphED1mQQnWss+znp+RgeBDCKe
X-Gm-Gg: AR+sD11bZ2f6+tNxcCCF2ULH2Vz6Nm2AgRn7oeAjPNkEkrBrwmf9XQW/wV09S+3yZx+
	eNnwNEJazfHGKwJGFbBHxTpw37d9pqoQtR/+eabNIeb2nBazcoMVUFWn0qVOjcKkgIp78A/d1Vc
	GelIofCBgs67MhF8DQivJVPMcIfvtb2qtATtwdpIEZsmbEPpfJJPmSPGoPkUE6H90b4Wr8dU0fy
	48FFO7k2i9CLt4ye5mpI+sCNwpUFGAmTYBDyBp3TndnqEzY1WPHoqyw72c+LuppeOepMc8xnf2K
	RWqjrbLG5niS4/DmVxVvJreNNqlkywAh5WDZ+tj5dCwBXnqsCfYA14pVp7up1OfrI/3lgXXgHIb
	fEG72USx25tL9WzjDMaTvQSI9nNR0bACA5UiTb2BBooDWwzrdae/0lHL0GqJnOu44oIGSoCe+dd
	pifcEMshFYefF5EhS6g5q/g2qgipaB4+FBcXJAUeZfcZJeye8YdjZnJL+qu3HveL7HBEpQkmqrO
	lTu
X-Received: by 2002:a17:903:4b4c:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2d046d6d47fmr19650765ad.9.1785502551976;
        Fri, 31 Jul 2026 05:55:51 -0700 (PDT)
Received: from ahmi-PC.. ([2401:4900:88f4:3366:cce1:8fb:2c26:b414])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4f0f0sm5720699eec.2.2026.07.31.05.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 05:55:50 -0700 (PDT)
From: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
To: michael.riesch@collabora.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
Subject: [PATCH] media: i2c: imx415: Fix control error handling
Date: Fri, 31 Jul 2026 18:25:42 +0530
Message-ID: <20260731125542.293895-1-ahmisaranrao@gmail.com>
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

The VBLANK path also returned immediately when programming VMAX failed
after pm_runtime_get_if_in_use() had taken a runtime PM reference. Break
out of the switch instead so the common pm_runtime_put() path is used.

Fixes: d5df1c7f3f83 ("media: i2c: imx415: Convert to new CCI register access helpers")
Fixes: 3bcae55ab96a ("media: i2c: imx415: Add read/write control of VBLANK")
Signed-off-by: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
---
 drivers/media/i2c/imx415.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index 0b424c17e880..c3b22b238ea0 100644
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
@@ -720,7 +720,7 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_write(sensor->regmap, IMX415_VMAX,
 				format->height + ctrl->val, NULL);
 		if (ret)
-			return ret;
+			break;
 		/*
 		 * Exposure is set based on VMAX which has just changed, so
 		 * program exposure register as well
-- 
2.43.0

