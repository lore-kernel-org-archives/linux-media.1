Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E3439734A
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 16:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456228; cv=none; b=Sc+FkIbYhq0trNuxo/HnvHeCi46YL+KxWZmFROlWuADMC09XnyWF10WUY7FxwIFZsiOf+ntwVsJCYKApWxWYdUJTPugTYJ97d2KhsOBGlkeS1nHuvlKTb7/WNUnAjB4JJJ85924yRQBsy3Gk6yFTLf+jJGmbjZ++H3Ctbb9JlYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456228; c=relaxed/simple;
	bh=q6Pj3wEPiFXy6dp5Lo+IV+wH/zxCIuyoCWI0DOTu43Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uNqyFzWxJFKSb65PIiEuCL1+N0aVMHLe5tupt5AHr+Yp1B/KIsLinc908riiiNXP+9nx+4lpoEoEEPb7okd1+/HgvJH+eLyagcbUa0N8xqNd8g/gqeBo2m675wXI37J/KqFB6Ie7vkFDDqwFWeIN1rARWsq5Z9+TWcet12s7g4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQZoFZqi; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQZoFZqi"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c40397e3caso23659685ad.2
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 09:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456226; x=1782061026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmOBCXRMxHUy9xFI3toxiU28u5v8kqCzk7z0VpaRiLk=;
        b=LQZoFZqi8hlrkhpRbMPPhWQ9ywQXC4RgvLTFbfal01FjM0QxSeuGzlWMSnw2fY97+T
         dysYNFMhCAKRe2mc6l885rgAlHSX7TqKIZhcKf3yPe4L+6ejyYKJQK2Dq1EdUP3ThS4h
         +KhzugoISwiaLhoM1ktPPVumRhEIXgrgLXpGGkTJn19THfe9xwDOO7k3vvZQaN4MEA9S
         r03gZ0pzT5A2qFDrrkhtLx58N5CNPkYNCIleGOeYgqSV7YGprEGdJgJvNhulhOwyQLiL
         5ffMqnVT+WFPbxfJNWHDoyg5vbuWIMVCgbqlcOSz91ux7yjd0GPzguRGmdNmVH+0xQex
         TP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456226; x=1782061026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KmOBCXRMxHUy9xFI3toxiU28u5v8kqCzk7z0VpaRiLk=;
        b=l7Jdob/YzPYBC9oS71tEyXml9ma/d9RJcEB2m+NjogWhl6g8ogytWGgHScBvKd14BP
         tMCe+kCmQgSe1JRL42X5yhiTxMsJpR6XPczi9lWS5arT7MdsS1DWTnq66iflDJCPKtGE
         SbubO2SyKPLJ55mbDIDbXPNMne2wzeMnQovFRPoNrTUWIY2YmKZpFYKW8/m5NnJHOGm/
         5wa8rV8m85JwhIoIJSWHFi8GF/ZMn4ri+YmfdU6oOblZWBxUdLErPNuzGhN9sFNj/JoW
         esL7d9vHMX9CVFDII9dhFsESLuI8z52ufmf/yg8pzNhHMw9djS1DKGAywiBaiNvNygiT
         qNVw==
X-Gm-Message-State: AOJu0YwU+5fCxSmJbCOeCDFC9l8QfCp2OnODNt0hwq1QklkMiA/FxyQ/
	KrlX868l2LT2MiKJYmoCxGUYRLyh7y8kVi3ohz/xFw1WhCNbeWvU4MsmcuqdbiD+
X-Gm-Gg: Acq92OFKgbQtzAd0LZWwqh/6WpKtrPFd5gyVrctHvA9XNlXLSDv1vGBs7JPuLnIVlzK
	fLrUYAL+X/GzGdsIDaNJeQP1VHdwctFJJq5LDLQ0IeVdPYXFbwZ5e/BAuabMqSZljIZanW5WIpn
	Z7avfBo8pv2oLNq9PmmvT8LZoLo8PeEKZHodtoN60gMA8gf2yDaMvi3h3BQr99LYqA917TWhh+d
	FHcgBRemgbcOV1sVVNl6jLR0lbWjkcD4E7v8ogscfbrj39KZbQLUxw5/WowUDjmjCB748Lu4PF6
	V0fW9n7vqZXaeF1e1h40tlewhlhacKQnjq3v8Q5qKY2uks/yVHyb+hsh9HXUVvusD/b7K+msiT0
	PCPh3DMiaNc1/vlf1MrVfCpjc27gm0ptyuEENNIFz9tmzQXXeFDW7kw2mSHOj2i7WEpBfJy0Y5C
	ueLUZ8ipNxYO2LQkvTAZ+bQ53Q2OQIFxYg4mqqlej29aWAr8C8wUOz
X-Received: by 2002:a17:903:238b:b0:2c1:77cd:fb0b with SMTP id d9443c01a7336-2c412f17bcfmr118511375ad.37.1781456226362;
        Sun, 14 Jun 2026 09:57:06 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.57.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:57:06 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/22] media: platform: stm32-csi: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:43 +0530
Message-ID: <20260614165630.3896-7-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614165630.3896-1-birenpandya@gmail.com>
References: <20260614165630.3896-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes: dcb0f4c16be5 ("media: stm32: csi: addition of the STM32 CSI driver")
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index fd2b6dfbd44c..0847fd347d56 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -1060,6 +1060,7 @@ static int stm32_csi_probe(struct platform_device *pdev)
 
 err_cleanup:
 	v4l2_async_nf_cleanup(&csidev->notifier);
+	media_entity_cleanup(&csidev->sd.entity);
 	return ret;
 }
 
@@ -1068,6 +1069,7 @@ static void stm32_csi_remove(struct platform_device *pdev)
 	struct stm32_csi_dev *csidev = platform_get_drvdata(pdev);
 
 	v4l2_async_unregister_subdev(&csidev->sd);
+	media_entity_cleanup(&csidev->sd.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)

