Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448418;
	b=uL15lEi+O1tL5AOSR1tmTCSAJg19bjPcVJWYS6HwYf2okhfDOy+6dNV3ikwd/qJs9dHh
	 +Q/pUK5CFCQB1qsYRyK5Cxm7FfBFp44y3UoRq3HKtT1n6XElt6QXatMMT9Yx1+drIyx8Q
	 JPGWiArCQ9FM30XThqbi30nhtJ3blNDfcJX1RL9hvxUMIrowGgd3egx3YtteYrLOrrdg2
	 OpYYgz5stMxLVHlJ/gdZEPai4tq4Qpl1TW704SXXwyBrG0YvMhFxLK3wOi6IYqwYykuIT
	 Il9C7ll8yze0DXZ3bFR+UAS7rkoRfRLTvZZl4qKX6UXcYFy1vJy7c43gkmWAWZzDsRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=meDtNnqZmmStY0ORBg5eu4fKzl8BJPe1cwjkjz6gNc8=;
	b=bwZWoyAxPGuNv8IVjDU841+/aQRIChJISIRrwpjqRTeHyHCRDNT2ffBN4W1IcPQ9d6JR
	 9IZUJ5p86WZKciieObt9MAQlgSsRxgwsDSrxvY60g3fWSI5EyuY+Bjo+8QmQhsINt3GHn
	 OAexhPMyAIFiO7rDnh9Jm8DEills3mvTl8VAuceyT+271+yZm0HULWmZ3REd4RWEkFYql
	 6vT0C+3dPcPACOznnIiBeklEshZXjPQzuKTaFRCz+VFtZEwFbvftPS2kVTG8UR4sx8lrT
	 uAv6Y2PsMxk4HQ/ZMmu4XgNxOziiT8zii52JAYTWua6UqPNeCSDnkrMICJZSArV+SbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eXzBfJix;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F98660A5BDE
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F98660A5BDE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eXzBfJix
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b5786e099cso857280c88.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448417; x=1796053217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=meDtNnqZmmStY0ORBg5eu4fKzl8BJPe1cwjkjz6gNc8=;
        b=eXzBfJixaGgco9FU3t4ZCWa3uqZPSikvM169FUHeyzzJYOyEr1S9CMW37iBbsc6ZDW
         IViu5GY8yXVlF84Oe4a9hl7+h7D8Ntug5vsiVCWbfPxap4G1r1mDDPSn66jnATLVCMmB
         qS4aQb3DJZdE7YP+v+0v++GMv2RO61+9K6hJnOLB+MFPNCBU6WZk9z1KIqq+8L07/8ET
         hmzuFlQuP/6y2K0V3Zdw/PjoPyosEEbBtx765KK7ouNcPbL51UcX88MUQRUlL/y43MFT
         9QZ9UaPz0GJviZ05d1yMX3Yt8kaQV+KxPUjYdlc2SlwNnkCVbychdHTrdoRXiUru1dYN
         RmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448417; x=1796053217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=meDtNnqZmmStY0ORBg5eu4fKzl8BJPe1cwjkjz6gNc8=;
        b=mucFWhgv363M59ME0YAnwrNaNz1QqJ3t8T3YehG8mjUJ+KjL+UFPeQjgcYF8IDrQ5A
         pAf+T8z18fRKYbU1pu6VUF8Q/0Iw+mQuOyG/2EbTmBPTjrpVD+jhW3EMgTDCgXrhnoga
         QLzaYVl7FdtJ1TRE5dWjZdlKxvhIVm2at3TUSj3dAHjRXJ2vsKgkk6jz4TX2/+QzPzdV
         up3FDmzbN6eugZB378SnmytZ8Ou/6WxGG9lIDU0rKi1/XiHZlS/hKP2KGBHs4CmvWxcc
         f+ClZBVA42oNaJyLvvrbdwW1yebsonwgXIZn+379qYjK9aSS97tA+OdmypvNZUMPJsw6
         2jWQ==
X-Gm-Message-State: APuU4Z9ObjUBiJFby31mfyIjw/Pe3/zpCaQpM0a2zDOuCL8ucklS0qvR
	z4pSoYsQLMsz+r2eNDXfsP7KPCvn5UGvV93xKguSnmKb8FE8Xiay9nXb
X-Gm-Gg: AZFdTZefjKK0Zp6XKsOgAdmfVzXPtgIvdIkHpxUt5wm3z8Mg4y6q4LOnSNh5TXUIey0
	lUEPrMS/NeU6rBXG5m3kWPqMjEv3k22/Y9FM2tuwVANSMA6+eB4/JM20G2otSI+NlCDZMp2Wlv/
	cnvaSgu0vsI0t0/ok9HtkqIUOkKAXs+fyJTQhR/MJcv0hkPuoEGWR5DB4PVrct4d69IqvvubIGp
	z6ccFT0ZUmCgpINJGbsSBn5sYERkubJtU64FtT6IzYiROt8PThP0cD2Inn5KVRzyOex0l4sZGCK
	ZNHgg6HwDZKP4gchvXgCYQfOzgstsTXg5ZAm9nfKkBtq0c6brqW1gMTwE+7QAkNiZvflovd7Ldp
	r9ft/wDltwLGM03xaXcSoS/qtFEmOvPnUFlaZrwcGKTXRaAbs0lEO5ztZd0UyJTMHDDNHUYSv1s
	beC56iezTN3tFhtaLI+JuN4pqqHeaG4mgsWt2kHYUIfH8ZkBsZAp7ejxnBAA3ugN89AaSRLfLwN
	Uq7Cf+d7393l7/T+xxYgwBrgOiRHDD/1FnmwimqlLbqvUhHsrwidZMwQylYkPfXBW/AnS2lUB0+
	a40z25F1bY5crz1t4tP1rrdDWy3S7JfAmOkjJjPZaUjPegY=
X-Received: by 2002:a05:7022:7f19:b0:1b5:281e:1702 with SMTP id a92af1059eb24-1b556943e35mr11158927c88.41.1795448417207;
        Mon, 23 Nov 2026 07:40:17 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:40:16 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 16/16] media: i2c: tc358746: power off the bridge on remove
Date: Mon, 23 Nov 2026 22:39:27 +0700
Message-Id: <20261123153927.2547169-17-congnt264@gmail.com>
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

The driver uses runtime PM autosuspend with a one second delay and
drops its references with pm_runtime_put_sync_autosuspend(), so after
the last use the device stays runtime active until the delay expires.
tc358746_remove() only calls pm_runtime_disable() and
pm_runtime_set_suspended(), which neither run the runtime suspend
callback nor release the supplies and the reference clock. Unbinding
within that delay, or while streaming, can leave them enabled.

After disabling runtime PM, call tc358746_suspend() if the device is
not runtime suspended, and only then set the runtime PM status to
suspended.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 80a21da36051 ("media: tc358746: add Toshiba TC358746 Parallel to CSI-2 bridge driver")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/tc358746.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index 88ff4a90eebc..68f483534e0f 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -1688,7 +1688,10 @@ static void tc358746_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 
 	pm_runtime_disable(sd->dev);
-	pm_runtime_set_suspended(sd->dev);
+	if (!pm_runtime_status_suspended(sd->dev)) {
+		tc358746_suspend(sd->dev);
+		pm_runtime_set_suspended(sd->dev);
+	}
 	pm_runtime_dont_use_autosuspend(sd->dev);
 }
 
-- 
2.25.1

