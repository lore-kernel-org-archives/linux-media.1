Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0C33F23B7
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 11:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784548122; cv=none; b=RJFLzoHhbNifSY1Yf4z8qmr0VzTxtKlQyIJdROZtvTDbnUHUtGNa3GVtH/wiYf2BWPjAAW7mizmMmN/J8GFpiHm0ER+TZG7tCqtmca6M/QsLSKb3mGPkfmxRyIrCpAyG01paBiTYBLBAxVnmFQO6vy2zDUl0fUd9eBs6a+TeEd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784548122; c=relaxed/simple;
	bh=xsdmgm6XUHDmG5O6rGroewG6Xg1XPiVD+jxPVRSIuPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VNbFsnoJdozPfQcvT3/wwO/WEHNg4EaH4fD1S3x1E87JLZBTYATdV11mgdLMoOvu67BY406T/SzDBF9v4TmXZ6xZYTMBViMz8GjH0VG0rnpXgmp3SOIdJDKZuSGibQ5RQQQ7NSqemRwI6XNR7oDG4I8AK/HRnkrrCnvrOZmDho8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CaUIYkcF; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CaUIYkcF"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so5852838a12.3
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 04:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784548119; x=1785152919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4PaMqJeNiC5QfbV3fIyDG7VK1xywrztWMZ9FqDUkIM=;
        b=CaUIYkcFfbx3JKc0nO6Yo8npgkHp0mbvD75vGnzWX8oJPe0kKI1lhyfOemij+EpQB/
         oYkHyIEVls+aIi+cDrAtzsi5hfaMEY9jajivn2VB35pKkeEAtq4yhqByM6zKpsysoe+0
         kUM/zUGNcKqqBaMnOnKL+ZBIxnOtITYdrvBRXvDo9wysaZHSOVi/ufeRtLOL7/A+yrxy
         InJMxNp332CSYXpz4VMEAvfDRG3fHZTMpbshv9IHLxHyUgRKziA/jbbJtAtJn4ov6mhJ
         OIU9Dq0n43SZWjw+sXMWCJ7cESwyRndUXsXV41Y9dE7WVhOob7qbkTBtUUpjYwQwx32X
         JZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784548119; x=1785152919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S4PaMqJeNiC5QfbV3fIyDG7VK1xywrztWMZ9FqDUkIM=;
        b=jbvv18EUUzODRD1PSvCp89OZbxooACwJbRi2q3XTsPyAOSq8rTsFtu/iXSlnksmxwD
         p2L8B0Ny1cFMeo9jVJ2X87pI/BsFmuZyV14mGtKIBi1Q17qvYBx6EW8Mu2sAyxNoKj7j
         VKDJ3NgMxEQnWo83PkRbKY37oSR1oR7O2WJpQzZ/iSdkIzGNHi5bjNoWlp3zwi8yMW7J
         VwZn8GMgdu7R09Hd7D62xIxU9Gpw8/p7HhoZbZOJvxlwEd0H8AtoD37jCdZTtEj8OK2s
         X3leXMS/zgv6AsYGPvF4/B5EKWJXWQ8JNuwhbJ21cjAjHaL5AWuZblyF0j48iYVEYxKJ
         O9KA==
X-Gm-Message-State: AOJu0YzoDJy9bblSNFDcRHoXRs0UpyV3s662M/YgSa818U1BT5Y6h0bX
	ooJeoyqFpRfit/KhsGl/VzxwB4Yp6ICb9nPaJz1oJZYQCFdJO+m8Qz+GL5RCddaogA8odQ==
