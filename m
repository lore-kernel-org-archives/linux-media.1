Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962306;
	b=cPQMrcXIOZK/C5Ul8PcqlgQIJZrul4oKJ74VOp1s3w7BtJIkvJJtGEcOAckKNLFRSoZk
	 1YV22n6GV4n2pRWw+9bfsxLINx5QblYq863DB49CwrbrzSto6brKnWIqB3rTAz0HCMfFF
	 TVpGXIxOPdQy1pjMjp2QCBBOOJc7W6UOlDlY1sIPKMRiT9AKHJP55Zul7hqaiyXd+CiUz
	 LuqP97ONs5VJfKf077z8iS3JxXHcL/NYTdAYd6m+hLYVByLrbf9EGPaxqctsMq0tDDDs/
	 ShFtdEsNnwvtGZLVHF4slVv+22dmcTAVGm8UxRAhJ56ur6dMrPvzYciqGB2gjUZFyFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pllyLf+++bwuw+cTuPHNT6Ou6itzbDvqjnXe+1hShHA=;
	b=h65PB3HFQep3Ng18zcu7zmlu4LbXLJS6EM5UeshEfjX7eW8kRG6MmeJr0q6W1WdRAbyG
	 dn5uTpGFn46ikwfOECDWmtvq+rwVzRfKONy4vir85A3oKhjWTDFCUniqgS8TcdN+2kCLs
	 cqZzH6Ygh93A+OZwFyjRFH0YNhU30ScdK2cRoG9X5t5eQe3T+e/D1pn975ewzB3OAC6Xv
	 kSoD/RnDYK/D81vYAaGmO63/Hvvg7qywTlJuJCi5BRThDUMphJZyHxSxfeis8GYvQRd5g
	 FexlsS235m4FKNNS8izQPI9yLEbR6Nyv29BVWTSL9WF2Yugn29lny199cPmgPbZC6rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fi1swuCq;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCE6606A887
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 00:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DCE6606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fi1swuCq
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-381f65e4e4bso795878eec.0
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 16:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794962302; x=1795567102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pllyLf+++bwuw+cTuPHNT6Ou6itzbDvqjnXe+1hShHA=;
        b=fi1swuCqsqRD4h8XJOEWAoKYZKTUtgqn9z+mHLkaeVqgxyi9z8AN3eNXyPMIAY5iVB
         o5XraQNOjQpa1/LixhjJQD7oj0sEGtXeq8Q7Q9Eg8OnG7fsm8qG5lGZ/RVgTy5otSfmj
         WKvXkQG1LeoGBEXUuDLE500suNdXBzUey8l24lJS3Pl/PGTNeyTxQthpGrehsd5yqusH
         zyMsY7mH5U8OW0xDSw4q5AknyPiJy1zvmhURWnS6pszdA6xFCreiTsW6rJezEOq4BL4e
         bDznmDJfZ0TMTEKqPUCGdi7X6+8N/AUX6n+lS/Pzxxb87fcp9FEeWtANpd4Fh3T+j09Z
         ZqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794962302; x=1795567102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pllyLf+++bwuw+cTuPHNT6Ou6itzbDvqjnXe+1hShHA=;
        b=D674B1+5Op2LWnncCtAeQhbGRiXASnCqgIv0ysU5gU0N1Y7cv1DbCOJUGjmpKEX2SL
         nOF02t0FhpWuT9P4NQR7Vve+lWbZ/AUrmOKqtNG/gAF4SJeUnEKFClFLTtt/yXic+mkg
         aow4Jbe6J7rv2We2iCxUTPHCbCGhLE7UAo9dWgICCUADBI5/DPoFwP5P62s2qxSqIqbd
         0KB8HDzjToB2tOaE9dG+uIwSUP5QVm/aKAN0kuK/YiMpkWRn4pmPm5AsCoFDNnrJtLVB
         znWAqoWb7ChyuA7vvnCCIFf/CZ13J4u8CtopGNjgi49A4t3xHwha2W4miW0+uDoVbpWK
         brxQ==
X-Forwarded-Encrypted: i=1; AL+hErEmaZMB+zBUcHA6wGMuktPN/uXr9vaYCUo4JdNYiYvcldK0mUPNjoh6iRDSINVSKg1OcS2JlkB5U4psGQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/GcHzP2xUOhEkLKGcp0eE3lPEJsxkKXUA5YPSOlPgk79Zf3/+a
	/UPTdirLVwFCxYz/j9B7OZX5G9WEFeP20Tlztd1ivSGRsG31S4WlPI3o
