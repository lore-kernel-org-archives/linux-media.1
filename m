Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEF71F1932
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 02:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789265166; cv=none; b=lVxP+u97pM23m8PU8ZPM8WSG+gMMF8t3JpZ8hC88S4SHrL1x9nPWNUU2gVKgb86lomCzVDBIiYWTSZ6bX0NYUGXoCmKV6GAZZMz2NMlSRL1C9WSos6aDrt/IrbdgriXZS58AytogUAcsPHjneJ3LL8dsqg8tOXlYEKxCXtC+PFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789265166; c=relaxed/simple;
	bh=u9GSM0aa+VAK9DTcZDNOH2O9K7tKZbEzTahPzC8uM54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SsS8xOgWjrOnMSZv0xulBj6dmvXhe46NAXddvLxlJHyHOugBCqfi9ZZTh9qYWH3vfEHMJaM2Oyo/88jd07xKHzKCDGdGfp7yLhZ0dqSbz6XBDk8d162O0U8Gp2P3OCbaK40Y0kiIMMoCfJ3ukgGz4wabJ8yxYRLcH+CFYAZg52w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TwzkJS4u; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwzkJS4u"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-939d698e0d2so89427585a.2
        for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 19:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789265164; x=1789869964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tTjkICk3Y9ecBJSXUR8cu0YE3Z/N5m7EH1Ek0T2d8Cs=;
        b=TwzkJS4unH+P2Gd3OizBqc6M13Nio4Fw5S+pFUF169VT02oqVyPU2tjbTrTdBPoofT
         eIEa1izz33Y94nuI311CE7Z2iAT6qkcswwzAs6oPEAr95s1bLrSqPh8+B6CO40wC5ech
         iUTfWxLLtmMDDMBmDCznGWQn1I5liNUk8Agv9S2kfqXmF8XgN7V9YsHBd4d7s01wgNqj
         Famhz/LF9LL13WjO/s02xcAJO99gmoNdwdTT3xE7DP1K1aJDNKDpwTEvioLZG1cNpFPX
         pbzO9/HynbyjY4yFJxduMN+Y42Fsxdr2WjeBVVuHrtKdF3acnJ28A4XGI+WD7F4F7yCt
         5DZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789265164; x=1789869964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tTjkICk3Y9ecBJSXUR8cu0YE3Z/N5m7EH1Ek0T2d8Cs=;
        b=h1eU52KdaF3kH9qbCwy4mHL8Db91nurLtaNvfkSoXJOhh2mEp8Nalb/p5GLHk9tKm8
         75Znf20KxIQ+zaJSvUTWczIhYLTKQOaZVj8bmYAHgCSzqTqLkAJl2n/OG+iPD2Goejdj
         Pq0jll2jZIuURUlZiIahxl0VPTsDhKKtpmfwZMSBu/w2dGtzAKKUmgRj993W9Tb00zmr
         GeUgGD4fTRJafkBsnCYRZ0O8DXgtga+IgLLvBb9Sqf1j2dYRTZ1cyvrRBCGpEsFimmij
         QpCKOLfLaWQvDt/+I8vS88/+WXFS6PfG6VKHOg7gilqbYriRzUZurrPVVA6Udi01PaVZ
         +yDA==
X-Gm-Message-State: AFuF++mPvcxNjvC8UPQ/P20KxJlpX7oE3WOQk7aRFKxIEtVvaArh6Ifi
	XvRo4lmrxEE9uM9XsS/9ts19HaQqm+9/OTuyFPauqTdzX2qIqdyZ9xA=
