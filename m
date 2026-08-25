Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1173BD649
	for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 19:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787685409; cv=none; b=lL+mMeUUQXkGB14VSeeDbjc2qcJspbmwPmoEvEkIXHv1cRN5ob1PS7MfPIoKQC8gGFzQFmcF2XeDfZn54pMOiGFJ/NxLAliq1GuCQmoqH87xQxsCutQDKsjhnLAnSYjKGWumgm7fKNvsInVJO0QVPf2y5UfHtl9SWh6w3SIfW10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787685409; c=relaxed/simple;
	bh=JF+Ug5E7sBl4C9kFEjZ3TL6C1lLbQgDAdYYCziFZjjM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HPlQZMVg4458jaY8cfTPOb56xstVsInQ4re8jfvLfcd4j5BKA254PUIK78+KwzZkRC9AcEoiTADwCVPebyvlaE4bjGh6fFdfnwgrnWptrql/UYGoshotZDqE4iJ/sPFbnKDZJdOIT0vd9KAMw4O7qq+LqH93EcqBpXJqL3Q6M7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=QuD1EOH8; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="QuD1EOH8"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-836ce6cbe1eso925627b3.1
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 12:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1787685407; x=1788290207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RwLBp5wQtTqQUXrfprG7ZEhj0j89v6z81b3e8Yi+OJU=;
        b=QuD1EOH8o8ebRK5mVDwijM9NllH6N9iqeYRbhcEGsb/H2JCX8v/HNaEkSYLDfhfKUv
         taipRH/mckbvp1LVU8Li1OE7Y8rGTBDeB+/lk8ejJxkzoaZrIB06QDWmv83JFKo34Hnr
         jBLAElqv4PCO58snnltp5Igu/72WUDrP+2ZFGH3OPx085BjGf8Cf7e526x5/jaewf6+k
         Pdr/nauljb7uHMak2BwngJtPKQnlmgrZ2Br0gYUcZEXXpF3WxFtG8YOMYdNymVltFVOc
         tT4r6bTbYQbFsCzgeJzKrkaIFSBFZQXaGom2HGUT5vQ5NMIcnsVHxiQbrDFIMn+9YHa/
         P4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787685407; x=1788290207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RwLBp5wQtTqQUXrfprG7ZEhj0j89v6z81b3e8Yi+OJU=;
        b=nDbBjU+jWlBTcspr6hdtXinA80opkW5o3B8nxzUlxmQwjKqR1P4Ue3KJSLbO/ARete
         ZS6NSTI9PwS6MRpA5s5oSzBd0HJlNQgmTZ+SAjyZUC8EG+pMJo+/S3jbyksftgPaVIpE
         e6YyQGWJbGYV3hapmcF8wJT9+SBFRhBRlEgbLqayyg1Ev6JQW5GPUQh+8wcjYh0UYa62
         Idtw7nqfJHJp8lGQJzB145ah89p0g5qQagef/tQ1RFS0kcU+TNbg3I0Nqlma0E1g4KCS
         yBZ9/tUV7hf2JKxUM4DQpn77tp9ZUPF/6D0hViOw4jbwtb1f40awfYqr1l3212HmJ4Ik
         4cqg==
X-Gm-Message-State: AFuF++n0SKQyWKUibf8EHhBfwqM5xGKcWRp78RMJ6QjDELrakZy8yzNz
	5zbj4TyDUaJoBdTHZAj4v6h9FVRIHtjyuqp3oOD+DeZgs5HDvC2XERjzC/I5NfGt3GMckantfap
	mSvovrnw=
X-Gm-Gg: AR+sD13koS5bJjQZcq2SB4MPHuQgV9+8PbNFWw8Etw2WNIBJuuGOcqg5KYaGg6SZNYs
	52epWEDW/yadCczKrTCM5eogtKQBenF/9/DK4P25BeGaLKS9FYmOEXWwrZ7TdAogMafRNf3kqzQ
	piuT8ldkHQfPFw1b+Jgf+FR0E5O759nRPX31Q5LKmugEY6EaKXOSHhMn1iV2N1rJiNDJ8SBfGho
	pLQL1ZJSoagywXgvWhVc+npwvTzEbkz7nLcz72kZgFWmq0JAr+c73uDSdZPoKlnqnMiVGGg5vaz
	C/Ke/OUWBv5GQKjgpesCexifwrGQOqGUG5h5aqwpAOHDdBD6sYHUxMEfAOxz21j01xxTnPANmiX
	Pw5W/FiBVybwvIXu41RQhUwFKj3WNqK5wSkjEeW2RFCQOh3Ip8SDYLkxl3u2nmjlNsKxzYfBy4H
	/Ti0btvxVYt/IwQ5dP8ZHbTIUUc+9Z6PLYCzbY0r3xzwUa9Ety7W6+xVyBrgUJiiR0nSxDv7pwm
	fRi2oxYPCJS61rhIWN+BaWBJUIgUsR8wKfDF953PryMM+47TN747Nd5
X-Received: by 2002:a05:690c:7483:b0:81d:6af3:b9b5 with SMTP id 00721157ae682-8573c5ed07dmr6434127b3.9.1787685406730;
        Tue, 25 Aug 2026 12:16:46 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8570d04e004sm4520427b3.36.2026.08.25.12.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 12:16:46 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org,
	hverkuil+cisco@kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 1/1] em28xx: Fix PAL analog TV colours
Date: Tue, 25 Aug 2026 14:16:39 -0500
Message-Id: <20260825191639.755480-2-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20260825191639.755480-1-brad@nextdimension.cc>
References: <20260825191639.755480-1-brad@nextdimension.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Red/Blue chroma are swapped on PAL analog TV due to register 0x7A07
missing in the configuration block for PAL. Copying in the setting for
composite fixes the issue and everything decodes properly.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
---
 drivers/media/usb/em28xx/em28xx-video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index c418add65bb5..864bab86ef69 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -431,6 +431,7 @@ static void em2828X_decoder_set_std(struct em28xx *dev, v4l2_std_id norm)
 		} else if (INPUT(dev->ctl_input)->vmux == EM2828X_TELEVISION) {
 			em28xx_write_reg(dev, 0x7A00, 0x32);
 			em28xx_write_reg(dev, 0x7A03, 0x09);
+			em28xx_write_reg(dev, 0x7A07, 0x2f);
 			em28xx_write_reg(dev, 0x7A30, 0x2a);
 			em28xx_write_reg(dev, 0x7A80, 0x03);
 			em28xx_write_reg(dev, 0x7A20, 0x35);
-- 
2.35.1

