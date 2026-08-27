Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446F236308D
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 20:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787861786; cv=none; b=BBbZsgDWURMM19GMTKuO51DlV2167DuITgcji8IVFFYaamxTdTOf7N8xXXGGxNhxm1cnZ6cwKS3mai00vn3dzSO1kdrpARHTmtGF2UTD18Z/tsti/dKOrlPU5DC+6lrlkWuVWcjUxedVteMPupXWQxuVqrknVfUnKyl22xqSneY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787861786; c=relaxed/simple;
	bh=av/RqU4IhFO21IwA44CfzNfwbz1VFP6HnDY1tUunHXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NoG3zfS0QNHhTXr4DkFbtgvElu2jnYAJh8LoKAke1SqX/pWH8QYLGAIXNa7SEniTKH3vn/xNrqrTtsCO0m8blLUpjfAgL2RUceu7cpOULJfCRkrzXHPmTlNmiROU6h1CCPavnZwa92EtXoOyAu89RmiZc5CrMfQf7QZCIJ6EElw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNdabwCQ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNdabwCQ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso1242795e9.2
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 13:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787861783; x=1788466583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S5qf5AyR14QicTi51SyKC35gs+EjRCOBvh+lO2Jaq7c=;
        b=dNdabwCQs7dSM4BQL6a+tjdEAxd3W1nT5yT5K/t/F54qmLtIXbn2dPTo1oL8lxSNMJ
         SOzpqQfEDmj+5RTzE+SYMM3SoNqo+yLUltAKfd4snqmWTii/G1ck3qLo9ahQnOsh852A
         qBggPWd/h4m+XBZNLYzfGUlXb+eRrgpUC34AI9SAIvT21myiPkDabdAE9k2oitkFqKds
         jTm5dXGT1/wcFryGt9EgXjRW43/OU0yOKg4JN5dCE5zsDeq+0IRi3g41kfFUZi76Vjzz
         kL7IpAYk656c8mp3ReKOOgfoqtcWFJzvXYhv7PHRE595mwapk+JwlHW52/0GpUANMe5l
         Ry8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787861783; x=1788466583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S5qf5AyR14QicTi51SyKC35gs+EjRCOBvh+lO2Jaq7c=;
        b=pURu3eDGQeKDx/BdEKhtIx0j1PH9dUo8kGm4fj7nhsQUG3H5oBjbay+IQ0xkEWLtTW
         C3TGlSA4jG2gNC1vonJL1JTY9qeJUlbsZ7c/UeK29o80EAOZUQ9Y4pj6J3/m/uIdmDdq
         JaRcPOuVDqNHhrYiiNqc60VAT1jtyFzp3mbceNJFbgRXJXa5CaRmtsGLuTjuTy9zJAo4
         vJuzEpt1sxd0U/p2Yp4E0KQdcqDgI2RFa/GJLaD1m67N/gUbjNO7eZB746Q2SR+3/2jQ
         MyEhsOFN4JgjTDNd2dVaoBxBoWQRGuioEsaL8JJ5EqSEsN+dfmJaK5op5gCceN7jTPXM
         x8QA==
X-Forwarded-Encrypted: i=1; AHgh+Rpi/rud1anO6sU3jTQlh5c9xz4cjcQ2gKuJhmPOZV8vOuR6wFplEQYLgfrhIa39WJet4W1r+yzIWwdCyQ==@vger.kernel.org
X-Gm-Message-State: AFuF++muOIYRuliqNHeuJdbgbZlVr976sCse4j7FKvzKIJnHOTbIFxi2
	S3eJ8F+VwgYsfFstkRswBtn6R0cqpTJfKiXIMURQPNle2d7S5wJb05Ox
X-Gm-Gg: AR+sD13rTDOOUc3+YqB2HAN/QQAw0N91lOOb/u5Zfc/DeBVxrS5s2Bg8tNWF4KuNjkt
	aXluxgNHDMt5d70sFCaNfMGQgCwI8w27bC13dK54EwUQN5febURS0toLdtn5brATyt9FIXFIgZU
	dKduhg9QVaopa61ON20b6dIYq6rxBSeVwLt489IbWUCddqlXrZT5k9ShNHKkYFsWmxd74fac7T1
	imHx0u8U5ghQtl70g7yxUcn2pebcH49l3xpasz+mrb3IhuIN1IYQEiS4o6R5QoIWGoKQLeqYJ67
	MrDZf+oAUfKin60JOidUThKJ8iXxopfuR62/oYYqM7JhPwGm0xInlnkGW3fbem90ISGBj9nIwOl
	hqS3TX8grr3MiHxzo7Rdk8MnqUbAn90witBf/vivdx7Zlqz3eyuS8JCOLng+5eVJRcdtHqI7fyL
	ra2kj3QUuHtrprObVZ9FQAfPryJK+XVXm9Q7UbloGRx4813JN7zvOYO7Qu
X-Received: by 2002:a05:600c:1c26:b0:499:a79a:694d with SMTP id 5b1f17b1804b1-49b91c265fdmr24699285e9.4.1787861782563;
        Thu, 27 Aug 2026 13:16:22 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:8824:7cb0:614c:86fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4961004bsm91899855e9.4.2026.08.27.13.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 13:16:22 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v9 2/6] platform/x86: int3472: tps68470: use unsigned int for GPIO lookup loop counters
Date: Thu, 27 Aug 2026 22:16:07 +0200
Message-ID: <20260827201611.99825-3-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827201611.99825-1-tchatard@gmail.com>
References: <20260827201611.99825-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO lookup table loops in the probe and remove paths iterate up to
board_data->n_gpiod_lookups, which is unsigned int. Use unsigned int for
the loop counters to match and avoid a signed/unsigned comparison.

No functional change.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index a496075c0..5baed848a 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -149,8 +149,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	struct regmap *regmap;
 	int n_consumers;
 	int device_type;
+	unsigned int i;
 	int ret;
-	int i;
 
 	if (!adev)
 		return -ENODEV;
@@ -233,7 +233,7 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 static void skl_int3472_tps68470_remove(struct i2c_client *client)
 {
 	const struct int3472_tps68470_board_data *board_data;
-	int i;
+	unsigned int i;
 
 	board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
 	if (board_data) {
-- 
2.53.0

