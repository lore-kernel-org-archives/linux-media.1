Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821E555D882
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 20:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924951; cv=none; b=Lz2kw0f9XkvkQTXkaGmh7zPc6OdfokQM8bJd6ynIsZMTrsAPwfYS4OVQcYUp9g5tNdwmspPgrm30GpXdVBSIrTuJgPM3mBMuLCTI4X0B9vpR8Hn701RRZc4T57dH4j2Hj2IGDOm0Z2KCjDKGWCnHvsin2ksuDZsw0NTMUK3Lw54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924951; c=relaxed/simple;
	bh=Yz9mg10bqVdj7cVQ9CUCuhVSPCWk27GUE+7ZZMs5kDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KUf+kpa3YpwnZMGbGphUqqi92C7huX3OJlu9fvqBeX3Tvkd78zY21KRIRVhRPNQypmCU1vwnP0W02Udqrf4wcNSi7ZXDqLN8JdguNsMuMzuAeMdKzdQOFZZbWh0yZhPIc++jyQaEa0WQiLSB6NKOYE31CrHrZ7WHVKp4CPXLz9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=reXEvNR0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="reXEvNR0"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4649b35bso3185261f8f.3
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 13:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791924941; x=1792529741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9CL2BRiyUp3CaHGocQHkhsGpx+V6MY3r8MUNMnInA+U=;
        b=reXEvNR0/oR539rFg/mAmOONmVBwbmQ5GC0k5RqdLIb/28t4/sJhr9VlDMTRP2selU
         EI4ngzmBIR9o5vFVZS9V9CaZL5VtDAlekC5OfeqLFQdxj+RDiXxfPjoh+PtAMIyxpKNJ
         O0DFXdOF0VFWMHxoAo63DYMgxwl+rz83JhX3fFTDS/DfTNvJlOp9F83hbiiJTGFaARTZ
         JBRYoCS72lG3ocBNO8HKt0IASjzWzzMN9YA70nYzttT1XQA7iPI7j49DK8ba1DVCJZ4u
         IHzcMBO3S1gfqL1W89gg20Tv22hBES4Q4H7nzrgnZ9u3rn4yvrh8RrmjLnGBW18SAySE
         sMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924941; x=1792529741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9CL2BRiyUp3CaHGocQHkhsGpx+V6MY3r8MUNMnInA+U=;
        b=cosLzCYeFG/yiNfydG1qNZLIKaTMMSl3z1xFsXZx6uUct6Nk7RKnMMEcISMHid9MOL
         StX7UefDzQG5JxURlCrrOdDaog7Xk3Sihtj8OpFZmBqvL6yFGpkiG2Ajc5x9V41UbJYU
         Cn1DYGNzKvs3kDMytRxHF/Q+qu4IhRGOeS27ltWAqQnBCrM+Ku4RLbYAiMIjzLsWACtP
         AS9EHKcl+/KojUiohpdxhno9NqR0w3vWktHoRU9FsIqGLvIbsvKvHddqd3LAHfwYH8B3
         buqrl5k0f8DpmZjOrLv2q+mMU6zke4QpiGl23NWUtZYqfqjqGy2KswLqzkWIbnUwVTCJ
         YJqw==
X-Forwarded-Encrypted: i=1; AKwUvBzrSdnJZmY2QefafTG9sjiLLRMylzH5ad26z+zJYs3CWufOIFTggSs+hYdnvMvA7pzE2Aupo/aSD4n26A==@vger.kernel.org
X-Gm-Message-State: AFq9FYK/8BIluQw2sK2G1F0KZ6BdLt/Mnrb4lw/vDe22a6li6upmtgp8
	3ve7Q33rqsT2UtaxpzfFqZr+avLTErKPvWhgLr1CV6yuMWKjV06vHwMD
X-Gm-Gg: AYBFou2daXd50fVEUQqRlzW0hfYHQYYoPZC3mwtwpqQmY5jvDfPGB3Di2PC39UEN2TX
	Ho+r8eyS/UeEICIcqAKuP3fJtaybcNAsus+c8PFwtbt1ARhG5TScsFodCp8+ESUMigYT2wiRYOx
	H9hesHyAolefzNev+Qc8JHIctN2WciyDi+ARmNtmhs0RmkIlw5iPIJVfuy2gFBZoIXWPKVpbAZ0
	Lh6v1WcpzpZv0kQlxf24lFSz1us2CxGgE6jG+rLnPVEU6xMFfLGpnZRyHRomsvXIlfANoGfDy5W
	Rl1TT/a9R4BfPRRszVR4d7IONJXrEyxGMUgcRyhJqUIASGeARxd+4rlfAbEXuWlM24RbQ9P35Hs
	Pw1kYumS+RIDvyJT7Pr3YfMOAzzdXbEFyd/bt4wp/GvTFokqzTeiBX5jJsUBu2FjpCBojkyrHGY
	w3dc3eK2KrY9wYj1Z9xJinzmV5REPAjc/LdSibpVlwyyWKGSv2vUp8QViC/IJeZlWe9305eiExJ
	baiSQ5eWJOJW0WkDB4GkUmuk0eHpV9tjvy032eii9ri5XnevO7yHGMWn1T+HPVOjlKd/rFnZXY1
	fAOFGUKjwcQ=
X-Received: by 2002:a05:6000:2407:b0:487:1ddc:aaff with SMTP id ffacd0b85a97d-48dbace40cfmr24537298f8f.44.1791924941527;
        Tue, 13 Oct 2026 13:55:41 -0700 (PDT)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7273a0esm2380730f8f.29.2026.10.13.13.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:55:39 -0700 (PDT)
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
Subject: [PATCH v10 11/13] io_uring/rsrc: add uncloneable regbuf flag
Date: Tue, 13 Oct 2026 21:54:55 +0100
Message-ID: <b013774568929cbc3e6fb9ed29079088a1006431.1791924581.git.asml.silence@gmail.com>
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

It's hard to implement cloning if the internal structure needs to be
mutable and/or relies on other ring resources. In preparation to such
buffer types, add a flag indicating that the buffer can't be cloned. It
might be possible to add cloning in the future for them, but that would
likely need reallocating the structure and reacquiring resources in case
by case manner.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/rsrc.c | 5 +++++
 io_uring/rsrc.h | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 54774729ee67..532866a1e9b9 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1458,6 +1458,11 @@ static int io_clone_buffers(struct io_ring_ctx *ctx, struct io_ring_ctx *src_ctx
 		if (!src_node) {
 			dst_node = NULL;
 		} else {
+			if (src_node->buf->flags & IO_REGBUF_F_UNCLONEABLE) {
+				io_rsrc_data_free(ctx, &data);
+				return -EOPNOTSUPP;
+			}
+
 			dst_node = io_rsrc_node_alloc(ctx, IORING_RSRC_BUFFER);
 			if (!dst_node) {
 				io_rsrc_data_free(ctx, &data);
diff --git a/io_uring/rsrc.h b/io_uring/rsrc.h
index 9ef88383b363..73d7b1ebf0b6 100644
--- a/io_uring/rsrc.h
+++ b/io_uring/rsrc.h
@@ -26,7 +26,8 @@ struct io_rsrc_node {
 };
 
 enum {
-	IO_REGBUF_F_KBUF		= 1,
+	IO_REGBUF_F_KBUF		= 1 << 0,
+	IO_REGBUF_F_UNCLONEABLE		= 1 << 1,
 };
 
 struct io_mapped_ubuf {
-- 
2.54.0

