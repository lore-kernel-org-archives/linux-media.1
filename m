Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC841499F2B
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 08:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940973; cv=none; b=fLb3mvxjflBytzCUA1bXR8pjCirGI9D0RCfvXhfHt+W5j+gRgAJ6kzAqV3ld3sKq95KO4oYt0YRYg5G1uf1M174JEnI4QDQbLVWElVE807GQosUy/VQW2t2M8xPpyu26+i8DLSnQFREV76UEaydyAvR7r3gdKRxZdQDM5ubqy8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940973; c=relaxed/simple;
	bh=fNedMvATv88XUN2yXNzYAwN7WlHGUXWXzn+KTQ0e33M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQUsXiPVRA7RYAOYDbIpKy9o8v7Ufy20HfN2TTbphbrWmmvPP1cMcf6eNR6/kJPY34FhmgZPMn4Hsi3U8444CdSWNGFJ7Xlu1gbCndz74bS47OG3fLVSkl1C/DDQoZgdHW4JMF7eLCUBpCC6UApoWIbP6hpiRrRi5hcJ+rJBtvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DI1t4fNk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DI1t4fNk"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso59896625e9.3
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 01:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788940970; x=1789545770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KhCyelSoPVv7zgNsnvURqCzMuI51nbjIqRvKAAsNNuQ=;
        b=DI1t4fNk4Y3mtXLg07dg9ja0BMfoSBpUcA2qqgwkfIfO7LiH0Os+Wac3FSXt8vCYgd
         ECT6GEKItbLTkgtzuU5Csoicdsn3B78TVvz6CL4g5vgtRduunu65WTTnfCuHEbo1Iw34
         OyQQJHJOhXxI0si8uty2G+FY9aDIw0N3sHWPI05+EQ9nFBTWKAejtGMmO9hebyHfJMAx
         JyGM7jB/JwInw28tA02IbRxArNsk8Dw1otT5ttR/lNqmTLZGieeqDsD0d3KnCfbyJxAZ
         sDswJDLmsW/sjx7bSYKgYRbENd4BlD+eUyI48+xTtxXBQgl4XO3hsNTWTuFeWZZzUCB8
         TQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940970; x=1789545770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KhCyelSoPVv7zgNsnvURqCzMuI51nbjIqRvKAAsNNuQ=;
        b=ZEsUsC2WchAGAJ2/+/18AfYYEjJG2VFpf46SdSnPkZxk4g3iO7fPaV3LaBjujF6n3c
         0UoQyjRCVn+fyrEf+bWemyg2VbzBAdVCPrBC9GsYfpIznXd4PKszVmPpoQJCZWgFVzyJ
         K51PMMwMxPb38nrACuDrJ8TYCII6J9p/iuQlwdKJSLY394PUs2OVysXYQOXZY0S/FXbq
         4YNxaaamZvaM5PyUiqNDwtSiJ6PDnGpaYqEPniDr/IRdUEatEE+wLn3Lm3k5Lbi2CUUk
         HPZ6BRthqBxYUtFth1jKNu2M8a8ct85ZR5AX5wxsMJlNryoU72g//19vn5Jsy/u5zFSi
         +IKQ==
X-Gm-Message-State: AFuF++mCu5zX9ug4aDU39/PpHEf6S3fwJP5fAPsna60NF6cSOKcdy/Dx
	jhwuDBX/6DuiIi2trWCyK1CywT0Ym7U0PVDCvwB1TQd8FQCc+3n2knJa
X-Gm-Gg: AYBFou2VSMdZyHabARvj35yIMzl+lq09dSWaVuera1Q1W81NE8rVf8R1SFnarFMbMMv
	EeoN1w4KnK2XgcIz0PCUK6Mk6ZPXr9CfQev8qu5giPOHdlHn47rrnOH82crBv/DoqDWO7NtF2qB
	XRpyd5871H4Ef/UPvCQ5/LP+VCoBKHWG1k2AuqwZhI7yOyXJEZuYWIw9JyLzZQqgoUC8jeBO7YP
	QtVr+lTB9F+XxYt3ViiXrl1nHZvd6nLb2zS4nmMJ2gujU7AC9hWFdHjuqwleYLCdywDgOMw2oxf
	UG5f37dEkppxhwUdVaUHEfFvS7a/ITi176VtVVUgcQ0eXUvCeJNWkpZ7IkUqUvPFBFBW3AUu26R
	l69QmFIaVZ12TX9dS2OZyuAcubhYdyg9wG4kU0YXUAr2ASbtp88gfHZwGKcU7Npy2KfPwF8RPpP
	hj3PCZcvDlZ5B6D3awywSoPrgYRTtJuMDpKwUp7/b3+wEXwAnlOW29qx9oSC2o+vVpi7DG2DFJd
	i/rMVcurCb0nSBqzsygqD97u3V9jmZOOjCk2f4emQ==
X-Received: by 2002:a05:600c:4e94:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49cf81e368emr586908475e9.6.1788940969610;
        Wed, 09 Sep 2026 01:02:49 -0700 (PDT)
Received: from chubuchnyi-ThinkPad-P1-Gen-4i.lan ([158.173.155.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm412817125e9.3.2026.09.09.01.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:02:49 -0700 (PDT)
From: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	mani@kernel.org,
	michael.riesch@collabora.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 3/5] media: i2c: mt9m114: Add missing v4l2_subdev_cleanup() calls
Date: Wed,  9 Sep 2026 11:02:25 +0300
Message-ID: <f3340fe13dfc5c331da1444335508fbcc02e0c23.1788940469.git.chubuchnyi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788940469.git.chubuchnyi@gmail.com>
References: <cover.1788940469.git.chubuchnyi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The subdev active state allocated by v4l2_subdev_init_finalize() is leaked
on unbind, for both the pixel array and the image flow processor subdev.

Fixes: 24d756e914fc ("media: i2c: Add driver for onsemi MT9M114 camera sensor")
Cc: stable@vger.kernel.org
Signed-off-by: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
---
 drivers/media/i2c/mt9m114.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 848ea06e7..137e8e6df 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1482,6 +1482,7 @@ static int mt9m114_pa_init(struct mt9m114 *sensor)
 
 static void mt9m114_pa_cleanup(struct mt9m114 *sensor)
 {
+	v4l2_subdev_cleanup(&sensor->pa.sd);
 	v4l2_ctrl_handler_free(&sensor->pa.hdl);
 	media_entity_cleanup(&sensor->pa.sd.entity);
 }
@@ -2208,6 +2209,7 @@ static int mt9m114_ifp_init(struct mt9m114 *sensor)
 
 static void mt9m114_ifp_cleanup(struct mt9m114 *sensor)
 {
+	v4l2_subdev_cleanup(&sensor->ifp.sd);
 	v4l2_ctrl_handler_free(&sensor->ifp.hdl);
 	media_entity_cleanup(&sensor->ifp.sd.entity);
 }
-- 
2.43.0

