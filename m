Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF8427AC45
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 18:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774810168; cv=none; b=HlYvdb8nZO59v/UI+60wgGR2rVk1OEfXQTiXCEsmvyxMC66WkiP5KnBgHW9Njpy5MroSkWQ11rRVEJlBfD+rrsFicEQar0Bg2CLaOKFtoUUt5gLqUYoohnsOdiOWAx5npRwDZswjj7GOlZfrEmd63DpzT2NlcVO19SquU+UGiC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774810168; c=relaxed/simple;
	bh=gmQ8qib91/MURsT4umIJTHqgTjd7DNDJ0EiCZzRTbu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RTD+Be3B6HleNyxlsjOr22vw4NBUbibfEGYhxMYGy1XTTZ6jDHwDuZsFuBSJiaWceKRTVQrnP9JfH4e0euFjPrU1qQFuP52jdS9LzUfHgV+u16wbGqNAadlRpUsmrc4I1UtIgOQv4p/SX9Y+zFTPyp3dqhgeKnzBGHVaYZW0OfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYWC3WMQ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYWC3WMQ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43ccda008cdso858716f8f.0
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 11:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774810163; x=1775414963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gnd3vtjEEK1Ylf3QTK0JvWS8DR77h7l5RXxPFxFA2GI=;
        b=ZYWC3WMQCBQzoEMK2TVzuxlpSZBUZoucvyPHIYqmXk1QSAZNbLTFN5liZmjSZAyghk
         SozHe0xTaV/aMrSskwnTZciN1PZONbF3Y8KuY4zr+n88wALtYlmbRcLJpqXwmjlMi7LJ
         a+z+HBj/vFu10/ixY+nqxcBt2lTaoo3oNzgRy5Onmkx1LdyK+eTK3pE5OaQX95fuoADF
         jno7bFsaBaGlgxiByaKVwD7H8i0cTPuPNGAXMKIMQ99tSklVnLHzYJK6cBT/tqy7EIa5
         X0hNp6mnDFmAbd14xaIitQ2a2z78l7eCdKkKgYx7+7sfTgdAiUggLvwSfFWDnKlS73Ev
         9t/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774810163; x=1775414963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gnd3vtjEEK1Ylf3QTK0JvWS8DR77h7l5RXxPFxFA2GI=;
        b=VLWcN5/VzjLkDP+6NJcrsl30IxujUSdECAbxLsJbRbm0p0iEf2hkzyEo8lFGWIEBHI
         qnINGyUDG6tXYyubFxizRXCg7NutEp40jo8MUk5c4aeitwb6NBuF2izdgBayecROgOSK
         MU2gcGqfPFiQ5Wg0UzgwkDRhrFPoJMY5fcGmUO4ev83HW+72uiMa767IKmWClCf5GUe+
         /sN6bsIyt3+GXwvfaIrKD4Be5k3IfVnGhCfozPCYyaumjVfDCHqp50IkC+O8EXXJc9ox
         YNl9rjps4/hqN+jKhgS4X7akRyPaen9SeHxeNJQ/nfFVYiQD8bF3WSU68jSHnnvvZ8DQ
         PNSA==
X-Forwarded-Encrypted: i=1; AJvYcCVSteK1i838Rb6j7Bacd8NT1XntVRfQ9acHKAfR3RwjE1DX14hxFZ61JXEz2Fv2kbzrpDLJcriH9MOl9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRnWFGm5ZiuG/kNY+1UyBmsSZPj0qBzrVikU7lQNFwGJSCgYZO
	L9pTPt4Yi2p4woKI3RwJh2IBkWGgmYAUyRqOWx15GS3IqzSfRsTjRXT4
X-Gm-Gg: ATEYQzzCVUmsPLpiJ5bMRjcH/NsC96zDQQxOq5Z6eL1YqVymv/m5TGYu/deF54pbsZj
	fVvJIPhnc90BXpdfSzg2vo+DR6MqmIgel4kgFZMCvpPfpEf1i8RV3xFV830v1qY5CYeLfpw6n8G
	hFo4vt8QRR+eoJyytRC2EuGccoSpJ52qoK2UPOwA78Z9aobnG3REFZY+L5BqxFFaPApnAPOySDi
	wxqqHUs/wx4RxdU5hErDdtiKna60KhGHA+DHcuziEHiplf2mdDvYcuvSOFY1CgdrgnptWhmv9YL
	V7yMM6M+qS6U8wnLNWWjLN0BGclAhqiBBv+UWEXl4F6yV1r1kCfhmPW2Vwj4KYaGJKdLbeEZs5b
	NFFztmQqT+Sjn9GVQJw1h47mQa43u17SBIcyrqrnEImZc+A9CRUmq167Jb9gPQHoWUNL1MM7bTH
	Hx4x8QO8dgnSSbvihNefQQdX4uDWRUnW5MVoJ6w8Y8g5ipGzeTcVU=
X-Received: by 2002:a05:6000:1787:b0:43c:f737:a3f4 with SMTP id ffacd0b85a97d-43cf737ab66mr6694222f8f.30.1774810162932;
        Sun, 29 Mar 2026 11:49:22 -0700 (PDT)
Received: from DESKTOP-IHE0QGF.localdomain ([86.121.12.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21eba4dsm14058443f8f.11.2026.03.29.11.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 11:49:22 -0700 (PDT)
From: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	daniel.baluta@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Subject: [PATCH v3 2/4] staging: media: atomisp: fix typo 
Date: Sun, 29 Mar 2026 21:48:08 +0300
Message-ID: <20260329184810.455285-3-robyserbanpascu06@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329184810.455285-1-robyserbanpascu06@gmail.com>
References: <20260329184810.455285-1-robyserbanpascu06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a spelling error in a comment: 
'uninteruptible' -> 'uninterruptible'.

Signed-off-by: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
---
 drivers/staging/media/atomisp/pci/system_global.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index c99fb649fb5f..6420436d88f7 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -28,7 +28,7 @@
 #define DMA_DDR_TO_HMEM_WORKAROUND
 
 /*
- * The longest allowed (uninteruptible) bus transfer, does not
+ * The longest allowed (uninterruptible) bus transfer, does not
  * take stalling into account
  */
 #define HIVE_ISP_MAX_BURST_LENGTH	1024
-- 
2.43.0

