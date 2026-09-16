Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9541E44A40B
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 07:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544230; cv=none; b=UWRGI85rrOq4FZEn+4srKYYjur61bpbU708B0wsdEPv9kOkXQL6VCtA1VyNOpfuNUYoL0/1+ZSyqdqZ1X0QZ/IPDB6V3Sb3D1KOnRgq0qgKdawE8qdrRnxBDsME8shj8nM7XU8Ki7DirY6TIOGg0ietQLBliF9u9ccFAQakmhhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544230; c=relaxed/simple;
	bh=1T6G2GdipAuIpsHBWuDFEV6aIj1b93ts1plzYTqBaak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gap8gNuoY3eMtN8TX8NrVM2ArhB2/J3XfeJBW5T05cwPZL4VrBhPUpKDysumkrJgCtKK/E5C5MoHMV/nqC29IMhqiBu0+ulPoNFqoUJA05107eJctbQBrujLDuuL73g0xsrMmXYA+6CgcQjxpS+dYHvxsJ7FNmgXjpcxwMJiY7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nheQpAlg; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nheQpAlg"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-86b90133ae8so434345b3a.1
        for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 00:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789544213; x=1790149013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Tks2oyxzxlf1TCNUshxK4sU+kJbcz/yddyURBT1Wps=;
        b=nheQpAlgUYIc8jFFfHoRPDfbx9XwCH7MxauhCM55JA+l7L9v5vw7iId+F+3C69LWb/
         be0wPB/lfoUGDrVMmhVNMR5KeN/k4pkGNix7BEJ+lTNEg7TW5qCprqCGGb3kURaH2pOM
         2ReCKRkLzlfYr6W0FKknEPaIcVrVjjPd5XP2WHpUW+61MxnMBvjPSbeqcOUt7sCZGUfV
         8wT04n2ftOICA9RXOvSlAOkY7NyU27dKCLboq66Hvx9RLHGLoGaAwragmW2RN7fv59Ch
         dGxyUpUKkBMNyxxhV0Su29TfDGSmK4y+YCTpftsNZKIrnob0U5KNK4ixAsokom0a9mOx
         QdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789544213; x=1790149013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Tks2oyxzxlf1TCNUshxK4sU+kJbcz/yddyURBT1Wps=;
        b=lPSB/9tDXi1QTZlYQmkv0JQRSdi9YTFS/EkHcf+sekwG0u1zE+9kRfIeymk8nMygAc
         2edk3etObm8Jj84EOJW/EJ4hW6MYdB6rUNnFebUKpSJhcKMsfotqZ/u2xrmRa3i0H6iB
         LHTO9EADnrZWCMbRCkmwxVTKjQLD9FCv9PN9VB0N+NQg/PpXzQIe9PRPTflMB7p1jLUm
         UTUcL9E8guAZbZLA3a7R3OuRXecjnBaW8eqHcFYj7jEKs0U0KHAWhmwTob3XMLHuuCCJ
         Gj2Z9RlJAtAXelPZSrpMB5syGl0CjVoMhFSWr+G9tdFn2+oH7wkeHquSHDk/4Y9ABaFe
         vidQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMVJDDUUXVINiV0kz5EgBVlbWtaBZyOnYIO7o4/TVFzOwpbpkDuoYnK++IBiJ2HBfx/yQjK/NEWPQr4Q==@vger.kernel.org
X-Gm-Message-State: AFuF++mkoQuDc/zJY25q6wl+tVmJDHovGT7n2O1atQ1z1spCZ3IwLpTr
	glybENA2oPzheUasEdugUC1mEVQWrT/wPUI/dNQQr7PdRtpnEbmJ7btNK1mBEB/8
