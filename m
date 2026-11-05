Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793919820;
	b=Jf5XoZGjkY9zSlQ6ZEanJSaHDNGyHES8QJu8CS1dYBJ4odUplq3KRAMoBaxVhOx+awno
	 4aAfziCVPzLIZo0hFDDYJrNHTyiMDRfAtSHkC76z2RtRdx3xxNCMWarQXfimWe132QrOc
	 NveW9xEQRoOYWt8J6TN1Y+IBVCCW3zRA+XzryYTzhoGq9pIXU+oFxazFW2NwysxGJDCaP
	 bkp0dZU2LW0+YEqQub1fLumjziGzVQfAEll7XGiO+W/LjgTTSILIBavcLbRVErwcyliYH
	 mQtG6OQhYWGF01ZYHZBVXYAGnsWkbtL03QsHj3xiwemRmWEvPF/F5JId5YYJjM9G9ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793919820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vfF/zL1HCGWmzc39aGM7Cx1wAkHKEMskWplLH7mdoFw=;
	b=fAirKPtHkmMp2ykJMxN9xKLY5OJmUcrUnYLd1MfgF6z53VUri8iog6poAWh6qELkk850
	 91Gmrjkb0I6YdQYTZMkDGkHpfotXAyPsA7Wy+T8L6a9o++eQMCrqiXED9/X3D6kHkOkSx
	 eOzvEMB/vnvsMiycpmD5mhrdudKl3wn4L1jKUjrnBJCGlkLu3TAnsXp/V4pFJUWR6mxYK
	 gK3H6Yt0lKHT4ZBi1V2TS9S2d6LzsK2DPwin9/uqdpUf9/T976SQwyBV0CmcojNzdiuLO
	 MLQr+thjwyVaXT5Ww0TGAxa9Vp6KeKraEsQ2ed4AoeG7g2aMwO8KGBdFlglVDjzlnRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LndA58dN;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BBA606A338
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 23:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27BBA606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LndA58dN
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a215e64962so429215e9.1
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 15:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793919818; x=1794524618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vfF/zL1HCGWmzc39aGM7Cx1wAkHKEMskWplLH7mdoFw=;
        b=LndA58dNBOpHOgDIA4pjmq+84QQ3Q1xUWfC4Mf0dBfJ3M/y8ucfa1MUBpcdZ/lCY7q
         3Ug23wG+xMabY3yHGNioYyMjAq1uIvGLCrG2JnrxLUIjK8txWJ6SPbDp7PGlLItmSJIf
         uAtOw4feivI9KoRcTu0hsFJvlgqtKpS2myfQ2MVzOzlOybHWv9bD9SXW/sJfX+a180bw
         5OB2ehhGkAluGNC68Eq4vqcbqnUGD3ZA9ilvitmY6n0v8oyyAK4KRPkU4JN/R3+CtIPh
         fVomz7612P3o9gMEQWuI536z9VueNhzJx2xJdBPLsR+UkMiZuTO5pqGEjoGSlMLonXq6
         ikbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793919818; x=1794524618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vfF/zL1HCGWmzc39aGM7Cx1wAkHKEMskWplLH7mdoFw=;
        b=vVRldlVXurjKafjnI9KjujC2qELVgbosniv61PDK13lE8UyAIq42SaRA60syKDSyux
         h02fXWQdUiWzTTt05eMnqaI0hnzrx2omyGsBm3Dztp0UdB8mHCF76Ikp7Sf2qsrmOdK1
         IQ2v+xrjWLZR5lwd4d++BKxnJWdeaOrJbF6gOIyqBqsiwgARsH9cB1NHqm5e4p1OIGxi
         LEzBYyzP1onlyrDQsCc2fWT8YvpRww84JlE599pkhtUs7OQUQ1msAKEFuM/3CyvKvdR0
         DAJIrwIqwULsrmXTgf73RYVdJYVoRmAcfZ8nIDWQPxe7raxwj0ZsqNDpdjeHlt2ueHzY
         URAQ==