X-Gm-Gg: AfdE7cnVYfAxkOl8mDrvSTPjs/KGmNiyn+/wfnDoMh8oLE2BpHH/8+yozDs1Kf1PgSY
	ETOGpJjwcqjfkR70Xr/nZ0U5S3RktJWUehCG8ufzc1TGDEHXwFxJ40vikDNRJBgHvjj5q9CBi6j
	qdRmtl/d/8pda3kRq9YkpGiz+bG0ILSZQjvuzN57b0SL+C12h1wy3599ZN7g7VoQCe75U6qFNNW
	p1wAxjAZY7FhzTFm3NaQFnh2+qGf+xfe04ydE1kjBfH1/OkQEb9zPoMkwPb+OnmcV4PfZ/n3SQO
	biS8iNmQzVaLfzztWF+mZdxGROuT4DXTPt6eqeZFmIszD6PzTlRwJs8fsXOV+nRx4K5o6mQiSDz
	D3DzneOSo0a1GUg9Z4UaQk6+5L0WDGnm962baUjs/sVphZ+nxor9sQVskUAL5IgtsGbAE/VA1aO
	Z8L3Q1nx/MAa3OPRhBtchXQ/U0iYjTQ0+IHO+hjk0wPo2csrTI7Zo5qo6lKcgv4BE=
X-Received: by 2002:a05:6a21:7105:b0:3c3:6ea3:f3d9 with SMTP id adf61e73a8af0-3c3ad9ec20dmr15497046637.70.1784548118650;
        Mon, 20 Jul 2026 04:48:38 -0700 (PDT)
Received: from steellegend.taila75641.ts.net ([2405:201:304b:4973:59cd:5c84:346b:aa8e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbda9sm35591141eec.19.2026.07.20.04.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 04:48:38 -0700 (PDT)
From: Uday Khare <udaykhare77@gmail.com>
To: sakari.ailus@linux.intel.com,
	jacopo@jmondi.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Uday Khare <udaykhare77@gmail.com>
Subject: [PATCH v2] media: i2c: mt9t112: fix incorrect PTR_ERR() call on non-error pointer
Date: Mon, 20 Jul 2026 17:18:31 +0530
Message-ID: <20260720114831.33470-1-udaykhare77@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <al4HvRWaRAMFPUrQ@kekkonen.localdomain>
References: <al4HvRWaRAMFPUrQ@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In mt9t112_probe(), the clock error check after devm_v4l2_sensor_clk_get()
calls PTR_ERR(priv->clk) unconditionally, before testing IS_ERR().

On a successful lookup, priv->clk is a valid pointer and calling PTR_ERR()
on it is incorrect API usage.  While the comparison against -ENOENT happens
to be harmless in practice (valid kernel pointers never fall in the error
range), this is still a violation of the IS_ERR()/PTR_ERR() contract that
can mislead readers.

Restructure the check to guard PTR_ERR() inside IS_ERR(), using the
simpler != -ENOENT form to avoid an unnecessary else clause.

Signed-off-by: Uday Khare <udaykhare77@gmail.com>
---
 drivers/media/i2c/mt9t112.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/mt9t112.c b/drivers/media/i2c/mt9t112.c
index bd2268154ca7..b3a6c6d76632 100644
--- a/drivers/media/i2c/mt9t112.c
+++ b/drivers/media/i2c/mt9t112.c
@@ -1079,11 +1079,12 @@ static int mt9t112_probe(struct i2c_client *client)
 	v4l2_i2c_subdev_init(&priv->subdev, client, &mt9t112_subdev_ops);
 
 	priv->clk = devm_v4l2_sensor_clk_get(&client->dev, "extclk");
-	if (PTR_ERR(priv->clk) == -ENOENT)
+	if (IS_ERR(priv->clk)) {
+		if (PTR_ERR(priv->clk) != -ENOENT)
+			return dev_err_probe(&client->dev, PTR_ERR(priv->clk),
+					     "Unable to get clock \"extclk\"\n");
 		priv->clk = NULL;
-	else if (IS_ERR(priv->clk))
-		return dev_err_probe(&client->dev, PTR_ERR(priv->clk),
-				     "Unable to get clock \"extclk\"\n");
+	}
 
 	priv->standby_gpio = devm_gpiod_get_optional(&client->dev, "standby",
 						     GPIOD_OUT_HIGH);
-- 
2.55.0

