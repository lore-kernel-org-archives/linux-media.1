Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478301;
	b=jkY5RFttA44zM6Bxftsmmn4vnhfWCwZyITVQ81gvO9/Fzmp7PB1CmIkLARepPjrNtdCU
	 licVbLN/aZsOfZ6vUD7DxYynl01LyujRAEaa1k9V8lNNqeufV8ptqt77/GicdeV88ZztO
	 DJq+k3Pxgnp/xLv94Vsag2gMz6l/aBRH5Yw/uYM0tvcM1bq3m4M3c2gopg4qPjElQon2z
	 81LIeWUriLIVzY7CobIiYoTdhjpWQ1NKKBZra2X1xFvfMEc2O8M5RIkEdpwPxbl5IBpCn
	 v5rrSLLxkhqizG2sypIre82+6GkJuyzkGDfe/Jy0X4QpZ5tzixvz4TiKdvbJ0yr9cCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WaoGSBUw+3Jzr2stHEJVabNKgV1ycEWdou5OEyDZ/EU=;
	b=wJa+oxNOXwL3vzafZ5BER7Ic9DwgvxOdL39s8DqN9m/zi4paE33noQrvxKGv/Ar1feru
	 dJRjQNfswWeFHAyZ86BE8wm4tr9kkL5MX7lsWfvWWCQnLx5aU7wJDwCGmrLjl6URCLrrR
	 cXJzPPtlcGvS3oyOozci3r03brjUI7H1JW8xgHuQPY4WUJQQMe8sR5Zjih1RM9id/Uhi5
	 T65+eLeGXJ/MCu8BdaX4DNH2C9+4u2pR0qlDvSLYQhADprqevUzWqN0Rnvd8f7QMXwxhK
	 08mOdmJYvEiSFXPi87rmfLhAz8olUxjZOiOUir1Dpsb/tCXkKdE/JNOPbzny4MUk8LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QaGhlh+q;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C08606A31D
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 06:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59C08606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QaGhlh+q
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4649b35bso2312564f8f.3
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 23:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478299; x=1793083099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WaoGSBUw+3Jzr2stHEJVabNKgV1ycEWdou5OEyDZ/EU=;
        b=QaGhlh+qQ+oivF5NfN36r2CTE+g/j1KuWE6VhvG8SpnMY7oKim0rNol7iJgN+tE4q+
         MVlQpnipcyxlqpwmar/PD2chWtmknUqsiFTkO95BEUKl+W+bmK7z+5Ejvn3Knxol0zJW
         +H7W8MM0hXObP7E+nRMiN/x3VU2/SMm9MnXUrpLB75C0uA/gHT7Gt/AUhm+yDZ7Ras+0
         ZK9TXDLd2/cWIECm6xd0LZX4E6isxEz2x6c7pyJ8X+r11X822uKwIxtxpdTR7SkeL8X8
         DEbKf83bpzYLaXDwQuA0Mo9CX1RlYqnWWXfj9IhXu3zsR3klycLE/+CSjcazcoPtDdFB
         Z/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478299; x=1793083099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WaoGSBUw+3Jzr2stHEJVabNKgV1ycEWdou5OEyDZ/EU=;
        b=ZRV7dAaFf/L7l4ecum3jnuVhqv1VbOd+pGrPY4oGeTMT/ZIAYk11wes5ybFYP7811M
         fMaZBdiBE9YXsuNGvMQAUEMPJcYzFF9YR10eVvMq4t+zVHnHwB7x+hBaoXkC+NmzcI3c
         hdyD83Fsu5TOq8LxEMA/25S6vEKe5ghCGW+2YvbbQl5IOGPJb2hcFx2nwxN4VieFr0pV
         uni509f2+7xBFPLPcr0QwhYA9RA1ECmoDjJH7c6Bf0jJqr3ByEZAWO8YQbhiPc/aD8hW
         gr7DA9HE4T38NG/6cBZf8Oa41k8EhENfM7ioa1j0X5hQTckp+KwosYVEMUPpUyJbDWUk
         irKA==
