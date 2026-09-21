Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF97B4A49B4
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 13:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997990; cv=none; b=CZ3DndaixZA8kTV7CXdoKvMSogThGHoaDazw6CpV+hL6wbyYFO70ZZRUDYRC9UzSIVOgabcUtwaRyNyTHAPut260toF1FsZwTNYGXnCE5MJwK3cBE9M/+1WcTEEH3ZsMHQ+OORcjJqyV64k06iSCxVptsjbWvzClLAl64V60r58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997990; c=relaxed/simple;
	bh=eWGOuzxLl4ww8+RUexIOLldrycXKg0mPt+5jK5IMoA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AXGGiGX0liothmKfkJABumykMzyj0CmqqzDLdXy+eAWw8q16rqOH1DJUQUWiH2PiS9AGvkDKqjabx2R78v5sqcPR+tDeXACvx16ELbBeGf/InrX6XvFzue8K69+5OFOSkPnVkKhiQ7ugwoatlmzvscAlI5DY9dvH4QVbtTg69fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gK+XMALd; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gK+XMALd"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356256so994786f8f.1
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 06:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789997987; x=1790602787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mH7BvLrcnLu8WRQAlFxz4vQAXzatlrTdCQIygZg9AG4=;
        b=gK+XMALddrevx7LCr/o4gyVSrrjoDnmkQraNj2cJtBSYgY8Vq0Ds4bOmrZ4AZLvhGF
         G59CcB5xGKPtHFNVnJZK1Yt9CSspq7EiPPaUdvQ3rRHIcTNiwzJdhr8xOQo4zr/KRnib
         5hJGe068wZgBxLOrfi2k7r59cZ94oRwAhJ50wfWV6TYK6QhW+i3M+Cxb0T2F9jm6K6JE
         RtDiP+S4IQ1sJaloDkxsUwzaBVLsqUyqbLNh0ZxgGTsSlv925Ylv26dcG3kwfaTHbOS8
         x2uFl6mU6+8nMZqI7vB2ORFZAFGaaScOgI1Dr6sbKoutAQV4mE2xz4OZC4NLRrSL7Xus
         Mzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789997987; x=1790602787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mH7BvLrcnLu8WRQAlFxz4vQAXzatlrTdCQIygZg9AG4=;
        b=dGwXUCzgEkaU8p2VOdY8n7hUMqmDdasM3atji7ycMW73ZuLDAYLOH0HPeCGcZHEDqu
         QhiBMO7WaBPe+zXx7QBhxp/NjF4wBPVHEAUd9KOk10PSuQyV1R8zKKiBGrHl+GZj/jR7
         CRNUHLu978KSR9FaKiwsZsW81RYbty+bFdpMnc5Lsq9fhF6FePTe4NI0S6+vb8MghiGT
         aCQwTsEbz2Srw87+kYstdkjEkVYLmZuwKQznmEC3WFHQCzZJEgSYk9jzCB5ierU4dR/g
         EnUuM1eZQdCmsjlFYna4QoN2TgcrvwQepexA+FKHH/uDDW7i1r560tNCBAuWZEbnBnHz
         PKYw==
X-Forwarded-Encrypted: i=1; AKwUvByYqmRsev6pdXtliX+Tvuk5qaLJQ/GLnH6N4buUWbAUR799/kpdo13IVbNGSf4JQqyptV/eBK2OGqekIQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nhvV7jNyqAwIUpS4U6x2POyA/qWNIAvCr89qdFaEYCbMifQTmv
	7Ptc5GOZp28U5aYEL8+Nk7q4t28PqiXu6YDtMeKFE/VcjinWYKGr1Wd3
X-Gm-Gg: AYBFou3EyJDUYAQ3SmEfioySVt42X55CCQcCZvnHGkXbm/sh+SaVgBa5LZ/sZVx5UNf
	gbvBrwxABjouMvBO+JmocXVlNb+GrDcmg018wOv0DWA9kbOm9K1QT5H9RoE/kftfhFXZ5NiPT8p
	NNDzthnYYfsP2qOjAVX4khxfqudRBN4VNxxnHjM6NrjB2OPouY7XA1kD95wrLgI6BG2AzRvluFv
	O4565B3KnaT1lJCzP0anlgXPL7f9eF4Ffyubn4DmnhZQRvdcRZ1nR/huSWA5mRRPW0YzxXXnAuR
	MbisUjglGAa01iZyEiEAtrcF33ea1WUIn7jcIwgE+Kk7TG/uUPmGI4TGFkevgIwV3A071jHDTfe
	ug2uXsOH+s0tGvlF506CDgLlbhZC+0Mvp4SaGoLEY61MbqvQlD337J+VwDQ+q1Fb/KqlMOZDmdq
	G32WvCPijipanYGGSOwKolV8IUlFOhYsaCyJqhk53VM8bewOq6HgMqRmIbbX7TLyxQWLu3Pw33A
	EX5Q+EUWqeVjpw5C/8+KiWuRcJGSH2QqVkcXTgc8uDwGAKCUc82lm0DJ3UwNHL1ZwQeqqnmbpRB
	+RKpefYoTA4QiSGMEq2eb3A7IjASPQ==
