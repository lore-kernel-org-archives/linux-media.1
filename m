Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56EA3D45E7
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 18:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785954222; cv=none; b=cgfHI2BIj1Lgdh15T7vKy3w3sXNqFLGJynmmIj8gGGvAzCleV5omjNn7Ab7aK6e0hHH4TQS0EBb9v2xJcUFg/T6DhaSj4h0qPXsU+0tcCf4NsBpCSzOKgLqouLXo1W8WFHyjGpIeLdUDgqmsLvVKlMnDnCSGeY9E1BdsoaSVR4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785954222; c=relaxed/simple;
	bh=b54ks5RNORzdzaeeeOGGQzaGcigoOryJQNXEuvkvRQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lWzw98/C3UDLDRa8DN3DM7J9gVlz0gcJr+xiPovZ2AU/jVzjvMTq3EB+AaG4FNsupqsikpHVMp3IVSji80Eyw69z0J5NsjY9ShYsObtPHXE5Fa57agzr0QlbobiHMsL7C7Z+XuUjV20qswjgala9YJ6ZEhh9kU9C4TF2yuMe8ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qjTpnK+3; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qjTpnK+3"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c953950dfso12412761fa.1
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 11:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785954219; x=1786559019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/etY9O7l1mJNeqKFZj30VOo1bjana+xUrE/MK1RUdyE=;
        b=qjTpnK+3fZovVumjroNiAZT3jYwZntI8KKhZUdeHMfNIvxBnx9w+gOdcZK9L+FuYXO
         mT7lC0m2yTgyMdZppRTvXqzWtpL392oicQBtfcinZhBhbXmaoxbL6dKNYHRgzaDDUwSg
         3JOIuBOqBmpa8D+MRxs3sLLZkysd/WWsujqBe5Wa/Z+Ckv+PZAys8RXTssnEs+hdOkOD
         C24NPyyuMFsjZvaKz97YGTSEOOjhiGFpmQ6Bjj4BWnYm5hq31l9fKxaHAjr4HpLGZT27
         wb91IleX8TSd+oKOZGaoJIEGn8CLoLa+/XCk8j9JHUBKpE8lFTgxsAf7vqwk4phlcGoN
         Z5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785954219; x=1786559019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/etY9O7l1mJNeqKFZj30VOo1bjana+xUrE/MK1RUdyE=;
        b=YjSRPwhBpWT1YNn/geaWNSlNx2+F0a5huoSLkTZUj+HDdLNsjuDLXqdUxDuKzbRcUe
         jaXahVAzUg2fibEfRkFJyn1kdBQUTltyanOXemI4OhCP8WYEurkO3U6L4h4PnBWoklva
         Ilpf8kpBSGvdTwY80oactpYRGBQOXgWjx3OcwgnlY/z1LpwxO86RMS3umnVAdVUgsfaO
         mwQUbWynFGvdbWpjeLUZLI3EreGpGoDmiKVxhYjd8FaMEYkqegt7MJgXgHa0P7M+JIq6
         jSksTEsS1wvPEd5VZeIBjfrwJlRqaB12aCU2UdnTWNnqcF5yF8PI9rkSAUEN0NNrWaev
         yZJQ==
X-Forwarded-Encrypted: i=1; AHgh+RpTzGZwKfo8XH1+cQcDPj+spbwIwmKXg++i3/weXjcxrsrQSo1s3wG6dis1qvthclJMS/jYPktLwrQj6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCJ45fENPqEmmS/nBdYTNiQI0TXp5JwR/k+bvcp3E+e4WL1H+E
	U/hjMjRdWs9oefbIlVIkBmNGgvLFvxeIQn/QhZLjJdEuroHk/ry8GiHc
X-Gm-Gg: AR+sD10bd5Y6oPhmxjqyVdToHjNEnZlqBXYdzHBIOi9wrGN91AYcehzolaAO9V4FIT7
	5RfAY3bY8MqJlW+vGaHA7bwXfXUX4vUju9sXTkWU31CZRQxgDTR80JurfVPoAwfwkRzF+GsUY6j
	ASui100gk7C0pVksACnWJN13VsbNU3LqQ5/0DVTfPOxiE1+LV4sdBxQdfFHtr+pq3gypyLOkiR2
	GkLvlXs/W+AiQD0I4XVhiUkcSsarYxLGyqmJ8nPhvzGHjnr2kuJC/8lLOwfioKgIVC9E8otJP1y
	TEnXIbqu8/s4L3BEmNoKYYuNxYgGNAu93AH9lX91p4cY5IsZ70hsEktetx+kCBkH7yKWpGgdxmE
	smen1E20uAsCxHNsQivAy7xVKll03jtmiy9is50R2rdtEPCONEGN/l86AhWIV214wC/4sp5yjTb
	DBUjm2PZKAcROju4KJhapfH0P/7/5/0WP0lM9Jg+labYUdozkrDBsTOBC3HKotnkkPYfyiLg==