X-Gm-Gg: AZFdTZeuHdPoXPyiyaMd7q+aip0wu7rFX3XA8+nUo6+JpIgmbyDxL/woGtgVCdIQ53Y
	mff61NDRR8D7FlJBAP3leGgZtgWDvQe8sXfZZoXZkMUrwgQ6sj51XGT9sp3f8LW92wKOlpfmhgw
	5ZG8hMXgzUV0feUtGYqzsU78oSl2EtxocdWn7snpqh03PPsO0cVTp4/2CCPEJwnnkM6p6LOlZ8o
	1sDEPKkr0N9hqvNOkuMN8us7PRr9gkdJ+uhibRcpNJsdXZf6XESiPlNiC/cAhiqYhd7tZbmNIU5
	gnl4H1W6A/BMXXjg69o00lykV0SdyqKZjo/KmogJGQ5MCGDeu2l1jQSwQIZqb02QUA6htyss9Oj
	/Jj1XCFY+U+okMqVgI9RkkuZGv/RIgk9EmIaRM9BYaHanUPLO3hVtfY/m14xBp6D0fYJCEg/gX7
	nPup2N1FlCkC04by8bW41sxSo1sfPUrtk6jVGs6tLn4uUSpUqcI3QI8NAjDknpEHM3ZXHNeYKIM
	T1zvLhAKDopznnUzes8+6PHboZD3EqpPag0p6EPdYUoRhupsMAsVx3eKTnGzrQbKYqo5Hd6Xqsr
	PAkGjm01y8uF/Sd27yY/HVfvdHf7b12DGdaDQmX+5kAwpD4jmkmRObKxYsX5padBjCUdoqWx++D
	KidYv
X-Received: by 2002:a05:7301:1a14:b0:382:5dd0:3bb2 with SMTP id 5a478bee46e88-3827fe7882bmr917793eec.9.1794962302027;
        Tue, 17 Nov 2026 16:38:22 -0800 (PST)
Received: from cachyos ([2804:214:64:aaf:eb0:6704:6a19:ed25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d8015sm1523892eec.21.2026.11.17.16.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:38:21 -0800 (PST)
From: Paulo Ravazzano <paulo.ravazzano@gmail.com>
To: paulo.ravazzano@gmail.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Biren Pandya <birenpandya@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: i2c: msp3400-driver: Guard media_entity_cleanup() calls
Date: Tue, 17 Nov 2026 21:37:41 -0300
Message-ID: <20261118003742.363133-1-paulo.ravazzano@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Member entity of struct v4l2_subdev is only defined through
 CONFIG_MEDIA_CONTROLLER, so the unconditional
media_entity_cleanup(&sd->entity) added by commit 87d1307b6791 was
breaking the code. A conditional preprocessor

An AI agent was used to find the bug. The correction was done manually.

Fixes: 87d1307b6791 ("media: i2c: msp3400-driver: Add missing media_entity_cleanup()")
Signed-off-by: Paulo Ravazzano <paulo.ravazzano@gmail.com>
---
 drivers/media/i2c/msp3400-driver.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/msp3400-driver.c b/drivers/media/i2c/msp3400-driver.c
index 8c2edd462..8f0b385fa 100644
--- a/drivers/media/i2c/msp3400-driver.c
+++ b/drivers/media/i2c/msp3400-driver.c
@@ -717,7 +717,9 @@ static int msp_probe(struct i2c_client *client)
 	if (state->rev1 == -1 || (state->rev1 == 0 && state->rev2 == 0)) {
 		dev_dbg_lvl(&client->dev, 1, msp_debug,
 				"not an msp3400 (cannot read chip version)\n");
+#if defined(CONFIG_MEDIA_CONTROLLER)
 		media_entity_cleanup(&sd->entity);
+#endif
 		return -ENODEV;
 	}
 
@@ -813,7 +815,9 @@ static int msp_probe(struct i2c_client *client)
 		int err = hdl->error;
 
 		v4l2_ctrl_handler_free(hdl);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 		media_entity_cleanup(&sd->entity);
+#endif
 		return err;
 	}
 
@@ -867,7 +871,9 @@ static void msp_remove(struct i2c_client *client)
 	msp_reset(client);
 
 	v4l2_ctrl_handler_free(&state->hdl);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 	media_entity_cleanup(&state->sd.entity);
+#endif
 }
 
 /* ----------------------------------------------------------------------- */
-- 
2.56.1

