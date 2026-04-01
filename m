Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE76F3F54A1
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 17:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062967; cv=none; b=EoS9iUBed79kgKg5WmOubjR+BoBL0d8ynPxU4fFuW7+QBXgj7HjhGFvYuPvstjeG8HYurw0oMGppMblommb66Mj8tyVKoVjFGPUkfNcLNhl1AW1honrEtpMe1gnpnVeLYtiToXHkyUdfwUvglVOPqwJNtWAwDvp8MA9t3fXvZRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062967; c=relaxed/simple;
	bh=HBzz5tCb4AUIUFviOE8eRLefp4KWy0BmJ2F/IOn50kM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mgZ53F8Q/8KnKWyNKQetFXz14CoKlyhsGP2mhEO5ER77IGJOsI0urR83L/rvKoy3hr5lhvHap8+AP+rCEVauzqAJiPhIaaIrjQ/oHUzpptXeYoqn8B51h0U9biYDUth6pbfHiWcGgh+UAdE5pTSzXqcHE7LE4BcR0Tq0Xmpc19I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oPrYlPJA; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oPrYlPJA"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b2469e5117so7193205ad.1
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 10:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775062965; x=1775667765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OBxoBABnFgARb0xnCBOsok+3wHCtlybCDJIvzC32HEk=;
        b=oPrYlPJAyXcRvqg61Mlp6m+AQO+FatgjeAvCHFHzVB+DAtdfZeMehdsc0+Xz1ZO48A
         GVOtecAwt5nLHtj9FesNiwWoWfwxGycWcdnLZt/rOVAMfauWB738OnUVFLnjGZSvSDxP
         QmzACh27M/LJlOyl5L7ZaTtX7VQoIz1awPMfd3zaoSr2wLLZBpGe44SNLxhSBoP50rai
         OU9YxhxEnItmy0yI6CzF2Gt1ys6N3zbS5io+3pjl+VoxraFVs+LaRpRLLTc+SpV2Kj7i
         DN0LNnjrP8IYe+wEqvdUIfUhBIvOSZQuqmSX9Bg+0QfM+Ij3lOwW3yVL+y1iA3dn3SD3
         AEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775062965; x=1775667765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBxoBABnFgARb0xnCBOsok+3wHCtlybCDJIvzC32HEk=;
        b=H+qpGI5GFDkQvzoKaL18/7q4bCyokU6v/l0UvY19vU7bB+aMxRyekPkntYHTbl7iQv
         msqTBYS+6sEdnD/euRw6ocZyaiDmWGTPVpxQ6E+HMjVen8xFicgGUH9eFPENIvXTjTV7
         AmzxbCNq7bkO6RD3NDjFLxbumkTlUOO+KbFz2ZtpjiBiRrmcLnFHyY65CHT8rB+COYUi
         PY4U9xn/tal3DPUkMwY0c59Mgr/kONE7PrJG2m5FVoi9dq6E22PYJ3czJz7y8mSwgA0S
         /7LEepYt7XPtX7NYPaz5HOpUh7/Ah6mJU+JBo3JcvpOaOynHjDWmfLxdEaq+8lsntVXd
         ztnw==
X-Forwarded-Encrypted: i=1; AJvYcCWVnGpZVpY5SZhHKDgYHC0TlMsKl3PpHQQM4IM3Yw6bsEpQHhZmwmiR5zhj+FgLk0M62TppgRpSgIAaZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOGyhRCVvLDKLyqxFOtNLlueyDyiVJ9/0vPnzqofzQcrkKiwvJ
	xH4EwiQ35WN9AjUcAGyfJ/qyOxKbe8g9ZWExBhTKNh1srCEhS02vbNPg
X-Gm-Gg: ATEYQzwptdyH8/deLYnK+RYuKDzncIVHUoEVvU1HjQu0WqGd/ZdKijlo9flKlOefoCC
	F2qf28cmmn2OYItZlITvjd1tL6HB/NjV6j8nhG432CL/kJ+5sBKuhuuBh0mEx6NvHigxxdDlSR3
	kmXPxqJblE1P6o2KzGxMY0iJz7il79h3NZ3S1gdKgGU6qL8LqfYWpwg602cy8RTQDCaof09C0EL
	7D/Oa2URWaho5HiqzdfcZZVvwh5Y/QLX4bp8J1A6Lh8RNGIzR+X66bHP+UcfRUbUwuz3Pj5j2oz
	raR/aEJQGy2WWvU0GRtaOKHG1RMKTw83GxabnCfwoD7XagDY5jvVz/eD2wv6O6QNL2sfU+fogLM
	4/buhGMlnKKZ1ujLq2D0UMFSMZ5bJo01g+ZUhHIvzOuMKKo9JTrJ8QkC7cApr4FZkVNVc6+1NOE
	QmAqXOX48/r3aydG2dossXxi/yV5xGPzu0s+xqxl+DhfM=