X-Received: by 2002:a05:651c:1993:b0:39b:2757:c1d3 with SMTP id 38308e7fff4ca-39fbae29cffmr10788271fa.9.1785954218658;
        Wed, 05 Aug 2026 11:23:38 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fb9a32bb7sm11954811fa.29.2026.08.05.11.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 11:23:38 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Wed, 05 Aug 2026 21:23:08 +0300
Subject: [PATCH 4/4] staging: media: ipu7: remove unnecessary "#pragma
 pack()" directives
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-ipu7_abi-v1-4-46d420cef267@gmail.com>
References: <20260805-ipu7_abi-v1-0-46d420cef267@gmail.com>
In-Reply-To: <20260805-ipu7_abi-v1-0-46d420cef267@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785954209; l=2463;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=b54ks5RNORzdzaeeeOGGQzaGcigoOryJQNXEuvkvRQ8=;
 b=4eo1I39brWWCs0IUeATVCS5ndG8QZkYOSCVi//iFbniZQwQWN+4W9556F5oQikt39mz3Gypcr
 YpXAbp0+zAUDYx7GmRBr7/Lp1blbWYuBtoGv/jTFXb5folTRXWsXue9
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

After the removeal of unused structures, these directives have no effect
and can be removed.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h |  6 ------
 drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h    | 20 --------------------
 2 files changed, 26 deletions(-)

diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h
index b85dcc519a31..40c7843ad7a7 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_common_abi.h
@@ -29,9 +29,6 @@ struct ia_gofo_msg_version_list {
 
 #pragma pack(pop)
 
-#pragma pack(push, 1)
-#pragma pack(pop)
-
 #define IA_GOFO_MSG_ERR_MAX_DETAILS		(4U)
 #define IA_GOFO_MSG_ERR_OK			(0U)
 #define IA_GOFO_MSG_ERR_GROUP_UNSPECIFIED	(0U)
@@ -49,14 +46,11 @@ struct ia_gofo_msg_err {
 #define IA_GOFO_MSG_ERR_GROUP_RESERVED	IA_GOFO_MSG_ERR_GROUP_UNSPECIFIED
 #define IA_GOFO_MSG_ERR_GROUP_GENERAL		1
 
-#pragma pack(push, 1)
 #define IA_GOFO_MSG_TYPE_RESERVED	0
 #define IA_GOFO_MSG_TYPE_INDIRECT	1
 #define IA_GOFO_MSG_TYPE_LOG		2
 #define IA_GOFO_MSG_TYPE_GENERAL_ERR	3
 
-#pragma pack(pop)
-
 #pragma pack(push, 1)
 enum ia_gofo_msg_link_streaming_mode {
 	IA_GOFO_MSG_LINK_STREAMING_MODE_SOFF = 0,
diff --git a/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h b/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h
index b2e6bd9159f2..01f4ce857238 100644
--- a/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h
+++ b/drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h
@@ -8,8 +8,6 @@
 
 #include "ipu7_fw_common_abi.h"
 
-#pragma pack(push, 1)
-
 #define IPU_MSG_NODE_MAX_DEVICES	(128U)
 #define DEB_NUM_UINT32	(IPU_MSG_NODE_MAX_DEVICES / (sizeof(u32) * 8U))
 
@@ -21,28 +19,10 @@ typedef u32 ipu7_msg_deb_t[DEB_NUM_UINT32];
 
 typedef u32 ipu7_msg_rbm_t[RBM_NUM_UINT32];
 
-#pragma pack(pop)
-
-#pragma pack(push, 1)
-
 #define IPU_MSG_LINK_FOREIGN_KEY_NONE		(65535U)
 #define IPU_MSG_LINK_PBK_ID_DONT_CARE		(255U)
 #define IPU_MSG_LINK_PBK_SLOT_ID_DONT_CARE	(255U)
 
-#pragma pack(pop)
-
-#pragma pack(push, 1)
-#pragma pack(pop)
-
-#pragma pack(push, 1)
-#pragma pack(pop)
-
-#pragma pack(push, 1)
-
-#pragma pack(pop)
-
-#pragma pack(push, 1)
-#pragma pack(pop)
 
 #define FWPS_MSG_ABI_MAX_INPUT_QUEUES	(60U)
 #define FWPS_MSG_ABI_MAX_OUTPUT_QUEUES	(2U)

-- 
2.55.0

