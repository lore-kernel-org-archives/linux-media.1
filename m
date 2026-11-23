Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448407;
	b=mtQVrJ/OOfgfOlf47Viow8ek3G8/wcos+1z8kE289HjBUtx3Han7Rz6cpCPXjhaR8S+E
	 iXeJ6lyfkynKVq5AVInyV9jWSHJYSU9hx6zawKUEZt7CQZV3diKmwFAYamKDAnCgsBxlA
	 n3TV5S1Jn3xhwfYvvXElxuX9FJL5W8iZFiaiqwu2E5HhbPwcNyTqhd6lQDofqrFSqNvAR
	 eJmPNW4QaIEAp8hlXSZ6wsKpyLZ2bf+58t20F293FgVXgCJc7sjBTUPOWPynqYeACn5Ec
	 D0GZnxdqJTjt+a49Q316FfepoJL2N02UsZJ12LN3CXfbTXq4w2mbUDmYgRusZiDOZqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1SEAJCvwxTi8XMRtkX81cceNuOWvlT9PFn4ME1tNCNc=;
	b=gZ16dG9z34L/e/vAj97UMFXJNO0D6Bm+BxdaTRCf9sczIbabGwcOa090Wab4TgHEu96X
	 ZjqqyC+hBn7tuMG6sHaG0NaV3geD54OYMBy9dPVRnZVCKmw3JXJklBYql06mVHXPmhHta
	 fgMds+GiT/SPXVIh/FI0+4CS8ncG5LLiHSv0k1GtoUVO2VMWY0L6cOtdnK6tINIzfD87n
	 hE43zVsoYzqUVmoHqfD9DiBcE0N+eLY/PHf44BdSxj6Ue1bk2pIs2zOQNBBZWRbV7I8qy
	 CrhRvhBygeyTYOnPo5y3xoQN5shgjWt8KCc9zYzelFS16jjj/Hub1YME6tMUhdWZ31g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ga7ggsym;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA7C606A335
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEA7C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ga7ggsym
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so5753520c88.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448406; x=1796053206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SEAJCvwxTi8XMRtkX81cceNuOWvlT9PFn4ME1tNCNc=;
        b=Ga7ggsymS6VkHSwUlv4H5Hwln7hS9KKekPYB3UukwQQfWeQrCZPK4VSH8UqtxZcTuM
         wJe6yEhFLKIGNYrulPr/wCz+z2V5NUK0a7pLr5f30VGXWhr6kh0aijjjmshphpLy/cMk
         dMbhlz7/k69ZDRJjsPxpk8Eg10ILl3LTrG0cu3leMjxE4iUoZCi1pTZPC4nqnwkvhz/N
         g42reKu3SfHvVlKWiPeI1XzYMFI7ubp5gntKSNZ8bxlJa4mQ7c79CSTDhJGTbuoStTwF
         d6XQlT0Khyk0GWKU8ynylDsTf8Z4XMq2gEYPCoP9Qzzi+Iwl2j4I3APUQQ45pKS/y2pM
         q4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448406; x=1796053206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1SEAJCvwxTi8XMRtkX81cceNuOWvlT9PFn4ME1tNCNc=;
        b=yMxD/RRP/9xFYTYKVXGP+o78d6Tnwm6YOaTL494T6n0++UYIfbVX1e4I3wf807L0s1
         jGiQHV7T+U2ugPHqMSglAa0aDczgTJ/eHcHVNNyqUczhBwAzrBUeg/HK6C7d0IeHyGlw
         ARJ5Oi19Czu3ize6V7sItm5eWz1sMkjUuzUBAt+ntzNup5UuTWJEe7bSndV6YaSXps22
         vSzMlRLuVx26gsZeiTnnzBLsr6aewFQ54RDr/i0+ztj/znOBXIUiiHAM86YgYtOIz+iY
         oMPqXeclJYMkgZ9WyxJ6xMtgroTCKzZXTShaDKsKX/8xEiz5wp3SkJn3OJyLxl4fSm4l
         hnnA==
X-Gm-Message-State: APuU4Z/UViFW470naWQvcSaDsXZbcQA5TXm+LVLJaz2UgupcStTlLy5D
	TssQBMcFyC9m3q4+KfA2WhPu5THiXFtR5cex86qi9If14DE9KxMoJpOf
X-Gm-Gg: AZFdTZee2Qekdy56nHYuu61h0cqq+LO06vByUEDf+KioFkLJriUDaVINwv5J/7q+m0V
	iErd/MRU2GoeItnlV/u9Ch68AfVWyxmX0w7l4+c5iWMgOVPfmfJ2yaF4BDh3OXW3DJI0FG6jtHl
	iyj1DGEowuq4HnLXzvyVB6T6Y3mDeA0IRTPsSR0tsPpCfBJZLx963ZwtuNFmuQZk8PSrZkLfHGs
	rJIIQygDDTPBOES7BSRsLKi0zK9voD0V3tErC4FtAyYVdoBLaQZ6UNTEIhrguY97pi6nhRmd1Wh
	HjLfda5kf4TSldJudzW05uGowoAI432OC7FpPDXoXR9ibY9ekHgsYjK693phfiBqtm63eN0Kb2b
	PdQsq6wTOeUSd37nHcIStH3suvwIFGxFmXJc+JEoBg512gZH52b/oVpA8Rz4C4tU/mWW/IcUdCf
	X0CzplJ7C8Y8NIvOB8x7zuw9a2+KN4dvoq/mjwirqHrLLjOB14ni5l1mHprKZtNjerfZkGf8RwR
	Rv4KEz3b2KBbrr71kdiHGBXCoIiQGro6aeiIDyZR6k4bFzNhlCVbiKgcBPd3PisSb2ZlSeiZWnY
	j5tBODMiG2hJcQgNrXsautcL6j2GryyOEBNThreBwPYD9vcjvgTmXSGcGIZXI/9lMkv/
X-Received: by 2002:a05:701a:c9c1:10b0:15e:6541:3099 with SMTP id a92af1059eb24-1b55687eb4dmr10798186c88.7.1795448405886;
        Mon, 23 Nov 2026 07:40:05 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:40:05 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/16] media: i2c: tw9900: power off the decoder on remove
Date: Mon, 23 Nov 2026 22:39:23 +0700
Message-Id: <20261123153927.2547169-13-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123153927.2547169-1-congnt264@gmail.com>
References: <20261123153927.2547169-1-congnt264@gmail.com>
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

tw9900_probe() ends with the device runtime suspended, and
tw9900_s_stream() takes a runtime PM reference with
pm_runtime_resume_and_get() when streaming starts and drops it when
streaming stops. tw9900_remove() only calls pm_runtime_disable(), which
does not run the runtime suspend callback, so a device that is still
runtime active when the driver is unbound can keep its regulator enabled
and its reset line released.

After disabling runtime PM, call tw9900_runtime_suspend() if the device
is not runtime suspended, and set the runtime PM status to suspended.
This has to happen before the mutex is destroyed, as the callback takes
it.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 918b14a26b12 ("media: i2c: Introduce a driver for the Techwell TW9900 decoder")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/tw9900.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index 51db5d5ddbde..1baf55ea48ef 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -744,6 +744,10 @@ static void tw9900_remove(struct i2c_client *client)
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
 	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		tw9900_runtime_suspend(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
 
 	mutex_destroy(&tw9900->mutex);
 }
-- 
2.25.1

