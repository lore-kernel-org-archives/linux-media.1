Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDD84C9E08
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 13:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790602374; cv=none; b=g2OXfnyexACp8bw5ale04eiQlU95rVeBXeX9H1j902cI1AUX+cPUyngDJgEKhYYBtHWNsxy6Vlpt3nXmYpj3mPbKxPvJI5ciH4gIjCbcZM5tnIGnwl/cdPaygmR6EEQdcqdarrGUJMrTbrfKa/BoafviMEX8tKHonGdzcGJmMj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790602374; c=relaxed/simple;
	bh=io+mbOBr0Rt7TH/wdx/lZ5oAtsvxfyuCrmFKA9OR3tU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nrStS1MrJIWNqV71V62RQu2Nv9EiJH4qvcIvykps3PclIwTra3kSIZTF2wMcZbKqePW7MZ8vywG/dSK81YPYCtvUToZ2rkx7COhuhMyqhBViDSbsOR5KpijiCenBkEgt4WiKPFKg1rNsotUPeDcO1fSx7WZoM0So7Z1irnOHC0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aw3XFRZT; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aw3XFRZT"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so2313627f8f.0
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 06:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790602368; x=1791207168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OcUXv3wgMOdU2Q5PfJeVzuf4KJvyhVvGu/xuChutEvA=;
        b=Aw3XFRZThrnFfZ4NNrryBnBx8rKYreyC+wG6xeLdRp72/nQBOP2LLNpSBikDWaAqUg
         B1Cc2nsr0YNiHZuzqepaE4qOdLBRkPtZ/q2lECdNi96tOaIOUhljX+piUy9R/ZDij2zv
         EJpQ0nTCs03EX6n0tFfjAO0LaxQYLe0Vbf2A4wlUxsMqgHOOfc4MHDOm82alsW56zirU
         u0vcOZs8uyUGHl3hWmI5ayUV05BUfIGbJdq+lnkQ/IBDDaFxYSaku1GxlrroHfTOPswe
         sg68AfqotYirUkk5Teg7eA4xEUmGb1HcmEqxmwwEtyYmw8nk+T6yLamjdbQ9pRm96Dkh
         snAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790602368; x=1791207168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OcUXv3wgMOdU2Q5PfJeVzuf4KJvyhVvGu/xuChutEvA=;
        b=OeXlmauGvkNOiEyY3uMgHN1wUo72dNxL4ebPKmumObHWPj+Ju3GN75T0up4Is42OUq
         w8RQHtnZorWxxGHcUPe+x5Jbl1/FZzFc62xGkhQzf7TLgvQs733r7F4A0PCl3pgYXn7d
         mV8EdDbbPzg341ISjXFwFbWg5uH/5A0+Klbar1yYAQ1Nf43XMY/W9ndi5xwAcgQIpLwF
         /lFZOOHRFGJAkIcjiRKOgw2sHV0kwmAVwylVHwOLbMvRPFsR5Q3hvP4ieCqBNVx3gfop
         XLNLrvfKF0DvhYLEKFzcWgW+PFFx3zBTlRHv0jzdhZyhUK/LXx/Kaq74HVJ/AzxPR7Sz
         tIkA==
X-Forwarded-Encrypted: i=1; AKwUvByCKFsyRIbQBHavDqCvgcZmgBxY33PrNEK/DV8JKmUi98Th+5mTQw2d1rx/woH9YADFRMsoRpkH9Fn0dg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJLIyYdOacQbSq2cZXKxn29NC7Yj2z1LH8zzrc1i8fF0ycgH+CF
	e/jeRHf1UrtdfO2gs/Ktkx7fJx50qbAEG/v/CUQpfsLlIzmd7jinSvJS
X-Gm-Gg: AYBFou3Vjx8/hIWEemdNdDtKaI8A7Jnf0f7csB4RlKWb08vCn6CFaEU5gI8t1I6reye
	yau1wPzUyOdM7S5XQYx9cPr10LMoKqfw04B+0KDc6dhGcrPesLIII7GiAzI5dBVYq4738j7bCXM
	00UOOFAm0wFabDyPz98RJe8i0geyAqTIyeRSJWWyDK711XSzHlKNGm1SW/am3/jRbS/HVx6Hmhw
	eVdTrHQAEIbj379GE1VcGsvSQVSYT4bLIQebC6CxKvDQmYPGK4YCho5KC4PoU7ODarDE3DHybey
	Acl7DXQY782youDE58U8GoBb+CDImehqJmT00zcF+qaj/DFSF4hMGXsLRuzicbF1tf4Ei8psgKj
	/BqsnTvU3IsxANW6M5Od/5DXJ+E8Q1rjWnnFdp7ggyEMmG8TtNT+ebvWLtLgAa8vdUdJSR1zgZP
	BBUXQSjaWUOoD+LgkSGVcxEJDHUxT7NopApIXOBLqy9XjhOQKKZyaFstWZSc/NjOE3hfdWT/Evn
	1aw3/m+kp1tp1FZqGV23OdcTePoldTXwen1gp34UHxgbwVTVAMKWXNgDPseUw==
X-Received: by 2002:adf:e19c:0:b0:487:11c3:b004 with SMTP id ffacd0b85a97d-488719760c4mr23422853f8f.52.1790602368298;
        Mon, 28 Sep 2026 06:32:48 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm28090164f8f.12.2026.09.28.06.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:32:47 -0700 (PDT)
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
Subject: [PATCH v7 03/13] block: always adjust bi_offset on bio_advance_iter
Date: Mon, 28 Sep 2026 14:32:19 +0100
Message-ID: <39b4cb178513b33726c8d2ee0824f7324e84828e.1790602223.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1790602223.git.asml.silence@gmail.com>
References: <cover.1790602223.git.asml.silence@gmail.com>
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
index 75f8086351c0..10ece05cbf43 100644
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