X-Forwarded-Encrypted: i=1; AKwUvBw/rgdPR1joVCpbnZtOpA21RWFCGlT0PN4A0diG5T4un7Lzgx6jgzNn+a0RdU6gV6cYeAMZi8JZX9MWww==@vger.kernel.org
X-Gm-Message-State: AFq9FYKuk7Drz2aV3zCY8qQYf1iWa1c70nEMw0ElJMZcPQgGZ7f1Z+Ok
	g3Q1jUyZNJ3yuw4vMFIa848Q5q1MdfbtdmVQAKpHHWWU2qf9Q/n3pEXp
X-Gm-Gg: AYBFou1bVFzVMN0QPeTz4uiBKq6R4xZXGsvzHtUoRhLozmIzVJviglzEW6esAVD34qM
	0HCAuvpbsTmG+ZxiLNX8tdIih9UsztxeqUhIBCcY6TV0YHs6ram8eJff+J+X/diTSlwhmKSIt1Z
	Bo0/ruj4GfIkYTnmDg10pOr16f5mCpTXZMqJZJERt3rM5iM5+4S+DQeiLuakZYnGtjiWH6VNgou
	DYcdoCA2oKuPPh165YohagHPAdNa6mzxDRHLOiT/adm2abuXdMewpIS9xa7KyFb+WhYlDFaz6HC
	9mXs6O2pJPXJqKY46Bqx6RRBikPwTgDrN7xr12Khq04OGOK2NriOgCHyGFkkBtnbAlZTOyjh57u
	k3/p3wDGnj4OopktAoywBmPY02BAIaorCb1Ub+8lTj+T9RfaN3ccaxhzR9vpjs5WdzBc4o6F9Ma
	DIHpaaBHtNCkntkcCJDQaGDomvT0znTUOntTPKGFJK1PbnKWccq5JgcH4lVDyg9ib3+k9T8oDDg
	agB24p7I88nm8uYx6CXu2lu4Ru/KUBHkQKPRHPRYmlP9I/juAuXWT7R37ayvGprNM7vsIVkWyyf
	5OCm7tCyd+2T1i8yniX/fkwVvDb1G567JR5zV60jwSCauZSpqZaIkBGtAo/3SkoT1vxp93f5sAX
	BLVfr9KKf/08S
X-Received: by 2002:a05:6000:4694:b0:48e:3d2:44b1 with SMTP id ffacd0b85a97d-48e07fb6991mr13514200f8f.52.1792478298615;
        Mon, 19 Oct 2026 23:38:18 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c92-6501-2169-eb9c-7ad3-f5db.310.pool.telefonica.de. [2a02:3100:9c92:6501:2169:eb9c:7ad3:f5db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d820714sm3916393f8f.35.2026.10.19.23.38.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 23:38:17 -0700 (PDT)
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
Subject: [RFC PATCH 1/6] iommufd: Preserve DMA-buf pin errors
Date: Tue, 20 Oct 2026 08:37:40 +0200
Message-Id: <9a3912ce01cfd1205daeb13b57de47aa8f27f076.1792477872.git.kmehltretter@gmail.com>
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

If dma_buf_pin() fails, iopt_map_dmabuf() replaces its error with
PTR_ERR(pages->dmabuf.exp_phys). The newly allocated pages object still
has a NULL exp_phys, so the function detaches and returns zero. Its
caller then accepts a DMA-buf pages object with no attachment.

Keep the error returned by dma_buf_pin() when unwinding the attachment.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/iommu/iommufd/pages.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 98c2a8027..0b32c65af 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -1510,10 +1510,8 @@ static int iopt_map_dmabuf(struct iommufd_ctx *ictx, struct iopt_pages *pages,
 	}
 
 	rc = dma_buf_pin(attach);
-	if (rc) {
-		rc = PTR_ERR(pages->dmabuf.exp_phys);
+	if (rc)
 		goto err_detach;
-	}
 
 	pages->dmabuf.exp_phys = dma_buf_pal_map_phys(attach);
 	if (IS_ERR(pages->dmabuf.exp_phys)) {
-- 
2.39.5 (Apple Git-154)

