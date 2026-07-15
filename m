Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766D73B19D8
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 03:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784086738; cv=none; b=uNzqhI7RZHdHtbt7TF+Dc4mQRYaKZu+bVNKJIIzt3OuSYkJLm558e0XtvgcjoaM2N2+gmRONagi1Rf834LmDBn9kP/9WSk/+kO2AIwR2X6lJryQrC00TVsQWuhmaorZIL5gbe92CBOET7q6eOBSL+4uhyvUcvCAKTifM/4Amkmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784086738; c=relaxed/simple;
	bh=1OJ+icYvEUWlm8+gkxpBRGkF6MURV1kBnpa24faYVyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MYIL79FfpZJwu9KaqotGMKROoxD2I7wJ6DuaA2aEzzhRf7a7C7MLcw8Tuj489RUa6Al3fMjYBEq6d64pLNnVTh0bSpUqjQNs4VSH5dt1GwhtuJarlugKkELwZVtvjIl5++2+M0Sxgu8DlZr0BhVFIXnigSoiRmrGJ0v804CLLLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muQJv+Fw; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muQJv+Fw"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca965de53baso946457a12.0
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 20:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784086727; x=1784691527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EyiROYORTtKO75BwiwBGsAV70dzUHKAaS+4RZHI8OfY=;
        b=muQJv+FwmyEyf4CGxc6bvKPltLNf3UQVrcPU1cm2wAIjj3Q7uT6bNjwQKcr+7IVcLx
         mesGok9Hf29WPNHVZI11Rni3hzWW6SqTZCzY93ESHnOfD6wMb6+RfFPZjWZ94NuKo7hd
         VX84LH9BQwyM8misfB7NHZD3wHw7LikBFfbSUzJNfOXrK77Fj2/NGcqKjExtrXXADoLa
         tS3wtaf6va3KYzJs5Ifxin0mzP1C9iN+4HAGHqSGUNLYlcAQRpWqIZfs7MZ0AIJ35ldM
         0nIb6lFymitpDAHRvWQmYkj6m7acmT20cXn+kxGoi9bIDJHrqx7T6T9Zik4jb3w0ifVq
         T1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784086727; x=1784691527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EyiROYORTtKO75BwiwBGsAV70dzUHKAaS+4RZHI8OfY=;
        b=Ng7oHcuBxjMi+2QgB5SpoFa3woqUBs+hT5OM5TYquycP/tJOExGnKeCBaqcpS8A81Z
         0IdRmSavMHF+RETALaRPLhEcyx1mSZNuAunVbB9esUQW5txZ+ZrXFNRq5km+ieW2ijzH
         0Qp7qXhR73QvqJnvjB1Lsra+0ChY4nJrS0UsjxyW1qAZhqkHD4WqVU68XxcFwaHtPaQ2
         hCIo4tp+GwwD3CZfRvygHcvjMl2xJ+cyVZdAsKN4QkoJcXYLbrOikROrm6pR1Xq/X7UV
         lxl/snzfr97WC99K4bHhvJsb397BrWyYsRr/5vuYBxPxJ195kP9AfzboLNySP3OSRyxA
         4J0w==
X-Forwarded-Encrypted: i=1; AHgh+RqR5O15qoz7hjvkB5jifaW0RFhP5J0Ch+OF2n+JPHmpVdCq3A7jVasYpsh05VkUM7uF+jcXrOpgWttDIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9HtdswiuL4B3SSpKEspl959Mf4a1OldWVjEbrG/HUgdeNVXmk
	5FndtDbYP5mSQwfq1/OkcdEEp08n7lw3TtHW43EYUuBxyfRqgfcXp+Qn
X-Gm-Gg: AfdE7cmnnh0ntofv4mfupMjbR8EbrpaNJXZJIxl7aKkUZ0OtnxJ7WsqxmuLVElNc+lN
	TjY7rOG1pti+h8qLEwIHz4sYsh5xiyEiy7pUV9a8QwIByUEKPx/e/M5tsF0AtwLtsIvZv//kcZb
	pDgcbfnUaWM3jQYEHJ2D3FVcOZ4Xpp1ZzchMFp2k/vZGoEcq7Crlb1+TW0iMpjPJDyZOBSVPazh
	+3WefzvLNKOTE/Rz1cfbF+JcTg+L5eM/pbB68TxuSxkGr1Q41oojHahDIiGxz1Pqcv7Zmp6ESwK
	g5quU9qiJJNyfI/q0KAq9m5rTgJuLl8IzMblHTD2IlT3kkHepni1TyVQNV78ABa97Pj4Bx8KYNs
	p+kkBOBy/scuBRL0iuK5RSr/pq8+R2ksGLps4RPnqNDJyRuByrntwpa0gk2q0nRMqrPftgeBpjh
	AsdghtW9s8zgMQKiQS/Ys5eX5+yIorUurfOALLwPSRPFU=
X-Received: by 2002:a05:6a21:9d91:b0:3b3:241f:66c6 with SMTP id adf61e73a8af0-3c1108c1a5fmr15396434637.26.1784086727117;
        Tue, 14 Jul 2026 20:38:47 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm91977889eec.19.2026.07.14.20.38.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jul 2026 20:38:46 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: mchehab@kernel.org,
	jacopo+renesas@jmondi.org,
	kieran.bingham+renesas@ideasonboard.com,
	laurent.pinchart+renesas@ideasonboard.com,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v2 5/5] media: i2c: saa7115: Add missing media_entity_cleanup()
Date: Wed, 15 Jul 2026 09:08:24 +0530
Message-ID: <20260715033818.10967-12-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260715033818.10967-7-birenpandya@gmail.com>
References: <20260715033818.10967-7-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The remove function is missing a call to media_entity_cleanup(). Add it.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/saa7115.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index 48d6730d9271..64adfff3001b 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -1867,6 +1867,7 @@ static int saa711x_probe(struct i2c_client *client)
 		int err = hdl->error;
 
 		v4l2_ctrl_handler_free(hdl);
+		media_entity_cleanup(&sd->entity);
 		return err;
 	}
 	v4l2_ctrl_auto_cluster(2, &state->agc, 0, true);
@@ -1925,6 +1926,7 @@ static void saa711x_remove(struct i2c_client *client)
 
 	v4l2_device_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	media_entity_cleanup(&sd->entity);
 }
 
 static const struct i2c_device_id saa711x_id[] = {
-- 
2.50.1 (Apple Git-155)

