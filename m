Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57956384CF0
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 04:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789273123; cv=none; b=Zh0J3Nj64O+4B6M8oBwtp+IWwF5d1z2VrmgWGXoQxI/T46F+jZbzCYLXxuCGJwatIVgbqukxa7/dj0LWVAxwgveoA+x7VIxK3dr946tASAUq7BVj/no4/kj63xS+1DLCqzeEWrXOc3espD42hCvk8+YZlz9zheM6s45ZiVL9jpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789273123; c=relaxed/simple;
	bh=KIIwlgtQiPCeDblTe7idpuN5xdTWR3wTnKQTNX2q9PY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ElQ9PPksVA5uP+eXklGHrhJj85yqFWLkTLeilylZ5IR91igT4CZPfAmDh/HugTYayAY/Zo9XeZwxWorHn+GNsshK4m8qYlb9g3xahW0QDsFLvbFyz6NLHMbLOSyoMwDVIxBzf81EGM0oYNWpXpt+jb+9TOgHSFreKBIfXSKfNIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwioAeQQ; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwioAeQQ"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91219376dd6so13435016d6.2
        for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 21:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789273117; x=1789877917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Cy9tKh8kDj+/dr3iT8f18N8p4TbAne3xHKS21+yoCc=;
        b=YwioAeQQdmz/TxQSxi3uouTkYpJYa31T8UqFnDBkXw04ZCyYq77bUMGli12nOrSfpk
         XnWyuvFJcyBqK6cqeVfyxRIQxQ7Sz2wWxmXoooYMkoeNkehQzyIohjFm9joo8UAJ5vre
         7BaM04DGeNzaWAcKjcKojSKGKHkEzaoJc2VzndRJWGCKRBer6y2xww75HGe3fJMS/eY2
         iw/DqfqMzsMr0KuTK9TcmF/fmHguMsP1ejXidZzO8y1YmLbtPJCYBdAEVMm7FIkzGriK
         0qzDvwG91BK6qKACPYn+x6rWABFNIIr22vhRk2lCnc6s0Um9hzJE8GABOnJVS48yp5BE
         bs5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789273117; x=1789877917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Cy9tKh8kDj+/dr3iT8f18N8p4TbAne3xHKS21+yoCc=;
        b=Ra+0/TMruHhXzbpYfC0lpVMskXtybdtIBLsu+IWsVQeSDdPNclgGyLc763TczZ8EES
         Vq1w8P3PEUcfrU4bsffusVTqfczqIpjY0DDkLh3um3WcxO0XwaP6v7vSLfGmAD4ewnlM
         HTEmdtiVw+EaVWP73OpW2GuSyZ8fv4q6+8jKI13AAUNKJWgzZLMd7h2SSzA2D1qAdu+o
         Z/zVPp16Vk3w9VQl6CpX6ebk6MYA7klPJ/lqMRQVscu4qc3MDPREGzYsuEiGqB3R+xLD
         igxGVksdsiFybbW0ruAN5aNs1WfNL0fdONlro9zTMcLBzo4NlWgs3mgVR19p+L4Y195h
         N1Mw==
X-Forwarded-Encrypted: i=1; AKwUvBxMjvudPr7tE+vMwgB1APRa3aDWFjXjj/VWQ1Tycn6/yCPi7WeCCo+nt8MJIQ8JofRgOmATkT2JMFjOhw==@vger.kernel.org
X-Gm-Message-State: AFuF++kP1co/MwUxz8q7ey0BQji0YqX0pu1i0NSGuNDaFuOxmnU/fz5x
	aEVqz2lYHcxZbwhWFxHadhccNirxP83ZbDYF/T5Ul2RvX3eOoi0Ynz4=
X-Gm-Gg: AYBFou3GLIyTFS4uL76C0GeDOS0MVLbFMI9fTGKe2SAEp443UjYKacx1l1aRKz7P0T0
	rgI1aSjSg7M9jWRjYU6m71PUxnJGkKpxbD6LlgrxApGKNnaDQF89zDX+bUKi51Hu8VpdBa94PQS
	l3km43neHDhSAOKMheS69njlqerIwM7VXoUXw4E7NI4RFfME8OZhUC5Grus4Bqu0hH7YGbodn8y
	uxr/BN5BCge0iUoOvhQyKJvqe5AbXjoWiv1wkoV8r09BVLqvZoWsf/F5XfZvivvHUtwhbEEUUlo
	tq0uPc9+qNS4SP2P5wKFCISstERuWwD+8KrGGNcUfHLDXWWxI+Qv+TPZS9HX4Wte9CGtklM7URF
	WIceqdwj34BzW3JTadvvYWlloZfO/eIllZAOJwDSsqeI2/YAt7IYg8IKU1SqFzgfBJ+I4BpGrjf
	2fSiClGSaxFKBd4Hi1ppKJc/lnvyIGCeozBOeM7TBmeLEDkyUi457M9Z8zp36yUHhKRigDaFKEq
	WKnjWE0xVoMmeSVRE+pE3vVGxPsZhbMYa1zmaQIn166glPMw2mOVm+N4ohMpRNGerHdjDTVWXdB
	RJvq0TTNBEup+m/MgxVXt7YlyAxfsZvxKw==
X-Received: by 2002:a05:6214:20ef:b0:910:74ec:8892 with SMTP id 6a1803df08f44-9121d8eb88amr91874446d6.6.1789273117604;
        Sat, 12 Sep 2026 21:18:37 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45adbfsm61735926d6.13.2026.09.12.21.18.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 21:18:36 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: i2c: dw9719: power down on detection errors
Date: Sun, 13 Sep 2026 00:18:28 -0400
Message-ID: <20260913041828.28430-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moving chip detection into dw9719_power_up() introduced direct returns
after the regulator has been enabled. An INFO register read failure or an
unrecognized ID bypasses the power-down path, while probe only cleans up
the media entity and controls after a power-up error.

Route both detection errors through the existing power-down check. Preserve
the read error or -ENXIO and leave the successful power-up and regulator
enable failure paths unchanged.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 2a1551665a85 ("media: dw9719: Add DW9761 support")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/i2c/dw9719.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 3b7ba88fd..8a34abe18 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -150,7 +150,7 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 
 		ret = cci_read(dw9719->regmap, DW9719_INFO, &val, NULL);
 		if (ret < 0)
-			return ret;
+			goto out;
 
 		switch (val) {
 		case DW9719_ID:
@@ -168,7 +168,8 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 		default:
 			dev_err(dw9719->dev,
 				"Error unknown device id 0x%02llx\n", val);
-			return -ENXIO;
+			ret = -ENXIO;
+			goto out;
 		}
 
 props:
@@ -218,6 +219,7 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 		cci_write(dw9719->regmap, DW9719_VCM_FREQ, dw9719->vcm_freq, &ret);
 	}
 
+out:
 	if (ret)
 		dw9719_power_down(dw9719);
 
