Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07503AFAE7
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 12:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782305638; cv=none; b=Z2MclD/7YUpdung61RQKGv1BPsMNe1gkXfiwF/zBA23YhEw73qKanYojm3EcenxMrY9FtcaaQhtpKbvtJkPYe6JWiVbbTeB8bXlC2tBUCRAu2HTMuqi77ftCUAenmRBQ+r3kjIYC6xjtngkT0oS9VJx7EisHBNOjIOvfTKS5vns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782305638; c=relaxed/simple;
	bh=hT7tYgitJ1JYFs7EQ8fIZtRHMSkFxHsmqmW6kASH9yk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hqSGEqYDHlThvxhzdoIsnwK3vZ4kGRfI2h3fmzL0tJS0um92DPRHF1wiKj2f5Hax9SaJ98pN/N88oNYwrp4V+rjaAUr+bi0motb5NKdnp6EnaPRi0R4D1ft/Vyq4oTVlw1rcoX1EhnDZyC65Zgp3M+78CW0ovFLfBCZSWr1xZNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKCMYgBY; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKCMYgBY"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-80260a90522so13295687b3.0
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 05:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782305636; x=1782910436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M1WZO8vWv2VJGmEwDoBM9gWeu5JjgR3Wcyzn9bhpYvk=;
        b=jKCMYgBYkg6sR5QWib+IiMF5OgDjXqV94m4wS65/DqAcbOqaLFjWleVAvJ+l7+AZku
         s8vLJY2uqf8lEJlLq0oL88hZVyR0E7VQqKxr6YQvKROF+65u2gzwMlm2+JH8AS+3UFGB
         PokVMOWPIfUnpWtXM/c0PtB7NUz1tB1w5ra3q7HRIncAgdqmGnadfyz8hUziXQizkbsT
         psgqTdY2lJZdNhUvdGx3x9wcsdKg8m6dy3mR1Ml4Gzv4l8mTtB7Xb6X/+SClFoGTU2OY
         xkKPyF34+sTQFiLzcTXvF/Vnck7sBmMJFj91Z1rS8rs2XHGSCJ0VUrSvL2rSA6GBF3ae
         Hk+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782305636; x=1782910436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1WZO8vWv2VJGmEwDoBM9gWeu5JjgR3Wcyzn9bhpYvk=;
        b=FIi+6w0as/Kdn5c5R0bBquuOUGzNxaE4IEkT4TUk7kaJws4E2jw+k1/iVySkT+Y8s+
         tZN57b3ZlckPOcyQ1BrwQc8G1VMZ8j+WAjJibrLx7f+f1kFNSEui7uDEreuPn2/kaoXF
         sin9wUcw5wJolaguGbzzw/ict6+KsAzX3KI39Bg3RMoWGJhz/HqiDKlsPaByQnS11u4M
         d92mGqpqj7pCvvJPULmWAXo0PUCQjDqWaooQzshHhJOO/rNwLD6sH6UkdriCKouKg2cD
         h6MRTtX6zxmFI7VJVws6116Hfi1z3ZziwQzt4RrLFf+dAs4zlJxNdjpCdfJWmeZF3LcA
         Aacg==
X-Forwarded-Encrypted: i=1; AHgh+RqVf2u+duZst7PtXFV6uR10kSrUXy6+c2kDT+8RGnBkoUXBI6Om89Whe/tJmkM5naZgWNjga57xe3ecvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWFQLJnVKzX1l/vInzc2gVV63xaIzZfHySLK11v35VT5OB/MiD
	ndbC6meamNJXNHb7fwzmn/HkwPxeCFiT8vGiX9x5t9GHfgU+vc1Olxv+
X-Gm-Gg: AfdE7cnGXpI+blc5pgmNQQtRm+xOkPR9x/eA7cJLMrg0A37obxl6nyAd/BxsZh4NCSN
	OEFcF4AynCYcvF+54Kucv5llgg0kZt25ZLUitrDJWzdQClPIHrTyTuCEXifU6wcXxr2hoNTauvf
	SfYuEUUGlOmEovrOLSzwbgn52zFUE1jtg66coOJTdFmmK787nAJf0o0EO+LSc6wU9M/RXjMCac5
	H8PTRWvN6U4FFufEtkh9c88TznSExvwf70uhSR48rsgpOh3OMQMwsgqstiQpgykQ+YgxXSdo6R6
	iwfdHOUNqmPHo7tPE7zvgoArhFHUFWqeRBPk5dMWUU1rxNsUMAnUTNn/RAXkgeFHeWfrNDzE1cr
	nFu3K7M10g7K8cRqtfSgEtbGcu6W4vtKLkP/Y8ZMpkc+ZjKoIA+V5N02LSthIJbi9KiwVp4tBZ+
	cEOJR6E90qCZMSLy1I3gsKVB8AwA==
X-Received: by 2002:a05:690c:c4f7:b0:7fd:d8ba:44dd with SMTP id 00721157ae682-806c3a16dc1mr67516207b3.42.1782305635714;
        Wed, 24 Jun 2026 05:53:55 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025cf69b5asm57476257b3.20.2026.06.24.05.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 05:53:55 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] dma-buf: udmabuf: avoid list copy size overflow
Date: Wed, 24 Jun 2026 14:52:42 +0200
Message-ID: <20260624125242.11232-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UDMABUF_CREATE_LIST copies an array whose element count comes from
userspace. The count is compared against list_limit, but list_limit is a
signed module parameter while the count is u32.

If the limit is raised too far or made negative, that comparison no
longer bounds the count to a range where sizeof(*list) * count fits in
the u32 temporary used for the copy length. A wrapped copy length lets
memdup_user() copy fewer entries than udmabuf_create() subsequently
walks, leading to out-of-bounds reads from the copied list.

Take a positive snapshot of the module limit and use memdup_array_user()
so the multiplication is checked before copying.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/dma-buf/udmabuf.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index bced421c0..b4078ec84 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -469,14 +469,15 @@ static long udmabuf_ioctl_create_list(struct file *filp, unsigned long arg)
 	struct udmabuf_create_list head;
 	struct udmabuf_create_item *list;
 	int ret = -EINVAL;
-	u32 lsize;
+	int limit;
 
 	if (copy_from_user(&head, (void __user *)arg, sizeof(head)))
 		return -EFAULT;
-	if (head.count > list_limit)
+	limit = READ_ONCE(list_limit);
+	if (!head.count || limit <= 0 || head.count > limit)
 		return -EINVAL;
-	lsize = sizeof(struct udmabuf_create_item) * head.count;
-	list = memdup_user((void __user *)(arg + sizeof(head)), lsize);
+	list = memdup_array_user((void __user *)(arg + sizeof(head)),
+				 head.count, sizeof(*list));
 	if (IS_ERR(list))
 		return PTR_ERR(list);
 
-- 
2.54.0

