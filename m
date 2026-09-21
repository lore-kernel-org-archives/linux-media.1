Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9444A0917
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 13:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997975; cv=none; b=ptaD4f7DgvGmsFpjnXboyRCE4J7SXKVCbTvaHMlPqKFEN8eGcahWI2Vt0jYNVbJENp9EO6rhnuxaE9048Dr7ltpwbvtioopfPmCmLMvCAn6nmRJ7dWUL+VkIBRuFk1YvvB/kzhQYgOxX8tShEkHJ5GKysYqewUuHPEShJ07DRlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997975; c=relaxed/simple;
	bh=lqtmMOq9NyJHWkCTixF/EfRvdzo9ti4x7BRbdW0dvpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l1L0nYpksj9HfFYQ9m+51ezg+HjrI/bIyyuTqO4qGGnTB/gSyq6dydD4CeWwj4pQn5w0fotegiWy/rOK0sTo9FMY9mj2371EkIZ9tfkAHm/q77xhH+2/L/hsCcs46ir++KM4ky13OfgENEpkvspBaPB8/fBBGHvSrqVOfSyAHrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knfo6iGm; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knfo6iGm"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so17497535e9.2
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 06:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789997970; x=1790602770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BooWm7URUcyrH2E2qkRWxlx7KQoz7GWFpr53v56Fl9k=;
        b=knfo6iGma+p5YGcX3sMSvqn1cE2jcWgAb6FR1sf0KBcsHhjevqWGwL62g0WiVWH9QJ
         sWgyh70nu9IKWRBj8XEB9jUkkeFvfLXHWLalsArfPtCBJ3D3Tg+r+2Cuo3BcyADPcEo3
         4JmrQsMvNG/kwKpbfkzdsP56gViW31u9cssaB6RQ2dWvsWXo+GU54HD29p6uDFzMTOf1
         uMt4nhViArd593RfEJdF/K2iI+XuF5U4Apza/2hmuN9BM+zw89gFCw7jvd04fK7MRE5m
         wDy6w27RO7GItjGoRvKawp8A6E2+iE2UESJhHD9by/Qr/iDMYlaa5NumYkYIO/S+hPZj
         q6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789997970; x=1790602770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BooWm7URUcyrH2E2qkRWxlx7KQoz7GWFpr53v56Fl9k=;
        b=T/H0hFzbAehXDKdOf/JqHFiKC+tQw/Qwf++zQmiVG1yYatQz7WmPOfefJyrFzWGGQq
         8A824+e7UnsL4KmMsRieKxwquogimFpV5eaQSfxgO8fMhVG0CLl3ah6jLoP9WWoxS/ir
         DX76QwLMdSYpbN/tzm3wdI1K7UVKN14jDh/Lqs2VaH/rx75W/oBLFAz4Fk8VypY3Vdad
         eDmXBip3tIA5eKlQlu2lBMLMEhyO+2v0xuAZpgEx9wfSOjiuqMf100FXF9cJQ3X1tTvx
         2FsdWMHezysWRW4I14Ds0a9BGYanUeTd+clOoDJE1Zvo7STzNRWDq+Dvl7yYGWnvrTx6
         2Cdw==
X-Forwarded-Encrypted: i=1; AKwUvBw4ra62kkACnGCBSNT1EUESpUDVb6GPs0EG4+TyfwV4SbQTmsF2LbC4AVKVSsF96f7BxJrBkdQxPMrB+Q==@vger.kernel.org
X-Gm-Message-State: AFuF++kNBzPC7OP5/Ige/Eid4r2PCMdRv7/ZEz/Coy8ecWjCYH/ha4mS
	0nIcdaj+INXG2F6/T+uNQeMC4CT4RdqafXrWIZ1yRam2bEAnfTjULrb6
X-Gm-Gg: AYBFou3hButHdSyyLKGkrKbnASF+RPCYByM1Msz6ekgQ51Fjjv1skpmGwouJcJqQNff
	EfyH0o7rjHFwK3QuFrTut+WHKVYKc/bcvUyP/SevNQhtRJFbmOpY9l1y73e3QzucbFhYpkrhml8
	EAf4W9JWwaRwCvvLegIBvxZC+zK3tFh21j+p1BgyJ8sFEE0AB+BiF8cQ7ZHETqmnpkFE01ZUqAv
	15aV88ocfYH11JWWe56lnOMwi6r5ts3TWiNzvCMz8kWXh3kcuomkBSfrfknWQDU3EHcqrNh5NBC
	yxoSCIuYjQ1FPmbHclz6MLY10xXSTEVbZIFBnMKh1OTRHugn3Cag3+6Fi+HU+Uuy0ywqMADkOSk
	LzVD15POQG/h2RBUdHFmpi5yXtkG4IB8stHz18+Mdec5tfdfmjhFWUwkDIHk7akP3iB87ptlIP5
	j/YP123sVvQ2kwVsHQk4lvZoziZH3AZSkJMxAUItU5BRhyWnxBC3s1h6t+9CcCUInOKo8O5KXAj
	HfJlWPz1FAPQmgNssUhD4L0lIAbh/FJNE6YV7WKNGsJyd3bnqIR85amrt+jS2L4jEC6O3PHgTC5
	S9nViUqk5/iwVlbgkq5RhnfCycT80Q==
X-Received: by 2002:a05:600c:c0c3:10b0:49e:823a:9dec with SMTP id 5b1f17b1804b1-49fc5a10b5fmr145292005e9.3.1789997970323;
        Mon, 21 Sep 2026 06:39:30 -0700 (PDT)
Received: from 127.0.0.1localhost (82-132-213-26.dab.02.net. [82.132.213.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm617171605e9.4.2026.09.21.06.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:39:29 -0700 (PDT)
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
Subject: [PATCH v6 03/13] block: always adjust bi_offset on bio_advance_iter
Date: Mon, 21 Sep 2026 14:38:47 +0100
Message-ID: <f3c6132b313e7bc6e237e1a16ae8750be5988a40.1789997898.git.asml.silence@gmail.com>
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

