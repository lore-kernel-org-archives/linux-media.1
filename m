Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DED84FB9A9
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 11:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975759; cv=none; b=PQOIn9O5dGXiU0RFGOzF0afG7TUW7djEy7OXwY4MbceFyI6tWuhO/VP4zrNtL5gzs6OSk4yOywRcv1e8gN0rnwo4miNyDbabm6ZKLohkpVrveUIYtctsuI3N0mUi+3n7qRQfePZw6HC/h9qmur+HfNUoAZJavFu5xLA2TJPaAqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975759; c=relaxed/simple;
	bh=0a99AkCdYYlGDSLNyvcoHvxyA0h7cLM0HZDY04APdmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jcIMBGI082KHp1UCfwGhzEUszV96Qd8gzW+xtDrCguVN1z8/T2/uf9uu79P7eE65pw11ZWQDu/rMs8DeRPatZXSp1q2RayFaIiAowP76zPa9Ts5tfxmseh/SXft+nWs5zdP0l34RUcCICs/fYBcCpHfaqnXwVr3pLl2igklxPcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1kO+xqz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1kO+xqz"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so8281245e9.2
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 04:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791975750; x=1792580550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SVgIYOF9sl5M4BcUqDAxFWbO5yiW+j2eX94ter+J4Q4=;
        b=Q1kO+xqzcnhyOMC/CmPun+hCV1NJP2CvZTgmiHVIE3lQoK3G8GakCw172Frx2IGI08
         ed/GXliK+ytILgZIPBI6mPV3kdAExQTxHL9gorMW6XZNqNtMKC+0vSb5wIGNtkZ9H+J8
         xrBqKwGb9Z3zpRrCtymlGgvQxofTGShk/4z2Dwt9/Yjto2bpYbAJwymXvZCXOa31/bqy
         LrwObguWN9VakhbrX+q6QBCXtcKbH5Z5v7JrPpCSRhLfBvhz+yoHw2gVd153XlzqEAQ6
         +3ESc3ET8xIh5CnYo31zLwr6xXUV5wkQZpMfIo/qscwkDYOMfbrVfwDJDs1oulfcUUZc
         ZWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975750; x=1792580550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SVgIYOF9sl5M4BcUqDAxFWbO5yiW+j2eX94ter+J4Q4=;
        b=mu6qU27VwsXFV4ZgEiU6PuVy3WbmMD1mxS/qhMaNK4rsCUgk4KJHH00cQVsrXAH91t
         UVtoDffAogGyymyLIsQRgTkVY6F5ifFV8OdQTtj+XVkH+Vg37x+0SF5CBChNxWrcIEQ7
         08yXPwyG9eLPHuZ9B+ozAECR5ztJbJCx1ToiobDpgSV77k7h0towKIU3r+zu3xcMIQIe
         ehWhfmTEly/oXJ+UwOUFLOV5FCP7Rvl/oS5wnoFkWWfvTzo5k1cCfx0ADDeuRrJdSqjw
         NJgXIFbNfGyiabjVy7C1D9ntpvzn56mFEqaOEOzwnVcpkEYeTvyFHxcvFrxXbL2KKGno
         CZHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUvwAyIGQOCqOWUTiYGzLLasU6S8pQn2MwEIb1k53FhwB0UgceRxwsybfwWA87O2cYUMxfwB3ZGHJCSQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKouy6AFU96g1Ov1ejux/ybiZlWjJ0ginqXqoppRdHYFEsgKgRs
	M86BmNqwepngaIXD/p/iF7KCW7vHgIKjIkcMlni1/An+zjsOaN+q0ZIb
X-Gm-Gg: AYBFou3QrcWHs+hQJ3rKkGDBXXvYWT1z041IHqfqz7YKze8F0cMkQpT2qIItiAqsEN6
	Iv0o9kmk2labURoc8tSkjKwRo86MhjaTxM9QxHlskcbhB4VOZZ5GEAGiq92VqCjBzGUEJEBLbyo
	DQnkgYIowHlCFV+O7ZNkc5u7lYGSspNX19LKs9+dRUAvgfekPmYP4kEvBjUZlwt5I58uraBhdxI
	dSof8w6dNNjp0/6UryhMpKb22Bbs0VVoE6UNVBm9Sdv0zg8GbbQkulWXZ4JuJ1vyuwX2/G6sG8E
	ibxSOzrJIIehIwMqVNkED2EZlEutHFv3t2SoZKq0Jv/GkVypzEkmHbbQlTXPSnioD5DmuQi7jpL
	andCUB/I2ArGRKd2us5z6JBVOGZYjxgA60gGKUHdDePAfHSnysvpRR+O7/fx4HsY4yHQAnvDWRV
	gBozuyLVuvkIDqYK7qDEVA8ImHPbEe+ZXnNkXBEOe9tb+7pdqjAmijT/mHxvfxirAtApSHM/42j
	NeGpQTtgzQwblFUxJvj5WIOxRl6V9wwsul6RK4oxIW6J8pZxpx3RwdQevJlKQ0kO1YdNSX2/qqh
