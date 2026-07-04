Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21C23A6417
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 11:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783166050; cv=none; b=nx0s2X8ndikbZY7+jbfMFgBx/Y8+wPIz3t3rOmHzkBA02u7EHGihDMto05dWflLTmV288xBdnyU1IB7UD8kSq4rBV/Dybs99zPuYEPpZhYIcU19Pbt+5V92C3diNXTO1tBEccYYjOGKU9iY8aoJcyP4Qvf0XTX0BzFRvAAQcNE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783166050; c=relaxed/simple;
	bh=SCFwqaPyAOd7AtOZQfQy4tSUqGdfqIp1+191PLyGxsg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PSAQgigPmzKr1WFb9wkMvWNJe74biJtJ9/zRP4AzF4IaOim9BOf/TZtMhsA6fJZIkLG0dAY86Cpz+3hkX+t7z15k9lHKUY3wFLRRiBeXB0z9Su3m/4qdw+LniXreFS/tZGHGEWT5LlYmLisycRofDd1y2tHuMiqKfrEDAw8V0gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5n9IMU2; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5n9IMU2"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c88cc025f54so896378a12.1
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 04:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783166048; x=1783770848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MRDokiXswTCZjdnL5U+GA5MEZ4vFkd9wPUEaXRriHlg=;
        b=j5n9IMU2RejrubfrEhqImsGH29O3AbX3DaVXTqPG41Mxf26lJCjJvG2JFkxltyEHEG
         l1Luv1kPcqaHLPjxk5t5AWFjR0bHniNNJ1auXjXjSfif8OoJfK0ePqFQgsBx7VeeuHVm
         AGQHMq3NYL5Lkobo0tnNakQ/0dMRt1ix43ltDGGtJbloVsJTdhb1WjAsNiJ5osboFg9Z
         FsSCjtrAkYjN5IoT+wqvXC/ZZbQl9lmPPc7ioU+4Gnh9cMwsuybzJjg4BJQvOBh+T47j
         +pi0oWoWDl5lAOuLW0K6YFaSopmtQUix2LXiJfO62LXwCA5YGIk+vP4K0pypHW24XIT3
         T6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783166048; x=1783770848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRDokiXswTCZjdnL5U+GA5MEZ4vFkd9wPUEaXRriHlg=;
        b=WxrfmkSFOAR3NQn8MfawbXPUy5Fr0it6auJ6cMtxjC1k7CDVTV0oag2v37X5yXpIsu
         lXTkDWxgu6pNa9sOZn/RugGJQCULfGPDsKJXOfFLHXW8lfKP69dkKSzOU01CzRFFAcYY
         FNdQoksfFNoru53q4R28YY/cosBBT+UahhK0kTt9b6o5KawiamCTyDl3tHbz1eZpDj9E
         ljZI2/j0M1v52/nZzkvZlzyh6eTX7jFmeXkYyLNpt6vSYCMX0iAHNYKiMQqztsNdxE8K
         B7IhfDl9BZTNGtHO8thQhW/RU4hn00I6WorAAdRqRfh11iGQkOVPb0Red44qFbfS1Crf
         PDwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yLI7602AR7FeYNNRtSyUDJI4bGMxyvfkzTIx/XV+NO6+wsEGC1oe1a1VrO7E2ojXvjOEQfuCy0vOJ1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/5TSyB4XwTqcJC2Fy44w/dcL0qONKj1dSbLD5mbNh06NfqCFQ
	h0T7tNonOUxnQg+IhVpImk264/XSh4RrLuIDkL2Aj2Gp1eyOS9L7j40v
X-Gm-Gg: AfdE7cmd1Q3HLeWgCiJhs1lnRFFoxXYDuTMJQ6fC4HqvDwbpnv3KZ80Fqh+QAwA0P3U
	y/SO5QLL5teRN8BOS+7+tJEgbUWVDw2MtN0mHhsnGKmEUY/unEQIVKBYThPUeia/sYZI3ZYtOlP
	aTD0+XL+uf6A0+1M9PXvZZps+EAADU0uAZO0iad6xp+5mWahtrkGG3expGHsnSF/KyOdzHprmpf
	a7FiNxHb99/Mco4Ub6dQnTcNTp0OITcFXisANksFUk/vHHY36u872JOK6XLAI7eD+zvBoDX1sk4
	pvTtYwdDh1jcTzPjNOPhBr4C/H5j/NyM7v0r44wMVbk62NbRZrB19E5pG04+gLXr7PDBl3O8rTp
	rEi50CFYR+vnbtybMnduRxD0GNxd8G2S5S0FfSstAj8CCNve/ehmEkCG1Ye5zcqGvDuCpULx3wW
	FtDj+xr1w0cnME1WuSWfFSIrP/329nwA9ORAGTKBpdhyuEzDFXb4cfXbQKetZGiFXahtu2aPRLE
	iC1Mi8aNeME+6kNkiYI1/B7A6q1CQ==
X-Received: by 2002:a05:6a20:d52c:b0:3b4:b2d7:c146 with SMTP id adf61e73a8af0-3c03e299402mr3518959637.21.1783166047950;
        Sat, 04 Jul 2026 04:54:07 -0700 (PDT)
Received: from dileep-HP-Pavilion-Laptop-15-eg2xxx.. ([2405:201:5c1b:700e:13c2:fa08:9a8e:9e32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f4453996csm6864322eec.17.2026.07.04.04.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 04:54:07 -0700 (PDT)
From: Dileep Sankhla <dileepsankhla.ds@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	abdelrahmanfekry375@gmail.com,
	error27@gmail.com,
	dileepsankhla.ds@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: media: atomisp: Remove unnecessary else after return
Date: Sat,  4 Jul 2026 17:31:13 +0530
Message-ID: <20260704120113.201099-1-dileepsankhla.ds@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary else clause after return statement as the else branch
is not needed when the if branch always returns.

Signed-off-by: Dileep Sankhla <dileepsankhla.ds@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index f998b57f90c4..6ff77e053d5d 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -235,9 +235,8 @@ static int load_and_flush(ia_css_ptr virt, void *data, unsigned int bytes)
 		vptr = hmm_bo_vmap(bo, true);
 		if (!vptr)
 			return load_and_flush_by_kmap(virt, data, bytes);
-		else
-			vptr = vptr + (virt - bo->start);
 
+		vptr = vptr + (virt - bo->start);
 		memcpy(data, vptr, bytes);
 		clflush_cache_range(vptr, bytes);
 		hmm_bo_vunmap(bo);
-- 
2.43.0

