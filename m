Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811583502A5
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 14:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481126; cv=none; b=NT2ecJpzM1yoQqZdcLaVhFBHeBUL19MOXFNA1+a7r870y56tIPBogPDo0db/gEw7V70lShiJRXj4TGVGFvN1hrPlDiJzol5igJc3c0jQeE8NUV2CP88HelYcGJ2IszqcPHOrbZdYjUNX0egOWCdd9R3slYgi8V7CB6GYXPhVAHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481126; c=relaxed/simple;
	bh=l1MSFdroio9w5UUZCK7+2//D7579OK4nRstZyOaDeE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LpvCL0tjYN+an2/piFae6P/gZENvDsRCSwK6tsb7Cc2WJr/hYAWKiQm+ge07a1zGW8XYAQ3GiKFiVBFPyzaCkBFFMdPItG6MKndDACkKlgl3jAwbHrc53EabTtSTKFOxzcwxuGqGBthbzCNvIgk5fevAZugAkpKgpR4IjmFKyWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efANzoMp; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efANzoMp"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c3b639adbcso298779b6e.1
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 07:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789481124; x=1790085924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4/dvc0f8jIgO60uW57rTwjvHY9CDCgJCM89WrVhajN4=;
        b=efANzoMpspjN+nI7BjiTg8E5Ixhw/qAu3h8y6dh64dS3y4VzNCEv/5meX8p5YZF3DX
         AuxJWZbOSeavGPqGH6kuJnXVpmxes79+PM+9Ufz9t0cAn9/PIeG4pJmiPHb6iiJPDz8Y
         JlkdQH1er8EGAtoUKNyNyse3679/0R8FR2JX+6IMK8rn4JHZ4LPLhSwUvB2MztDa/uW5
         NmPvkDZVXazApkjhMPC9aIW7uI5xWwfrj7ydtlGJ5ZKFfVlm2+UOALBrXKIamTH7pKSU
         9i5vB0njf4YXM6NydtEZneyO7a8vYo26WLQMoF4a81cl2BBhW+1B96RQwSAkBpYxQr4g
         QEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789481124; x=1790085924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/dvc0f8jIgO60uW57rTwjvHY9CDCgJCM89WrVhajN4=;
        b=i67YeLQFkQMj9f1FGB6pb45DHMbMp/hFwHTupBnvVnbvWnVtLEzWZe32wCN1+dW5Un
         T7GM7fEsmTRCVo2bdUN6BJSm39xbmEwBCBC4Y8C4DseTgYNDMV5PzMPm9sjDbkFS0Ifd
         dwsEdTyGCRwiC0eNOB4q+u5ix9rKlCGcrtubkspaCBPHB3jxuNYJYDwIc1kZQu4lry7w
         0A229ZQopk2S3na3pw8vLYzNNGEoWyh56kpSeh+XGQ36VXU/K/Icm+Ae7iNYKmI2+XZp
         ARuFtlLBH8gGR13rQW3ftp5jYvjFeuAmw5AImhF2lNLSsoQI6XcTZbPvjXNcOwcY1J9S
         NEmA==
X-Forwarded-Encrypted: i=1; AKwUvBx1ofUQ5auxc2tNrt9mIKun1VAsCJjiU66Rx9gaJoB1Td6HsQKbrXA9CNqAm3mqJNt8bd2tNPQrMlg8rw==@vger.kernel.org
X-Gm-Message-State: AFuF++kOb5LzQWQkHVS0A9zysfXpv39EvqikE17IHcC4kgJYUMhSUsqA
	z4XoXyOtU4a4V2uuP1b2qb/mtn4xf4SRWivcRApqh73G6VQbKMto5JzPhnB/Lv9a
X-Gm-Gg: AYBFou0NqKX8cPqPfq/SYhxCFlJJFh5d4mo+Wr4BGZYTJJNyOCWx2XsrL9o1UUPYmdv
	t0kMBS076/wXoUH0M5jmv+zOkDbhDqsrl41W+GVF7yoGOVE8wajj1wffRFH6uIOeOydD1J/PqGh
	bXi77oR0dEs5pf+ESJJ/Dx0p7tvUaowtkBv+c9kRJZLs0h85hxXIHJFj+SdHELJN9wRpqtP6JNK
	fKXmg5NjVHXiCVCJC851EO3x5tinli6g9DZHkckJbjW6i4UuG04gXZFCzf4iJi4K1/4tWLSNiLN
	ySPexIrx8ZYFKAWuQs3EdnirkFENyRf1IAMdzOEoJniH1LETs11b//flZ0dsEbsYMZnZazpybt9
	yy50s7o8w6QnS1n+/V2GbRTfosd3XOyjcLweRuWvEdxiCUS0KWmo7xj3XOyE6tGhi7F5+ZdgXQ6
	b55qKyfqSC2jEH0EM8qPtW8ujTGRflnc69g7Bpy1FaIOoUdfAFAphiZQ==
X-Received: by 2002:a05:6820:8c7:b0:6b8:1306:8567 with SMTP id 006d021491bc7-6c739c76dc5mr719865eaf.57.1789481124343;
        Tue, 15 Sep 2026 07:05:24 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6036fd7sm7020010a12.0.2026.09.15.07.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 07:05:23 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: rkvdec: do not destroy borrowed SRAM pool
Date: Tue, 15 Sep 2026 22:05:11 +0800
Message-ID: <20260915140511.2429792-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rkvdec_probe() obtains a provider-owned SRAM pool with
of_gen_pool_get(), but its error path incorrectly destroys the borrowed
pool with gen_pool_destroy().

of_gen_pool_get() returns a pool managed by the SRAM provider. The pool
is not created or owned by the rkvdec driver and is destroyed by the
provider when its own managed resources are released.

Destroying it when rkvdec_v4l2_init() fails can invalidate the pool
while the provider and other consumers still reference it, and can also
result in the provider attempting to destroy it again later.

Remove the incorrect gen_pool_destroy() call from the probe failure
path.

This issue was found by manual code inspection.

Fixes: e5640dbb991c ("media: rkvdec: Add RCB and SRAM support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 061281f903f3..4541ef9ee3b9 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1857,9 +1857,6 @@ static int rkvdec_probe(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
-	if (rkvdec->sram_pool)
-		gen_pool_destroy(rkvdec->sram_pool);
-
 	return ret;
 }
 
-- 
2.43.0

