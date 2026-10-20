Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478314;
	b=zxPvE+iPmNqWW6Cf4nVZh5nJLXXcPbEjeg3VQSTqxfQPAeNtRm2bHJCYhFAorCBt502s
	 vFbR8yhdlb+ggLRmyqmL8uVZUS4IeZJqvjAgTRoy2Du40S51tKSiKea+pRFGi3Mu68QIO
	 wjsf/T4+ZDvgRd5IJBfp3AwODLmU6NREa0vY55O7Qmg+yY6VK4nth+/wM9DTe3d2xJv+V
	 wIedq30u7z8c9QC313bKRyWLjHtz5GYbnVm5uOwld0fiBYc76Xq/QNHHoQopdQKSA55ad
	 ljn4cT90FaT5b+n8kw8oZfdou/ahnGWSVyAjg8eKeNUK4rQIS+HcEjzEa0ztwzxZF9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZfCKuhuFLFgY7+lDwr5/B266OUdv6BfsTvR8mFssGTA=;
	b=0wLZjCA9/Siz+9DErZ7XuuORPkMfFN3HqIYJcyqQxYOj5YIp9+QQuuTLCKNitfuPBMuN
	 9MN3zvuoE7PMceIjoAeAFCYb4srS0OrCHOKV1MKFT30Igi6l9dly1pq29YdjXU8FhdBN3
	 UiqIwKlctHWQioDMiCD2vzKmMmE+JJIG4y+vzzVm/PA1M8jb5mcnVXIwGh8L2asVChzwt
	 QgoGtg9VtX2exWiIbmD38Ao4hyABlOXBB0IekfIKYENLjj1ffrMkulj+Mbhg6sL4knuFP
	 vuNErY6X9+HVaOQ0yUdqeBl95T0DsRQwB3ZiuBowqLKg0YKkizS8lazs4FuH6YMAF5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jyCX5E17;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA9A60A262C
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EA9A60A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jyCX5E17
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dee593f18so2123051f8f.3
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 23:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478312; x=1793083112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZfCKuhuFLFgY7+lDwr5/B266OUdv6BfsTvR8mFssGTA=;
        b=jyCX5E17hnjLXAhAwoXKBMXQVYu+tPW2CI+HH0G2ER6wB9MTmmSiAZpi/as4fOdclo
         kAXxM9PkY4H5JHdjsZ+4Bzx5HpHo2OnrZ1HwgLbj+bPwLnnqf70yEaupd4CLVASzf05+
         OWSWlR51HT6pmhY9gIzfGoDxulMeZ7F5ku19C7h7HDX7X1ERjFj6F5Vm0iNa7uXV1PFt
         NYQOfJoQQiaI/ISd6sVZIM0JKsBtHgJSriQUYmbyhsYlwRYCxSYdk4j45W35mPoYQWKe
         eoBwtsyp9MCCF4vac8+i04nXoIXyxJkMqmbtyDTak7n0J5c3tabeCTmLOTojUJhKN4tk
         yyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478312; x=1793083112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZfCKuhuFLFgY7+lDwr5/B266OUdv6BfsTvR8mFssGTA=;
        b=kxUTqr6onlk+Au4nfQlXVkv1JEjRBltgm0plESPGLgkBpy77bMfFogHK8BKDXgaaDM
         BgYW+bXDMW/yxvWWmMUz35Ox/kuSaxfmI3exvKCok0tj9nkqS9xJg4RBoWJGuolE4aQp
         DF3EKkp4OGVOIu/pmyudkjnBdOghZDvjCxnC7G3oUt0e7xPnbMLL4utE1gstX8Vks3EV
         J+C30t397KqGkfNTFcHhHzY2ZJFmIGhbECv7nI+AJE8Qcgcq4QrMQtKm8p+MTYyTYnQa
         r2v0aPXKSsihy0fZBq9B79UJqb7UyYLshlDps7sj6zqBMKRREb43KU06RM+31eVLRymd
         nMTg==