X-Received: by 2002:a05:600c:1d06:b0:49e:8222:3451 with SMTP id 5b1f17b1804b1-49fc5001358mr167903285e9.14.1789997987144;
        Mon, 21 Sep 2026 06:39:47 -0700 (PDT)
Received: from 127.0.0.1localhost (82-132-213-26.dab.02.net. [82.132.213.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm617171605e9.4.2026.09.21.06.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:39:46 -0700 (PDT)
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
	Phil Cayton <phil.cayton@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel@lists.linux.dev
Subject: [PATCH v6 08/13] nvme-pci: add SGL support for the dmabuf path
Date: Mon, 21 Sep 2026 14:38:52 +0100
Message-ID: <1a50e7e88263f97403f8df8583dbb1953600f2a9.1789997898.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1789997898.git.asml.silence@gmail.com>
References: <cover.1789997898.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anuj Gupta <anuj20.g@samsung.com>

Add SGL support in addition to PRP for dmabuf-backed requests,
building the descriptor list from the mapping's sg_table.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/nvme/host/pci.c | 153 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 149 insertions(+), 4 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 8dc4002fa696..4756f114154c 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -1297,12 +1297,18 @@ static blk_status_t nvme_pci_setup_data_prp(struct request *req,
 	return BLK_STS_IOERR;
 }
 
+static void nvme_pci_sgl_set_data(struct nvme_sgl_desc *sge,
+		dma_addr_t addr, u32 len)
+{
+	sge->addr = cpu_to_le64(addr);
+	sge->length = cpu_to_le32(len);
+	sge->type = NVME_SGL_FMT_DATA_DESC << 4;
+}
+
 static void nvme_pci_dma_iter_set_sgl(struct nvme_sgl_desc *sge,
 		struct blk_dma_iter *iter)
 {
-	sge->addr = cpu_to_le64(iter->addr);
-	sge->length = cpu_to_le32(iter->len);
-	sge->type = NVME_SGL_FMT_DATA_DESC << 4;
+	nvme_pci_sgl_set_data(sge, iter->addr, iter->len);
 }
 
 static void nvme_pci_sgl_set_seg(struct nvme_sgl_desc *sge,
@@ -1313,6 +1319,145 @@ static void nvme_pci_sgl_set_seg(struct nvme_sgl_desc *sge,
 	sge->type = NVME_SGL_FMT_LAST_SEG_DESC << 4;
 }
 
+static unsigned int nvme_pci_dmabuf_sgl_nents(struct request *req)
+{
+	struct bio *bio = req->bio;
+	struct nvme_dmabuf_map *map = to_nvme_dmabuf_map(bio->bi_dmabuf_map);
+	struct scatterlist *sg;
+	unsigned long tmp;
+	size_t offset = bio->bi_iter.bi_offset;
+	size_t remaining = blk_rq_payload_bytes(req);
+	unsigned int nents = 0;
+
+	for_each_sgtable_dma_sg(map->sgt, sg, tmp) {
+		size_t sg_len = sg_dma_len(sg);
+
+		if (!remaining)
+			break;
+		if (offset >= sg_len) {
+			offset -= sg_len;
+			continue;
+		}
+
+		sg_len -= offset;
+		offset = 0;
+
+		do {
+			size_t chunk = min(remaining, sg_len);
+
+			nents++;
+			sg_len -= chunk;
+			remaining -= chunk;
+		} while (sg_len && remaining);
+	}
+
+	if (unlikely(remaining))
+		return 0;
+
+	return nents;
+}
+
+static blk_status_t nvme_rq_setup_dmabuf_sgl(struct request *req,
+		struct nvme_queue *nvmeq, unsigned int entries)
+{
+	struct nvme_iod *iod = blk_mq_rq_to_pdu(req);
+	struct bio *bio = req->bio;
+	struct nvme_dmabuf_map *map = to_nvme_dmabuf_map(bio->bi_dmabuf_map);
+	size_t length = blk_rq_payload_bytes(req);
+	struct nvme_sgl_desc *sg_list = &iod->cmd.common.dptr.sgl;
+	bool pooled = entries > 1;
+	dma_addr_t sgl_dma = 0;
+	unsigned int mapped = 0;
+	unsigned long tmp;
+	struct scatterlist *sg;
+	size_t offset = bio->bi_iter.bi_offset;
+	size_t remaining = length;
+
+	if (!entries)
+		return BLK_STS_IOERR;
+
+	iod->cmd.common.flags = NVME_CMD_SGL_METABUF;
+	iod->total_len = length;
+
+	nvme_dmabuf_map_sync_for_device(nvmeq->dev, req);
+
+	/* entries == 1 fits in the inline descriptor; more needs a pool. */
+	if (pooled) {
+		if (entries <= NVME_SMALL_POOL_SIZE / sizeof(*sg_list))
+			iod->flags |= IOD_SMALL_DESCRIPTOR;
+
+		sg_list = dma_pool_alloc(nvme_dma_pool(nvmeq, iod), GFP_ATOMIC,
+					 &sgl_dma);
+		if (!sg_list)
+			return BLK_STS_RESOURCE;
+		iod->descriptors[iod->nr_descriptors++] = sg_list;
+	}
+
+	for_each_sgtable_dma_sg(map->sgt, sg, tmp) {
+		size_t sg_len = sg_dma_len(sg);
+		dma_addr_t addr = sg_dma_address(sg);
+
+		if (!remaining)
+			break;
+		if (offset >= sg_len) {
+			offset -= sg_len;
+			continue;
+		}
+
+		addr += offset;
+		sg_len -= offset;
+		offset = 0;
+
+		do {
+			u32 chunk = min_t(size_t, remaining, sg_len);
+
+			if (WARN_ON_ONCE(mapped == entries))
+				goto err_free;
+			nvme_pci_sgl_set_data(&sg_list[mapped++], addr, chunk);
+
+			addr += chunk;
+			sg_len -= chunk;
+			remaining -= chunk;
+		} while (sg_len && remaining);
+	}
+
+	if (unlikely(remaining))
+		goto err_free;
+
+	if (pooled)
+		nvme_pci_sgl_set_seg(&iod->cmd.common.dptr.sgl, sgl_dma,
+				     mapped);
+	return BLK_STS_OK;
+err_free:
+	if (pooled) {
+		iod->nr_descriptors--;
+		dma_pool_free(nvme_dma_pool(nvmeq, iod), sg_list, sgl_dma);
+	}
+	return BLK_STS_IOERR;
+}
+
+static blk_status_t nvme_rq_setup_dmabuf(struct request *req,
+		struct nvme_queue *nvmeq, enum nvme_use_sgl use_sgl)
+{
+	unsigned int entries;
+	size_t avg_seg;
+
+	if (use_sgl == SGL_UNSUPPORTED)
+		return nvme_rq_setup_dmabuf_map(req, nvmeq);
+
+	entries = nvme_pci_dmabuf_sgl_nents(req);
+
+	if (use_sgl == SGL_FORCED)
+		return nvme_rq_setup_dmabuf_sgl(req, nvmeq, entries);
+
+	avg_seg = entries ?
+		DIV_ROUND_UP(blk_rq_payload_bytes(req), entries) : 0;
+	if (sgl_threshold && avg_seg >= sgl_threshold)
+		return nvme_rq_setup_dmabuf_sgl(req, nvmeq, entries);
+
+	return nvme_rq_setup_dmabuf_map(req, nvmeq);
+}
+
 static blk_status_t nvme_pci_setup_data_sgl(struct request *req,
 		struct blk_dma_iter *iter)
 {
@@ -1408,7 +1553,7 @@ static blk_status_t nvme_map_data(struct request *req)
 	blk_status_t ret;
 
 	if (blk_mq_rq_is_dmabuf(req))
-		return nvme_rq_setup_dmabuf_map(req, nvmeq);
+		return nvme_rq_setup_dmabuf(req, nvmeq, use_sgl);
 
 	/*
 	 * Try to skip the DMA iterator for single segment requests, as that
-- 
2.54.0

