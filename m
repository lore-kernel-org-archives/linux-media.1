Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292861;
	b=moDUe5okB/w96hqY2fYOq/WyWDip9dfzgQBtfmSdzDZYZYOwzKeTzj0S54MRABWYVbGl
	 yZ/CtpjwZYGtGgEGtnhDgoxyL/CwcbQDCeaLKqVk1h0O4XS9PMJpuVr25Rg8lG6FdrMfT
	 9PmJ6UfjvRPLyNsErrjnkfR/1kN0kpwD9FhEdMWvAj6rL+5auSsk99AvvgA7e+aNkMxBj
	 5tTy54Brb9KQPgr7e1d8wLBWwZYb/VQ39J4LlcvzZjoFSECH6MPCjkumuN5jTWqEm80LW
	 ZDFARlMjasgq8YO8F61zNfshbP8+3VLGCbmn+lcxj5mZRE9L7OZlcABBFGPSz/HjnFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=7FmX03iXfBjs2acD2wbrodl+Db1Ecz5K6iKGphZPelI=;
	b=4UoTU3BUOyKUqmvZPq/fg/tBH7ePkXVjVMqRJK+rLTE6ursuJiD87h3thdZlCUb7NYgy
	 jwpM+zzSE0Wb82fMwPfwqotjHy0/weRrbQih4afULGcy+UMxO4qJqzORDJiVbeZiGhFPP
	 AigseAepNu1tYgmVg/R2GG00wygR8ARWI/DNQ63hLLCdB05JEiOzcapTf2/bXvz5gOPIb
	 Qj7pDFSNcYyeBsffm5Vhc3LkKIa27pRTy2gz/85yxhyxDBwHR0oCz99m7ojrJhddcy9TW
	 /fv69a4Qbk3EDmWDye0vtoiP+/Eakdi8ihuh8PNCZmpC/7kJe4+ajsqBm9Qn0X6Y2Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=d0dXWeQT;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBAF606A31E
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 16:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DBAF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=d0dXWeQT
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e0d885929so1839291f8f.3
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 09:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793292860; x=1793897660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FmX03iXfBjs2acD2wbrodl+Db1Ecz5K6iKGphZPelI=;
        b=d0dXWeQTPA3I9LxCRetbWSO+c75R1NGgnPphSHlgM7r43LOlsb2k+MFX1mj4fv1/Oc
         dS6ZUD1DC+wWz5697SZsva2m2B5ReDoE0cFzphUEkJhAGnKJ0NH5OrdEJ9248LpvITSH
         nRiRs02F904/XMFH07S5LcNJQ1vbzv9kGDFKG4zzRj3v/wZUTdQA15kpQe+bCPd7Uvts
         pqHEdYi8opI2u0vNNoc+9XdOU6QZ5JHQQ4qPu54pTh3meS4/ByEkxAap1gITmzMqfou/
         8b75yR79r4TWsuCYrtYmve50f78qKYvmrITmuhHti9IuQt+Co7z/vkqAI8rdPmgxAPLa
         cwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292860; x=1793897660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7FmX03iXfBjs2acD2wbrodl+Db1Ecz5K6iKGphZPelI=;
        b=PMEFMoKPq7n7mJ7MRC/lOyL4kLFl0lFc0Y/pVq6P4HNbjB+1ZFjkFc//wfyUOoLlAI
         Ico9u41DqbKzahkTDfbLi1u4O4Og81TMdGVs6zo2nwUU7fgcyniX5rtmT9k1OkY2VJgn
         4xvb7KVDlPbKNBjsf3GVEHq2bdzyhkxKLQxKqfzD/xjjiZ4uhyBpU94OjTPnSrR7vye6
         A+AOmBzS1V/OVOYeaTIVuPjH7N6vLuVGj1FkvigpktYSaTUue9d3wykID6LA4PnUqdI5
         +7Rms7kOwdVWdpUFcdYH8Y6CtbnzbrK6xGvLszArs9P5detRNhkdJKQzvJk278gdlMAO
         w0bw==
