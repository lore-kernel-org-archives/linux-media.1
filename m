Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495C03A1D1B
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 07:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774856179; cv=none; b=CM7yyxsgCWanarLXKXL0rfege/hwTbPocIpdyjPr7gwvvuSoGt6QIqA8+3C+QovOx6gJ9A15QDTRlBv7fjur/5JGdC8QndfUBlGOoUmmCrrQhMbJDWCrDwv3UKVv32b5PcPHdSSL7fuQOwNJR312xrHBwBh/vjVRZ/78CsGLfeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774856179; c=relaxed/simple;
	bh=LAaNo5RL+flgMVL1YHSP0zlU4TE9e7ImpSJmnKfKBr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VwTe+TyNmGnuBSUzEalyCRBpQOKB1V8n62sxZuYHdjjvgptZo5iIvDu0Ra/zasRqoxc31mLd//8+SKYKu1x2BT1TzB1vKdk+1VcpXVgSJ4zZJGr4CnTCGaYS4WCc+VKoyN782G0MreuaxhV1zrz+FPkTt2fGdHzfpjcNT8chVDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s7MQe9KX; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s7MQe9KX"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so49373365e9.2
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 00:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774856175; x=1775460975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6PDT/N7LbYtJJDcDJelx2xg8NXIfygevP3dIW+DnC4=;
        b=s7MQe9KXzMe5phM1PTYegUySPiaw+nfLkd8AJzTwvr20d65JLaD1MNRUqXShBGYogr
         dBPimYh7IZd92n87wtH9HW7FEa5fZkN1b1/HW1eqWvgxdEL9Vh4qWjBwr1MXX8nAvWhO
         fEKzBQPh5gvJz9wZlT54eB9Augjpk48HGsEo62qhKdUv2MMJIXEBG82qMzEZILAojPtG
         5pv4c8Em0VfDUg5f5EVVqbj3b76Fhql9TO8XByJGa7r2TFSsNKsamX/2YaPptktz98uG
         ro9cocToMGdtaYxIDCTROniIw3KGoBJOAu6BPEFnDLss/FAca1xGlrWHWUz62ZkK6Kl0
         iUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774856175; x=1775460975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c6PDT/N7LbYtJJDcDJelx2xg8NXIfygevP3dIW+DnC4=;
        b=LBw0vHUiF0rkWQlkQE12FSnd2ogud7wDHtBX3xA0/t4HH8U/FMcwXKQG/R/ug1pCvi
         J79+7SIuxKWYujAVvS9yxXOT0zS/ijbyuAi8l+YS9iPoJ65xtRmCIJQraQjfniXrejah
         U7kXtbdBiuUgexqftRWKAXdTVBDwOiTMuymOVBSAcH4vUtW7z//6Omvh067/rtw2SwWt
         f47Jh/K3Bxts3lhkWhr+Tk8V6sJsfhmTLa0b1sNuYXbkwY4WGU9DBv3H1Br3xapMtRru
         JdheixpI/d/VdG4KsfKDRE14IiJw0d2nayZ11niKdo69ERFL39VgJ38hJPiw85OUp6uU
         AnfQ==
X-Forwarded-Encrypted: i=1; AJvYcCViIwyx/CaAxnpx9PYw/HaqtrtZFdESbvIawsyXwY0kHcDd7E+8NVDo+Y5LcHseng9zA9vnPZ+MwbBx/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrmUCi3mzbgmBU+/Et06LPtYmYeh2qcahGe8yE2WT6C4Nh5zgd
	njf/sEW61z9dndsjOOgnIWJHYg0NYsj01EMsbUD4O8YMKQxyz3LP5ZTz
X-Gm-Gg: ATEYQzyYI9byRbzzOauSsYcXkPrbOM0+J/q++GMOSpovrRJxnm/6KhpuoyyqC6GOw57
	VyhG6iHah3UujYNX3DdF4a+hPxqpXz4HtZlHRLhI+f0NzvK9wRPTN7Tlda1SIGYfBcJCWy7OOC0
	3YFOUsCi1Ox7bSugfBOVsAY2z5E1sM0RiF12E8Kxt9SXSSebDj06/axc1LO6pQzi/4TjHKWqzBp
	3ZvxOJxBFGkdkgB3gXnrUrALRHxXJmz9guvYk0kriMLWNr0HwT+YCILQJpuxucZQLnaXugWOj0M
	bsoIcWZnZW2e9oKICrcUP0eLOsYb1ViS7/UBnesZJ+towsLukgPnByrbNTfcSgGl3XbVsXRnDNb
	n3Y67Rycxs01gq7WBO2/En4uiyPZoW6gl30/eCDn4pXFib87KdrxrMqhUil0ZfNoCfCqWhVBVEy
	c4pWkIsaP7wfnBH0+7gfjehZ6IB2HzyNpQvFOY4oqle3oUj+lblny0dwFVL9T/GQ==
X-Received: by 2002:a05:600c:4f53:b0:485:481c:e7bb with SMTP id 5b1f17b1804b1-48727ee9b89mr188413445e9.20.1774856175429;
        Mon, 30 Mar 2026 00:36:15 -0700 (PDT)
Received: from DESKTOP-IHE0QGF.localdomain ([86.121.12.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722be608bsm389407255e9.0.2026.03.30.00.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 00:36:15 -0700 (PDT)
From: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	d-gole@ti.com,
	m-chadhry@ti.com,
	Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Subject: [PATCH v4 4/4] staging: media: atomisp: remove redundant blank lines
Date: Mon, 30 Mar 2026 10:35:49 +0300
Message-ID: <20260330073549.5782-5-robyserbanpascu06@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330073549.5782-1-robyserbanpascu06@gmail.com>
References: <20260330073549.5782-1-robyserbanpascu06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove multiple consecutive blank lines to improve code readability
and follow kernel style guidelines.

Signed-off-by: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
---
 drivers/staging/media/atomisp/pci/system_global.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index c65a5be8445a..d417230faff2 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -218,7 +218,6 @@ typedef enum {
 #define	N_ACQUISITION_UNIT_ID		1
 #define	N_CTRL_UNIT_ID			1
 
-
 enum ia_css_isp_memories {
 	IA_CSS_ISP_PMEM0 = 0,
 	IA_CSS_ISP_DMEM0,
@@ -248,7 +247,6 @@ typedef enum {
 	N_ISYS_IRQ_ID
 } isys_irq_ID_t;
 
-
 /*
  * Input-buffer Controller.
  */
-- 
2.43.0

