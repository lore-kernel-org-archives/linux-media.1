Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB66F48592E
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 13:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133036; cv=none; b=nr7FY5OD1P7/GFsVwN/gd0RjUZ6BMRC9+cZqP0C9g/MbI9u7prajmfX5bvJXWrYN2zGunvv2/CIu8I7CkWuD16OjYSgms4bGg9fJSYsvAKQfxwzHWct+UcFPxn+TCTKs5ElklOUuzI4Nc2XkAiw9yuii9Vx4QcejJevoCqfchWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133036; c=relaxed/simple;
	bh=qpz2ap2Qy3ycSRZrgUKqHGFQhhk7gpL+MfmoSPp40Dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JsviEEOOleGAJ0vQoJWTIIc49VYukimE3MvKlfG6RnQ74thc9Fdm9azzn6cyCiDRcVojCH3Ld2GLoqpH3CGueK1iIgLtB4964wdNeWX2xeZPWdIHg82EkqUqjFCJ6e3quGiaEC4Clalq6woN0lfUEDBsmQWvfYTPBlqJRtS6gVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LxGNi495; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LxGNi495"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a4bef87631so6148521fa.2
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 06:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789133032; x=1789737832; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GRtNOlIv6Nq3mnj3CtQhPUwSgfYJDObGyFZaQ8xnneU=;
        b=LxGNi495ExZd1S3ovUUb0P0OhGIH+1Sfpr9NghkgE3oBK/fh/GxQvEWiinbTCiKCXm
         XrUEXUWh+Tks113I4Tnos550L8UZNMpWNPUEy7zVqub70fnLlloAf7IanN8t+vtGKjQo
         z1m7XEejAJGMgylB7IiRIglp7Wg1nqWqz84Aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789133032; x=1789737832;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GRtNOlIv6Nq3mnj3CtQhPUwSgfYJDObGyFZaQ8xnneU=;
        b=m4VGU3o6jU+g9WC82kyVcMHwcR4r8IA0oS0/ABh40+IgGUncuUun8pI1g00xy1zo89
         hZnHUV49UKzY3bT5r+y67hlarVRjgnUQu8eB986WSmMqhTGPJ3wNcRlUMdcqRff+w6SR
         10CvEt+6SPV1kiJHDWb5PY0x1QBT5lS4OdwYyr8Pees7xDPU55ZiiwZcvZGm3ufMyeJm
         Iw2pEjboy7vruWcOncbrt1PoV4PpgS/3UYvrn8jFXA+EXuj00vY/xw5Qv8uPrtjv8NsZ
         36mk/ihVlwBcUJTuDOU8Z5yc7jOARbfzzK4MPiafjjUf63pzZ1hWnziu24N9oVAQ6Gdi
         efZw==
X-Forwarded-Encrypted: i=1; AKwUvBzBN6uA2hCrLDxFgewc/xTj/DRo3Pg+/a9kgiCIzG6rRYia1zwQRUv9sKlMrav0JW9q72KlHYNFe9lCdw==@vger.kernel.org
X-Gm-Message-State: AFuF++mwNgD6aPSeIHYMMNENe/HsEw3n34Dj9cuYvc0R6sRmJIypl3Jl
	de8I5YqIofd36gyRhQxeo4zJhDMnIwv0DoEcYZLQC1d6XWbLcwl0aRT89YOCJscry7SNARnonz4
	7q0w+isaE
X-Gm-Gg: AYBFou1uMBlaw2exi6x18y7b9ExfiPHva9eR/I2hNNDpcqRZfAsU6zVKqjvy4yX32HA
	IEguOn5sHnVjzEsE+pm98eUUiOIFzDkyJ80oBUJxDsLf8DQXQQT0R5AbbCtKUUcNRKbMpvrmZfV
	6E22AhglXYXIKpeKXzgeJWLi/uBthu+leNYWPraVUCBbLS+9Lwto5/CPjTo1EVV6F6bZALYmyZa
	sdkTcbpdSzXcoE/AzizUzMgsVbrrTUr/cnmYo0OE57LtZWTpFDT3nj+pAyw9/VbpfznkNbdV8VG
	9+5YEPABgeY/hhUN0HIM3lfHYeub8/u6yazRR7TiuJDAU7VmsWPUMoDnk6oVKk0U+4HpcYUSrKZ
	4xqLz/Xi4WVm7DDLLNMLOqqSoxl3XzVSGJf7plfeHS5V28Oyezpy2/rxmCQJr0ea6d8SBoR34Mh
	Hqe08NfeTWokz+9HdGRhLRtkggFESeo2Jhb/ReJtSGczyy10nXTEeB9GsAsimi+CV6v4Kc832U1
	GdLeb67tuh9K2fYJISifBC8IM6mQdVjWcmjBPa8jQqgnXHEMA==
X-Received: by 2002:a05:651c:43c4:10b0:39d:b5b9:f0f4 with SMTP id 38308e7fff4ca-3a5a50895f6mr3800571fa.10.1789133031755;
        Fri, 11 Sep 2026 06:23:51 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3361f94sm5611931fa.32.2026.09.11.06.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:23:51 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 11 Sep 2026 13:23:50 +0000
Subject: [PATCH] media: uvcvideo: Fix bounds for descriptor parsing
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-uvc-ctrl-bound-v1-1-7b5cfc68bae1@chromium.org>
X-B4-Tracking: v=1; b=H4sIAOUApGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0ND3dKyZN3kkqIc3aT80rwUXctkQ0sTgzQDs7RkcyWgpoKi1LTMCrC
 B0bG1tQBPMFgRYAAAAA==
X-Change-ID: 20260911-uvc-ctrl-bound-9c1940f06fc7
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@skynet.be>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

uvc_parse_control() passes descriptor by descriptor to
uvc_parse_standard_control() with the number of bytes remaining in the
buffer, not the number of bytes of that descriptor.

Because of this, malformed descriptors could leak over the next
descriptor, leaving malformed data in our structures.

Change the code so we pass the actual length of the descriptor to the
parser.

Note that this makes the existing check more strict and some devices
that are wrongly parsed today will not be probed now.

Cc: stable@vger.kernel.org
Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index e289cc71ba98..429f1ab19a2a 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1248,11 +1248,14 @@ static int uvc_parse_control(struct uvc_device *dev)
 	 */
 
 	while (buflen > 2) {
-		if (uvc_parse_vendor_control(dev, buffer, buflen) ||
+		if (buflen < buffer[0] || buffer[0] < 3)
+			return -EINVAL;
+
+		if (uvc_parse_vendor_control(dev, buffer, buffer[0]) ||
 		    buffer[1] != USB_DT_CS_INTERFACE)
 			goto next_descriptor;
 
-		ret = uvc_parse_standard_control(dev, buffer, buflen);
+		ret = uvc_parse_standard_control(dev, buffer, buffer[0]);
 		if (ret < 0)
 			return ret;
 

---
base-commit: 27953c044974baf7e24dee3e9342fe0103dea80c
change-id: 20260911-uvc-ctrl-bound-9c1940f06fc7

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