X-Received: by 2002:a05:600c:3e87:b0:4a0:a34:6e7d with SMTP id 5b1f17b1804b1-4a18e4bacbfmr282470095e9.18.1791975749999;
        Wed, 14 Oct 2026 04:02:29 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b45eb78csm38078845e9.2.2026.10.14.04.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:02:29 -0700 (PDT)
From: Pavel Begunkov <asml.silence@gmail.com>
To: linux-block@vger.kernel.org
Cc: asml.silence@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-nvme@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	io-uring@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Anuj Gupta <anuj20.g@samsung.com>,
	Tushar Gohad <tushar.gohad@intel.com>,
	William Power <william.power@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel@lists.linux.dev
Subject: [PATCH v11 06/13] nvme-pci: rename nvme_pci_sgl_set_data to nvme_pci_dma_iter_set_sgl
Date: Wed, 14 Oct 2026 12:02:04 +0100
Message-ID: <42788b01948b58b891476006cb7ee9f9f5e917db.1791975048.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791975048.git.asml.silence@gmail.com>
References: <cover.1791975048.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anuj Gupta <anuj20.g@samsung.com>

Rename the blk_dma_iter based nvme_pci_sgl_set_data() to
nvme_pci_dma_iter_set_sgl().

Suggested-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/nvme/host/pci.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 77317e5d00f9..a65b77726e4b 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -1147,7 +1147,7 @@ static blk_status_t nvme_pci_setup_data_prp(struct request *req,
 	return BLK_STS_IOERR;
 }
 
-static void nvme_pci_sgl_set_data(struct nvme_sgl_desc *sge,
+static void nvme_pci_dma_iter_set_sgl(struct nvme_sgl_desc *sge,
 		struct blk_dma_iter *iter)
 {
 	sge->addr = cpu_to_le64(iter->addr);
@@ -1177,7 +1177,7 @@ static blk_status_t nvme_pci_setup_data_sgl(struct request *req,
 	iod->cmd.common.flags = NVME_CMD_SGL_METABUF;
 
 	if (entries == 1 || blk_rq_dma_map_coalesce(&iod->dma_state)) {
-		nvme_pci_sgl_set_data(&iod->cmd.common.dptr.sgl, iter);
+		nvme_pci_dma_iter_set_sgl(&iod->cmd.common.dptr.sgl, iter);
 		iod->total_len += iter->len;
 		return BLK_STS_OK;
 	}
@@ -1199,7 +1199,7 @@ static blk_status_t nvme_pci_setup_data_sgl(struct request *req,
 			iter->status = BLK_STS_IOERR;
 			break;
 		}
-		nvme_pci_sgl_set_data(&sg_list[mapped++], iter);
+		nvme_pci_dma_iter_set_sgl(&sg_list[mapped++], iter);
 		iod->total_len += iter->len;
 	} while (blk_rq_dma_map_iter_next(req, nvmeq->dev->dev, iter));
 
@@ -1359,13 +1359,13 @@ static blk_status_t nvme_pci_setup_meta_iter(struct request *req)
 	iod->cmd.common.metadata = cpu_to_le64(sgl_dma);
 	if (entries == 1) {
 		iod->meta_total_len = iter.len;
-		nvme_pci_sgl_set_data(sg_list, &iter);
+		nvme_pci_dma_iter_set_sgl(sg_list, &iter);
 		return BLK_STS_OK;
 	}
 
 	sgl_dma += sizeof(*sg_list);
 	do {
-		nvme_pci_sgl_set_data(&sg_list[++i], &iter);
+		nvme_pci_dma_iter_set_sgl(&sg_list[++i], &iter);
 		iod->meta_total_len += iter.len;
 	} while (blk_rq_integrity_dma_map_iter_next(req, dev->dev, &iter));
 
-- 
2.54.0