X-Gm-Gg: AYBFou2UIDrwIz8csg17IyPB7TsvUKIfO/UQZohFewQ0TTmuwgj3a5RUEdb9k201uBx
	KZjVhqiqjjizK05cZ6a1JzMHqgulSEpCfWcXi0cK8azk0FYGC1lNzIWzFs+mb88bfudv/8J5GTK
	htTQaOxqPyAQfmSI8QaUhLiL3O8iXaqLBuI+5o//Upnocd6rYO7oBBHTmaGBHHaElqrhZsjvWFl
	pUysYASaH07JdgxPppPGyJOHYwbVYydjDPfF3wL8tnI6VcGTnUUN0jhS3gyOy/w/jZ9sDMh4L3W
	GKikxpJMmFOWrjrhfu7B2aV051nbA892GvoC9VX+Az8/Dl4/ZEXKLgYfKmEMNoFwp8frk/2bmHP
	dLDEqxhVEIeUH9NVkDTO+sjR1Nep8iodyBzxUgtrlCGnQkq0As5TNLZsyeQZpOMCMkqUpXMGYP2
	i9pqPvWygFC0pP8MNzCYpSa3jiKX9F0lfSeOUmk2yNcRkywfvl1CeBVxcs6xRmbIAX1WnbvzZ2r
	wyhvqmvI+OQU+fRAdHzP1lICuMe19BRgvHxM0aIVg59aGCdJ0uDZitfnLbNN1hL4RuqCI4Z7RxO
	Lg0Nuhsjgf0PsDmVb2pIbYUvQKMpC3mXoQ==
X-Received: by 2002:a05:620a:6191:b0:939:3b56:c416 with SMTP id af79cd13be357-939ea0e6c8fmr1489184285a.8.1789265164106;
        Sat, 12 Sep 2026 19:06:04 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939ed67a93dsm540462185a.43.2026.09.12.19.06.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 19:06:03 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: cx23885: unregister DVB bus when SP2 CI setup fails
Date: Sat, 12 Sep 2026 22:05:54 -0400
Message-ID: <20260913020554.55506-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DVBSKY S950C, DVBSKY T980C and TechnoTrend CT2-4500 CI paths register
the DVB bus before attaching their SP2 CI client. If that client cannot be
created, bound, or pinned, the current error path removes the I2C frontend
components and only deallocates the frontend list, leaving the registered
DVB adapter behind. Removing an I2C demod before unregistering the DVB bus
can also expose the use-after-free ordering fixed for the normal remove
path.

Unregister the DVB bus immediately when SP2 CI setup fails, before the
existing I2C client cleanup. The bus helper empties the frontend list, so
the later frontend deallocation has nothing left to release. Keep failures
from vb2_dvb_register_bus() on the existing cleanup path. Also release an
unbound SP2 client and propagate the actual I2C creation or CI registration
error.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 2b0aac3011bc ("[media] cx23885: move CI/MAC registration to a separate function")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/pci/cx23885/cx23885-dvb.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-dvb.c b/drivers/media/pci/cx23885/cx23885-dvb.c
--- a/drivers/media/pci/cx23885/cx23885-dvb.c
+++ b/drivers/media/pci/cx23885/cx23885-dvb.c
@@ -1158,8 +1158,12 @@ static int dvb_register_ci_mac(struct cx23885_tsport *port)
 		info.platform_data = &sp2_config;
 		request_module(info.type);
 		client_ci = i2c_new_client_device(&i2c_bus->i2c_adap, &info);
-		if (!i2c_client_has_driver(client_ci))
+		if (IS_ERR(client_ci))
+			return PTR_ERR(client_ci);
+		if (!client_ci->dev.driver) {
+			i2c_unregister_device(client_ci);
 			return -ENODEV;
+		}
 		if (!try_module_get(client_ci->dev.driver->owner)) {
 			i2c_unregister_device(client_ci);
 			return -ENODEV;
@@ -1202,7 +1206,7 @@ static int dvb_register(struct cx23885_tsport *port)
 	int (*p_set_voltage)(struct dvb_frontend *fe,
 			     enum fe_sec_voltage voltage) = NULL;
 	int mfe_shared = 0; /* bus not shared by default */
-	int ret;
+	int ret = -EINVAL;
 
 	/* Get the first frontend */
 	fe0 = vb2_dvb_get_frontend(&port->frontends, 1);
@@ -2587,8 +2591,10 @@ static int dvb_register(struct cx23885_tsport *port)
 
 	ret = dvb_register_ci_mac(port);
-	if (ret)
+	if (ret) {
+		vb2_dvb_unregister_bus(&port->frontends);
 		goto frontend_detach;
+	}
 
 	return 0;
 
 frontend_detach:
@@ -2618,7 +2624,7 @@ static int dvb_register(struct cx23885_tsport *port)
 
 	port->gate_ctrl = NULL;
 	vb2_dvb_dealloc_frontends(&port->frontends);
-	return -EINVAL;
+	return ret;
 }
 
 int cx23885_dvb_register(struct cx23885_tsport *port)
-- 
2.47.1
