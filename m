Received: from mail-wr2-f41.google.com (mail-wr2-f41.google.com [74.125.225.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4506415F2F
	for <linux-media@vger.kernel.org>; Sun,  4 Oct 2026 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791108473; cv=none; b=I/fogNWILdDYIt9EGHvABGDuFtstF5Q1ghHegE026xY1VNhZNtJ1ZiKKDS/BFA0L31CfbYGiiLQ9VXwIxGhjLFY13x4nuoo+uUFtgIJ1RgiX6O2uqKg5xvAypF+/jw9+V8PohvfH9PG4SJwTZROGGlp2Ab30SBIpAtP4+lwVpxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791108473; c=relaxed/simple;
	bh=V8p7f+anGnSoL+KBB359kqfJ1ldhGnObhu2HYkCbO4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gdux6zwZQLCuaASwJtA943HJAMmLGz1XOyhFSykbNf6HXDCXkNGRXXBbW4cGb867xp3rbtRZIZSyJUgWks1Qw3fAZenxqiQnZRuOFs7ZmtKVC5NsdLpF5I4K2AuqECNNO7SYi8ZEpPVxU3gvN1277hc/72ZDregk+msmKQnHXw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpPkL3Qp; arc=none smtp.client-ip=74.125.225.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpPkL3Qp"
Received: by mail-wr2-f41.google.com with SMTP id ffacd0b85a97d-4834977ae75so365943f8f.3
        for <linux-media@vger.kernel.org>; Sun, 04 Oct 2026 03:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791108470; x=1791713270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yr4Xk59A6nBEe9AXu0gZsAXZVCEOldu1UBAKss+kKik=;
        b=SpPkL3Qprtmbmc4Y8rw7hbFhv2TP8pNJxHxSGjVB96GKlOKRzzW4da+H/fvEGJvzvX
         5pPv8lImD/oRoQ2vsZRjPxm23C1zuOAv42N1zStE3rSKOx214agHIPgTyTTsrbXL1ckg
         9IPdx0zJSy92FuKGVeS9rQpCCheGNZ77if9KXZxzskJe7mZwMzvBglPuGcOzrbDT/mrH
         Zk3PYJp9uAgYuT519Akj4DXRYhGToDhsbtOQukmdUZTIUmccLl0k2rODJ+5CnbGS9S2z
         M+f1ig/9JZP/gvsvCtxa2jqmBXOY6+HUI7j8oXDAU9n7vsdbC9Hm1ybCYL+TD2LWT29V
         HB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791108470; x=1791713270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yr4Xk59A6nBEe9AXu0gZsAXZVCEOldu1UBAKss+kKik=;
        b=lFhhWv+gGDoUydky7k80a/O39HdDhbefr9hQwKONt7rjYCb3pzIognO2L2QN6V/rOI
         b+X43cnkEM22/9Io9yT0+QIoYbmeS+pkqzSI9AEXtY9bhA2H2C19yuNEpo2Gk4NhBodR
         mrVvD5O5mfBNmb8nDstYDlTIC+2i/Ci7zVKB6E1tWPVSw2T/o09+VCaHKOGdBFbq9Zob
         ZdYgbBEd4peZ/OuJOIzHPsUhjHa2HST2mpAvloanCIJQqsKf2wLg3PSmElPE8zyXzamV
         J1bmk2VxVPZYxysNngKjGsM+L9oRnIf3AqfCV0usP2I0i3YQ5yak2bdGZLlEQSTTqagp
         qwFQ==
X-Gm-Message-State: AFq9FYICMcVl5HobGzm1n8GMSKAASEq16GVzChUQn09Dl9U3/6Ukuula
	G94bB+4dJw/X88LaGsziNXSF3TiWW2lY78ZyP+HoxcWuZ7WEoF7NxB8p
X-Gm-Gg: AYBFou1QSm4SmExOLIG7/mWazNdbrqrEr4grfoyebQRz97UUbQT1Ua4RS9KDrhI/C3V
	O32nnHjMd0YvaT8WDjWFf5RbRrPfm2jNDgkeybC8qUjDIRDFiFdLPRbEzlkAjo8GXQxBVVvNPK3
	mS7tD1jaa8/GYNPEOQxVp3/l7t6HTjEa4s5bCXKeLPFKzxK3UB8WqvSMSR0mnoTDCrs8M3CNhbJ
	/t0lqiPhDbOJ70ovIqrhZ14ZO7KK61Sdd0PkVNA6T4y6IuaTyEbLslH6TtcFyKAWnjtbk4p6E7B
	XN82qg4/o+M0NzVJPYWhkovYM/Fv7Otfi9dzHAQwN4BYxInbcgkW81LQD1O0wWrH4hOgreXZJzI
	7F3ce98uuuNLmGA6pIzKnmU5gpqmBzvqkDitaTTHbIs2D+jCQ0yOjSxjIPGlTVfW8lcRLDLT+kH
	HxFnN3OBqrhsIYiT8zkWvHlS4k0sDQ/t9RVYXaxTGkbNkXZLr+0YNruwhgA/7tj6yk1Rx9K3fb2
	kpyhfD0byUiX5mO4jJ2Zo0JUfT/OeNyENtJkVnMAwjE84RhlvTiG8bmMWxVM5wvv2f9N0LvOkuM
	Iu3loK0d8SEj4ADfyYQLH4sjqOHWBiAoT7fcb5pLk91Kq9Hvns86pq7L0kI8PMXz2SxjOn7vj2y
	1zS1LOt6YfkEY6UMud6it
X-Received: by 2002:a05:6000:260e:b0:48b:161:ff26 with SMTP id ffacd0b85a97d-48b12749fabmr13400933f8f.29.1791108469910;
        Sun, 04 Oct 2026 03:07:49 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-c000-0ddf-b17d-de75-1ac4-0a1a.ipv6.o2.cz. [2a00:1028:c000:ddf:b17d:de75:1ac4:a1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104602sm18136032f8f.26.2026.10.04.03.07.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 03:07:49 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/6] media: az6007: fix CAM status polling after disconnect
Date: Sun,  4 Oct 2026 12:07:36 +0200
Message-ID: <20261004100741.71711-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261004100741.71711-1-pepe.schlehofer@gmail.com>
References: <20261004100741.71711-1-pepe.schlehofer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

az6007_ci_poll_slot_status() returns -EIO when the status request fails.
dvb_ca_en50221 treats the return value as a bitmask, so -EIO is
interpreted as CAM_PRESENT|CAM_CHANGED. The CA state machine then
handles a CAM change for every failed poll, without sleeping in between.

After an unplug, every poll fails this way and the CA thread can spin
forever in dvb_ca_en50221_thread_state_machine(), preventing the USB
disconnect from completing. This happened when unplugging a TechniSat
CableStar Combo HD CI with a CAM inserted, and rcu_sched reported a
stall.

Report no CAM when the status request or buffer allocation fails, and
only inspect the status byte when the request returned data. A read
error while a CAM is present is then treated as a removal and the CAM is
reinitialised after the next successful poll.

Fixes: 962f8f67e486 ("[media] Add CI support to az6007 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/az6007.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
index 65ef045b74ca..4ce1afe01c3b 100644
--- a/drivers/media/usb/dvb-usb-v2/az6007.c
+++ b/drivers/media/usb/dvb-usb-v2/az6007.c
@@ -526,7 +526,7 @@ static int az6007_ci_poll_slot_status(struct dvb_ca_en50221 *ca, int slot, int o
 
 	b = kmalloc(12, GFP_KERNEL);
 	if (!b)
-		return -ENOMEM;
+		return 0;
 	mutex_lock(&state->ca_mutex);
 
 	req = 0xC5;
@@ -535,16 +535,18 @@ static int az6007_ci_poll_slot_status(struct dvb_ca_en50221 *ca, int slot, int o
 	blen = 1;
 
 	ret = az6007_read(d, req, value, index, b, blen);
-	if (ret < 0) {
+	if (ret < 0)
 		pr_warn("usb in operation failed. (%d)\n", ret);
-		ret = -EIO;
-	} else
-		ret = 0;
 
-	if (!ret && b[0] == 1) {
+	/*
+	 * The return value is a mask of DVB_CA_EN50221_POLL_* flags, not an
+	 * error code, so report no CAM when the status cannot be read.
+	 */
+	if (ret > 0 && b[0] == 1)
 		ret = DVB_CA_EN50221_POLL_CAM_PRESENT |
 		      DVB_CA_EN50221_POLL_CAM_READY;
-	}
+	else
+		ret = 0;
 
 	mutex_unlock(&state->ca_mutex);
 	kfree(b);
-- 
2.54.0 (Apple Git-157)

