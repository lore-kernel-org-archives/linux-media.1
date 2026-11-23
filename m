Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448410;
	b=o71xGFlBcoSEvxXmpxblDl0SDw+59rSfEkiPGXoASRLJa1z6ngOeYakgPJRGGl7GCsZ0
	 UgYj2wu2Rc37XfVXdO4BXNqxmK2FCyzSwwoiLBA/70+QLgeNGsY8rx95Rvg9SHC2B+bfF
	 K7I+JRvtBM9kN/CknnAgr21nZimpvWQ9IBlckwlRqaC45FWmMG2zc53X31yOpf9xybzZo
	 D2UNwvzqqjrZTJYee1ucqiaP1nAb2+uS5fGTnC8MxG7s90z+QY9Z8Wh7L8J0fam1uV2WR
	 uGMsJUstGcGMwS2lq7XIiGwMCHjN4HX0Ofzbpbtg10JGaz4nwPGBujTaHUmzdZa628Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mAatwWMGIQD8sSjbJ0d+bFjPR7YE2b8DjJZg25l4fP0=;
	b=fHdOqvz2DfFIANO66VyMCVglwHR5kgMVxxZ7lsTirvBonpl6XN87doEiiLxZjwnwPc+T
	 WawwjoUZj7M1+/CnULa5uOEhv//r1p1jO2XnsrzQ3WAjv907iw6Or8qXravo28SgdC8qU
	 SSAz+LxYJUlbluc20t+OpVHYMW1l2iX2HqZKd7eHseEsmeDZ4++7Hw9+dTMmX4QArtLEr
	 VwIDTnvwncrXBSWi5XMbeUK/rfl2cJKQtEUf6ihFpsn5IKkwybsKLeNhPKYBxVeghjpXv
	 jIpzJwOnHbzVwgf4PL921Mc/31uHfuzta4U4bRObc9f1aXovhfcb1BryQukKA/Pa2eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vXjLzPTM;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C8D60A382B
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3C8D60A382B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vXjLzPTM
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3ada81853so3900781c88.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448409; x=1796053209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAatwWMGIQD8sSjbJ0d+bFjPR7YE2b8DjJZg25l4fP0=;
        b=vXjLzPTMO6S0nyXMvFcJhaevneyow9/u+al1JNDbgukfsaI96vj3mlZm4iAWYnsbX7
         /T0cYO/zGRL/02ZkBaMoU4U9MJSl+TH1dN/BMtOSYfGyy+m4qGmm/YqBfC6HvXhCttVh
         qWIj95d7DSWXz9DyTupEF4SVGZ8+RphJZVGbED8OB8wiClqSgT+BMjUkfE+jnoZv1KYF
         cKchXYdqa70tSPmIfohI8CycGdpdk0E5GOm0fknaOVWYxbTOemcHk1RK1sOxpbgQazmS
         8oLbcMualvjErfgiGlkWsBSZlVkp57yDs+xj25jy7lLftKl9if2gAb/m7Kqw8KWu4aAC
         8X8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448409; x=1796053209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mAatwWMGIQD8sSjbJ0d+bFjPR7YE2b8DjJZg25l4fP0=;
        b=zhICgclGY6Id1RIiyZ1RxkgE+N/E/VmCq99TMbG+o1g6K0X11eZFIa4XGPcE0fWrcP
         cRSCBnGaKEL0r3S4EYCt6gV6b389zTLOCG1NnjFCqnMQ4jYqJbcJuX4prvKkUY29RluN
         UA5LryEBpVruUofgwmz4CuMBRp6BX8YKF0YP+Gq7iBkcwKB/U+CqgKL8cb7ZzFbviliX
         JtHSJfpfdW4iGz9t809zzuig5RUnCy9CrSBJvUUCihgS44EeTNW0KOtjWbygGk/O7GjF
         Bq5bNk6B6azQjBMafl1vc8HDSPq8//P8ZjlF6+FAOG5S6AVwTTukZCGBRhIMkfspYJlL
         XKQg==
X-Gm-Message-State: APuU4Z/3oNMqZ+3bkFByyROjOFavUPwsqhLpE35RAdJmYrJP4Tj3ivL8
	YhZB2dHz+jWx1F35TbXkfkWOL9DOXTmHeEB5wa32A+ykvh03BjY27ubg
