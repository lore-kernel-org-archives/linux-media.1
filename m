Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A7A4E06ED
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 14:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605939; cv=none; b=U2Em/WE9dQgYmjX8W6l3sTWiSh3t6RJ+Lg/n2Pe9ID3u8LAJaAKQ3ZeYqdtc1bMFGUIorXSGmm5Q0YDog6adpOBsryE6yRD+om2IgXGFWOuG4Zi+sAs9Kew8owHqBa/kAMQUyZaJSwMJKurgvoikk3QzxasbqKoR1YfqRfN8Z30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605939; c=relaxed/simple;
	bh=C32WIKcMjSufDQSgpLE112ID2RGi2wFW4Rq4I0PGvBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mXf0LWFkA6zTLOC3zjvq4ckKWpg/+3B6IRQCvECOj1SYY43Yp9tcMsE5qIQrM4FIlW8CmjeTrZuIoVMCR/rjnkjgXUyIkLCf9ESodTS87OZyhFpJIU/jG5I1WQDib3JwZYxCMEIlT9DoB78lu5raiNrh5p0/WR3SCXZmhHM9r7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dv9UnCIJ; arc=none smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dv9UnCIJ"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a66f8bc23bso10384351fa.2
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 07:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790605931; x=1791210731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BUwHGqWdEKrWnZJi1cFZbi/odoLBr8uhXk783Ds9z2g=;
        b=dv9UnCIJgK7VNQ8ImE8+as/IZTNeuiAWwR6OnJgYpugLUdZWLJ47ZKNa6nUue8xSJS
         kkLSf8wTHFC4aNk0vvBx5yz3Hej0mSKAAho1hqUBItxkrJmlVWibJTsLhOq5+IcNjR2I
         SisD1UqhC5PqtXAnD+l2g3He5E5rlN0xOmJP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605931; x=1791210731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BUwHGqWdEKrWnZJi1cFZbi/odoLBr8uhXk783Ds9z2g=;
        b=wT66raAX/In7Ks3/uufuRuw3lmFpfgTiot/00zMi9rQ96WkkwQT0hHQaYHv0RkgPvL
         k56Powh2w0le1U7FuedR32Plyh4b2GFaYdFdZnr/kgjEXJ+08vBxQZ6c+3Cy7GldAV8V
         Iv3kF/oyTITl2FFoFfNXkjGzysi3r2HcQ+x9FOirxRGVp/PxnbJ7hd5kPZslF+azZcZ1
         kDi1UzOITOFGi4E557SrFiG2jfBNJdX90mK4Roz69dLPsKAlxaJ66USa72A4QOTmlPMD
         tiMDdh4ox4sVuLXjLkpyUWpUGF5F8Nb2p62hgpT+aUXK9qrCnfMuxRSNdVCQEHyWdgp2
         xsSQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9Do3YCpd37BdjUscCrEypqf7BuGyyZb044RDt8vEkpdd/7FMbsrW06RPHpAJR358ThXV8oawzkw3bVQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLNdhdUzjBHRBPzf8vh+N1BxD8tiNIWb+ozroDyAgcDBEzCXK68
	UJlV0WNXP/yUvT/dPO8+y7qhGhrdrJm1um+e7d+LFVjV41CbU/nnm8bEQsjMO6uHag==
X-Gm-Gg: AYBFou1UgcCXfkPass5VAVzIbV2kX7lDIlz66/Xe34oImCb4oXlrUq+TY47LGY+Zv23
	SE1JUJ1n2hSPZybFYRTXbE26zoDEqoGyO2i9qOeELNDieeYeHQ8JxJknfkvpV7SReUSuVJspUf4
	gR0LMjhZhWIhy5I+L3yublt3nMBtBMu/e5oj+Lb83B9eHUnFkLjD0gPjX2iY3fzipnkAY/s3YdJ
	T5p+T8zvo1b9cwpJelGaXHIWMywscDhi1l1eFJIY1sGxDKlCSzQRF4UmQ3wfCJvQMSPvKrJVl0G
	mfqeIEGd4Co6DiIGShSBGj1smek4wo5RC831365ft9ltr7dpreppRr42UHClJx9AYyRT+AGguxI
	RhzVQOmbTsGFOkE8Br+dt+4ps037O32TcjO69ynotP5kEJtkdDFCwFeiKRXhUwqnhq+13+nenge
	3sr1UeMO1jxDqvsNVz9Btp0qg71ngQFchOpMOzegIv5tmZLEgrluqUBCCyfemb5+FGdi78/Ig7A
	TtZyQqjILoiTEmAKvrz7IdmTgKEDfV9L9hJUQS4XcW7Io523w==
X-Received: by 2002:a2e:bc06:0:b0:3a7:60f3:40b2 with SMTP id 38308e7fff4ca-3a760f34514mr2414141fa.7.1790605931661;
        Mon, 28 Sep 2026 07:32:11 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb098dsm603606e87.38.2026.09.28.07.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:10 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 14:32:00 +0000
Subject: [PATCH v4 1/5] media: uvcvideo: uvc_warn should warn not info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-uvc-version-v4-1-da0e983fcb95@chromium.org>
References: <20260928-uvc-version-v4-0-da0e983fcb95@chromium.org>
In-Reply-To: <20260928-uvc-version-v4-0-da0e983fcb95@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Now the uvc_warn_once macro triggers a info message. Use the correct
level.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvcvideo.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b6bcee4a222f..a80406f20beb 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -685,7 +685,7 @@ do {									\
 #define uvc_warn_once(_dev, warn, fmt, ...)				\
 do {									\
 	if (!test_and_set_bit(warn, &(_dev)->warnings))			\
-		dev_info(&(_dev)->intf->dev, fmt, ##__VA_ARGS__);	\
+		dev_warn(&(_dev)->intf->dev, fmt, ##__VA_ARGS__);	\
 } while (0)
 
 /* --------------------------------------------------------------------------

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

