Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF71472F8A
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 11:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940078; cv=none; b=TuVzr2Hb1FI3rUiyyDPtzRnrfSyEvmokI+ituuWdBlKxEqrQnlCYrxJWm91KqNiPwuK2i/zPCs3IeEkkpRcwfrVv/q263/7v8bjIuUuDe9qOBWKgNiWsFLDd3iqZO+TgYYyOiudTYQxyHJhFH4dyUKtFrdNQc4NSby+RlyWRago=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940078; c=relaxed/simple;
	bh=rkCcOHhvP7Z1T5ywcz6uiBs+Yi1x1yW7MGEBQeGtYM0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RkfxC7+CAcu3y3F+AzmefbKHBQFV7tDqTaFuKI0Jke0ftuW7+qb/8wKkFCL65+CF8lZd+YQ7s41qQ7JimqBpoXHN4GpLLi5YufbwgxD5TE8ObtdeF6uypZl2BUUQEuUnairRxkTOJsTDZTEGcWorZbtkXc8Do/QuM6c04rzMeD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hTY95VGy; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hTY95VGy"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a3156692e3so14915061fa.0
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 04:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790940075; x=1791544875; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wWsaWvAs491EwexC4j9Mtw9mN2AsoOlrDKvF/57KANQ=;
        b=hTY95VGy8H146W7rDSVk0OI4SfwsOjhc+KeZjJggd/EJnp3fRMcQAsytrBpO3nRV1+
         2vkjtTZ6yWh/cWLUXJdKz09oKH6o+5eOGPBLvQFtFKVFKYSB3CigklIjpQK6FGirT+EN
         ZogfX1F49SO0pN8P8Tix7NlJMgiG4sSHTdd0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790940075; x=1791544875;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wWsaWvAs491EwexC4j9Mtw9mN2AsoOlrDKvF/57KANQ=;
        b=qMgYTj5j5T5vSlW9dOOqCpASjRjKdSQd+wphYrRoAMiiWE43/ZDdKScTaWBU5QQrVb
         cExUiOOWNIJBa70T2lC15zT3cdC++O4kByJlDp8cscPfA6/EcjJ/DaTseP14x7cNbFBd
         rtTYoKSU8GRsFdyeO5muAal3GMsv77wxQB4wAXe9lvPHBXeqMuToJSi8x4R+4VW+b0P9
         gnp24E8ob3vMq80ldUfvNCMq9ZXCtQkeEJnkgCyW1Tog78PCUa7mTfcZjbKowQPuWNWS
         ZGb7/uGfsL+Xe36BpmbS1XuCvog8bXotHs3Ip/RiaKolSMPP2PJzf5T8fn32rh//P5G5
         VgpQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0cGRkrr52zui4omy5rODJI4wGkFwU92Qf/GA+qbiO8snv1C/wiOuq0/DK8L8UYqZ3jUIv1zR7hxebng==@vger.kernel.org
X-Gm-Message-State: AFq9FYKT48uMLhWrzvUMtzgpHqjveo5IjBzJgh6UkBno43y6M+ACKizN
	YovUeqnWdfZpp6/kXpjgS569LhuFp9b3aYeqRpxXj91120m90QkYsCqn5QwhSyUnyw==
X-Gm-Gg: AYBFou3151SHAoEw0o7HDj/oIBdyZxmKFO1Qaqf5wKaW5S5iBoaKzzIGY44BKu+/1q9
	MSnlNHVxZyMqxd7jF4WsufzDNvjKoRREN3RO70xsNBIbhw8iP/yQ6U4OtjxKszs8Xnky7/A/oBy
	bMMS62ny/fBavtZqRJO+hv2PmEeWXXl+K0ShrwvdciHrXpXuT2G0CESuA4P+wZsQPw5ROe92qBS
	xkGfEtZLxgeNxtuEn/1dpQ8Q1jZy+E+mW8BYKXxovoBqV3D3YCXM8tKDJPCW3K4p5QIEfAYstJZ
	Sfq3hYHRihI9BDVJ7DQ9tgE0YzllvRtpZ9u65CB1P9NipMkL7bLcwtQWxhiRFCkji/fQgbDOY2v
	fZHI0ekh610IRzgDdwDxwh/CrCfffdly+x/nwBuzaZ+WUyqIuBtib5J22LNDmQ31n+uWQSDrZ3R
	Hp1XjBnQXq1sCKsvCXZkJUuZOeuJ6tV1B7hLeuqkXx5sdj4f1J6T1kO6BiRs3Hhy5QGarbMLWoI
	PC5Z4r17fIXgyqQRARsj4dP9Y1LxapnqpZ1ZHLhtjWC94HmjPFosjGK
X-Received: by 2002:a05:651c:b14:b0:3a6:4739:2008 with SMTP id 38308e7fff4ca-3a87ebf5707mr5347261fa.0.1790940074663;
        Fri, 02 Oct 2026 04:21:14 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e324350sm8562931fa.36.2026.10.02.04.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:21:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/2] media: uvcvideo: Do not read beyond the uvc_status
 urb
Date: Fri, 02 Oct 2026 11:21:09 +0000
Message-Id: <20261002-uvc-status-11-v2-0-a98a135df0eb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKWTv2oC/3XMyw6CMBCF4Vchs3ZMW7xQV76HYVHqALOAmt6iI
 X13K3uX/0nOt0EgzxTg1mzgKXNgt9ZQhwbsbNaJkJ+1QQl1EZ1sMWWLIZqYAkqJWg+a1NV0ZDT
 Uz8vTyO/de/S1Zw7R+c/OZ/lb/0lZokRlx1NL+qzFIO529m7htBydn6AvpXwBTTK8760AAAA=
X-Change-ID: 20260813-uvc-status-11-99b9e27a8ea9
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

When we receive an interrupt status with a control change, verify that
the urb has enough data before we read it.

While fixing it we figured out that one of the mappings was using an
invalid size. It was working fine because it used a custom map function,
but now we rely on that value.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Use wMaxPacketSize for the  urb size (Thanks Laurent).
- New patch to set the proper size of V4L2_CID_ZOOM_CONTINUOUS.
- Link to v1: https://lore.kernel.org/r/20260813-uvc-status-11-v1-1-2cf43e9590b0@chromium.org

---
Ricardo Ribalda (2):
      media: uvcvideo: Introduce scattered field for uvc_control_mapping
      media: uvcvideo: Do not read beyond the uvc_status_control memory

 drivers/media/usb/uvc/uvc_ctrl.c   | 18 +++++++++++++-----
 drivers/media/usb/uvc/uvc_driver.c |  2 +-
 drivers/media/usb/uvc/uvc_status.c | 18 +++++++++++++-----
 drivers/media/usb/uvc/uvcvideo.h   | 15 ++++++++++++---
 4 files changed, 39 insertions(+), 14 deletions(-)
---
base-commit: 7fa44c2c123c17c4a3856ffac5e384409267cced
change-id: 20260813-uvc-status-11-99b9e27a8ea9

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