X-Gm-Gg: AZFdTZd/pUUpyfE+CmNVpiNjmFh9/WIWhk3valAnBZD8B84hnddoIyi1cVglUsYyPwX
	C1x7ZWNRI4+W4sAv3+qCXL+0C3Np3g3bZ/5+T/O+4AfODEdG5+OkxxKXdcLAlcLNuHYJqDZgAAH
	jWXEwXNuwQX51RNelzWVbv3DRqpHnwofSkK5vZdM9VRZeI6Rn9s8pzr8KJg7spC2FcQGmhMWKgn
	Y9brtU399/HlPQDQ1W9hs/po5vm7hLaI9z7HHKUggD1cqfb5EevTgqvGQS71ooxwmp2AguoNHlN
	CDKXe1v5wVs0o5c6RFySPyDjfFmQA0ljo0fT4ovep7MG8VEu6VQCZiA/Gt1vz0XfhKYlR/bmqif
	paMzzx1Uy+oyzisAXPGBFLx4OoAbZ66XX1EYn/kk1PgUvNfJbm1xW8bb1YhoJKTvqtCPcjDZYFC
	c9+XD4hOQ/qwCSN819OTN37K/7J1UVsApb9Pt1GyjUuTo6XhcSaKQCxlN5wLngk4xWiITGd8yAD
	a/VCn8yI8WP2P3euTzlFb/dcwKDJUkNTVFnBp5x2fFdhd/a6lBYmFMfq8rd9YaGFcoPnJL3VXhC
	TtByAK8JmtaoVMNY8G8Vwzs2x8RpYUcMgG9SYVHtiDZhHfQx
X-Received: by 2002:a05:7022:3a8b:b0:15a:4155:3d9d with SMTP id a92af1059eb24-1b5568d6db3mr14898522c88.31.1795448408705;
        Mon, 23 Nov 2026 07:40:08 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:40:08 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/16] media: i2c: isl7998x: move remove() after the PM callbacks
Date: Mon, 23 Nov 2026 22:39:24 +0700
Message-Id: <20261123153927.2547169-14-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123153927.2547169-1-congnt264@gmail.com>
References: <20261123153927.2547169-1-congnt264@gmail.com>
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

Move isl7998x_remove() below the runtime PM callbacks so that the following
patch ("media: i2c: isl7998x: power down the decoder on remove") can call
them from it without a forward declaration.

No functional change.

Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/isl7998x.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
index e36fb355133e..42387bd310fb 100644
--- a/drivers/media/i2c/isl7998x.c
+++ b/drivers/media/i2c/isl7998x.c
@@ -1544,16 +1544,6 @@ static int isl7998x_probe(struct i2c_client *client)
 	return ret;
 }
 
-static void isl7998x_remove(struct i2c_client *client)
-{
-	struct isl7998x *isl7998x = i2c_to_isl7998x(client);
-
-	pm_runtime_disable(&client->dev);
-	v4l2_async_unregister_subdev(&isl7998x->subdev);
-	isl7998x_remove_controls(isl7998x);
-	media_entity_cleanup(&isl7998x->subdev.entity);
-}
-
 static const struct of_device_id isl7998x_of_match[] = {
 	{ .compatible = "isil,isl79987", },
 	{ /* sentinel */ },
@@ -1602,6 +1592,16 @@ static int __maybe_unused isl7998x_runtime_suspend(struct device *dev)
 	return 0;
 }
 
+static void isl7998x_remove(struct i2c_client *client)
+{
+	struct isl7998x *isl7998x = i2c_to_isl7998x(client);
+
+	pm_runtime_disable(&client->dev);
+	v4l2_async_unregister_subdev(&isl7998x->subdev);
+	isl7998x_remove_controls(isl7998x);
+	media_entity_cleanup(&isl7998x->subdev.entity);
+}
+
 static const struct dev_pm_ops isl7998x_pm_ops = {
 	SET_RUNTIME_PM_OPS(isl7998x_runtime_suspend,
 			   isl7998x_runtime_resume,
-- 
2.25.1

