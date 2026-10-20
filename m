Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478310;
	b=5IzBTNIKdOceX5cnJyhIJvy2nQfs3YW6/KwzgaGF1UH6wR3V2s/ExwG7H7xcKJs8IX3e
	 FWFIvldSeVwoonTgOOpingAC8L6RkYhuhq5hOTkCm9u3b+PGaMingb9RxaEC7fiQdoBcr
	 KLLczbEyKmmZq5PXb1fYjGcD7rbexiHmcArB3qDuBZhGxN1RFNqtVSnd9iSXU/em2RKqN
	 a8VSM2jhrhA9TN50Mwha+4iFWmy5Af8LXVpQzTwUTLJWe3HnmspVM586yM/iv9gSxRcaO
	 TAOftsToyZc9p+q5GS5nSCgyjbGJlOsAWuB8SWBgMGovJuF50j84hM1183RB+GJSZmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u9+toBtEEPVpz6hTN7Pcfhr9T4/drBZovt9bfqsgE5Q=;
	b=jCu446s6NmDMqa/1i4Ociy8Z7p96NhBxcmRJ8VJvUDn9fBePqkXxaMfZS32+79GJzi4R
	 03e61zNycNDstQCWVG0zXwn9Fv1ha5lqVem77HuSYJt8/asnR0SQnPdmK7O1jUyqmFziY
	 t3u8xT6j2qG/6gwErT1rZigKFLEvELYwpoLjVacb3KUUSsxisnoX/UdUkeDWt9aUso1XD
	 zP2iNaHrasygyqJvBfQPpaVoY0yt5z03ins69adwoPFDWMpE8qhkiLkDjE+/1CbgqAKxt
	 nNMG6SKTsdgUuJlwTOf8pPNwqZdhYerFhYb/uSz1uGfU5WpCzxOZRyI3xfWS8nI17DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JT4YDfD0;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8350C60A2617
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8350C60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JT4YDfD0
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4be28b82so2167408f8f.2
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 23:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478309; x=1793083109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u9+toBtEEPVpz6hTN7Pcfhr9T4/drBZovt9bfqsgE5Q=;
        b=JT4YDfD0Aw5+5dvdOGL1aJEX9vUX55vIr0W7wrSg0hkHHU+y7g+VR1R5WGzVJVmerg
         84Os19N7kJt4mYuIyB1OsurnEfrJwgh0cRpXti8bgCAfWE6CRrQRTSTwd63oTfx56HYf
         kIue6b47gLPi4YGFC2XTmQKoP2YG7eiDJUf11dPqm6XtEuyC51+Xg4Wz9FNZs1ceil5g
         t3aXkRTU8hWZQ0A0pWwEmD8pbM+JgNbIFJkQBdPCzW+Ni3yZ6b9/IwVIKBnmSaX0nptD
         v4/wqpQvM6kskNnN/qS/Xz23Nv89QoBOXfR74JxF9LKxgIC+xo4chsPOm2Xab+kt6ftA
         5y/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478309; x=1793083109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u9+toBtEEPVpz6hTN7Pcfhr9T4/drBZovt9bfqsgE5Q=;
        b=hVx3M5PRQo9mrynmEK5654hdU69yZSNQatLT/7OKJRTlO611RDdtW/00ApM0570tvh
         beWTjxYlp+ZH84udabZdVIox+9Vn0SS8uic4FSHenfk6i3yGAj58rcLDeW5XaWNcQ9zg
         dXPE5ZIEuUZVEjDpJICFCxiix0XB4Q6lRHxFFNXZSion5gsYClRKMPPriIog0rvM21tD
         umUy8SX8rjpbp8nl7wgvBfNh7WCg3Y91+lQ8EkYBdeWxFIW0hbINoem/O9Ovzuxi7EPS
         RiKo5Z/SVFUmc4JxwDpfrjGUJpavjMmiINAXOvsdQn2lyNSyV4ocBt5dar+/X2TD7G8g
         dEJw==