X-Gm-Gg: AYBFou1ImRrHRDVdOEY6eWfIxow+fakwTBlbSE04aT+py21ZBzP+h8eg/8w+VodTz1f
	GYYlUZIjxp4uk4anrUxLSlAWJ/OxZScWzU3KjblaBSLcaIgcN8BF4KlRkNN7CiN81BnCaPJzm06
	N4c3W2gJQonxb/T6Sq8waLeOBw6dd8+z7Qrbk9sd7pUO2zpn20BSCvX+35dulLH5BKEehk5RyIN
	uprEfJZWxuHFJneficuhIOnGNv9AhBQAImDEc1LNL5LASuBbe8kh260kjat7bIpJv4UlVFbzPCS
	Dm9IR47Ihag0JcS6zB9MPwRkOlS5xFKd+zYSbO3WWXBLjlb4uoBW9hYpP9COlsonaKsRdK3zU8c
	gcK3B/2NNPOqiTYbzF5kgVdoaxOY/GVAofbuFumcN85B4PgB38wnUp2uxxvlpMR8xWGQlVh2ztY
	OW7G4Q0negT5PuXhVeq20ctkFrTB9imkJ8rK5n8M8QSIvPnnBPJ1GlzvXLuf7igWxiPRbbT67OC
	yI1jemw8Iwmi+Sze2SL6uD9GmShHtcDsNAbB5Yd7c4h/T7xJA==
X-Received: by 2002:a05:6a21:b82:b0:3b4:8880:2089 with SMTP id adf61e73a8af0-3dd5f5d9f56mr4321805637.16.1789544213182;
        Wed, 16 Sep 2026 00:36:53 -0700 (PDT)
Received: from localhost.cuchdit.in ([45.248.159.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ad6b9dsm5291011eec.21.2026.09.16.00.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:36:52 -0700 (PDT)
From: Punnay Sharma <punnaysharma805@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: atomisp: ov2722: Clean up resources on probe failure
Date: Wed, 16 Sep 2026 13:06:46 +0530
Message-ID: <20260916073646.26709-1-punnaysharma805@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915140828.25537-1-punnaysharma805@gmail.com>
References: <20260915140828.25537-1-punnaysharma805@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ov2722_probe() mishandles cleanup on three failure paths:

- media_entity_pads_init(): calls ov2722_remove() but falls through
  to registration with a freed subdevice.
- atomisp_register_i2c_module(): returns without releasing the device,
  controls, CSI allocation or platform resources.
- __ov2722_init_ctrl_handler(): leaves the CSI allocation behind.

Route control-handler, pad initialization and module registration
failures to out_remove to call ov2722_remove(client) and return ret.
Keep the separate configuration failure path because ov2722_s_config()
already unwinds CSI setup.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Punnay Sharma <punnaysharma805@gmail.com>
---
v2:
  - Handle cleanup and error return if atomisp_register_i2c_module()
    fails (Dan Carpenter).
  - Route __ov2722_init_ctrl_handler() failure to out_remove to clean
    up CSI resources.
  - Add missing Fixes tag (Dan Carpenter).

 .../staging/media/atomisp/i2c/atomisp-ov2722.c    | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2c41c496daa6..272291e370fd 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -971,7 +971,7 @@ static int ov2722_probe(struct i2c_client *client)
 
 	ret = __ov2722_init_ctrl_handler(dev);
 	if (ret)
-		goto out_ctrl_handler_free;
+		goto out_remove;
 
 	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
@@ -980,12 +980,17 @@ static int ov2722_probe(struct i2c_client *client)
 
 	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
 	if (ret)
-		ov2722_remove(client);
+		goto out_remove;
 
-	return atomisp_register_i2c_module(&dev->sd, ovpdev);
+	ret = atomisp_register_i2c_module(&dev->sd, ovpdev);
+	if (ret)
+		goto out_remove;
 
-out_ctrl_handler_free:
-	v4l2_ctrl_handler_free(&dev->ctrl_handler);
+	return 0;
+
+out_remove:
+	ov2722_remove(client);
+	return ret;
 
 out_free:
 	atomisp_gmin_remove_subdev(&dev->sd);

base-commit: 587858367581b9c55c3690f4e63382ad622719d4
-- 
2.55.0

