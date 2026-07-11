Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C0032E757
	for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783767923; cv=none; b=RkXuSUVr/yqgdGR8Wizfptgms+XHDQ19GE+EgAew6ARqZnQj1IFmw8jyySDFTc6i8ZG3VSn3ElbEIDoQWFd9bKrhX2sW0zXIUXJtczscHb2mV0O3zmDjCtbxMjKfWciyAsRsGn8WjqgmpRK1MkuVzUDR6LgEC7JUtL3+xHxwKxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783767923; c=relaxed/simple;
	bh=PvNrLEy0esAgjkx98SqINTHZQ5HZEEkzMrRFEp1RfB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ks/iFNtDaS5P/E9VYQauKtayJhY/1UpV7gi/0ZlOvKWYwVT3KfxsOGHPZE7MtianKvVfGKkrUEodTqBQv0yrByVXJoBwEq/sVQrzYYcaF4cip6ye4XKS1PbKZ9HBgfw9aSzxNuSPUNGGvlLKl6Ewkv/na54p3vQvbuhCzIDDJqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ofva/k4i; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ofva/k4i"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aeae771c49so1941032e87.3
        for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 04:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783767921; x=1784372721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bA6h6uzBB8Oq/gwDDfVQp4kei7vWwer0wCBkghOzAFs=;
        b=ofva/k4i+Wsypvh1Q8JU+Q0ofqRGCCoFRwt0JvVNXrtDL7egcSqeXXZAxbHHNrIaZk
         a0srMOSXNoTjgT+s88OOJGqhY09Dy9xmEgAmOSC4YHh9WY7zoeJ1sV+icNh0B0eLgshO
         lZ6nLLJqhFdlh8cA9qx3MUsuMDBUYxao33SHISK/aeiJmaXo3WGDbnFMYth8hQnaGv6B
         LoSkrjX1Cyn2ShFwaonH9QAp1kTlIonYVLl9U7KXc7te113r50pkLZdB07BYqZRUHMPE
         /suGzbVxAka4E1DwpIk56MOorTkv54+T+CFGCabKkY9up1pNt0btv+yJy6ErORlBTqpK
         hI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783767921; x=1784372721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bA6h6uzBB8Oq/gwDDfVQp4kei7vWwer0wCBkghOzAFs=;
        b=MHoIfP7Zb4z2rZcLyUMNP16DOIIR7QosOEBecnmDdvBuW5xuFi/2ESQMsf+Qxcc9Yb
         MovkXpyof62WmDsnDOx52kKqNnSbOkExuA4cQ4s9HrHWWvmvQILjS8os4xdKy596Db8c
         4KoJCALObngRCg66Wyrrg08xGxP+Txnpz0pNiXtRt8QR7zydAjvgRgbilQ7m7zeN8Eij
         n2T62ReDNm6Ggtr9X7O16VJ3/lC695MMCkcPHrD7y33tDUpNJ1IjeG5BvA340mxpGw2O
         RsXKERCW+mdjA60nZuQp/UcKgsi+FoI+l94vyb25kRdP4rt3lo0t0s10eXriw5KI6j73
         QoUw==
X-Forwarded-Encrypted: i=1; AHgh+Rqo3Eqspu8Lu3P46PooXMRploCvQM5zKLaGL0+b493K4WVt6NVTvE0cR5We84tMc6Lx+eyn1IrCZ95ZGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXS/nRaAB0etyR9oZvuu87RSpbpfEEAQhVQ1CHK6vEd8wi9u4L
	4TX9oeYGe/WuUd2a8p5EOcnbwKV1IWkfUN2dJBu/6b9HEu4rtOPFP5/j
X-Gm-Gg: AfdE7clmxUm9iA9mXCafsOV3wcD19P6PjvX+BSYBGV2FYyHU8/DTdn736fnq7eeKvaa
	la+8481CfaSyZO/DOwbY9S2isyZ/dNmD7a8VMvnmH294Wd0SVnmOYNtmXxLqdOagVOwTX/6TmYJ
	oNKtcYmw8b+ZkxwRS3Lbhs0ShPNkCJ3agBV5n9j6h6/TYrqMRDf+44o6DJ42ZVSDUkMTlXJWHYJ
	KiKk0Er6tSjc+0CcTWRK8BEmWh3zFXjPrxlSxFjuO2ks4KwDNZKdq8nyzDHe91Pg4p4sxLXEs6a
	4czEQgkBqbzf2PTBfvlpGCL1msa0DBZVHHbwu/Alg4mBOs5+vcjp0AMwEX49Ep0STJF8c6O9l16
	zWadveCTBBZMsAd30ZzXqswtHpdtlH/gvYTOVhGyo+wppeBrREtdFxafT/S7/za8kGUOTJxzU2W
	AANvIRhwk=
X-Received: by 2002:a05:6512:3582:b0:5b0:1e16:f3a2 with SMTP id 2adb3069b0e04-5b0236c7c84mr381624e87.57.1783767920589;
        Sat, 11 Jul 2026 04:05:20 -0700 (PDT)
Received: from linux ([195.54.40.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm516488e87.55.2026.07.11.04.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:05:19 -0700 (PDT)
From: "A. Kalimov" <erqeon@gmail.com>
To: error27@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	andy@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"A. Kalimov" <erqeon@gmail.com>
Subject: [PATCH v2 2/2] staging: media: atomisp: fix function arguments indentation
Date: Sat, 11 Jul 2026 15:01:52 +0400
Message-ID: <20260711110152.66188-3-erqeon@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711110152.66188-1-erqeon@gmail.com>
References: <20260711110152.66188-1-erqeon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: A. Kalimov <erqeon@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 81d0afae8..d741f4f04 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1883,9 +1883,8 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
 /*
  * Function to check the zoom region whether is effective
  */
-static bool atomisp_check_zoom_region(
-    struct atomisp_sub_device *asd,
-    struct ia_css_dz_config *dz_config)
+static bool atomisp_check_zoom_region(struct atomisp_sub_device *asd,
+				      struct ia_css_dz_config *dz_config)
 {
 	struct atomisp_resolution  config;
 	bool flag = false;
@@ -1918,9 +1917,8 @@ static bool atomisp_check_zoom_region(
 	return flag;
 }
 
-void atomisp_apply_css_parameters(
-    struct atomisp_sub_device *asd,
-    struct atomisp_css_params *css_param)
+void atomisp_apply_css_parameters(struct atomisp_sub_device *asd,
+				  struct atomisp_css_params *css_param)
 {
 	if (css_param->update_flag.wb_config)
 		asd->params.config.wb_config = &css_param->wb_config;
@@ -3893,10 +3891,9 @@ enum mipi_port_id atomisp_port_to_mipi_port(struct atomisp_device *isp,
 	}
 }
 
-static inline int atomisp_set_sensor_mipi_to_isp(
-    struct atomisp_sub_device *asd,
-    enum atomisp_input_stream_id stream_id,
-    struct camera_mipi_info *mipi_info)
+static inline int atomisp_set_sensor_mipi_to_isp(struct atomisp_sub_device *asd,
+						 enum atomisp_input_stream_id stream_id,
+						 struct camera_mipi_info *mipi_info)
 {
 	struct v4l2_control ctrl;
 	struct atomisp_device *isp = asd->isp;
-- 
2.53.0