X-Gm-Message-State: AFq9FYKrI0c2itYoJDP9woc43BfSg8vqxJDnqgvcQ3tGg40t2p4Y+Hqd
	9sPPwLRMEPuIgaciKGM/Koj5ljgp2MGye1vKNP0AgxdmObpGfaN3itlZF4d19Jrarxw=
X-Gm-Gg: AYBFou3yuicZtEnlFnS3lSpQrveaSTTq/4P33uiNCegJYzASD72orzunFC+bBU9n5yq
	fHe3Z4MdGNKrlx4g4MHURpw6d+4DMjFAWgqYTaoULQHOMH3u768FhyR2xWDVpHbYuDzlUOWogGO
	rvujVP+qoPmgolVfcSTj8dKJi6oh4In0YDDnPsOdFrMpZz1gBuZGqpAKvTTHF0+NVnaepxEXNut
	EekouHFUAkUlCcURw2MrSARlVYxwOeB624NDHcUoOf/m204NXwSyrpdOjOiSWCQmQniMz0Kff1/
	WVv9WOmDSmfTJaIjEu1pSfG/SPLIzYqSMZmw2eaxRnf1/uSdS1NNK9AcPU2NTBdF3VdN7p9cTNI
	sZc6JerIBDi0EJeYXLRd/gV1V9jOJmZ0Zp2jEXZ4Atn8W1lcESH3ubAI69cJUAIIf2Td4EMZMTR
	9FdyMYPMPetF6ZuKa7ez6MPf9YgoZ5ebmHou+g7jig1hs8zlwsLtA1K+E7fQgySZZU5e+W8P+ej
	KcqJrUQMZvC7ozEUz9OYvqywe9/q7VIZmzxgTfz3ymFo512T0dUxc1ze+MGM6aDG5oikRGfcNls
	XXOQpd+vahdd2qlURB4sfsptCW+kMaNKp6s8aD/fsVYk1/Uvzx9e2GQJZCgMTu1q
X-Received: by 2002:a05:6000:2284:b0:48e:69ff:b8a3 with SMTP id ffacd0b85a97d-48e69ffbb32mr3565710f8f.38.1793292859627;
        Thu, 29 Oct 2026 09:54:19 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:db5:c0cf:53f4:d20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df87fdbsm310880f8f.13.2026.10.29.09.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:54:19 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 29 Oct 2026 16:54:14 +0000
Subject: [PATCH 2/5] media: i2c: ccs: Unify list terminator for
 acpi_device_id
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-acpi-media-v1-2-eb50f0a34e36@thegoodpenguin.co.uk>
References: <20261029-acpi-media-v1-0-eb50f0a34e36@thegoodpenguin.co.uk>
In-Reply-To: <20261029-acpi-media-v1-0-eb50f0a34e36@thegoodpenguin.co.uk>
To: Ettore Chimenti <ek5.chimenti@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Miguel Vadillo <miguel.vadillo@intel.com>, 
 Antti Laakso <antti.laakso@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Bingbu Cao <bingbu.cao@amd.com>, Bryan O'Donoghue <bod@kernel.org>, 
 Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
 Arec Kao <arec.kao@intel.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Kate Hsuan <hpa@redhat.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793292856; l=744;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=t0GyuyhTv3wyjVaMRgM8lbfgGeqJnYVzcR9oV8F5u1w=;
 b=F68vU5fTxp1Q+eDr58IdP7wMG6e/bepL4C/7bAuZi9aA6n4EkpIfuXDBaOGIUQMHaR2ovIMw4
 ItJhefv6XYtCINGOcV8I6tYBDMUUQqyAZcsLvsit0GX37aH714e2t/f
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/media/i2c/ccs/ccs-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 1cc4350856fd..2151f62daa68 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3666,7 +3666,7 @@ static const struct ccs_device ccs_device = {};
 
 static const struct acpi_device_id ccs_acpi_table[] = {
 	{ .id = "MIPI0200", .driver_data = (unsigned long)&ccs_device },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ccs_acpi_table);
 

-- 
2.53.0