X-Forwarded-Encrypted: i=1; AKwUvBxuXFHJwaL3Tv73kcXY3zjpZPxgldnkfVgyJRj0U6ZQdJOnXwPYVVzmjjd1zn2h3tSnp5Ryky4yrotHhw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKaV2kk0NUo/HH0kZVLdt8XmwQ62F6RiYB0W7tvVFdJLLY7d8Qe
	7DOvP6sWOg1riUicguiDugktQ33XhyT7UNFgHiu0qHh7MO/IgZxMyoNZ
X-Gm-Gg: AYBFou08o5jzFUaOpd8Zjo867e46nXLX6uDMPDnmBqVF3K4quweNnEbW61yoorBi3ZQ
	Y9e8BHbsioF/q/E+V2oabre7nR2f4F61n0dqSJsW5c7I/7uWyoKhs0xctY5pV+3/fIBqcYbKdzX
	TGWL1al0J+oTdETlsZiENJR7o8fUrjEGmbJnIQAv/M1oq6jRFZV2V0Sjo7mgivy0H9PQzUN6sFO
	OX9GxMOAAM1tPX0gS+8rQ9O8oMpkZ/rhceWK3O3bAWp9yBvXGSHYWtr2J1Ztmuq7lSv5vS8k2U2
	r8zXt+++rxe3onp3eTJYc/HcTvWilOodx8txo4a6OJr7W9kv7hLGbwM8l+lAw3y92/EhfE6hau2
	pNxbm4k2QL5yuiCIZZW/G4V0sLflCrw8wnKtmKMVhCLZ8QkVjSjtii/0dRBvx1lGJVvToEiUMcF
	bT5/SdpftZZLEh21kqCHsMzlHIa3FAOAZz9bJgHeV1tx/95yg255AlbIY44EAOyiMiXuhfNmsO+
	Hneup5aEUoGPQ0aMzCpmeoAFYaf3I+pw/4kDRMIylJpmy+S5OYf2mzdqhwLIxb7Q/o/Fu2HFtkI
	kQ/iTNwrLjvhAoIa5kczK6ALUhEsINy9EWiX1o9GwTC4KoFkBrsJl6AhLWqy7Hh2huhKBXh91RQ
	ANA==
X-Received: by 2002:a05:6000:490f:b0:48d:f99d:a0d2 with SMTP id ffacd0b85a97d-48e07bbe6a1mr21638509f8f.15.1792478311632;
        Mon, 19 Oct 2026 23:38:31 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c92-6501-2169-eb9c-7ad3-f5db.310.pool.telefonica.de. [2a02:3100:9c92:6501:2169:eb9c:7ad3:f5db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d820714sm3916393f8f.35.2026.10.19.23.38.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 23:38:30 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [RFC PATCH 4/6] iommufd: Keep the pages mutex alive until DMA-buf detach
Date: Tue, 20 Oct 2026 08:37:43 +0200
Message-Id: <fdb5d9715d7f278ac24f05246f09703edb283525.1792477872.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1792477872.git.kmehltretter@gmail.com>
References: <cover.1792477872.git.kmehltretter@gmail.com>
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

iopt_release_pages() destroys pages->mutex before removing the DMA-buf
attachment. The linked attachment still exposes pages through
importer_priv. An invalidation can enter iopt_revoke_notify() and lock
the destroyed mutex, including when exp_phys is already NULL.

Destroy pages->mutex after dma_buf_detach() has removed the attachment
and excluded further invalidation callbacks.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/iommu/iommufd/pages.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 76d8803d6..59ee68a1a 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -1667,7 +1667,6 @@ void iopt_release_pages(struct kref *kref)
 	WARN_ON(pages->npinned);
 	WARN_ON(!xa_empty(&pages->pinned_pfns));
 	mmdrop(pages->source_mm);
-	mutex_destroy(&pages->mutex);
 	put_task_struct(pages->source_task);
 	free_uid(pages->source_user);
 	if (iopt_is_dmabuf(pages) && pages->dmabuf.attach) {
@@ -1689,6 +1688,7 @@ void iopt_release_pages(struct kref *kref)
 	} else if (pages->type == IOPT_ADDRESS_FILE) {
 		fput(pages->file);
 	}
+	mutex_destroy(&pages->mutex);
 	kfree(pages);
 }
 
-- 
2.39.5 (Apple Git-154)

