Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3B9256C61
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 00:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784764944; cv=none; b=bybxLm+wCnWsrLZMF6Ie/wOGas/VIuaG47Ei+iYVRPtFHfe5V4WJAnhCFgRCzIkxRcldYrUpqitxWqG5X4TpDfr6Y/qcf0RZrdUfmBg1WMXbE9xU+ByuSJKo6Ydrs5X6L7hQGI6eYfgRslpA3og3nwr/BbTMGZU2Lxp+SZ2AG7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784764944; c=relaxed/simple;
	bh=nDHwGQaXGMuuaGG6qOmiW0lE5wNxDly8GUn5XWwT0oY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d/1U5ORXsE1ce7/QBD122x6ZvPRv4exlfou0HaxUF4OlB8XcQaA4r0SM78KDr4zrsCQ9jVQs0PC2A5vcrfsBpx350R3vq/MxDKQvt/ZqIl657wUnYYwmA7B20/OJqCesFwXJjdhWZ9N6N37MmDl+26/2XwPulLnazH8M2crmPYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXqeDFA8; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXqeDFA8"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81dfdbd86d1so776927b3.1
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 17:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784764938; x=1785369738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aJUm3MLQsqh/2fKr3xOSeTiTlhgXutJ78HCkgaFr/+0=;
        b=BXqeDFA8Pzfq6Ao6Gg5pMiQByUb0LAsjpUj3YZ5tLmbisgz1Xvv+juvbFtUFbwhfs1
         TKvhdFdf/Qgybq/h+7IVWWWtmUJwok9uLuZQn4V46xQWL4t8xlXkTMEIIkHJNUknaxJD
         nbkov+8JY2bGM99lcoMA3SHjiFwmgZH+XpSMrGTrT9Mz2ueDQqRoCtPtlD2dEfjQCnFL
         gRYi0Rg7G53c1MtvIlkos8d7Y5rjqR6oUcNbcfpxJNPdv21z2ANjfk+HUvBCKSv0Ex+Z
         9xwaDNGTflJvjEoS2vJUfyOAmGV0OJLeKmAD4dQ0cGfHVL2P303kNduHYavY1pfsAMkg
         SMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784764938; x=1785369738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJUm3MLQsqh/2fKr3xOSeTiTlhgXutJ78HCkgaFr/+0=;
        b=kFeSHNaK5FbrWVSgJN2d1KyoSd08o5F2YX3nw73uYDzn23D5LHJF4P0YTsbuMhbj5W
         opXxm1jqHNiX202Pv9xHPLbxAN0L3puM5wrMF6j0mPcY8Yt6USjuVYJI9/PJRNR2pjdc
         yqpchI8tBn1H2XxwSlTGPVmBzmQfzGvKJWt/dmVhGD54a/jov8rxiD9WMR7QSLu2wbNk
         lrGeZIc9eLI0lQnxqbVfjP9yoRRAwu//Pbduq3moVbV0EpGRZt//dnSSsX1Pb3ml/FO0
         r1JvE0UA5wkC7gaCeDNhZ/rJDRKG+V1+EYCcx8f+lJ++Po+/h39L5jhP5dO7n0TMCvry
         3iQg==
X-Forwarded-Encrypted: i=1; AHgh+RqUys1j/02tkr4X67q1kDkS9e47GrshBCf3I7lr+/z15GOjslpFgLJnCoHwweUipn1FW5PJKa8s4LSf4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVfbhMTpQDzkN2NKquiW9h2qP8Tt171G0lYTs7S6AAi3+K2KYP
	A3QQ+I4ruVg4TZf+3FoVVHft7/DHzF/ywuCA1QFC9QSmxYGb9INnCEHh
X-Gm-Gg: AR+sD135CRpDclncvEL8q8uFWWT3c1NL7ol/egAMbQ2CZr1XvTzs/KFh2s72LmufueL
	74yoReOv/f/cZpA0QejjIOG4/9YW0lZJ3G1VtWpmgHQXtFkE1NJGDM4a/JOWSjY0H1lj44H5Tt0
	7PrMfRq4dcNmLdv9Dp+0BcplmVTkarb9+EFaadn5IJgQ2gnAw5Kog6afogWO8hJaLKjTFYE0/Nk
	yoTbPl9IEFt6/XozgxIlcAXag1Ezic4gVVwaq2FhFJtyqSNSsEbRzMbjszwag+WfAEVTvr3jRYR
	bCaTT5ljp3vkHEXzZJxRz1x+ig474ODWAUjZh0IR2/Z7I2lE80J85rz3eQm67ZUePvLsMtHltiZ
	ltJSCdt59ODe/ad/TZdmapVK1hKshp3vGjNKRqoh3VmenBZ9e9JJFo76uTaeuQZ8vmG5pl8e31p
	ZfMFv0r87ETh0xIQX4a4eQJW86dauFn3wZdyU0O8MEit9ZRvXXpMzJVWm4jQhtK01JOAZ5FMEFl
	WQtxvgjPAtWKcH+Xs6eICH8eme9H7Yw/lMeXUpqd2cSWLePvD/gtTsey/OJe7Jct8U=
