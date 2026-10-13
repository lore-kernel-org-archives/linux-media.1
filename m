Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8EE556B95
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 20:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924925; cv=none; b=OP8CkUyTo9hXbhzjfe3QW6Yatnl6La464W+f/8ZGLY0xlZGaLtdCk8ufRhWoaRk0SktTI9YYhrFcyKSPL1B9fQIjmUeru3PLmhfHdIBPgjkadvX7FmYs3WVzWf60XusptQRxxb7GEGDizLH6uMhHdCV3cxaVC+wdhIXRdqOLnOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924925; c=relaxed/simple;
	bh=lqtmMOq9NyJHWkCTixF/EfRvdzo9ti4x7BRbdW0dvpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mIRrIdUtAl7sjNGL/EBBxNQE9wGD5HRUepBJVHXCaqvkgsDNxnxIakJExCfAa2RGaIgaq8MFY8UlnF+6I/AbbuqQ/SPHFPZkE7CPUoU/h/5vM2yDDBX9EezqEe3Bxdq1gCaYoBs5stnDXop2ikc28P9OwcuxxH9g882ZGzWJqlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmFXR4vu; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmFXR4vu"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so28468305e9.0
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 13:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791924920; x=1792529720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BooWm7URUcyrH2E2qkRWxlx7KQoz7GWFpr53v56Fl9k=;
        b=SmFXR4vuCaMo3QNHNg+lOj2KNs21jJ78u9JC2s7IhIvdMjkgms30I+9HuzrwHHrfhE
         Fs9RJ6L1imwZvtHQsc63YyH0SOPVY5DJvt2CyTkJ7KNKbNFGBmlUKa61Cqr61Ifkx+rm
         Of718itS7uUl6lFhsO977+ejz/fJuSFBr9gaRDLlPWjlFoXWSWQUPG2nTKJ55VDTrXvo
         7P4x51h6lGorsQCrvKZ2zv7V5FsqWS90FhUlQs6wpI4x/X1Best+JcL+HxQ9osvFXE5e
         vQXtMBoDYsDSc6n4oCjaWwJCfPgCiVuwnj6TSAHUmx5P0/0i85mSvWrl56EfUaTxQ+5j
         F/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924920; x=1792529720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BooWm7URUcyrH2E2qkRWxlx7KQoz7GWFpr53v56Fl9k=;
        b=zFH3xx4WwH1Uxt1TOaGTXnUHpNtNq+puUcOel89DaJ7+WVW9fpIyFyvn2ShsRncKP0
         EQ5kfDpVQtLf8u2fs/F7PQlYdgaICPXx8JYEXhn0bxqVA/MUu+W2oaWzJ7U4ZGRRtnfP
         7Gsxk+wdY03WIT5NrGBn5TDyzGu1l2AMCF7nIkUgi5Cbd5IaOlU1n8+VfWwCc1ltxNEu
         9RClKZpe0FlCM2Hx5vrlIzqhWo/paY4+x0OA2BBoji09LHOoZUZF0/Fbwrhtnz7BGs5k
         yHcw3A01NtJZ34u34jl+vhTTUDAdQkquPylNggVK1maDNhu+R0OSqb14ndZSam0Vjj+I
         oEpw==
X-Forwarded-Encrypted: i=1; AKwUvByfkBrN3jUN/3GtQiDTTqs/npz//oGvNaojTVezBV5u8xL/eJ99C2f0J+2pYnCO/25GihUsEpiJiu0mZg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKVGhdJxq96o+qWAkGxdzoJ7GLLwR9v1LsBwnWHiYzVrGqG6sgp
	hfvJqWyZVUlg1u4FC7WLhPSC6Al06T8a3ZBuwXZlXiEAhzieUKUV7cRl