X-Forwarded-Encrypted: i=1; AKwUvBzTl4nH+2JVL4BL0Ys6PNRn1Z39ImBgE17b7AHZtAsOOtZbrhwEKslxuDlQqDldaUinIZ7/MMdGXetdDw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIMJsFrp2uZJNP1XT9BWMVZEPclK/565AtNu3yDs7BeVEOVXH7p
	SvbOmk+SEDVyOkKv98o+mP9SN/vBWBIV4ojr45oq7qBOLlQ/6FgFwElz
X-Gm-Gg: AYBFou2E9wFsUHvrUfpXIC9D6WzFddrSVUfKJF9pUb+e8F6NqD4e8Do5/sg1SHj+5Gw
	1WW/7lBD3nuzqmhlnTOBRXnIUuQb/UL43XCntZ2/6k837AJwyAlF+xwO9ssu0Mtaft0eAXmU7RN
	opVfA9QxYZkljGhGX99pcbPCuo9TvSoh25WFbfie8Po4vrwBMWBvqcm9wf9Dx+/Zf+Td4BTtSXm
	Iv2lFB47eK+aIarlwa/sl61IdbJzTui3I42YxFbeuZv7iDOTZXLnUBy4MFHjDwIOG7dYW/UN8LS
	86pZ5/EXBe4oHPIP+3em41q2gyCSkRTBSaoQXXC51Cp5SbG3n5zqqjMciT+bHUYOnGaItCk09EW
	jMRGsEVxbQ6aOulcPooB8oqzTsZp78u24o5j8tjgNzKUvNeNMHMVmfJ17vFJO7CMjwFuhzr5joN
	GnIbC8hJi4HBthYDJa1qjXl17AoG+AaSLMFg0cdAWcf+0GRJFy08nQoCpzJd0cyw4dewBjOFyTj
	p+Min+UrhSQWl08ghvcPGUHaGMk/rtsSR73rvazJGboI+NVZODjeJ4YYiJBhgpG3X+w/RdA84ef
	8ZxynZ7pAvURNOf18aMsri92g6pab94eoGGIgmldSevNZnzvTduMmngKzi3tyv7FpogygvOV6NC
	Qaw==
X-Received: by 2002:a05:6000:400f:b0:48e:d88:55e5 with SMTP id ffacd0b85a97d-48e0d885ae8mr18682745f8f.6.1792478308630;
        Mon, 19 Oct 2026 23:38:28 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c92-6501-2169-eb9c-7ad3-f5db.310.pool.telefonica.de. [2a02:3100:9c92:6501:2169:eb9c:7ad3:f5db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d820714sm3916393f8f.35.2026.10.19.23.38.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 23:38:28 -0700 (PDT)
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
Subject: [RFC PATCH 3/6] iommufd: Clear the PAL list before dropping resv
Date: Tue, 20 Oct 2026 08:37:42 +0200
Message-Id: <65a7be483aa5e374e0afd4d72cbafab0fd07a4a3.1792477872.git.kmehltretter@gmail.com>
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

iopt_release_pages() frees the PAL physical list while holding resv but
leaves exp_phys pointing to it. Between the reservation unlock and
dma_buf_detach(), an invalidation can see that pointer and unmap the same
list again.

Clear exp_phys before dropping resv so a later invalidation sees that
there is no live PAL mapping.

Link: https://lore.kernel.org/r/20261016194022.62065-1-kmehltretter@gmail.com/
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/iommu/iommufd/pages.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 9e9bc6a1c..76d8803d6 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -1674,9 +1674,11 @@ void iopt_release_pages(struct kref *kref)
 		struct dma_buf *dmabuf = pages->dmabuf.attach->dmabuf;
 
 		dma_resv_lock(dmabuf->resv, NULL);
-		if (pages->dmabuf.exp_phys)
+		if (pages->dmabuf.exp_phys) {
 			dma_buf_pal_unmap_phys(pages->dmabuf.attach,
 					       pages->dmabuf.exp_phys);
+			pages->dmabuf.exp_phys = NULL;
+		}
 		dma_resv_unlock(dmabuf->resv);
 
 		dma_buf_unpin(pages->dmabuf.attach);
-- 
2.39.5 (Apple Git-154)

