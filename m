Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271041;
	b=zWLkUZTRA5n3FTrzNTL9A7ZpVOaFgGZ3qxAZ2zKFBjgSYsWnKfaPsyqlJOseKSiU9OhB
	 iCipXOIaopuqb9mMZ4ADxBkKmhNF81423/vv+ZUFBjeGmhYEyySju5WvTtvnmu7NnvXzg
	 obKrRjqO8LyHyEJJCHcJyFudhubtIv2Ehg1Md+ZgdtBUoa1UA4eyDzcDGUxsPpc9Y/KxP
	 hdWtmeFT8P4IqIxXOZnLewEjvS3j9/n/XfQ+xzwOEvzmdaJZKzThpZ5cERzYnJ/CWSFuo
	 /BLCP/1ZeVQ1oLf9ptoOXbnZ/vXpx5dXX2GOe7Yfy5P6jWcIUD/GpZvjoXXY0Yd2o4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CW8IOaqeYsrZkoZGxqPTohwddEkpCD1uTeoSdK9Umo0=;
	b=LMMR+0gh0nf7ZxCg7NWjsBZV1R1AUBYknDcTEyo6sjkocjBY6+kuwiV8fyXxT9X1yfWU
	 4ZCgagFM317ay3+fDVFoWIaIWpZ16T4U0wk2zMHXMuPmb8eEHHN3M3pP2iudTaVcpu/1Q
	 tiXPymG+UWsV+Y76sFSx6cW/tu57xy5sjcxgwW5bowF2I6Z+K9HWxwcRPStNLwMMPTZiR
	 c6/m3G4Fuq4u8sNugHGzAY2LYIWrzYUC1C5t5ZCtmjtYn6Vdm6fwWm8GqqYsl5ZWgKDxo
	 uLFFXYyS0/+u4SHOriFD2NuAVMIM7yYID0dE0Q/B2R1j+7NN3R5J6V9jketkUITJmmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A3lMYVWq;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064CA606A31D
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 10:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 064CA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A3lMYVWq
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20be3b39eso1926085e9.1
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 03:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271039; x=1793875839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CW8IOaqeYsrZkoZGxqPTohwddEkpCD1uTeoSdK9Umo0=;
        b=A3lMYVWq+snDOnoFwdDh/YWCR8zVuCY1F052BH+meVOosbnLb3orLSR6J1RHndVGIu
         UsuL0F6ka2Z8pCXjgWqoZxYkGgOo+JwpfxpyDEnTID/q3EODEBYiB2Log65XDZclsJ0k
         YLl/BxJqKs32X0uCD2HCP9DrUBGFbVm8P5vIrj48hmD3qcT4xldQTpOHfOYic33YEPUz
         6wBlW73uTWczHRZZMRARsFY2FxmPhig4hfT8xLH5pxgmiIruDAsi0bTYP+vVQ1MHbezv
         qgtIrTPbhym5bQcUlfzKOreht+QsEH6a2va/X3mMX+unmvATxcSPQWfrS6Vr9UZZ91Pp
         b+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271039; x=1793875839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CW8IOaqeYsrZkoZGxqPTohwddEkpCD1uTeoSdK9Umo0=;
        b=yDGFkY/aKUJtvOpzu4+XBigdm4nkOwEQzCmZ4tZAalOkeAnQX/eEfl+rteqR60Wqvj
         KAoxwwJerzPkl2BWxc84GVKplXMdIZAALzuvV8IRDVSZvfXUe4OiRkvIbRCEIgcOwlod
         BBMAjdlk3yuv7SB/Gb7MGxq+Nt+yvPeQI2HGWbowv7TdNHpnWKUhSIQVMSJMo9ncml1T
         2AYUgiwC+yoFeCMIFMGWAtdyU+PQtL1Y24159eunUAFe6xRkwm9kZIaJw+wUMbbwTgTl
         mnnoTYDhUk2ue3F8Zk6sJN14M+mP3dJUZwkiXa8Sqb3Db34D2RBDuPR0rmTeTEjV644k
         EnbA==