X-Received: by 2002:a17:903:32c2:b0:2aa:e47d:e3b with SMTP id d9443c01a7336-2b25ed654ecmr85278575ad.0.1775062965153;
        Wed, 01 Apr 2026 10:02:45 -0700 (PDT)
Received: from hosnbs8526786.. ([27.7.150.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478d329sm2965875ad.34.2026.04.01.10.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 10:02:44 -0700 (PDT)
From: Sairam Bandikanti <sairambandikanti@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sairam Bandikanti <sairambandikanti@gmail.com>,
	Claude <noreply@anthropic.com>
Subject: [PATCH] staging: atomisp: fix memory leak in sh_css_load_firmware on error path
Date: Wed,  1 Apr 2026 22:32:18 +0530
Message-Id: <20260401170218.40504-1-sairambandikanti@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sh_css_load_firmware() allocates sh_css_blob_info and fw_minibuffer but
all error paths inside the firmware parsing loop use bare 'return'
statements, leaking both allocations. Additionally, when the
fw_minibuffer allocation itself fails, sh_css_blob_info is leaked.

Replace all bare returns with goto to a common err_alloc cleanup label
that frees both allocations before returning.

Signed-off-by: Sairam Bandikanti <sairambandikanti@gmail.com>
Assisted-by: Claude <noreply@anthropic.com>
---
 .../media/atomisp/pci/sh_css_firmware.c       | 62 +++++++++++++------
 1 file changed, 44 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index 57ecf55..dec79d0 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -263,8 +263,10 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 	}
 
 	fw_minibuffer = kzalloc_objs(struct fw_param, sh_css_num_binaries);
-	if (!fw_minibuffer)
-		return -ENOMEM;
+	if (!fw_minibuffer) {
+		ret = -ENOMEM;
+		goto err_alloc;
+	}
 
 	for (i = 0; i < sh_css_num_binaries; i++) {
 		struct ia_css_fw_info *bi = &binaries[i];
@@ -278,18 +280,23 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 
 		err = sh_css_load_blob_info(fw_data, bi, &bd, i);
 
-		if (err)
-			return -EINVAL;
+		if (err) {
+			ret = -EINVAL;
+			goto err_alloc;
+		}
 
-		if (bi->blob.offset + bi->blob.size > fw_size)
-			return -EINVAL;
+		if (bi->blob.offset + bi->blob.size > fw_size) {
+			ret = -EINVAL;
+			goto err_alloc;
+		}
 
 		switch (bd.header.type) {
 		case ia_css_isp_firmware:
 			if (bd.header.info.isp.type > IA_CSS_ACC_STANDALONE) {
 				dev_err(dev, "binary #%2d: invalid SP type\n",
 					i);
-				return -EINVAL;
+				ret = -EINVAL;
+				goto err_alloc;
 			}
 
 			dev_dbg(dev,
@@ -313,17 +320,22 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 				dev_err(dev,
 					"binary #%2d: invalid firmware type\n",
 					i);
-				return -EINVAL;
+				ret = -EINVAL;
+				goto err_alloc;
 			}
 			break;
 		}
 
 		if (bi->type == ia_css_sp_firmware) {
-			if (i != SP_FIRMWARE)
-				return -EINVAL;
+			if (i != SP_FIRMWARE) {
+				ret = -EINVAL;
+				goto err_alloc;
+			}
 			err = setup_binary(bi, fw_data, &sh_css_sp_fw, i);
-			if (err)
-				return err;
+			if (err) {
+				ret = err;
+				goto err_alloc;
+			}
 
 		} else {
 			/*
@@ -331,18 +343,32 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 			 * (including bootloaders) (i>NUM_OF_SPS)
 			 * are ISP firmware
 			 */
-			if (i < NUM_OF_SPS)
-				return -EINVAL;
+			if (i < NUM_OF_SPS) {
+				ret = -EINVAL;
+				goto err_alloc;
+			}
 
-			if (bi->type != ia_css_isp_firmware)
-				return -EINVAL;
-			if (!sh_css_blob_info) /* cannot happen but KW does not see this */
-				return -EINVAL;
+			if (bi->type != ia_css_isp_firmware) {
+				ret = -EINVAL;
+				goto err_alloc;
+			}
+			if (!sh_css_blob_info) {
+				/* cannot happen but KW does not see this */
+				ret = -EINVAL;
+				goto err_alloc;
+			}
 			sh_css_blob_info[i - NUM_OF_SPS] = bd;
 		}
 	}
 
 	return 0;
+
+err_alloc:
+	kfree(fw_minibuffer);
+	fw_minibuffer = NULL;
+	kfree(sh_css_blob_info);
+	sh_css_blob_info = NULL;
+	return ret;
 }
 
 void sh_css_unload_firmware(void)
-- 
2.34.1

