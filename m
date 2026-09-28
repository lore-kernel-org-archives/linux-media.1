Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969574EB875
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 16:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614252; cv=none; b=kMBDVtEZzMDp3zlo5IOiaKtskDee4Mu4p+dBuIA1tjepbrkvO486x/M5/TB2AjwTc0VqDYd6rvarNiajE+Vb19vqgxP8juSs6sM0I45aftYQaWN9TnV+WadVgU85JB6MA1rWdRSQVtpfbWBJcmBKBiExRrT5eWb+SfyBMhtDrQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614252; c=relaxed/simple;
	bh=vn8yjXaDcpQywxawcEFzJ56V6mC0wurawB33i7t3Nog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OPT4nPApObzLj1HU3yTZ9meS+oSk5ZTl1KCRp/aTPz6xuvOoBoobWAwNsqrD1hzGXPPkPf9hzMs8QXhqN0C268z9gkRHtV0hHuZUFYTzbTf+t3EOT64YLXXK8MNaX2nKPVjicdCKKgN25j7dTF/vF5BqN6T5tpC+QyIYtDdhzHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQSwL0hS; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQSwL0hS"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso35209145e9.1
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 09:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790614249; x=1791219049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EExoRMAiKw6UlbvLPHuAhjKP2otqvzD0C3mA+918bEo=;
        b=jQSwL0hS2EcHV1LgRxw4jMItzteEvFuuQgsHdFAzOBjVhJg2dcbGBPet8YRzXTo3x6
         HE6FZFo+1Ruhjsvq3rWb52INtVkwV9/aZ00SJw5SJoTmO8slO4K4AqAH+w09URstew49
         KOMQ1yl8V8xbvkFCwgzzCyw6eEAOqu6V7LHRl9zdt4VPWdsdSS5xDaM5SYiLb7va4gYS
         1Mva5JQAcE7w/2LEwKEh9AEEVaAnYpJ1ZbCM5Na5FTf8tTudJyZU733WU/gReld1N78A
         I5u+G6jMNgyEC5At1mLlNdaL4/wl+4/ovybx5JPzJlhUKrllGe1iZIC45lskc4bwOzYU
         lcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790614249; x=1791219049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EExoRMAiKw6UlbvLPHuAhjKP2otqvzD0C3mA+918bEo=;
        b=dZluKP2b9Q1DpIt23/EHJebcRb6HpYWk+ptrqkZGLTvipsb/V3Gzxbid0c2KD8Qmjb
         rKWuwFzlbyxHXdmFwutaFVwawp8SjoYjcVpjAqP38hC6HGwLxdDLMKnFHtgyDS7360G+
         8fov4IGkGHPBLOZS//X+ojMiTgS2odnNuvvKdcryBU58Ms3CmvDBcHETWfacmCg33C5F
         QJzhJxA4rH86MLRdVY7/KrLB9osL39LuH1iRBwSD9VCtKQhFotkOwAN95QoDrbZFUCML
         +QEu/Ej2kJWyWeLv8Ni8upwe4c6ErXXXjvDep1aueA0yW3KLSxGCV/CPTfXB9KoTTjxI
         FhvQ==
X-Forwarded-Encrypted: i=1; AKwUvByuyu4nfpNlSywYLTy4sskKNxJQdoZZ3Gwkz8mBabEQ3qeeKNu4ThQRPLY8Jd14JsVzlLZo5GQLnDybGA==@vger.kernel.org
X-Gm-Message-State: AFuF++mfIvN2hotK3NesllUP9k+5V8OKPLVn9A54NhGUt0DAeKmzD5OD
	dtF1MYQ4fAomCe11a2CUDP9skOxC2AxKYh0EOvw5iM5i9JZGV+PPIK/t
X-Gm-Gg: AYBFou0G+k1sWvIQtdgaShPMf/0/p3Hzo+ibnxZZ+98Ov+gIgGVK08w84gtMWjP2Obw
	anPTQIY/7kfK5UgdlFbAGGgylEa6TeUs7TWklDBbV8lcxyXjqX6X+wyCJ0zk0ilrLogHvgetlVM
	OyYgtNmj+/zFmCQXoffUeJinczKcgmZb6LnuSAO3ai4a54mqHMRyU+GqhiHac91p+KeTw03uMGD
	tlOe2xdxkQ5L8GgXIbp+JPiS6lLKXKCtT7pF9xBL8xjgu5tBfuG5IhL/gZstIfaRqyKjAbaxKRv
	1aY0xvbrWKUcfx/JfqC9mnfPvpcGk4bYAD3aySJ0IUg/TtuAm2P3++TG3eHPZ5VwBS3YRSHEnJI
	z2INmQq1ewOuppNP2xZ69le15iPFxTlvnOQmNg8Ri89FjYVIoZEU9rkmpwkmilodYTDcR5LT/tx
	dldCJJExBzSRquDF26bFjFdFD+PsEgXEK7GDjoOwTb7GNcRWmbS42p//MVWt8Qi42tIXXn1oJ/U
	xF/Gv0P
X-Received: by 2002:a05:600c:530e:b0:49f:bc28:e8bc with SMTP id 5b1f17b1804b1-49fe7bab945mr244219495e9.17.1790614248631;
        Mon, 28 Sep 2026 09:50:48 -0700 (PDT)
Received: from localhost.localdomain ([62.56.221.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm27538220f8f.35.2026.09.28.09.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:50:48 -0700 (PDT)
From: Michael Freidkin <freidkin@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: meson: vdec: size capture planes from the aligned canvas
Date: Mon, 28 Sep 2026 19:50:45 +0300
Message-ID: <20260928165045.642354-1-freidkin@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The decoder writes a whole canvas of ALIGN(width, 32) x ALIGN(height, 32)
(amvdec_set_canvases()) and reports bytesperline = ALIGN(width, 32), but
get_output_size() derives sizeimage from the raw width x height.

When the width is not a multiple of 32 the planes are too small for the
advertised stride: for 720x360 NV12M the luma plane is 262144 bytes while
736 * 360 = 264960 are needed (282624 for the canvas the firmware fills).
The decoder writes past the buffer, and importing the capture dma-buf
into DRM fails: drmModeAddFB2() returns -EINVAL, so e.g. Kodi plays the
sound over a black screen. 1280x720 and 1920x1080 are not affected.

Size the planes from the aligned canvas the hardware actually uses.

Tested on an S905X (GXL p212) board with LibreELEC 12 (6.16.0-rc3):
720x360 and 1920x1080 H.264 play through V4L2 m2m + DRM PRIME with no
AddFB2 errors.

Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Michael Freidkin <freidkin@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -34,7 +34,7 @@
 
 static u32 get_output_size(u32 width, u32 height)
 {
-	return ALIGN(width * height, SZ_64K);
+	return ALIGN(ALIGN(width, 32) * ALIGN(height, 32), SZ_64K);
 }
 
 u32 amvdec_get_output_size(struct amvdec_session *sess)
--
