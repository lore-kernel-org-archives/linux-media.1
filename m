Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261E9552936
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 20:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924934; cv=none; b=ufipfiLFQ3cedb6iDYrW+oXnoKovKPauhPTWCZe/uxS3j1hYkZo79c+sN7EhQkaHWbMjFpgJRiF0dXz5caJK/1tZb5CKj/0MHC7xfVdirFJyeFce+ABss1JxKatEXAhHMfKTJ/5oBwCyWNZtzgcKdnYz25lcD+hTVDiMG9ytnXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924934; c=relaxed/simple;
	bh=0a99AkCdYYlGDSLNyvcoHvxyA0h7cLM0HZDY04APdmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y0CC6fHW9ttJ4ghIedF97JlGMNiSPCDXynGGsVyj+k9sY7sQDOH6/t3+59fpOT1G7zHKRgY5CHQZkUAVhob5Jl4MwyLuMizGqvQrFjGFylhRDzyi3wTMCyQgyFyLSE07Q5mTzFL89yLsPuxnCFrgYEvUfKMu4XVnJ+F/JBNRWp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LwcO8KdU; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LwcO8KdU"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b0584ad71so1974112f8f.0
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 13:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791924928; x=1792529728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SVgIYOF9sl5M4BcUqDAxFWbO5yiW+j2eX94ter+J4Q4=;
        b=LwcO8KdUHyYrdKQ/8j7tAKiNFwHbDujT8GdFEX2KNcqlHFfG/Na5K5kxM9B1aG/3XM
         UopK6UUi7ijG+DVl0L5VdYAdDQ9I5KVXnl9K4yNUsLrXbjkdYgCeUmeM2orJUZ6wJk49
         V4XRyAyXaQo9AbwQMG55LhvqPfWwjfWLV0rVhmLJSkuS9+HyZWRmeJUcwdQMGRw8KYaN
         zVivHMHc0OobZ548LI1ZHAplQU9CqVRAzggD5J04MEBpto8/6C9n3vYEmdGSXmvc2Z39
         B21/xy+LGe9qvbbIKlqo2VKgw5gmXchSSo40VSvJn/J2OQQYl/waRhyPMtrNBQiMToSh
         FT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924928; x=1792529728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SVgIYOF9sl5M4BcUqDAxFWbO5yiW+j2eX94ter+J4Q4=;
        b=FNC5QlL4XqkCB3hrM+t4UH+sogpnhHo66cik+t07zxnlvFF1ndSX2NqLboH9rnFYoQ
         d0jhnewmvvPTcob3J6Ng2N2/BlfBjbJFtQJDrORVLDUUF00kN1uyizSqbVoY3IDLQp2u
         nFflvb0H9ET7Nl48LFcfETSSaQPnqfDvQHU1Yrs3lRmD4o/CTLz3TRESWDn+y3UJ2FsT
         wquopfx6WsfDG5bBTv8RU1gVZsB0+E2AoVYpuywArfDYDg9dd1bAC91tA8u7z8OCdMDt
         BA3y+AW+06vIOrijKIfkFXlbuSV4cNL7tbcP46E4Fzd9TAdMHlIcudMwA4E1xua+0cAp
         84Zw==
X-Forwarded-Encrypted: i=1; AKwUvBzLLM92eR7rN2VhcZWO2rSPzj3r/bPBtWmaJT9zTbftw1rpxeEQWQZCO6mGI0LZmHNt/S7JrQs2zS8hMQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL2Pq2KMXnC7bMKAum1glgvboEbiOWbm9QX5HABH43X3zJsiSQU
	0iJ4lUMW9X9DogtEgYOC+sHylY5uvAhn0FP4UOtALIKJIN9fB0a/KaqB
X-Gm-Gg: AYBFou0FnnS7c+J1lbe7vKwrDf2L31GytgtztWbJdUgXPlDavwmfUE1fWHgP02DbF6Y
	7EmXmhqN+0h/SaIHwXQDvUwSguh4eiPEkH5yxL8dW1U9QjO2YB/yMtLuJO2U81ghQD5RryenBaj
	Jm1Wpyk/G1tys9pICmj62e5FrKVuyXY9/kHpT5iy2ErXAbb1bhsyblKjYo8l2SNhYEn6cF/Tonn
	wH3IQhVJ9mkvXnOHNHu49RgqVBNlL7HGMJB5e2qwnQUJsGSrlZBstKvEbnhCqm6NrSaD6/aJ5q3
	jRSiqzqraLVOezXxXj8HCy5TjSjpQfMA+s/vRxUpYfVUqPaaluGM4XmeeBKS0Pal/rMNpFE6deL
	cNqbo0z5yeOLSNlaDrHg/Pt9KG0MwtCPeNqh5AkKuenOjCCZ6ylPTHUSFiwE7Vmo/D2OQFJ7Jaq
	AS6iKw0qRtb/4qPK1j5z5ByisjvAez/ZxrQUE5CIxpS95B7EWjlgPqEXIF+6+GVBI0N1f9cVJFC
	/BOcheYYcvmLoduSofXi2rK4h7Wpk2Ud3LOBD4PMwo3CKxUL4NK03OPgAVpDqr49juuhiIUE0xU
X-Received: by 2002:a05:6000:186f:b0:48c:7c69:2dce with SMTP id ffacd0b85a97d-48dbace9dfemr26073729f8f.16.1791924928152;
        Tue, 13 Oct 2026 13:55:28 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7273a0esm2380730f8f.29.2026.10.13.13.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:55:27 -0700 (PDT)
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
Subject: [PATCH v10 06/13] nvme-pci: rename nvme_pci_sgl_set_data to nvme_pci_dma_iter_set_sgl
Date: Tue, 13 Oct 2026 21:54:50 +0100
Message-ID: <54f1186d20a7c24075dd38eda1dfc7ac3705a13e.1791924581.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791924581.git.asml.silence@gmail.com>
References: <cover.1791924581.git.asml.silence@gmail.com>
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

