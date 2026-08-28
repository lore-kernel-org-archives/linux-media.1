Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E7437F011
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 16:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933711; cv=none; b=oRTLPJw9bd1XaP0rN/iPZE5Zpi4sn3fuJiFVPYt/QcanxU0Ft6D2SYpnhoFm2CaF19phnbFrEXxS324+Ox4Ajw/YA2dDBr52UPN7Fwavd1CpzwwNhD2AjbOKAWHDKAp/oIyecJJxu3XQbud4yeby93LhjlzEsNWy16vYQ2FXcSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933711; c=relaxed/simple;
	bh=P2vAhkjwfZLpGHwPw59L73KMSOIBIbwxnRr5PopVIrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GflOaSU3rdjm3nnuFT24UwoMq5HRNRTPr6TWUJUOthfIi765ZLkIF/C3T7dYjmUZ+x4Nn0lRcMeAfSxhTTki0NfjokJbGxfYpP65VQ3ioa0/K9cmMdJxMTyD639/nz8olE6MZQ0ZZFKSyzz4emy62WtAoOqb75K6SsLfdSMZFmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r21O2EBG; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r21O2EBG"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f96c5b722so748035f8f.0
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 09:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933708; x=1788538508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/Z0cnaeaBdqm8px1bR7dodj1ScgQOWcRfeLIXj+wSQ=;
        b=r21O2EBGZjHGNgjqx4UYfUg3GnrXV9mUa01fpFTRdXhOCRKyV/Y7BOtnKDkoRGwGGl
         zBJNVHg9lFA8gjAoFKXiWikdPMV7Va4ePZRzwZIRJfwxH9pLbuw4mSzx6zakZhHiIEkU
         pAs/MJw4eS/HbnmaXXYEbat/U950U37VK8tNGfEOKwQkA5r65r6T0riA4YOgvH4KUWM6
         mDQyUnhZPTwSJb+T+5WW8hwOCTTve7rcuEvMp2xm6g5My+FLCkKufHV+RUI8gnUAvm64
         +F4IPoQxJ7y23GQBOkI11DxWJ5hp7f3pR4YosqEQFcCXlts3ApGaU+ko8qHXGmRPFOOh
         APDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933708; x=1788538508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2/Z0cnaeaBdqm8px1bR7dodj1ScgQOWcRfeLIXj+wSQ=;
        b=raXlm2Di+RwRD8bO/D3au0jdk47k55YLKjHUw9O0YEUQwXx+BDPXyG5726wLalLfXM
         CZXscBwzagB8uTGmzgxGGy+hcaU/bgwmcqL4bUn5hygxD9HZx6xbsEmsLvgjReEHOolj
         ybvQKO4PbxJkMn+rgsj8ZnjSyhZ8NIrj0xW+PFPtBB9TZIveOwBbQwvjPWDyBR41TFQK
         9snytdQbyC2o5zWRZ+6dv0H0mgQXKxOlvBeAsxxCrIrzkBOUiJKkgQyrIu487WXciVGp
         /pcBh1L5vYl7g7mhOBZG6eT3Jq99ZZNlBYkcMgvcPmZKTr26jsEe1/MCL1Irw1NjyAV0
         bffA==
X-Gm-Message-State: AFuF++n7Bp4+236ZTsZxf3RrqQ0AmbOiZatlXX77Fk3oTCZX239S9b3n
	FUpElRKxziPcfjSEJNXwwqzwLTOqvYnpz/0W8Jv0KFWen4e+pMVfLlolCzSjn7Af
X-Gm-Gg: AR+sD10R4lRJydhJzj/rSwUjthYQgVGMJCkoE6G1mk2JeO0lopCjyA52OvEJLCisrpD
	rjmanlSYDdkzLL2bWLIcxTIQ5yb0zrJJu30AdGeXiox6SG38aYGs6J2VqtlR/IhKYwJazk2bBhP
	An30tuOAo5bGh7viW4iBuz67qc4Wdysi5+8xdjUVhBWkyjVIzvhsQa0GLFws8HchDeh+PyIcjHf
	kRdlRqlrsarPsnRFKrUbG5lHvZLm6toFnHvdgJncAbTuP/t2gn/3Uq82GymbUWkWTGyQSjOPfHQ
	cclIq3V8+BuS5QGJWTbpynWRw3oMXi1GgtJUVMjQjacnH+tdifLwpV5RTWwYzD9cXDpr9PWkLII
	kMGaQgLhD5NysyU+75poQflsMwNxTKd3IQZ+4Mlrz3EP0Y6oxv6SKHnTqA7f1ZCDjh4dweuG+qw
	qZudJcFWzggqOHmetCqEz2mixh1UmLDO/Z6qgZ9dCqTPGa80hEmUrKTx39Xtb5n8ajgbwOlta+T
	bIa/RZB3ubODwlggQqllg5HxzO+f6/Egjd+hpq1bQ==
X-Received: by 2002:a05:6000:41d1:b0:47f:b51d:f0ec with SMTP id ffacd0b85a97d-482f79cd0d2mr14102631f8f.15.1787933708396;
        Fri, 28 Aug 2026 09:15:08 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:07 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4 03/15] media: ov2740: Use C99 initializers for ACPI IDs
Date: Fri, 28 Aug 2026 18:14:45 +0200
Message-ID: <938b7c91985b4bf4b20dc9722453c44a4917a31f.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use designated initializers and the standard empty sentinel style
before adding firmware IDs.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 39003c1632ad..8f0ad5dbb245 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1461,10 +1461,9 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 				 NULL);
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
-	{"INT3474"},
-	{}
+	{ .id = "INT3474" },
+	{ }
 };
-
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
 
 static struct i2c_driver ov2740_i2c_driver = {
-- 
2.53.0

