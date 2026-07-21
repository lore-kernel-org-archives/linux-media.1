Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AF931F99D
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 16:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651768; cv=none; b=qjDjRNM4xNQr/frCqAGuQtq2L83UikkS4dDkTs2aZXYkNFppGMdRJi2OaSw2Aw+aRG99Wsj8t5FDyE+h8P1TiPrbwuhHC308L4Sa85XTS/kLP0qjR3oFCSjQqpPQCHg8wCRrk4D4BPW056tzhrwNzZ8rQm9iVw8ybgKfsRu2NZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651768; c=relaxed/simple;
	bh=XVWfsIAgGX9Xd1n8zXWGc6IgbtmhQvC36aepBIb8Tf8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E0ulM1/i258Xy/qalDQaHSYoxko8s27fE/3ViPPGSZloKnlxNm0woiy40qX1hAGlEjqwJp2MUuKvoiFee6yCFRsSgixrqYV1+ImoXK6lbI3tSzRLhPD19pGCTz64D8nwzTRqx4quT+K8zioOw0Bi05Xwn4U328gtNht1y2AWmHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4R3ZMJ6; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4R3ZMJ6"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso7827762a12.2
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 09:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784651767; x=1785256567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gPJSl7du6t+JICWFEnlJMKsprDG3NXTVNkQiPLiNnnI=;
        b=B4R3ZMJ6hPxe7wzh+zfrkl/YO1voaEEmiRsiF/EDLhdIKa+G+LWIrj1D52OAhwt6BX
         ZkCX3jiNOKgekKKEmPdtvjbu0CgHL7QrQejfPFqFDcTB2Nn2Rvtev28Gczx50564nduB
         ANNn4qqmcw/bwCYxATf5oBBvPUFLtndKDuYL05Q5dFaT3gMIIsEcWlUVYbYjzKgZUUux
         2Hmn7n8uH4FF6e4QJPf3we3EeU/aRYgWdF3lUG+7MLQ0iMfdRqO/hAJm9oeVjg1ZHtwE
         PpA+WgoKa6eptW5VfCpiDFVwN6dJHKFURdMskBrDk3XuyFoyHGj9ImiD5y7W2rYZzGjJ
         0KRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651767; x=1785256567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gPJSl7du6t+JICWFEnlJMKsprDG3NXTVNkQiPLiNnnI=;
        b=NpU5C4vbvuKV/W2ktJfLg+f8nn/3Ej3ckVYG+xX5b3uVks3uA+D9YYdnD3IUxT+6j3
         vwWx8Gdji7/SjGdp4/UKJyoMjbOlnc+pcck7/FY4fJ97YiCN6/m/0JOnDgK+K0SWebJT
         fh39rW+vQ1PYHIwzR9Dr3k8itDZMBoueAsn30qISDZJqPovMujdgLi1mDou/7WR91+Fn
         1W4Hh1N+fdDoNxwDXmjF1qsuHLsdCfB7xVciGSgb0JeCY7K49fNQ4NuBY6hG6uH4PN4f
         ZZJhYVbkK59XRTqzBQpZyaTz+3I+KOC4EvGW/si4PcXCyhdfoIQJgBTcnoYm9FWgLSTN
         S9kg==
X-Forwarded-Encrypted: i=1; AHgh+RokcC6OCOsCpfEUqbmu5FchrmccMGg2fVlnq7+mPSsZPTE+rnkh7dBcWRhPmhrxA5W8GFGAEoGLYIASmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzR28lxLljhMkEyQYpnf7llC2aWIkRKbLSig1N5RVwGxxcvlSFT
	VTq6wwnN299n0nDw2c+EKfQQkHXHq8kAt4wzNO5VPOxb+QmOw9pxT6c+
X-Gm-Gg: AfdE7clU//0KfnZsr7A6C5jpnUxOVyj6nrfW84SsrynJCAfmwuuTKsBxZBT8yw02Pb2
	OSQNWNskSIIMmxxwmZX/Lk4tiIf6GVJR2Wh5c+iTxdOcH4iU8dtC3DZ9sfvC5UXp5XpC1ZaD6xF
	jpB41Ua7RSqDEcRpxbvrFwtTp5BnHutMvk15pVutjxxYVLCp/HXaHBCS8peJ19OCodyt4z+JG/U
	9zkUcVfwlIdOdaHrEWevvbcFKGNVP67a/xqZGXMHJifQfSzZUXEp+Gfo7jrirwNvtFc3RBdZJ1p
	UWD/DAU/1vCABVPShhWly2DiGgPMlByAf0XaW9AAWPYPLn3rB/2FvBKxD8nuceA19TIdz2q89Nq
	rjmYTmBwaICBGUoDfQraOgKz4g1ePHKGFM1AfFrYBRo58O3JnKUKGFt3+eBjNFxaAQvgoOVbfd1
	zZleK0BIVvrJCNwzm8dRs46Y33
X-Received: by 2002:a05:6a20:c70b:b0:3bf:ba89:5236 with SMTP id adf61e73a8af0-3c3ad8083e7mr20534478637.33.1784651766739;
        Tue, 21 Jul 2026 09:36:06 -0700 (PDT)
Received: from UbuntuOS.. ([49.34.103.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e0818e4sm482146eec.22.2026.07.21.09.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:36:05 -0700 (PDT)
From: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Subject: [PATCH v4 1/2] staging: media: atomisp: Remove pad_w and pad_h module parameters
Date: Tue, 21 Jul 2026 22:05:31 +0530
Message-Id: <20260721163533.15888-2-prajvalchaudhari733@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260721163533.15888-1-prajvalchaudhari733@gmail.com>
References: <20260721163533.15888-1-prajvalchaudhari733@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the 'pad_w' and 'pad_h' module parameters to prevent userspace
from overriding internal ISP hardware padding boundaries. Convert them
into internal driver constants instead.

Signed-off-by: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_common.h | 4 ++--
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   | 8 ++------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_common.h b/drivers/staging/media/atomisp/pci/atomisp_common.h
index a2462fc306fb..7c6c0124ff72 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_common.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_common.h
@@ -22,8 +22,8 @@
 
 extern int dbg_level;
 extern int dbg_func;
-extern int pad_w;
-extern int pad_h;
+extern const int pad_w;
+extern const int pad_h;
 
 /* Minimum padding requirements for ISP2400 (BYT) */
 #define ISP2400_MIN_PAD_W		12
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 812230397409..d117fea2860c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -64,13 +64,9 @@ MODULE_PARM_DESC(dbg_func,
  * output res, and isp output res. however since we do not have this yet,
  * the chosen solution is the next best thing.
  */
-int pad_w = 16;
-module_param(pad_w, int, 0644);
-MODULE_PARM_DESC(pad_w, "extra data for ISP processing");
+const int pad_w = 16;
 
-int pad_h = 16;
-module_param(pad_h, int, 0644);
-MODULE_PARM_DESC(pad_h, "extra data for ISP processing");
+const int pad_h = 16;
 
 /*
  * FIXME: this is a hack to make easier to support ISP2401 variant.
-- 
2.34.1

