Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F934E73B5
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 12:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734038; cv=none; b=gPZJoIKXOCakDiWX9kTmSCFa+hSQ8uAkD4G8UWpSu75ICvVQKVR4z3LizUjspbgR0S3t9Dl9Z9uh0PvFJXVCoWHJFgqRH4VMv0if0+X41wiSEl9KahSDVBxz6VmyEAHaOS7u6GN2gnDLcc3N3pDSjGVP/UIbB1/4wfX4SMvevEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734038; c=relaxed/simple;
	bh=Uvo7ny/vdoSMMXn3s6ScqNW2b/mk6SSiroCPEQIUC8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WYQUWOmhwGaMi3vlGTcfCqFmqZPe8eecSlIRTc5KqEKzSyt4GfbwGhhRxvZOULEU/7aIcNqXsEP3CZEldvvZEmE2UL12PBIXlz3cLp3QyZq2P49ct2CD/XTdifd/H5QUfxYHGf/KbSoeLKGRY/lfBLpTvhlHhXEmOuqkxQT8hwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ks+SVIe9; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ks+SVIe9"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c5so512122f8f.2
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 05:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789734029; x=1790338829; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xCzi81HLZxZMux1T+BtO3glGJsw6KpWZnk7OAVt0O+0=;
        b=Ks+SVIe9tnfOV2ncbsKrA6nj0VFDPYVdHkg/5+1KcZPrDnaWium7iaIWqib7R5AcEw
         vyqSHpEtj6WlkmWsagOI8TooZDNXAR7tXpUnkzawoo/C7X09HRHvJd1novQ/WelpEUgd
         DQqA/TJwbgZrnzBoEr/3JEsiGjtqwNyns/9lMl0THXYu1qu6oMotHOUEAacMBlDeskzP
         Bg8aP5iAiK4fgczpuAAckjXGTv+NDUbLUymW+L96zKa73DS3wFhjlCdRT+8eUdrHi7ma
         AorIoVEA6qbYLWgT3kzD0fC6+W10L8dZw7hWzJa4k67x+EoyTL53/vDeUa67Px/AeiON
         5HsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734029; x=1790338829;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCzi81HLZxZMux1T+BtO3glGJsw6KpWZnk7OAVt0O+0=;
        b=zlDzS9Cyd9HpJqsR9WaYy9G+iV0mLzHFAohfU95JrRwRfDd+TW6UwUiDAZ7ttD/ewh
         XlmfwPo1x8IBy+YFJ2Y3caIEGd+XxkJQgMg2yVqx0mGb++h4yUNYjvWylGjFpKDJol+/
         Dp9eLcFGjf5JKU7b3cAtZ7AcmsT5PUA8SJw/Wza5WXW4YfCla77HudaoluHBSkuyvdrv
         libFDOw5CtfPV5wc5OpcSs70ZjJYhdA+jtBav2GnP9PozufhdFqd2ErfpFs9KOCr98Fi
         W7ds5OhL+lW49rJxd3iQYwqVOSQHGv/8Nu7mNQT/XiMXyC3AUXS/o+2gaTH4Cpj3S85Y
         wPfg==
X-Forwarded-Encrypted: i=1; AKwUvByDSY/fh4pw/Qsgq5DMBLnnPGmQFM2lHj49bwOZxbLHf7RmTEQdjQOxevQ+BcRm/ML0cAqv2h7L3nwaUA==@vger.kernel.org
X-Gm-Message-State: AFuF++m+HzFH+wmd24kVrQ7qDa2TW20OXekFsw2UeOHxp4ApVAZBzHUs
	1DEuDL0fJuORMtkN9GqDJKtBK6OD7VxljitPNWGCx9wn6KBGRrC/CR79
X-Gm-Gg: AYBFou2dn0cpqsXoBXYZ9N17ulFMsJGprBSPNZZw08px/6VLxElplF0/bOMzxRp4rqE
	DfLg8mRLj52/RO9hzd9IWKcuOdmxzWXNOf10rLit8detaERCnhgjxEQBgjNt5gLsfYkKPsJ++B6
	p++qPBgLHJw4HVnSv+CmjUq+uHUpL+FhsuieXb4KrsP24CXDD5SaBS+zhPDu1sFgmc0dC0zrccr
	OE1YrSUc2e+C3Z5AjIPiDGHx0/3afB7NyS6diIjQnx36EpO/xD+vOuaxrajOnf1BHwyxYd1B+AQ
	juegTFzuqt6nqvp9y1VSiwcnevQqTgezLQKrftJHmtRsvW/MKvKgvzPBKPd3tA0BSSPn3r+hML2
	BmV8a2WGIVBW0EEIsiwyl3AbJ+hHJhkP+2A4LBAARpy7RwscOrWBzyLdtmzufp0qFOUgmuHjUbI
	9BoVFNFdup5pFLlVshaTQNs6uaMKxShsjzz+D49T9dxSi8ln+vlQv7n5jsLjj7v3mIqhY=
X-Received: by 2002:a05:6000:186f:b0:487:36a:c870 with SMTP id ffacd0b85a97d-4871e2123damr3702576f8f.11.1789734029028;
        Fri, 18 Sep 2026 05:20:29 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871feb5d63sm4086611f8f.3.2026.09.18.05.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:20:28 -0700 (PDT)
Date: Fri, 18 Sep 2026 15:20:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] media: uvcvideo: Fix buffer overflow in
 uvc_mapping_get_menu_value()
Message-ID: <aq0siVcghDe6x9cs@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "idx" value is a user controlled u32 so we have to bounds check it
before calling test_bit() to avoid reading beyond the end of the bitmap.

Fixes: 4e15c535659b ("media: uvcvideo: Support any size for mapping get/set")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 3ca108b83f1d..f157ed99be4e 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -538,7 +538,7 @@ static void uvc_mapping_set_s32(struct uvc_control_mapping *mapping,
 static int uvc_mapping_get_menu_value(const struct uvc_control_mapping *mapping,
 				      u32 idx)
 {
-	if (!test_bit(idx, &mapping->menu_mask))
+	if (idx >= BITS_PER_LONG || !test_bit(idx, &mapping->menu_mask))
 		return -EINVAL;
 
 	if (mapping->menu_mapping)
-- 
2.53.0

