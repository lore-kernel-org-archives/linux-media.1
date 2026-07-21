Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB36C322B6D
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 16:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651815; cv=none; b=c2O1tJoLXFlD247P//zK0occboxNNgGZmMS2uYcoeTGy7AVEmBUVDZWAPYeZti+povEQabzKeTUXsx67q620gSav5qLd4vr+ANHMwEMGUeqsYR403BkFGnAQzMR3ZMvswElv4CY/uaETfNllU/R4fLqLgv00Z/sxQiS6wfwqyoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651815; c=relaxed/simple;
	bh=68OYHZmfO1CqJ2yXczKtCiKa90oo4HRowTRiyn7WyTw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=udMzjFVQcYzeB0e+Itd7aUdihe2txvK108F95ywy4cJPm0uDzA2CnkFeEEP2gZOKK1Lm6JTULVQI9VMobipC+tON0XFyL7ToSwz7uk64l3+5yrDGq4vqnyX8rABL1BYEpIMLi7eNBFykAh9DpvqUumsusb6wb3Mzz1YNgMeKDos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TpLzPEok; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TpLzPEok"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so29589855ad.0
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 09:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784651813; x=1785256613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=amTHwVMATpcvRoO2/8Ok6HtXAv3cctTYnMFChFU3fQs=;
        b=TpLzPEok3a3SMrCqeeCxkvgIvfLu5w3qer6rdUXY4f0idBIC2Nkd7Mf36URENztBQi
         1ggVxMzC54DdaOg3EqolG2KG28fK1F2kwUzn5s2jOTRglaJQqCABybfLyvd7/WWSYrfb
         0NSir9yDgUumhSqv1tyswVQ1HtkrRDs2QGthScbfIWpq6qDiruGP0WmKAa23ecWxDSMi
         vUECby8e94HhhEoagNYbxe0bos+Bfhz9O1CT6Um0VHcYKMAPL6X06kbds27jHPknE8pF
         dkxfA8EyEtgmof2j5WOy75L4MeR4RVj4M4nSkWt5K/vxHYJPMNKa/lAY3lq/nnzyQJI+
         oeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651813; x=1785256613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=amTHwVMATpcvRoO2/8Ok6HtXAv3cctTYnMFChFU3fQs=;
        b=ShDfbJfG5wwj1aGyONK4WAwIF1lB+nKS70SszasWrPkXMAhv9l6FLZggbeHi8ElOrN
         HzNBMFXgAlgClerPrGgFibc+KknHEdmN58mE/JP2D/4/UbImlp8i0bzVeVxCRQEUQ0Fr
         0o2NdWbcDD6OUV0AEe6OLbmkZVzNwzf9FgEmTUbs74f4OLFX5XchmkYG9ObNkRtNe23+
         vHwCNXQyflYzDhdK9BxpybBYQRjwEz1T9XNO2dPOthkWew/h7bXnolmsyywCD3usz1pm
         D/xnNDmoHS/K8uBMi+ytiVo5S1ZN0NEPdPAVwdBH3AzCF7TvYSbtH5ZuKcrHbp+KNcug
         KqNw==
X-Forwarded-Encrypted: i=1; AHgh+RpmIGWAFPNnShoyT4DGNWxytTUYSYx2YpCR84ZGn5mSrkRNANxAEfN8sJJP2p9XyLdeYtrezSieYAmATg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUUHtjHDcJ+fpETw28w8CxHlWQidJ1zQ9ZDU0oRQLUGe2D6C1Q
	AX3KZeaoshdZqX8uuVlih1teC3wQKuFi5FBNqVyaCjqsMfDoAxTkZk1S
X-Gm-Gg: AR+sD12A/UM8WSgEt4lUodSOT9f9LhRbect/n5HVVz3A3ZoGVIaL4m0Rrk8neYmfuZJ
	NaDjXF87P1Iu6LxB6y44KK7YVic6Q8EPLB+pIx4uBzceFN8gRJ7wcOboT6uWTaWvVhA40gt9h9d
	fj2gn+vZwulg6SsZ6f16TYIJJxztfN5fG6g9mZGBWBTIb1WuQZPJrFXxH+OBpuRFXC2VkM1c2kt
	LIlvNwIdhrek/NTdZSSRcA5pjfCisz6wF0Yaw1lE5S/GaExmzOdCJ8Rv9j44AYBgXWtKuKTu+wI
	kjo95WIBw0E65EsogbxDiKT6otx4SzZhPKz4ERwTigapHxp+/VX4POa4WNftXeYt1UNi7cVfdXu
	FEJNGpTSi8A1N1HhbTfax/lEq6biDa+Yq5G+Pl0osd8UGGH8CrZmfRBJp7+K7eDTcje4Wt5ZM6Y
	hMp/gjs6vwIkOkR/zR/nb13VCO5f7TUce6ytY=
X-Received: by 2002:a17:903:2f85:b0:2c9:97a9:2097 with SMTP id d9443c01a7336-2cf349f4878mr204285505ad.43.1784651812845;
        Tue, 21 Jul 2026 09:36:52 -0700 (PDT)