X-Received: by 2002:a05:690c:6f0c:b0:80d:21d3:a399 with SMTP id 00721157ae682-81f4c307df2mr2454957b3.48.1784764938252;
        Wed, 22 Jul 2026 17:02:18 -0700 (PDT)
Received: from LAPTOP-83ECOPAB.f7a5e5c3-cab1-4810-bdbb-207cdd06de9e.globalsecureaccess.local (76-204-101-112.lightspeed.tukrga.sbcglobal.net. [76.204.101.112])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33c2df04sm21047067b3.12.2026.07.22.17.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 17:02:17 -0700 (PDT)
From: "Cen Zhang (Microsoft)" <blbllhy@gmail.com>
To: mchehab@kernel.org,
	hverkuil@kernel.org
Cc: kees@kernel.org,
	rongqianfeng@vivo.com,
	axboe@kernel.dk,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AutonomousCodeSecurity@microsoft.com,
	tgopinath@linux.microsoft.com,
	kys@microsoft.com,
	blbllhy@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] media: dvb-core: fix race between dvb_dvr_read() and  dvb_dvr_set_buffer_size()
Date: Wed, 22 Jul 2026 20:00:16 -0400
Message-ID: <20260723000016.84091-1-blbllhy@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dvb_dvr_read() accesses the DVR ring buffer without holding
dmxdev->mutex, while ioctl(DMX_SET_BUFFER_SIZE) replaces the backing
memory of the buffer under that mutex. A concurrent resize can free
the vmalloc region while the reader is still copying from it,
resulting in a use-after-free read.

  BUG: KASAN: vmalloc-out-of-bounds in _copy_to_user+0x4e/0x80

    _copy_to_user+0x4e/0x80
    dvb_ringbuffer_read_user+0x141/0x390 (dvb_ringbuffer.c:151)
    dvb_dmxdev_buffer_read.isra.0+0x310/0x3e0
    dvb_dvr_read+0xc6/0x110
    vfs_read+0x1ac/0x940

This is a re-discovery of an issue noted by the original author:
https://lore.kernel.org/all/47E45138.1030107@googlemail.com/.

Fix by protecting dvb_dvr_read() with dmxdev->mutex.

Fixes: a095be4b030c ("V4L/DVB (7659): dvb-core: Implement DMX_SET_BUFFER_SIZE for dvr")
Cc: stable@vger.kernel.org
Reported-by: AutonomousCodeSecurity@microsoft.com
Signed-off-by: Cen Zhang (Microsoft) <blbllhy@gmail.com>
---
 drivers/media/dvb-core/dmxdev.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 3c8bc75e4d6c..b4aa8d37ff03 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -270,13 +270,23 @@ static ssize_t dvb_dvr_read(struct file *file, char __user *buf, size_t count,
 {
 	struct dvb_device *dvbdev = file->private_data;
 	struct dmxdev *dmxdev = dvbdev->priv;
+	ssize_t ret;
 
-	if (dmxdev->exit)
+	if (mutex_lock_interruptible(&dmxdev->mutex))
+		return -ERESTARTSYS;
+
+	if (dmxdev->exit) {
+		mutex_unlock(&dmxdev->mutex);
 		return -ENODEV;
+	}
+
+	ret = dvb_dmxdev_buffer_read(&dmxdev->dvr_buffer,
+				     file->f_flags & O_NONBLOCK,
+				     buf, count, ppos);
 
-	return dvb_dmxdev_buffer_read(&dmxdev->dvr_buffer,
-				      file->f_flags & O_NONBLOCK,
-				      buf, count, ppos);
+	mutex_unlock(&dmxdev->mutex);
+
+	return ret;
 }
 
 static int dvb_dvr_set_buffer_size(struct dmxdev *dmxdev,
-- 
2.53.0