X-Gm-Gg: AYBFou36rItfJvGkExqDNGWu+/ldQ9kxJQ2YbOUpU9Gg9plixWkvP7/GdFqE0RksIsZ
	hSvwuTQKKua6vOcsZmUtK1vfenFMlfIzfqs/87GJfPmC+288JrR4QRc/0+mvzNY1ibIX2nWIJ+y
	+aouNie+3PePKIYaVjlFnKB1Woie/CbZtYjlLPbZXOLNrZf/ho6f0Wf8HOAwDBkl3FMGBPcPWBI
	SH46aXR1qlUnzvEfuU5el08zdJFbRD12CORQMHdrl++Lv6Y9aQ19VQMgaRIQ8CsLiEgwsjyZ+3e
	/cXjmmyu2ddHWmsJM0gkhqcC6EDtGNssXSVrtHpwtJJYgr/X+09KVeRwEjT9JWSiqjcsaqC7fJl
	MqdI3RugY4JlSmgwtOOJNmL/VwMv5GAoSdfkZNzqQF0JZKzRbGvENhMPyvuEqytGJdHr87Iot4H
	4EkpNjNVN2XN2Ze1bepFop+iDSqUTG5AR6G3n6+WYtt0ZsLLYVqQ7bGOeUEF2BbxyzMxLr9OLRM
	nCfR2ub4QGMNOu+tcMUccPTFOWOwITfpUoX7qgY+SMKMDg205HPhXpEk2nu69S2c0B9vWnxnP/M
X-Received: by 2002:a05:600c:3e83:b0:4a1:6d35:779a with SMTP id 5b1f17b1804b1-4a18e446880mr243665015e9.3.1791924919983;
        Tue, 13 Oct 2026 13:55:19 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7273a0esm2380730f8f.29.2026.10.13.13.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:55:18 -0700 (PDT)
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
Subject: [PATCH v10 03/13] block: always adjust bi_offset on bio_advance_iter
Date: Tue, 13 Oct 2026 21:54:47 +0100
Message-ID: <007fe19ad4e949ec70ee74ef5cb05774656c62e2.1791924581.git.asml.silence@gmail.com>
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

Extend bio_no_advance_iter() iteration to also increment the offset.
It's not currently needed because the currently listed request types
don't have a buffer, but will be useful once we add bios backed by
dma-buf, which don't have a bvec but work with a single range.

Suggested-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 drivers/md/dm-io-rewind.c |  6 ++++--
 include/linux/bio.h       | 12 ++++++++----
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/md/dm-io-rewind.c b/drivers/md/dm-io-rewind.c
index 04f3fc8aeb6f..b22719c6411c 100644
--- a/drivers/md/dm-io-rewind.c
+++ b/drivers/md/dm-io-rewind.c
@@ -113,10 +113,12 @@ static inline void dm_bio_rewind_iter(const struct bio *bio,
 	iter->bi_sector -= bytes >> 9;
 
 	/* No advance means no rewind */
-	if (bio_no_advance_iter(bio))
+	if (bio_no_advance_iter(bio)) {
 		iter->bi_size += bytes;
-	else
+		iter->bi_offset -= bytes;
+	} else {
 		dm_bvec_iter_rewind(bio->bi_io_vec, iter, bytes);
+	}
 }
 
 /**
diff --git a/include/linux/bio.h b/include/linux/bio.h
index 17944e44b584..892ca469c570 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -113,11 +113,13 @@ static inline void bio_advance_iter(const struct bio *bio,
 {
 	iter->bi_sector += bytes >> 9;
 
-	if (bio_no_advance_iter(bio))
+	if (bio_no_advance_iter(bio)) {
 		iter->bi_size -= bytes;
-	else
+		iter->bi_offset += bytes;
+	} else {
 		bvec_iter_advance(bio->bi_io_vec, iter, bytes);
 		/* TODO: It is reasonable to complete bio with error here. */
+	}
 }
 
 /* @bytes should be less or equal to bvec[i->bi_idx].bv_len */
@@ -127,10 +129,12 @@ static inline void bio_advance_iter_single(const struct bio *bio,
 {
 	iter->bi_sector += bytes >> 9;
 
-	if (bio_no_advance_iter(bio))
+	if (bio_no_advance_iter(bio)) {
 		iter->bi_size -= bytes;
-	else
+		iter->bi_offset += bytes;
+	} else {
 		bvec_iter_advance_single(bio->bi_io_vec, iter, bytes);
+	}
 }
 
 void __bio_advance(struct bio *, unsigned bytes);
-- 
2.54.0

