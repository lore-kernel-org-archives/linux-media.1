Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EF019F12D
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 13:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938212; cv=none; b=Yz/+11htvlVMy1UavI8rBlwCaeatmyL6Uy/tldzptlE0RFWSAFl6RQpdnRpxa+xW1XQb9AbitWIEdTEOMCzDaIBDoH6ZORb+zX+wBpVPd656Kjo9+0yRRBJprDJpnBOsoFVAuTl8INku3cerXBH/Z2uLp7KQWyTshDup8K01MZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938212; c=relaxed/simple;
	bh=SZNKc2jWaX+7ZPchNb8Z8qXS+B9Dw28m1FGfwGF3Xus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tczO2ruUQ46HJQuzLhzajujRzxEvgUoKHj1ZNjqxIqk6VRhFq9roSMiOOLslW0Jm1doCUN+UmeIwWVFN26X6hjKEyG/m84mU8eG+aqlm0K/k7HEsDb7x4s9iclttJNSt2bg3I2qs4NyehP9j1zxVXxU6WdP/CXfhYboJe3wJMw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebNAj5Wk; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebNAj5Wk"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c999f162c9aso744723a12.3
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 06:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785938211; x=1786543011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eg7s7wWDZNmPm0HzlM/ekfoGFm4nbJx3bfGiH7qMY1E=;
        b=ebNAj5WkTyI1XslIXYPbSMa8aI8pUpWwWutETE+sJd0vP+wYbabIIq3SavGcRHfdGV
         Xx0DKYAfqxCRpdMfS14F++fb34c9VJw07GnLMpZS8N1M26NslYAniaPVJQ23g4QAEv6T
         nhfkvFgsYJfuCyYHkyQylB483SITjbMs41P0UFDvUt/LSF+9TbbEPIyxlra+EJt68L/6
         iWgbdJc9L6DFKQ38EwxIGr88ynXa54dtZ7cFAfjJH2/JJkbS1ZvKjbLMClq4+QS4INAH
         s5M2//2Gz+V1FuKL2393ePv6ucPddp6drwWhFX2NpWtKAQBzl0dnFTHy85ALUUEFny3I
         IEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785938211; x=1786543011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eg7s7wWDZNmPm0HzlM/ekfoGFm4nbJx3bfGiH7qMY1E=;
        b=ed4Kv401bCqD2pXp2S3feXbfed+2Ai/fbwmkTjK8u26/xXrUS491SDw9YyvVMAVrCD
         egH/OvdzYNxZjsct/OiOEIby4/dJNC+vgTdrl4E5uaKUOLepaoA1off8ZFHis2lzHV0b
         F6+IO1twKorE6GAPRptF2PF9cu4ntj10PII88GHCmnCN6bsBy8YpfbC1JGROgo6r3erC
         uzMvHlfbOGinYb/ZqjiZ8lcBy+UQINaB+wuBvyyTD55o2zkMXw25sBGTS9RMa56F6soW
         bYKHujZFc/CfE1Jj4kfLP8IMV9Xm+phQlE8fxb96chTvRcchKJ/qqz/vK5YxR6eh9pGm
         4ZGw==
X-Forwarded-Encrypted: i=1; AHgh+Ro4PlOSuHy5xP78wFPOSZ2ltx2yuhNG/mxKaabhWbrEq9/IneUPFXr8d0I+osN/QSiosMjMSK8gC03cJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjfzQz1t3HLWmRBAjcX4mcBht0dDlU/TgkQqj3DYqz7YZArDf4
	vmkWjYe09o+Ve1cpUeMvJKDC/lSgns4zyEfNrZUl2tSgde3re3iXtS66
X-Gm-Gg: AR+sD11BhsCa6qXEhVkXv+aLhIWdUBvM/T9T4amtV8cidpuIbqdGIbgZepj35VRZPB9
	hG51XMZapFU/UrzVkZGkRTArQgy+Ct8Z8p5K9Vj3CGeHPhI11Rxc3YyVFhB3ypSnxD/EV09gNzn
	xZQGQYePsDQVKFRbH4b7tTW9EjNzbtOwKpq5UchVK7s8C6yM7ssZEPMgW1SVtFtx6zT99KTDVle
	OdoUamdtrRQgK2BLS95PPRA1Cz/gK4KqevihojLU4rDRiSZHlMh6hQd7D8D0LQXIMuQGh4mzle1
	vPp5F9/IjDPYmy67CrVVgq6uRYkkaphoR6C3pSitlobpPb43npSdn8BZfEuEq8Sbqj8waHTKa2k
	3xjG/wn7ahEV9zLmfwBmb4P3B1Q4XEsivSKeGoCQiEpp+NIp9Cgy8lpX7abZDq6ie4BFACkYriD
	NPQRzlP5hUCKdEmEhlJ4HE/5zKn8edjJRJAOeNE6iHdAy4tA9+0/oLloIB0Qg2Q+OP+Q==
X-Received: by 2002:a05:6a20:6f02:b0:3c4:511e:26ab with SMTP id adf61e73a8af0-3cb85ded984mr9538978637.3.1785938210963;
        Wed, 05 Aug 2026 06:56:50 -0700 (PDT)
Received: from ahmi-PC.. ([2401:4900:88f5:5e4b:e580:68e3:78da:9f5d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673be4dsm22066935eec.16.2026.08.05.06.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:56:50 -0700 (PDT)
From: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: michael.riesch@collabora.com,
	jacopo.mondi@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Narasimharao Vadlamudi <ahmisaranrao@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] media: i2c: imx415: Release runtime PM reference on VBLANK error
Date: Wed,  5 Aug 2026 19:26:35 +0530
Message-ID: <20260805135635.56556-2-ahmisaranrao@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805135635.56556-1-ahmisaranrao@gmail.com>
References: <20260805135635.56556-1-ahmisaranrao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VBLANK path returned immediately when programming VMAX failed after
pm_runtime_get_if_in_use() had taken a runtime PM reference. Break out of
the switch instead so the common pm_runtime_put() path is used.

Fixes: 3bcae55ab96a ("media: i2c: imx415: Add read/write control of VBLANK")
Cc: stable@vger.kernel.org
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
---
 drivers/media/i2c/imx415.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index f5cd79da512c..c3b22b238ea0 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -720,7 +720,7 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_write(sensor->regmap, IMX415_VMAX,
 				format->height + ctrl->val, NULL);
 		if (ret)
-			return ret;
+			break;
 		/*
 		 * Exposure is set based on VMAX which has just changed, so
 		 * program exposure register as well
-- 
2.43.0