Received: from UbuntuOS.. ([49.34.103.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e0818e4sm482146eec.22.2026.07.21.09.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:36:52 -0700 (PDT)
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
Subject: [PATCH v4 2/2] staging: media: atomisp: Remove dbg_level and dbg_func module parameters
Date: Tue, 21 Jul 2026 22:05:32 +0530
Message-Id: <20260721163533.15888-3-prajvalchaudhari733@gmail.com>
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

Remove the 'dbg_level' and 'dbg_func' module parameters to align the
driver's debug facility with standard Linux kernel APIs (printk/vprintk).

The internal logic relying on custom debug parameters has been updated
so that message logging and function tracing no longer depend on exposed
userspace module parameters.

Signed-off-by: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_common.h   |  2 --
 .../staging/media/atomisp/pci/atomisp_compat_css20.c | 12 +++---------
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c     |  7 -------
 .../pci/runtime/debug/interface/ia_css_debug.h       |  7 +++----
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c     |  4 ++--
 5 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_common.h b/drivers/staging/media/atomisp/pci/atomisp_common.h
index 7c6c0124ff72..aa230c3708dd 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_common.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_common.h
@@ -20,8 +20,6 @@
 
 #include "ia_css.h"
 
-extern int dbg_level;
-extern int dbg_func;
 extern const int pad_w;
 extern const int pad_h;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index ea49ebe2da5c..647f6e7e2455 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -784,7 +784,7 @@ int atomisp_css_load_firmware(struct atomisp_device *isp)
 	isp->css_env.isp_css_env.hw_access_env.load = atomisp_css2_hw_load;
 	isp->css_env.isp_css_env.hw_access_env.store = atomisp_css2_hw_store;
 
-	__set_css_print_env(isp, dbg_func);
+	__set_css_print_env(isp, 1);
 
 	isp->css_env.isp_css_env.print_env.error_print = atomisp_vprintk;
 
@@ -3372,18 +3372,12 @@ void atomisp_css_set_isp_config_applied_frame(struct atomisp_sub_device *asd,
 
 int atomisp_get_css_dbgfunc(void)
 {
-	return dbg_func;
+	return 1;
 }
 
 int atomisp_set_css_dbgfunc(struct atomisp_device *isp, int opt)
 {
-	int ret;
-
-	ret = __set_css_print_env(isp, opt);
-	if (ret == 0)
-		dbg_func = opt;
-
-	return ret;
+	return __set_css_print_env(isp, opt);
 }
 
 void atomisp_en_dz_capt_pipe(struct atomisp_sub_device *asd, bool enable)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index d117fea2860c..55b3d4d3d6ad 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -45,15 +45,8 @@
 #define CSTATE_EXIT_LATENCY_C1  1
 
 /* cross component debug message flag */
-int dbg_level;
-module_param(dbg_level, int, 0644);
-MODULE_PARM_DESC(dbg_level, "debug message level (default:0)");
 
 /* log function switch */
-int dbg_func = 1;
-module_param(dbg_func, int, 0644);
-MODULE_PARM_DESC(dbg_func,
-		 "log function switch non/printk (default:printk)");
 
 /*
  * Set to 16x16 since this is the amount of lines and pixels the sensor
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
index 2d0e906530af..029adbdca945 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
@@ -8,7 +8,7 @@
 #define _IA_CSS_DEBUG_H_
 
 /*! \file */
-
+#include <linux/printk.h>
 #include <type_support.h>
 #include <linux/stdarg.h>
 #include <linux/bits.h>
@@ -39,7 +39,6 @@
 #define IA_CSS_DEBUG_INFO    9
 
 /* Global variable which controls the verbosity levels of the debug tracing */
-extern int dbg_level;
 
 /*! @brief Enum defining the different isp parameters to dump.
  *  Values can be combined to dump a combination of sets.
@@ -125,8 +124,8 @@ static inline void __printf(2, 0) ia_css_debug_vdtrace(unsigned int level,
 						       const char *fmt,
 						       va_list args)
 {
-	if (dbg_level >= level)
-		sh_css_vprint(fmt, args);
+	if (level <= IA_CSS_DEBUG_WARNING)
+		vprintk(fmt, args);
 }
 
 __printf(2, 3) void ia_css_debug_dtrace(unsigned int level,
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 5113aa5973f3..86b2cca2f441 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -135,13 +135,13 @@ void ia_css_debug_dtrace(unsigned int level, const char *fmt, ...)
 
 void ia_css_debug_set_dtrace_level(const unsigned int trace_level)
 {
-	dbg_level = trace_level;
+	/* Trace level is now controlled dynamically via Linux kernel dynamic debug facility */
 	return;
 }
 
 unsigned int ia_css_debug_get_dtrace_level(void)
 {
-	return dbg_level;
+	return 0;
 }
 
 static const char *debug_stream_format2str(const enum atomisp_input_format
-- 
2.34.1