X-Forwarded-Encrypted: i=1; AKwUvByA8euoo3xtRW5G/EwDX361BhDM2Odo8xUYrH3+kYmE5vkrLuAzQ18tZG0BAiZO2l27rn001Ys1MUXIJg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+P2w7bOCvaJB9gjHAq5aHuEtwLrHAcylwh0pGZtobaRVNTPh9H
	nqd9ZN7Q+P8WfN56OYChY7Bspa+1+wKfEbVT5G2CkUpwr2xc5dFrPnoS
X-Gm-Gg: AYBFou2QwD5DCwUnkx2HqiB3vlhww/lwSpMJi8imhrgkntXM8/PHbgVkT/eC5dlSjcW
	sB7Vga1lOTDxXJL1Oe34PeD8e6z80HXOHe6pYfCLdxo037Op+t/ZZRHf/T8LTp4riktaB+6Z2Hn
	/t+GkdOa3I6Jpj9QlbZ+gXXKVs5Euno7C2ASaAQMrH3Qce8Q2KbAR0RunAY5RJ2lc/Hqj4JYY/e
	eIapNA8I48et74Q/D23BGtA8/udOHcQLJOwVz9r9k5N7Jzy3XLWxId4OZ1yq0dN58kbfMB8hJNC
	apfOPIcPRwM+QVkFCUeALmS/7L4mhR3OJu5opsGdE/6MCAcyOEQ85E7fVhcuYMNV7yg1RrJYra0
	2JJoHt9vKEGq9JQ6l5u+zP1TCJ7HoaFs4nC+h5eOwIythG0Mhid9jMKxW2BmiV7Zd5mJFMInaEE
	H+EWZjsTKtLnEU61T8uQPGDTT+Ts/6/OY/KTlJmP6JYL3bH3Af96bcT6OZFyTE72chJGrofLrfB
	FohubIBJQFLVtU6qnSYzSB1p4q+o+eSX6R8wFa9ezIcU8LI6Ha1hYhqLY6R1DHX4mAAClB9Kb4F
	lZ1Ue3Jcx1bhZpOOOskpLUZZZYY/p7oABSVJHJUCmvt984b13IX3GsnNLxm4QmIpckqacg==
X-Received: by 2002:a05:600c:3e8d:b0:4a8:cb23:f71b with SMTP id 5b1f17b1804b1-4b6df5eaac6mr8963635e9.18.1793919818475;
        Thu, 05 Nov 2026 15:03:38 -0800 (PST)
Received: from figssurface ([176.223.29.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e2029209sm12267215e9.11.2026.11.05.15.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:03:37 -0800 (PST)
From: Afonso Figuinha <afonso.figuinha@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] media: ipu-bridge: Add OV9734 to the supported sensors list
Date: Thu,  5 Nov 2026 23:03:24 +0000
Message-ID: <20261105230327.10852-2-afonso.figuinha@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105230327.10852-1-afonso.figuinha@gmail.com>
References: <20261105230327.10852-1-afonso.figuinha@gmail.com>
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

The Microsoft Surface Laptop 1 uses an OmniVision OV9734 as its front
camera. It is connected to the IPU3 CIO2 and described in ACPI with HID
OVTI9734. Add it to the list of supported sensors, so the bridge builds
the fwnode graph the ov9734 driver needs.

The ov9734 driver supports only a 180 MHz link frequency, so list that
one.

The change and this description were drafted with an AI coding
assistant (Claude Code, model Claude Opus 5.5). The author reviewed
them and tested them on a Microsoft Surface Laptop 1.

Signed-off-by: Afonso Figuinha <afonso.figuinha@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 3739c4a2a..4982b77de 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -120,6 +120,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTI5693", 1, 419200000),
 	/* Omnivision OV8856 */
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
+	/* Omnivision OV9734 */
+	IPU_SENSOR_CONFIG("OVTI9734", 1, 180000000),
 	/* Sony IMX471 */
 	IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
 	/* Sony IMX471 (found on Lenovo X1 Carbon G14) */
-- 
2.53.0

