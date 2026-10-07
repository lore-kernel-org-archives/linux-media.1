Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B1133A6F2
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 01:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791336737; cv=none; b=a6EnE4NTCujM7OQD2e/Hr7uA9Yhdhq+rlRwunyduF/bF1JcmC8QP++QUA0BynunxdM5zBo+7eG0MObl+cOlYfuEXFJtPOSi3pmVF3pNtjVlfSeXauYCqv+NN53+HujXK3hjEycn0BkNqe5X5DMNbtCyIXOF7F7I7d6lEFitrCK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791336737; c=relaxed/simple;
	bh=lqtmMOq9NyJHWkCTixF/EfRvdzo9ti4x7BRbdW0dvpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rImPWfneo6Uz0rtMMReDO1wIDssNnkUsbBIVn70xV4K09ZabKiZnAEvRy/6IRKSJYooNrv7SZ7b8YlSEeVaFWCumiJ0CF5d/wRa8nWcoQqjx1lls3TtQIk6ynxpUxZT8TxW+MNpyKbdZVGVXKu5MRo7T/cGQM47PUjoKUOhSyLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVCasvP9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVCasvP9"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a166199820so7946685e9.1
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 18:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791336734; x=1791941534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BooWm7URUcyrH2E2qkRWxlx7KQoz7GWFpr53v56Fl9k=;
        b=FVCasvP9FCP4taYfm6Pp/cJbtg0TdDpMFZR+V35uZjUu/heOUawDO/hCI3FrJy7fam
         NxnrzLwPmxlSjWwfVN7YOjGfFSMrRKOl8sd8FuEPSoc0dGOX6DWbyA2D9GZ+kaM6Tq3R
         WsQfYp8wfZsByC0cIN3TQTcLMXHett9eoe//LvN/EODYGz9a2a2utouHWA4BsIAGkpJw
         ERZME37rRAn9urM61FVbZJxXusNQ3ywvEOQMMMUQoXpyYT72VEea5HK6808szxd0JFVb
         ChYZ7fQERoUoIQQuMFUtmMkMNsxJ1pU3mICfe02ZgQEtL9OFGjxIduJizyWOuXpmSA3t
         v/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791336734; x=1791941534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BooWm7URUcyrH2E2qkRWxlx7KQoz7GWFpr53v56Fl9k=;
        b=2UWgUJef6C2aJkVlxkdhxxRHNgs6unl51FpEC4bb79vfkRjDBBjODXEWdVSAgSydM/
         hhC/FjurODJuxd01Q4Ws/xtswfMuepAUE7jYfChB+pF9cLIIN+PSDH/uRiJgKuet71wn
         bQ7r+JTAsAaqdF5XXe3wNYWc6WaZWznN0+IFKtoRwKmWByCMGNu6XCCTQU6+1jgKi/pk
         goXC96khrX2j5NI9OH0YaU70T8Utgvv9pF6vDQutPrTcgTc7wwzT/KJLB5WdZyRHOKt/
         eC1Qrjbt/6FsCwd8nE4lag7nqzOoGt6lYajHC5KLVGq2DFTdM4PaHB+NANCw7XDDcpb6
         wexw==
X-Forwarded-Encrypted: i=1; AKwUvBxMOiQJh4WzcT8U5hgQzTVWcNlGFlIWwTLyRbRY5pKEtuKbeuPamSfdG4X7mTK42z4WY4+CuhmyaPhoKg==@vger.kernel.org
X-Gm-Message-State: AFuF++lxyA1Toj72lblOuntsoqSOhkp8+XJ8uq2FrnxA+txSpwGe+nOu
	7PNYuALOtSLQxbOe1mZYpCNKEFKe+z9vvRmXnDXp0/AGefxi2HeTRJTk
X-Gm-Gg: AYBFou0Cbw8B7heLNy2t6emgetuY3ojPhtLhX+HaNOCgLyGtTsc4tZS47dhBVYfrzBm
	2uQ1rnv2QoFxGbDLeXFHR8cz21N9W3MM5ZrSddoQKYY5HhGGyJODgHeGe1n8osLXaq8HjgTxyyr
	S/3LAN67nC7e9oY50urOsgRvFkmgr6+uJjMrVGRpbg0vnu4LzNgG3ZlrfQCzWHqL9PDZHREIsCB
	76saWXmbBcGelqs90LL787tmSt7Ie2V/bgWxrDe9hoMW7BSUvg32jThXexihubBoOteQTKctFhh
	6qEreoscS2qSzuf2ZU6V9YQfyT6yhzW7lQW1U1Qw6Oo+sSzSTgOZA/wroRF++kKGblk4b0IbDAj
	N1V0hyiHKnNxNP+I+6/WHpUWd77pVSk85HK2tagYFkWHpuPrkfGhQth9a4kX0rEPfk3sFUybiIA
	uMrb1Lchi9F0luxa1kwyGWPhHWHbC32v7ol8Qm/Tv7LXQ6/XkywCbi4LgKx2No6m+uTY2ghBd9s
	qjUt/I9+jEPm2LScTRHPK+H7Z0dFDb3qvRmEiJDn3IUJFXl0oZGX5OtqewrcYxZfCkr3l1ST1Qd
	aZpAmSgFCVk=
X-Received: by 2002:a05:600c:810c:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a180422b6fmr8623225e9.8.1791336734141;
        Tue, 06 Oct 2026 18:32:14 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f6538b7sm21183615e9.13.2026.10.06.18.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 18:32:13 -0700 (PDT)
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
Subject: [PATCH v8 01/13] block: always adjust bi_offset on bio_advance_iter
Date: Wed,  7 Oct 2026 02:31:44 +0100
Message-ID: <beec7303891dac21cd620d2a47842f843b391192.1791336002.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791336002.git.asml.silence@gmail.com>
References: <cover.1791336002.git.asml.silence@gmail.com>
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