X-Forwarded-Encrypted: i=1; AKwUvByWsKFhBY4lVEerDs7t6Ll1T6HEsIFgurByCHPV55F+D58WpIJl8NoIviC4fndH5HFhdKP8pYeOTYiZ3w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJGY1OrrMelSPf0LrfPlmCVpyu2pPAZwjAa9AiDcR/u7wVzkykc
	X36zgAIDSa6rl83NOW67WrwsZa5VKKcTlJW3CZHwVCylp01+MoP9r/6V
X-Gm-Gg: AYBFou3PwRCEWkEw5bHNgZPBQ+UyzOM1SicdYrZylBSP1BQk7PqBMF39WI5l6W1qSBw
	tBpTW+RivKjmr1lbHnXYxkApqMo3fvgr+xMESK3YHZEj/+p5pNVCjCrNvAQiMxVG34VPC4GtMzu
	NZvvmy4s13BhokM0vYLy99Ure2VGx/UcxVCI2XTGcwwUahQNIQMZH4hiqJljp9SH1HKiDWkN8dP
	0ucSksKMO9FYFmVV4X+GBT+TLi60hb9rLczj88LTspvHCKm5lGgAlrjxv+UR6TNfrJHOVGfHQOr
	UFf/ePFoHMPATxazhQizzarWU6kXiE9hLhapcRDoRr3uaTJx52BZdZnuiDZ+tjTvA8XNAviuSt1
	FYk4OOqWwI0t+qBKvw2lVcCwPGGLEwJhsotbYoc5bqro2U4gKb/7dTqmaErg1nULoz7hCocxoPg
	gbIcv2D5gC/o6GQHWNES6dEdJd6AaOBtIupjt7EBrF4qMkdgmSP0f7thYzuGl4R5NXZLiokDVAU
	zu1F8+074FvA3kEtgTFkzILnSvCzO9rFjSjYmvJXPdCbAxUlgp2ipDKLHtjyPVGACcg+MA15Ey+
	JvJzVo7jlTnzNHlrYcjB3D/fCp0AZ0aegtvzd91JaCVbSkONW3cKGeif0m8uQOYSHDRz/WA=
X-Received: by 2002:a05:600c:4286:b0:4a2:6ef:d1dc with SMTP id 5b1f17b1804b1-4a965cdc67bmr72534585e9.1.1793271039058;
        Thu, 29 Oct 2026 03:50:39 -0700 (PDT)
Received: from thomas-precision3591 ([2a04:cec0:10c7:3c2b:8fd:45b7:b1ca:5901])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f50d3sm84444945e9.8.2026.10.29.03.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:50:38 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Javier Martin <javier.martin@vista-silicon.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-media@vger.kernel.org (open list:CODA V4L2 MEM2MEM DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] media: coda: clear m2m_dev after releasing it in coda_fw_callback()
Date: Thu, 29 Oct 2026 11:48:09 +0100
Message-ID: <20261029104812.26411-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In coda_fw_callback(), if v4l2_m2m_init() or coda_register_device() fail,
v4l2_m2m_release() is called but dev->m2m_dev remains set.
v4l2_m2m_release() is also called in coda_remove(). This would lead to
a double free of dev->m2m_dev.

Clear dev->m2m_dev on error paths.

Fixes: 186b250a0725 ("[media] media: coda: Add driver for Coda video codec")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/media/platform/chips-media/coda/coda-common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index be37ea568bfe..b1a656054b89 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -3023,6 +3023,7 @@ static void coda_fw_callback(const struct firmware *fw, void *context)
 	dev->m2m_dev = v4l2_m2m_init(&coda_m2m_ops);
 	if (IS_ERR(dev->m2m_dev)) {
 		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem device\n");
+		dev->m2m_dev = NULL;
 		goto put_pm;
 	}
 
@@ -3043,6 +3044,7 @@ static void coda_fw_callback(const struct firmware *fw, void *context)
 	while (--i >= 0)
 		video_unregister_device(&dev->vfd[i]);
 	v4l2_m2m_release(dev->m2m_dev);
+	dev->m2m_dev = NULL;
 put_pm:
 	pm_runtime_put_sync(dev->dev);
 }
-- 
2.53.0

